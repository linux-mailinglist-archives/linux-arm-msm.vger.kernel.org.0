Return-Path: <linux-arm-msm+bounces-105440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YwvcJBFT9Gm6AgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:15:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBEA4AAD41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 09:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C101300EF99
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 07:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1EA364053;
	Fri,  1 May 2026 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4YVP7Gcd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA0835F5F1
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 07:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619726; cv=none; b=J778rCz8Kg7tRFDTfh69vqd79NxJ5FFlGEuYHs0Wahh5kmeYmu+Pjh2uzqTFCp0mPeR5mCLZBt0qgGFMpa7QR0zJxSw+UrFo9gL069EIIQmCGKmPJK0dSizkoC4cwPCqeUTz95WOkE4kvQb1/oZyTh9sgY2Bc6QtGbluPgNHOtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619726; c=relaxed/simple;
	bh=u4AOHqSTtzBSQJ6HpCIkCjUSJffdHCdBxVASoG0gP9M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HYhf4X6NPfTM0XTt3tK1B7Ga/R4/iBkdCfDff7uatV011MUWF+asYp7p0/YsXQPHQfoCcpIfrQUOIyI1xu4a9GqInCwqcBKXVRmDBWbDo9yMDLU0gdIR9vb6TUrsX1BvvUibV3Z0W2pYh8KucWwwkoqUND0Vnop6C5EgcNrUr7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4YVP7Gcd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso11732025e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 00:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619722; x=1778224522; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sI6xBikbSzlLlr8+nu1EBDSADrRpoTvBTYV2Ibu2fTc=;
        b=4YVP7GcddFGwS1xv14do3pgVcu/fQdrv8e40cV3YEEgL9p68JRKP2n74zYxP8n9jxP
         FKUrjVMFF3+RJ3zX1v/RePam0m1CkN+S8LnqsvGuGN9Ln/Gmdyh70Pb6P05UlLk8D0+5
         513K4ruN/xiIYXHI2LyMHg16VjlnVfFAZdVPcGAwhQVQ1fca52+lKuoeWGU61wf3wI1d
         414EKdnxJU2BblMg5kLeVIUAztHSMG9D6eNOEwG9Mufik9uMdBXjV9UwZw7ycJdsP5nf
         JFH7oc3Dytd93/xNgD1IAIlIZ/nn5sPpzTnhBTd/2/godo+bG17nNGfB0pGYeSWki5VC
         OSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619722; x=1778224522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI6xBikbSzlLlr8+nu1EBDSADrRpoTvBTYV2Ibu2fTc=;
        b=Cq6DaBb14uoJFz1P0lTGYq8ObK/TAwM4bgRZEmterDQ3h1m4uFtQgb6ZsG20EVSzvY
         DwHeqmMj/yIGk/inwi8S+DoKJQJ6fS1DIwzM4dA70MzJVIJ1FCli1fmfVKgyfscSiypS
         1t0d9vBA/MLbCHh+5nWkkRCfWqMQwrjbt1HFiNyG3n2ePafbxgqCzYKoFT+nB91o4xWR
         j6WLuMDOtHYfQUWJuwThyLJY9F9kPhbanTiC8aTcveHMjoQcHSK62WJx+6jfCjo7gQ00
         7bsik49kjv7ZT+Px0vcsJk+tRdfymzlmM1OiZy+kIHZFTlg7X95SiFrzqWewbcpsKow3
         d26Q==
X-Forwarded-Encrypted: i=1; AFNElJ/bDuMEJXzSsdtOS+FB98i10JthQDSP+rsjbRI7aPj5oZ3lSr+JdzGaG1m7XGW8AXu34xN3vHrgkh/I/LIL@vger.kernel.org
X-Gm-Message-State: AOJu0YwjOEEDHcDoKFnJE54dLw7YX+JkNN07eP/dmpNUYk9HQgE3Xb+C
	zzAfFfldAcT1wKBXPv1KmxiI+r91LUfVC4Y6L7PjZiSvDSxPQ+1SUOmIVhVu3aWFTRk=
