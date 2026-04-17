Return-Path: <linux-arm-msm+bounces-103529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCW5DxEz4mkZ3QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:18:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C82A341B8C6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3A48300D9F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A19E25A645;
	Fri, 17 Apr 2026 13:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keZ35Q3C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ED5346AFD
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431880; cv=none; b=ljM6+0SUvJoZYDjJNRDev961TPSUde6Iwot1vJVBB7qtPo3rRkEfiXbWPRshrYwZ6SfvGZHwoeVtBSjqEsi6oWctDGrelyl1tcJl4tl3LZBCLs49btyQgnZvvnNrpzTOD4aT40Nk1UjUchqPeIYOyyFar+IDx6Gf5T4u3emFDe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431880; c=relaxed/simple;
	bh=4DyngOCiUwuBV2TeTJ6rHi1WlGo4jcEcygxJzJUYMg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sIzUa/XuChODvELisEPMyaw/NtE2vgrrPCTuwpV5195YgYBUkaEVrqamOmvYYbcNNvgSwBtF8DSlaokhwKOw05iGOH4/ko0EMox1i25DkMLh7rTehN1uoEGX92/d2jt25fpZUOs3i9YnvIHHvhqPqDstLQXpMG2R0FVccbyIeCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keZ35Q3C; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ad4d639db3so3672825ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 06:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776431878; x=1777036678; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=glqQ6qYTvvcF2xmLwx4uSSeXniDWz2W2Hha8YXauDbg=;
        b=keZ35Q3Cm+9tQmqyn7idobogOY+URcZ80hyR2rJNTtbHUhyQwuDf+J6Qqy8sCsfVu7
         k8XhKlRgFx5Ku9NO5jt5Q/kQ50VE+hNubt30Lme/yIqVwBDK9KwEJoxveaP81n/jGRWU
         ARAyWhTskyQHVv36Ml2ZK1v8GQFjhYjh/0J8vVnwK4axc4nVqJm/PllpEvx4pZHXB2Ah
         vNs/ZCU7PAFXyqKq3UKLERwqPzyZnIkunrU+qhCWlJ7ZRflafCI6Y1cCQS6oRbQW2kKQ
         cJI41g/23HEMLULOmdOv8fADVrk6mNV9btfdhae6bCLZbpGdqJsLVQstrahAJmHZoWta
         I1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431878; x=1777036678;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glqQ6qYTvvcF2xmLwx4uSSeXniDWz2W2Hha8YXauDbg=;
        b=cNY2vsAnJxqJ0Yns3IYQRTaAKDOmKgo57XVdKSLzdAGcGU0hgeK7zaPoIGqPsFzdEk
         EDzin0e1AuivyAlJxJBkhON6Llxg+k6RE4NQjmXwe78Dq7TPIRMsRVvMKS++lMmXpeP+
         1u2juhRDOOCZQ0PoBNJl06xw+1ErmIBSFUQ9afQr4U+UCtgwx0tUdNa+oqJ3qqtdmaSA
         JOgdBFVrMkfpUg5ywnbv3TQjyPyXGjQOyK4WM7ADpVYXHornP+I7c5dX6WGOjG0rMctU
         g0kCnDl78c2v12D+6V3bLKDb2kVYUwt9CaxyCMc7rC6Sx2x424bFwa+4dGZthWBUfbSR
         rscg==
X-Gm-Message-State: AOJu0Yzy7zJzmcao51GARkgRKLBw5G4GuawiDCYW7q9qbu8z+pjfITBS
	RMoTCLHXvfM80o19F8rIg/t4fIynOrjHFmoPMPkB8sR6Kpba5CzEKu3t
