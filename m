Return-Path: <linux-arm-msm+bounces-15677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF2189147A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 08:46:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B98B728861A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 07:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3241D4177B;
	Fri, 29 Mar 2024 07:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="HtHaIHOP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D818563BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 07:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711698361; cv=none; b=C5x5lWtRIZl3xNQdfALIq3NZtrMbK4GJozrOAahvKngWCDtmhuvGUXSDsQQszrhc3VthEtwhky5shrH8RER8n6+T2jtepCJoe2CXgS28hK5Wx9OdAuHnur6OyoRJyZvdSoJaYpQ9lk99AfQ0kQwy8gX0gOyo0SbqMoIMBy3Jjxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711698361; c=relaxed/simple;
	bh=JfvR1AJwGyQZ6GooEi3cFI+W+VMqE+KSEqlmxky0qk4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=it7JL+I328+16GR/FJbbfyLPj0dpR18arOVSr+ZUjvYnl1MYCh3SP2ntz/lGpu+cy7lChogsMBPhsu5brs+5gSd4QNihOm1y8epi26KPXEr2iZBSUgShE/Dyfwbt7Ou9EqRxWJioAXWggzJ3Q6kT9c2t6k3uLwLQngUjjZ3eBGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=HtHaIHOP; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a45f257b81fso191198166b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 00:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711698356; x=1712303156; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O2Yw8I3npoX2UZ1a8v7MBLYBW49lXvLIxaEAjAdwtH0=;
        b=HtHaIHOPkR6v5SqhwoFadWJDaVJeS2Aw9+qhDNgWJJPT/rx6JapKUz6IzZcqoACpeb
         jb7uVL9gJxHSCBq74fcQB+qg125RENGARxUe48kyNUZM/nZP08ivoyvUiEzbdcPUq0YZ
         plCWeASY9HGGhDNjhYiSQ8d08NgJB3usGOXDCApGogejilo6YdWo1UCAcLC3Uzkcdk2a
         EeEDdY6cCJ42N0m9sU0WOYuy29tBWvbtVsR3TdfmeAaUy64WIiKuvOXRbsvwAP69V0tp
         HvY7ShVa5OTatHF4rC6PM2M7bjMhpXpxKS9sWBKIaO6zZJYkk3GCRReo1+k0aBNjFd7t
         Qoww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711698356; x=1712303156;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2Yw8I3npoX2UZ1a8v7MBLYBW49lXvLIxaEAjAdwtH0=;
        b=mGnD4LNAbDfGpuvfQLhPoAW8BNy7Lmq8p9oWLzGUfKQBxj1X5fVgFxv2xwMHUXP4qi
         5gyK+ISKKynlIvFhZGWVHkPcs4I+mXeQJilvPRaV2AuO0LUZQ4FyKK9IObnp1l8pzjh0
         vqhpxWvT0fi+ZwA1OAEWOVCdjM7A4jRp2Im2xBBktnFcygnEFTNip25NpdPX+SBLzD6S
         oE+msYcrrJzOnOXuvllb62OuvHlc2FniXwEqmz+om7vbXvLTHvaqNb45TdOFp4zSGcJH
         gLTc89DBVLeaRPvZ5IEfKLRxPCEXzXoTUO+jz0uzhfOdnm/NzxywsEp0Gr/ug7Qo6QCy
         lZmA==
X-Forwarded-Encrypted: i=1; AJvYcCVPfEpg7kHocgkEYwX1q3gzp7twLwkermTAU9fOQHw4lFO1F8dWT6HWTPaMu0KpIFvX/cnh2BeHE/Ebd9a4ONqmuXfeTktaAWw5a9ZEzw==
X-Gm-Message-State: AOJu0Yxwwrjhu6QQmeZTdSD7RVMkV86HxouXWUS1XAy8SQK5Qcs54zUp
	Hn3x4f7kEj2GkRw7i5P8c9RQnGyzajCFE64RJJEimqaQRXOGw3gtPEFyjp0s60g=
X-Google-Smtp-Source: AGHT+IFxPMIBsdZk0Lxri/jnEnAqJk6fcA0McqLNuoYlYxcF2e/U3vOHL2/tR0eQxjRYpIKHZ4rGRw==
X-Received: by 2002:a17:906:f6d4:b0:a47:8767:671a with SMTP id jo20-20020a170906f6d400b00a478767671amr1115394ejb.21.1711698356276;
        Fri, 29 Mar 2024 00:45:56 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709060cc900b00a4e24d259edsm1382737ejh.167.2024.03.29.00.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:45:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] DisplayPort support for SM6350/SM7225
Date: Fri, 29 Mar 2024 08:45:53 +0100
Message-Id: <20240329-sm6350-dp-v2-0-e46dceb32ef5@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALFxBmYC/23MQQ7CIBCF4as0sxYDAxjiynuYLiilMotCAw3RN
 Nxd7Nrl//LyHVB8Jl/gPhyQfaVCKfbAywAu2PjyjObegBwVl2hYWW9SczZvTAmURmg5KWWg/7f
 sF3qf1nPsHajsKX9Ouorf+k+pgnGGQjuLkxFO6sdiKW8hRX91aYWxtfYFvdDmaKYAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Add the required changes to support DisplayPort (normally(?) available
via the USB-C connector) on the SM6350/SM7225 SoC.

This has been tested on a Fairphone 4 smartphone with additional changes
not included in this series (mostly just wiring up TCPM and the SBU
mux).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Fix typo in dp-controller patch subject
- Use 'contains' for subnode in mdss schema
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com

---
Luca Weiss (3):
      dt-bindings: display: msm: dp-controller: document SM6350 compatible
      dt-bindings: display: msm: sm6350-mdss: document DP controller subnode
      arm64: dts: qcom: sm6350: Add DisplayPort controller

 .../bindings/display/msm/dp-controller.yaml        |  1 +
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |  9 +++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 88 ++++++++++++++++++++++
 3 files changed, 98 insertions(+)
---
base-commit: 871760455183dc66b3e185f8d3ed2184cc9fac25
change-id: 20240328-sm6350-dp-41238153b448

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


