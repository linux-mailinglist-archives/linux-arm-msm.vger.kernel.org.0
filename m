Return-Path: <linux-arm-msm+bounces-2851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6397800718
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 10:33:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 667E5B20EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 09:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA451D545;
	Fri,  1 Dec 2023 09:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SeYjkzI5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 194CB3266
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 01:33:45 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54b7ef7f4d5so2234847a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 01:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701423223; x=1702028023; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHVrjeIvHlbkENQloINWmB2dsPrtzcOkwkp/DcbG/G4=;
        b=SeYjkzI5cMP4BR3ShT0Idgn/x3Hwp6sH51dI4B22CW1dIk8SqdWWvwyopbnhyu3K7A
         9TQzlCeKuDZU9QiOl94uNgX1Ki3IRgcncVjBQsC7Fp45meFHumK5P/D5wBLk815qzAls
         7t9hr3D56tqLFo4SK7QMVrVyWZGKiOjSXQukdnuIxhmy60BWctFCuYKKXXCTeWIN7e9G
         x/iKEJFNAMr++56ndZ9LMFLgetxcsoaVB5r2Ws3aP/lgZTAHbhuh0JRjLEOqGRkLyjE7
         eFcfdMvB0tLPNsSIRWIADsvn1TqdI+Z5HCCeVuEO9xHzMMJ+M8m9GCoFPXk6Jak3S+tu
         Df9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701423223; x=1702028023;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHVrjeIvHlbkENQloINWmB2dsPrtzcOkwkp/DcbG/G4=;
        b=BOc53Mq0wVBMnDIXqVpAU7DC09sSm31Izc2jeK9auqqdbKnX2XoOJSmm+o2DEihR3e
         kwCvGs2D0aE+6cnwVkylEhFCpAcjRgRUNpwmwR4uNJswiFydKwS4llAGpv0+ugVwQO9m
         zZ6DL0IEcdhnX9EVEAIap3VNjT/cw0Q3lPmhcQKdk6YwPY0tkdUs1IvsDFOLu4SEI2Dt
         EknmbEA25ZYtscgIXmDuI7ylp542U/1X+11EF6uRa08Ek9Nu4wnKoZlAM4GlPLzx14d/
         tsC1MP5BsghgsG6V8Um832Frw0Tay+9zaoAw+oHCe8WabGX5sSFoIZmRgYl8LZWksaNN
         U8pg==
X-Gm-Message-State: AOJu0YxoAcx1+vNWgI/V+3WufBgrqKNR3M3azV+yNwx3qw7OS//PB3AC
	aJjuQGOAC9Cctd2rDFKPFkx6Kg==
X-Google-Smtp-Source: AGHT+IEid4Ye47Vw7u2H0QYSqPZWJcAhKKUil0A7lFg/3cgLgNI+1GrOrPS+aUv+vw6IHdlWx7zz+g==
X-Received: by 2002:a50:c251:0:b0:54b:7a1c:6b01 with SMTP id t17-20020a50c251000000b0054b7a1c6b01mr589403edf.33.1701423223596;
        Fri, 01 Dec 2023 01:33:43 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (dhcp-089-099-055-216.chello.nl. [89.99.55.216])
        by smtp.gmail.com with ESMTPSA id b16-20020a05640202d000b0054bbc6b6580sm1423708edx.31.2023.12.01.01.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 01:33:43 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v3 0/3] Enable venus on Fairphone 5 / non-ChromeOS sc7280
 venus support
Date: Fri, 01 Dec 2023 10:33:17 +0100
Message-Id: <20231201-sc7280-venus-pas-v3-0-bc132dc5fc30@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF2oaWUC/33NsQ7CIBDG8VcxzGKOQwo4+R7GAenVMkgbUKJp+
 u7SDg7GOP6/5H43sUwpUGaHzcQSlZDDEGvI7Yb53sUr8dDWZggowaLl2Ws0wAvFR+ajy5ycbSQ
 oVFpJVs/GRF14ruTpXLsP+T6k1/qhiGX9gxXBgVvfaGl8J5R2x86FNPZDpJ0fbmwBC34QAYA/E
 KzIpcU9GGOFFPobmef5DTjxykT5AAAA
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

Devices with Qualcomm firmware (compared to ChromeOS firmware) need some
changes in the venus driver and dts layout so that venus can initialize.

Do these changes, similar to sc7180.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Move 0x2184 iommu from sc7280.dtsi to sc7280-chrome-common.dtsi since
  it seems to cause crash on some boards (Vikash)
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20231002-sc7280-venus-pas-v2-0-bd2408891317@fairphone.com

Changes in v2:
- Reword commit message 2/3 to be clearer (Konrad)
- Link to v1: https://lore.kernel.org/r/20230929-sc7280-venus-pas-v1-0-9c6738cf157a@fairphone.com

---
Luca Weiss (3):
      media: venus: core: Set up secure memory ranges for SC7280
      arm64: dts: qcom: sc7280: Move video-firmware to chrome-common
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable venus node

 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  5 +++++
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  9 +++------
 drivers/media/platform/qcom/venus/core.c           |  4 ++++
 4 files changed, 23 insertions(+), 6 deletions(-)
---
base-commit: b2a4d0696192f24f79ea71fea2d775da28fb9157
change-id: 20230929-sc7280-venus-pas-ea9630525753

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