X-Gm-Gg: AeBDietZDZ7Yc48KBK7JWuUeZ9JiK6pXSN3xBUfbOftZnE3v9rkFSoLuUVKj9YVEqGQ
	r38NMPTbiSRrWOtHAPFcx79lJ03oBeJqNAcNjAkgQ+RFAY2Ii8fhzwPYzJBw3uZtO1OW4LygvKy
	En0O8ghqiQ3x1HuhGRiEXSwflTpL4KrqnRXPLl8eJPg2bqAcbOECmhqp1sSzwXZHAERGb+IzGHs
	LwC19MFgRy5plpBHPAIRx38J3rmdaymVIqbxKJkYFUOYhK9OzZbv3WkewjPR/IUyZleQePGkNdj
	Pm1M5pPPX9j0ZiLfSOJSWVsgbFZmGS94FHJmeEo9aS3AKjeJHdelOZizUesduu6JfE+Y4JSQjmW
	UgH2nlYD43849d0enXkHt+VJ9fw7ncc9VGNREOPlYDO9myxT5wq4PyBlyniakY5v2l+FxU17Va1
	y0Duyty4v2WuHJkTyNqDOwOcCW1vgm+HlfwqtHp9UIhrnNb0sH97oG+8ifcbQd6Cayg1UejcqEd
	QpVZHqZ
X-Received: by 2002:a05:600c:16c9:b0:48a:906a:9050 with SMTP id 5b1f17b1804b1-48a906a912cmr8140525e9.10.1777619722469;
        Fri, 01 May 2026 00:15:22 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/9] MDSS / DPU bringup for Milos
Date: Fri, 01 May 2026 09:14:42 +0200
Message-Id: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Pyw6CMBBFf4V0bU0ftBVW/odxUWAqkwjFthKM8
 d+tGBcal/dOzsmdO4kQECKpizsJMGNEP+YgNwVpezuegGKXMxFMKC54RQc8+0iHLkbqLDNa6ko
 ao0gGpgAOl1V2OObcY0w+3Fb3zF/tX83MKaOlksZWXDedq/bOYph6P8K29QN5qWbxwTWTwnzhI
 uNNq3Za76RTrf3FH+9pAS7X/F567yONjUDzfcBUFyMsia7yUrJMPJ7h1v/1GAEAAA==
X-Change-ID: 20251219-milos-mdss-fa0763693775
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=2542;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=u4AOHqSTtzBSQJ6HpCIkCjUSJffdHCdBxVASoG0gP9M=;
 b=GgAn3RCm2XTRW5OjQ+9yxLpcVCl8ULnaPfWJ+XpSU7o4jODj3CqRfHbV30ApXcp5M9nxIWxiw
 kAlD0wRlopCAlpDgkQ4p7NOWIyErcqyzn9fo1la+zMw9s7OPySz6Ezj
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: CDBEA4AAD41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105440-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This series adds display support for the Milos SoC.

This is tested on the Fairphone (Gen. 6) using the SM7635 SoC (8bit DSC
cmd mode), and the Nothing Phone (3a) has also been reported to work by
Alexander Koskovich.

The panel driver for Fairphone (Gen. 6) and devicetree enablement will
be sent later.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Use "contains" for mdss-dsi-ctrl matching
- Fix dt_binding_check for qcom,milos-mdss.yaml
- Pick up tags
- Link to v2: https://patch.msgid.link/20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com

Changes in v2:
- Address comments from RFC v1 where it wasn't confirmed working yet
- Pick up some tags
- Add dt-binding patches
- Drop fp6 dts patch, that'll come later
- Link to v1: https://lore.kernel.org/r/20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com

---
Luca Weiss (9):
      dt-bindings: display: msm-dsi-phy-7nm: document the Milos DSI PHY
      dt-bindings: display: msm-dsi-controller-main: document the Milos DSI Controller
      dt-bindings: display: msm: document the Milos DPU
      dt-bindings: display: msm: document the Milos Mobile Display Subsystem
      soc: qcom: ubwc: Add config for Milos
      drm/msm/dsi: add support for DSI-PHY on Milos
      drm/msm: mdss: Add Milos support
      drm/msm/dpu: Add Milos support
      arm64: dts: qcom: milos: Add display (MDSS)

 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/qcom,milos-mdss.yaml      | 286 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml  |   1 +
 arch/arm64/boot/dts/qcom/milos.dtsi                | 211 ++++++++++++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h | 279 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  29 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  23 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |   5 +
 drivers/soc/qcom/ubwc_config.c                     |  12 +
 14 files changed, 852 insertions(+), 2 deletions(-)
---
base-commit: c9bd03db3e792a99e9789fde20e91898e3a29e8a
change-id: 20251219-milos-mdss-fa0763693775

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


