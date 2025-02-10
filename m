Return-Path: <linux-arm-msm+bounces-47345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB76A2E2D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 04:33:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35F653A4B24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 03:32:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FD835959;
	Mon, 10 Feb 2025 03:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b="Zum5sqxM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261BAEAF9;
	Mon, 10 Feb 2025 03:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739158386; cv=none; b=dWQc1VZN7/Ct+6HC9M//UdkE/qyi9539D864MroxwaeWovkiQz2K8y/8wgq0V0di8gmg2+1gwfKIRKn+SLaIwZDAXrZIatLYhulgM83lYLcxj03JQk89YdMfFt3jcbTmuGdgVJAQLyf9VABpySr8IbmsNylkJtUpGhGFzjS/CoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739158386; c=relaxed/simple;
	bh=e6u4jgCux0UDketL1vecCE7NvY4pCwpsgSfqIahNaEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pWdyUnlCYJR/nrXIijuXEcLWMcy/y4VBw7DNSTNPpgqjtM5kLZotUq75w2Q0A26oY0AV8yPBXXQ6oUKCrNuVQMhU7CJN0XDcx9GpzMINtPTqPCP1Zymq3Vbm88vI3uNEyGtd83uK0l+6dMrZJBTs4xzgp5AI0PSf74TClt6k4sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com; spf=pass smtp.mailfrom=ethancedwards.com; dkim=pass (2048-bit key) header.d=ethancedwards.com header.i=@ethancedwards.com header.b=Zum5sqxM; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethancedwards.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethancedwards.com
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YrqsS1XtTz9sl9;
	Mon, 10 Feb 2025 04:33:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethancedwards.com;
	s=MBO0001; t=1739158380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tRuwqs8KnCQigl941VXZN5uap3PzZB4mUUfaIPcppDI=;
	b=Zum5sqxM4Q4JadLtlN8RsIZGAEmp2nXh+dQCsajjGuCym3uOA8jSwQKWrZRVLJ0+JGOLzv
	fjv+l0WN++4bzhgvsdQQRpY0HSnuPZirOuAf3y7U5PLzJTHJkTFJePRDVZV4LitV3edu6e
	LOkycJegE4InZ6YLD7evKic1IRHLiwltgMswn8KLVP6d7CrbBxui+2K/vWBQLa4Sdnhwnb
	fdZeGbqMeWc4LnXQu0W1JeGaMtkdmwh/N9um/PnyYOyrw53Oypr/mfyCl8OTzXWkvvv45I
	xmVSE1eQ6dwr1HXxmv5p0zwjqbihex40Gg+ncRBQp/n7tOV/3KtcFLUPRu3SVg==
From: Ethan Carter Edwards <ethan@ethancedwards.com>
Date: Sun, 09 Feb 2025 22:32:33 -0500
Subject: [PATCH] drm/msm/dpu: Fix uninitialized variable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-v1-1-0db666884f70@ethancedwards.com>
X-B4-Tracking: v=1; b=H4sIAFBzqWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNL3ZSCUt1k47TEZHOLtGQzQ3MloMqCotS0zAqwKdGxtbUA4F3dx1U
 AAAA=
X-Change-ID: 20250209-dpu-c3fac78fc617
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Ethan Carter Edwards <ethan@ethancedwards.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=ethan@ethancedwards.com; h=from:subject:message-id;
 bh=e6u4jgCux0UDketL1vecCE7NvY4pCwpsgSfqIahNaEs=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0o0bkp2QXk4ekFKWGJEOXFoNThlVGp6e
 GhQcXlVeHBLOHNUdi9YbjVLaXljdFFLNTBiKyt4VDhoNXIzczNLCmg2M2M3NlUwT0xuc2Qvd2Vk
 YmlqbElWQmpJdEJWa3lSNVgrT2N0cER6UmtLTy8rNk5NSE1ZV1VDR2NMQXhTa0EKRS9uZncvQ0g
 zL0hRVkthdkxhK2xXWlFLanp4Y3ZQZmp6Vi9WTlNlYjdMd3F2ODJleGo3cEFzTWZ2dkRjU3FlVA
 pIeHhXT0R3TlhyQ25xT0Z1ZW1YbDNYZmU5YW5Qekt3Q2p4V3lBZ0JpWFUrUgo9dDY3OQotLS0tL
 UVORCBQR1AgTUVTU0FHRS0tLS0tCg==
X-Developer-Key: i=ethan@ethancedwards.com; a=openpgp;
 fpr=2E51F61839D1FA947A7300C234C04305D581DBFE

There is a possibility for an uninitialized *ret* variable to be
returned in some code paths.

Fix this by initializing *ret* to 0.

Addresses-Coverity-ID: 1642546 ("Uninitialized scalar variable")
Fixes: 774bcfb731765d ("drm/msm/dpu: add support for virtual planes")
Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 098abc2c0003cde90ce6219c97ee18fa055a92a5..74edaa9ecee72111b70f32b832486aeebe545a28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1164,7 +1164,7 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			       unsigned int num_planes)
 {
 	unsigned int i;
-	int ret;
+	int ret = 0;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];

---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250209-dpu-c3fac78fc617

Best regards,
-- 
Ethan Carter Edwards <ethan@ethancedwards.com>