X-Gm-Gg: AeBDiespntmi5uFi5zTNuWilX2c7H4y7xApnG55MNp9DpsIctnjoW7u3pEnrvowC0Ee
	WHOT6lC5SSJjCnW2spGvfmSWvyVSUt2/BZhYH1lhLgL3W/3mpM2/bGGgVFwJpC6hB5PB4cmcW26
	00nhnLPPnxy83T9xdK4CZQuVtMBYVF9IDYw/L8gk8dIC1p3MtxLUO+LwIQaVLf1vhQQjD1XmwRQ
	n6cX26Kv7BaXVmN5IH+mN1bLfL8a3BlPRiNNBQ7Dv6d7deS1NE87nYUV3qECAsAIJtKFqOSc5OA
	2yUvqJOvZadr7sriXkcSf4aoayqOL3JpJWQwV+lyct1B4YZ9KOrmC9GUHxSHXrg46riK5Ed6/aN
	5y7V1u+IzavCRqz+8UOAzwD0UB2YBGce9rqvureUOFnl9LSroKUVPIXEORjenER1l1piUUy1BBj
	jYJx3Q8w64AwSq31rUDWS6ld9GbgFAp9FTl8d7UqzWS1ihUA8DY/eW6iQB+gh4KC8k5eqjuDAZH
	pKMOtkhuAgsoSBhwNcDIXXpmgZMmLEW+pT+ijk87w==
X-Received: by 2002:a17:903:3c70:b0:2b2:58c7:2ce1 with SMTP id d9443c01a7336-2b5fa02f3famr32590055ad.36.1776431878170;
        Fri, 17 Apr 2026 06:17:58 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0d0f8sm18580465ad.47.2026.04.17.06.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:17:56 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 17 Apr 2026 21:17:52 +0800
Subject: [PATCH] soc: qcom: wcnss_ctrl: fix firmware leak on req allocation
 failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-wcnss_ctrl-v1-1-5811ffbd8f49@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAz4mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0Nz3fLkvOLi+OSSohxdE2NzC2MDS0sjU4tUJaCGgqLUtMwKsGHRsbW
 1AJxhjxdcAAAA
X-Change-ID: 20260417-wcnss_ctrl-43783099258e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rosen Penev <rosenp@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776431875; l=1591;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=4DyngOCiUwuBV2TeTJ6rHi1WlGo4jcEcygxJzJUYMg4=;
 b=15lsJh/n+7T7NdelBPrtskbIZPOV9i415wPEXjZKBBNC6Aqqn6TpcLLdKzZOHOBBU/H7hw/sL
 1Vs5p9xqiopD2Ev7DSuAbgBEUaA+9VIPKDzC0d2xEsOHS2JoIY58I+C
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103529-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C82A341B8C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In wcnss_download_nv(), if kzalloc_flex() fails, the current code
returns -ENOMEM directly and leaves the firmware reference unreleased.

Fixes: 908061f0ad30 ("soc: qcom: wcnss: simplify allocation of req")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/soc/qcom/wcnss_ctrl.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/wcnss_ctrl.c b/drivers/soc/qcom/wcnss_ctrl.c
index ffb31a049d4a..f046d0248306 100644
--- a/drivers/soc/qcom/wcnss_ctrl.c
+++ b/drivers/soc/qcom/wcnss_ctrl.c
@@ -221,8 +221,10 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 	left = fw->size;
 
 	req = kzalloc_flex(*req, fragment, NV_FRAGMENT_SIZE);
-	if (!req)
-		return -ENOMEM;
+	if (!req) {
+		ret = -ENOMEM;
+		goto release_fw;
+	}
 
 	req->frag_size = NV_FRAGMENT_SIZE;
 	req->hdr.type = WCNSS_DOWNLOAD_NV_REQ;
@@ -243,7 +245,7 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 		ret = rpmsg_send(wcnss->channel, req, req->hdr.len);
 		if (ret < 0) {
 			dev_err(dev, "failed to send smd packet\n");
-			goto release_fw;
+			goto free_req;
 		}
 
 		/* Increment for next fragment */
@@ -262,9 +264,10 @@ static int wcnss_download_nv(struct wcnss_ctrl *wcnss, bool *expect_cbc)
 		ret = 0;
 	}
 
+free_req:
+	kfree(req);
 release_fw:
 	release_firmware(fw);
-	kfree(req);
 
 	return ret;
 }

---
base-commit: 452c3b1ea875276105ac90ba474f72b4cd9b77a2
change-id: 20260417-wcnss_ctrl-43783099258e

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


