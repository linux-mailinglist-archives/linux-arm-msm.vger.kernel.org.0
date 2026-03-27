Return-Path: <linux-arm-msm+bounces-100366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMq0EYKtxmmiNgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:17:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 880173474BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34A31305F3DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB88346773;
	Fri, 27 Mar 2026 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="e2+9tPTE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746C9344DBD
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 16:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627954; cv=none; b=ch/kMt5NwJV+rBEQ0bge5//L3li7bCT7XHyDLamBTOvLnouBNX60Kgkn0xG37816ycWdMnuJg+lkrlOkY0r8N0juR539sLchKYfjR6a10yoCyUbZ9fspezlViAxf+wjyFVA0IywuQ9z5SvnT2bEYoqFsG264JtuDvTyWZGKvEt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627954; c=relaxed/simple;
	bh=10yPF8/VWMN/hc4QFl8Moeagof4tQyNFqpgYHI7SJQU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e5vKHi7al7R9kw49kxIga54r1C54jfqemDn36QP43IpPbRQHtQaCSAGnt3LZ6qQlluJBvXTUi+yT/FoTapb0CKlnccJ2CvSwFwYD+nXLavJ+5z+/ndou9oT1np1bNiTe6mwe600uoFv7U8WjrECoel6LXiGo2hUgoOaDysjdjaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=e2+9tPTE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b8f97c626aaso409675866b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627951; x=1775232751; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uI4iVL61EfDlecebQOI7GUlddKXIvzUTtydmWf5G7Iw=;
        b=e2+9tPTE4XWdbKnW2oPCCAGKrmWENSkFa9ycJ1Fif1C45QJzcdJTQ4TAvKVY0RtgmL
         KtoZ4+JSdrJxKIgI8QmAOkhvX7xOCJwjMYdilCWRIkXP0FLqnJSEEVNxvmSAd9cwqA1U
         5h+VsQ/ai9BLvJvgvhCO8Jyrw8xixZx2AdQH/zyyS5Ob+w+fTr+UmHPbFBgmqoGGF/7E
         qFOuM3R7+1eKE2HAnl26Vf4exlEJhUtzdcr6wMnyBGEf+XpgLI2NcaSq0oanfVdvI92G
         MHgusvMOSGNm7jGGCGhghCwAI7gxhVFOlXUNdKY0Cf+6TqT5ONMdvTl6gqoKvIxAODkW
         mlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627951; x=1775232751;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uI4iVL61EfDlecebQOI7GUlddKXIvzUTtydmWf5G7Iw=;
        b=TTVFg5m6FIDwxkeKgLLp4qUBmZwe4Aigy1MlzjjHpz/SdL21r5Do4BdB2nrr8udM6p
         4RYVOU36+y/4j4ANbBY91mmTp3PZvAmHf672tdcLq9gaKLPbkDm4tKJRUwdOWfx6Hg2R
         urTpOCUyrE0kTU6VgOlYP8046tu8GPzXA8+ywPYc59/qoGBqlmVtxEQGDA7Y85dH9Hdw
         T2T8R8sRfsTlPtA03GfVCD9FnnVvFu6aUHK1csFzwYhTbJsj3P6tN2dCxW8Kl8+nF1ad
         dLzTXq0w+98ndIVKZeRT9BcDN0lpWYTMnRGmN+HE9jD2Fa7yB6Ey3E8CKwKBCl06OHI6
         +wPA==
X-Forwarded-Encrypted: i=1; AJvYcCUNomj0TKqRfHG2r2Di6Yrsv5gAG/1Vgu1Fi5wOYZVigcqwlPDcqppbpmh5wwftCSDaxYkFHyD558GutKXU@vger.kernel.org
X-Gm-Message-State: AOJu0YxKyc5XJZe/D8T8C2dhs0dejR2yWh3y1taC4/y2XoKU1Pw5GQ5s
	xvaqIkm0rujbmk15LwwKR3HctGPlXnbawKP4Txwvhv6COjbhxLysW6uqfmYSrXc5L+M=
X-Gm-Gg: ATEYQzxuYGbfCo1Y42cDdlauTH0Erbe2t3PrDNHhD/SwTuRw65W3c1eVzlrcjU4pjkA
	36No6fYrrIQrA0HwGmKvavXyPjq992i2mQLuZ5GQ5zFoThXmpKWp7YrBMOBUyi/ZpWPg/gDw9sY
	5eAeeIaMqnp24NneEdXiACuxoc50ORsQwN24ztpwvxIzyrXqq9DOXnRbOO6Ho3jQMhjuuooOMhr
	fl1Emcs1szptOYaaq8IjV1jgkT2/F08LDbOsQtsWCekTnq66nBrCWT4XJyoMOWzvGY0wql/5USB
	+9IpsV8S6YFk0aSpbHRNYaTziFeu9QNPpFJbyCaSluIP/aK4KiYSlA/vD7KBx1J+Bux8hFECc6Q
	W5u2OxMrDbYfn6n897czIFPhpUikTrJoYhuKBu39YZChp5/46RI/Du8E6yScrnCzQZdtdmbWQBo
	iD2xGEEt28jFW4vRbSTDp/xVYJaiLUUYuWixuXHsHEp2N1Jh0brIvk05krjJ/BWF8DStwg18tPT
	5CFkQ==
X-Received: by 2002:a17:907:3e96:b0:b9b:171e:baf0 with SMTP id a640c23a62f3a-b9b50175870mr202321266b.7.1774627950599;
        Fri, 27 Mar 2026 09:12:30 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:30 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/9] MDSS / DPU bringup for Milos
Date: Fri, 27 Mar 2026 17:12:19 +0100
Message-Id: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6DIBBFf8WwLg2PCqGr/kfjAnWokxSxQI2N8
 d9LddvluZN77qwkQURI5FqtJMKMCcNYQJwq0g12fADFvjARTNRccEM9PkOivk+JOsu0kspIrWt
 SClMEh8suuzeFB0w5xM/unvkv/auZOWX0UkttDVdt78zNWYzTEEY4d8GTZjvcEV7v8l8+BkhrE
 9By95iv1QhLpkWumBSqNLYvpfHBp9kAAAA=
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
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=2322;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=10yPF8/VWMN/hc4QFl8Moeagof4tQyNFqpgYHI7SJQU=;
 b=9oPXoqG3XMqtp6BcyU4qHCegc+zNhFN7LJjx6NEN8RDodef5FFJKVS7qu7kmGmCyixaAYds8A
 jouuE+dbgNYAHi1BR1KXXYSNBeUJP8ywnCngw658VW+7vzKQ26JukT2
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100366-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,marek.ca,quicinc.com,linaro.org,pm.me];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 880173474BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds display support for the Milos SoC.

This is tested on the Fairphone (Gen. 6) using the SM7635 SoC (8bit DSC
cmd mode), and the Nothing Phone (3a) has also been reported to work by
Alexander Koskovich.

The panel driver for Fairphone (Gen. 6) and devicetree enablement will
be sent later.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
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
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,milos-mdss.yaml      | 283 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
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
 14 files changed, 849 insertions(+), 2 deletions(-)
---
base-commit: 50f91f877c695c7ce6cabc3df6a892ab7abc6c3b
change-id: 20251219-milos-mdss-fa0763693775

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


