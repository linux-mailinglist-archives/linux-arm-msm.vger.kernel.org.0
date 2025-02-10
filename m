Return-Path: <linux-arm-msm+bounces-47348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D02A2E2F0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 04:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67A323A3895
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 03:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C2F12C80C;
	Mon, 10 Feb 2025 03:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="GFSvKdEk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA51D125B2;
	Mon, 10 Feb 2025 03:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739159532; cv=none; b=Ee9Rxq0hZDDGlklhV+5dkCplj3CdSShheIfuTAApti6tWdYQ71UpaKQkPEy14/gs0sMrDx1N9Ro+FWLaJVYYRitLD6ubVYSxxcDdVGcWJLznbMvY181b14x75Viu38kQAr8m3Xl3ggmNjUTOAEg36zedHMDOKHU8Qa4B9KFR17A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739159532; c=relaxed/simple;
	bh=28nhjIqmGv2HbdXYQNPlD/qwIn8nqK1Z1FnvA35GsIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cKqrufoUp1YbJSE+CTfwszog4JCMAIQAlnverB5Wt1fnqBu3hY/2YGHjNYeDPOF7i0/qNrOLDWN4bcldbuzqKdI9eav9L4dKNw5nZ3jE14gFrH3wcM4x977qPmPNr2Db0zGI4HS3X3y3ec6gWANKgB21deQJ07ksonK0seAwCyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=GFSvKdEk; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YrrHP2MQmz9shp;
	Mon, 10 Feb 2025 04:52:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1739159521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NSZuHneQJ8E7PuSXeM+u1QfGVntSHexPdYDiQ+xH+8w=;
	b=GFSvKdEkBADv1j9CAKotDU7aEWO2kPTxKB4iGWRMssF0vGQjYfY9418/KuQ+AeGpCjOGCr
	Rq+9vI1EKtSlTqyzT/QSxGq7Q5ha0NocR+s1bNX7lbyP8jJGHU8qtK+sxfv1e6Q304ipxy
	3X4Bs2trOamT6t51W5r6xcn7HXoI9Cm0TtVg0qIz9GRe9vyGDYMR/pYTtWGyy/bfhC79qN
	hhTAmi/v36hF6LC1mKFa4p74pG4ItEk/G5rrpp/79QvwGLfzwala1gdMlAvBOBTczq/K7V
	+45krd3MRqWJkUWESgD0B9ab/Ypurdkp6rtlYXmi+Kp6a0/16hJZWG6N6XwgrA==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Sun, 09 Feb 2025 22:51:54 -0500
Subject: [PATCH v2] drm/msm/dpu: Fix uninitialized variable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-v2-1-114dfd4ebefd@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIANl3qWcC/1WNQQ7CIBREr9L8tRhABezKe5gu8POxLCwNVNQ03
 F3szuWbzLxZIVMKlKHvVkhUQg5xaiB3HeBopzux4BqD5PLEJT8zNz8ZHrxFbTwqoaE150Q+vDf
 LdWg8hrzE9NmkRfzS/30RTDDubkopY45e8wst7QzJvWxyeY/xAUOt9Quk107cngAAAA==
X-Change-ID: 20250209-dpu-c3fac78fc617
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=28nhjIqmGv2HbdXYQNPlD/qwIn8nqK1Z1FnvA35GsIs=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeHBLOHN2K3YwTkNySmRIZGNFODlGZzlNVHF3NW5PdTBJCkZ2YnphRGxWTHBYMmdJSGg2
 ZTJPVWhZR01TNEdXVEZGbHY4NXlta1BOV2NvN1B6cjBnUXpoNVVKWkFnREY2Y0EKVE1UekNpUER
 vMmVtcXBrTWJENEZ0d1RZRFlxK0xIbmRiZC8xZGwvRnEvODhic2Q5MWorWXcvQS8vdEd1OWUreQ
 pGdkhVVmN5ODQ2b3cyMzJkNkYrVHk5OXFIUjh1VEM2VWQ4eG5CUUJSQms0Uwo9cHZzKwotLS0tL
 UVORCBQR1AgTUVTU0FHRS0tLS0tCg==
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE
X-Rspamd-Queue-Id: 4YrrHP2MQmz9shp

There is a possibility for an uninitialized *ret* variable to be
returned in some code paths.

Fix this by initializing *ret* to 0.

Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
Changes in v2:
- Return explicit 0 when no error occurs
- Add hardening mailing lists
- Link to v1: https://lore.kernel.org/r/20250209-dpu-v1-1-0db666884f70@ethancedwards.com
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 098abc2c0003cde90ce6219c97ee18fa055a92a5..af3e541f60c303eb5212524e877129359b5ca98c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1164,7 +1164,6 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			       unsigned int num_planes)
 {
 	unsigned int i;
-	int ret;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1173,13 +1172,13 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 		    !plane_state->visible)
 			continue;
 
-		ret = dpu_plane_virtual_assign_resources(crtc, global_state,
+		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
 							 state, plane_state);
 		if (ret)
-			break;
+			return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)

---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250209-dpu-c3fac78fc617

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>


