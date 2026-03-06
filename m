Return-Path: <linux-arm-msm+bounces-95751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDClJtGdqmlLUgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:26:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FE421DE32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 10:26:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA2AB302F708
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 09:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260133446AB;
	Fri,  6 Mar 2026 09:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnHw1/Xg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0573533A9F3
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Mar 2026 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772789199; cv=none; b=nOwjQNTbEspMeW2f0gzKjKAnNocfcEzrIEyGPX17axkJMSAh1omXDZDkSIHNbDkCeOMDo8ZR963x6gqswLiBzhng1bsOpuaOkXdpIyW2IBU5J9XNhAinuzeQpmI8YddM6TQR3Jn6w6kwjghkycAOdx9D6BGyY6zmYLXQWP9oUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772789199; c=relaxed/simple;
	bh=IY70Dvxs2i4cs22/BLr5UD9VRHpFdLATTLq1exNNnfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jeSYQZ3M6pXPMFOmdg/KtsePaYIXv7IajFdEsol1O1Zd4+eM4oUdAe8B4TfG0K4A1JgmK4HuphKrezRXZQ2g1ZI/JmPBlgrc/EIGbf2d5x6utXu83Z6W89PyBhxKSiO4GyPfI+OsTMkI7Kep9iCJCaH/9o0yGo+KjFHTJlexyIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnHw1/Xg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ad21f437eeso64048595ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2026 01:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772789197; x=1773393997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GASaaeIc7bq6+Q3h14hRV19dPYKwOXv/nhaVWKzPPQc=;
        b=nnHw1/Xgcox273IcxZKVRiKpo0zijBq0XHpqNyYOMuByuae4UUFXeH3SBRSod/bIEK
         PcrzMSQp9032+8ryIUpy/oRzb/OYzAW18EiJuujL0oki8Cwp8LcCiEFgPT1J/nprxkJ7
         MBxKQ1vVjc2i6XVcD8uNs80ptcXUNYVBtcv+eIKTJHzt5oCZ+yn7JC7QsOH6/WZ7P2t+
         xYoY/deOuN+c7wZNYmgIT5JYT2cXftlk8pumm8zQdWK/G7XU87MHWD3lPheT3ZuxmPEk
         4DxP9KphlKfBrPn3/TmwYH49sea2lxdyXGH5N5KVPft1IbIZXY4Jv2NmQCouUGz5y7hX
         GQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772789197; x=1773393997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GASaaeIc7bq6+Q3h14hRV19dPYKwOXv/nhaVWKzPPQc=;
        b=mwJZpRTFLUoIyhAtxgYue7+h2YPsE+dRahBL5p7RfGDuc6NrrRRFVQoPoHLyPalkDq
         f9W+nTA/y3ieE8nRdIkDAnHOBnbcWcgBOU1otsWUFnFkdtfEqzL4WDGAd2c42iYs/7Q5
         Xi0QpjMAVOeCrBxlcbrYuFSxe/Ueei6H4VJxNcrP7/hM96VJM9nc6ys+jj6RJYAusGht
         ZYmqZaTlredSpgHokFvWrSf4mHocP7T2lG+nnmV0Fv3S/fRz9Q2vh9gD3ScD/RScnlPy
         Z7ezwaGoAVDfkB1QdgT+JoSKxRlmyd5+THf7X7MOGKMk/vTQGPHbkEoexrZI2yk+kho+
         IK+g==
X-Forwarded-Encrypted: i=1; AJvYcCUHlWJ7jlYkS5enCVoZh1U7rWqXizel+iwvrvrQyXoimvjf0j0+hR2HDHEE3xwsVKUXizeU2RpTfLVUw0kE@vger.kernel.org
X-Gm-Message-State: AOJu0YyWw/UDCGa5+jNTeby1eH75GG6db6QJ21ySXwAsdA6gGoH/5RPf
	K8txIHQqS9fT7gToq5bYOki2JQ2dOpjkV8yVePR3Mb/m5rMUI8dbVqpvfxRl8tOGb2U=
X-Gm-Gg: ATEYQzzF7ixxP4AsGk1QcnWSpga9u1ytCvJOJvWSubwly98wKciGBp7QZi1dgzwGorC
	sxsLGY+rVOcJsiO/N6fKOJ4lqky4POqyJlyXb07515bfFcl2xPIvrD7cCRZwMitwWADjeo9f0Eu
	JKTWt/BnrRRqmwKtchl4LKG+7mykiOjI9Z5k5wUS/CdLW7n2fQmhkpkQP6LgMTPbUBT0ProUwHX
	qK8wX/k46Iosig2WVYAPjiPRz6NXUBVaPpSe8yUlF8+QPRrMZW7DroEY6dzbKiGjUTvl4n7zv0Y
	OZg3JZOBkXEUu+COtMZEHxPKAFURR2RkVgDhJ/nm8Nn33+MJ+ZmAJDKGNA7HSw/MoYuUwsJjT+Q
	gVxlPpeqyF5RVLfkOmoWxmFOxOQ0MJw5xke4C9OaRXDpo3yEF8HKcYDqR5tLy345VYotbZwyt2f
	NTVGQnMARZnRrYH2WB+A==
X-Received: by 2002:a17:902:d501:b0:2ae:6163:345d with SMTP id d9443c01a7336-2ae75b4e528mr47926475ad.12.1772789197338;
        Fri, 06 Mar 2026 01:26:37 -0800 (PST)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57afesm13214405ad.6.2026.03.06.01.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 01:26:37 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: setup RC model properly
Date: Fri,  6 Mar 2026 17:25:53 +0800
Message-ID: <20260306092553.37973-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 44FE421DE32
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95751-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Using incorrect parameters does not seem to affect the display, but we
should use the correct in accordance with the DSC 1.1 or 1.2.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 31 +++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index b60b26ddb0..276c63d2ac 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1843,10 +1843,35 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
 	drm_dsc_set_const_params(dsc);
 	drm_dsc_set_rc_buf_thresh(dsc);
 
-	/* DPU supports only pre-SCR panels */
-	ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
+	if (dsc->dsc_version_major != 1) {
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "Unsupported DSC version: %x.%x\n",
+			      dsc->dsc_version_major, dsc->dsc_version_minor);
+		return -EOPNOTSUPP;
+	}
+
+	switch (dsc->dsc_version_minor) {
+	case 1:
+		/*
+		 * For DSC1.1. the upstream lacks SCR parameters, the downstream
+		 * parameters are unverified here, we support pre-SCR only.
+		 */
+		ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_1_PRE_SCR);
+		break;
+	case 2:
+		if (dsc->native_422)
+			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_422);
+		else if (dsc->native_420)
+			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_420);
+		else
+			ret = drm_dsc_setup_rc_params(dsc, DRM_DSC_1_2_444);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
 	if (ret) {
-		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters\n");
+		DRM_DEV_ERROR(&msm_host->pdev->dev, "could not find DSC RC parameters for DSC version: %x.%x\n",
+			      dsc->dsc_version_major, dsc->dsc_version_minor);
 		return ret;
 	}
 
-- 
2.53.0


