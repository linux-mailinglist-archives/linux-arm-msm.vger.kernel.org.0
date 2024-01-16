Return-Path: <linux-arm-msm+bounces-7299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A855482E77A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 02:48:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DD021F239E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jan 2024 01:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3022541C75;
	Tue, 16 Jan 2024 01:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YyvMwj/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0C041C7D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jan 2024 01:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50eabbc3dccso10669504e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jan 2024 17:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705367318; x=1705972118; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+IviJOxjWGSwzTR6EUReJVzvbpTGAhShFaB+riIyipo=;
        b=YyvMwj/qnVSQtMqb7/2fcVxIN9kZudrl+GM+pEoFC5jHvQf1vUd5vHDu3S+ElWnk90
         u8TOvSwCuuGZi7GRfTsXViyAGQYA9cWSKBfRvq0Ogr+yK8szPeOlhM0+BlDk1+5VC1g8
         jxyis//zmOHUNODfmyC3nX6Pxs9izLa1BUW9krmcxQCEv6m9Z3cU4dn1mmW0QxidUblU
         Lmhq0ndPzl9pz9s3S39E2zH8yRTeEW48SB84+BNmirZKk2Mx4SvWeL21CBgxhh5o2zp8
         lo3aI3E6c61cIvYWu6JGIBxE9KuLvKQzu3G/G0cbFw5RRz0ZKvkweK2U8AYPj2SEPlQN
         SP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705367318; x=1705972118;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IviJOxjWGSwzTR6EUReJVzvbpTGAhShFaB+riIyipo=;
        b=fMkRfFuWBHVmRxVZINvFjC5XV7Od/dls8kRQioRT+AsfwjwpWhlvpWTriGnWVqBE9u
         NofphRMiaTrj+pkjaV5w+r5pfGRLIvIHtHBbFM6RIXsE9Szd4iv7Z0OVtbT+g2JLyjuB
         WxHP1SnP99xPkh2l1Btvn/kOcG1WpDm+Lk2gLT9K0L/NzhHEgkovOXGD2apmDq/sCs66
         bWHLqMbQJ5021Sl5VesytyGD/zRwCmyWk9j++NeSV3BryYhuXfKiGcyw3D8mJmPlC8w2
         riAUfWmoUxhcz9jZ5QUcABQldidqSLDwc7db0+2jfZ+zRmkLImrZC9rjGiasZi3uqiLj
         eRMg==
X-Gm-Message-State: AOJu0Yy8ab5/w06U8m8PgGsK9Gazlqu18SwtCoxdObcLEWYc7werrmim
	KX5W0XxX2zxSOZXMwX0sq03o1iExppEP3g==
X-Google-Smtp-Source: AGHT+IGrrM4Vbmgr9m12MkFjiL7ZBoX2UKNafshAVTocDeAOpDoy1fFCyn2nwh999ekX59TtMHjDVQ==
X-Received: by 2002:a19:3858:0:b0:50e:8119:21e2 with SMTP id d24-20020a193858000000b0050e811921e2mr1271898lfj.173.1705367317821;
        Mon, 15 Jan 2024 17:08:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t3-20020a056512208300b0050eb2325472sm1615507lfr.37.2024.01.15.17.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 17:08:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/6] phy: qcom: qmp-usbc: properly handle the clamping
 register
Date: Tue, 16 Jan 2024 03:08:26 +0200
Message-Id: <20240116-usbc-phy-vls-clamp-v1-0-73b2da7691c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArXpWUC/x3MSwqAMAwA0atI1gaaIqJeRVxoTTXgpzQoinh3i
 8u3mHlAOQorNNkDkU9R2bcEyjNwc79NjDImgzW2MEQlHjo4DPON56Loln4NSIaqmv3oPFlIYYj
 s5fqnbfe+H3pA0O9kAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=WG5aoSjp586WL8fOrnwJNKotljm9XIOQ6TGo0OqnhCc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlpdcTr1oe+6CLVOtN9B/dycfQoAVk5pta/8upp
 iDb/y6OUxaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZaXXEwAKCRCLPIo+Aiko
 1ap0B/9ovzVFK9v82KghdYiMVc/RTDWisUCoN8ysBMXfg1gTckg9THhviCVdADVVqMDQIKT2FMq
 tOnbYV7vMCj9G3RFCCJawBBnIsuGKYnSZx1a77GGIiCpN/V0pBFy+lRfVyvv8zvUR5DvjFNoNr/
 C48o5cgQbwlHT3zXr5scZt/eQUC9tE0QN9lXCuDtxGQbIP7lzQDmn3sP2rXroZvoNxrHc/QyOJ0
 lCIZLHfGtzDBXKLjNxOSxDYeDhd1x7IZC0nWOPbAQ0bDau5WZ+f+l2fF3Xd8f8FOE5cKD6wYpn4
 mXf8OT9ACsxscR4a/+j5dQRL4eBsVJQZhiNBzX8HkFpJo/vz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The USB-C PHY on the MSM8998, QCM2290, SM6115 and several other platforms
doesn't have built-in PCS_MISC_CLAMP_ENABLE register. Instead clamping
is handled separately via the register in the TCSR space. Make the new
phy-qcom-qmp-usbc driver correctly handle the clamp register.

For backwards compatibility the driver treats these registers as
optional. They are only required for the PHY suspend/resume. However the
schema declares corresponding property as required, it should be present
on all relevant platforms.

At this point I'm not sure whether having a single TCSR-based register
will be enough or whether we will have to add more TCSR registers in
future. In order to avoid repeating TCSR handle (and having multiple
instances of TCSR regmap in the driver) use qcom,tcsr-reg property
rather than someting more exact like qcom,vls-clamp-reg.

Dependecies: PHY-related changes of [1]

Note for the backporters: if the patch is packported to the kernel
before the phy-qocm-qmp-usbc split, the phy-qcom-qmp-usb driver needs to
handle both PCS_MISC_CLAMP_ENABLE and VLS_CLAMP registers as optional.

[1] https://lore.kernel.org/linux-arm-msm/20240113-pmi632-typec-v2-0-182d9aa0a5b3@linaro.org/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      dt-bindings: mfd: qcom,tcsr: Add compatibles for QCM2290 and SM6115
      dt-bindings: phy: qcom,msm8998-qmp-usb3-phy: add TCSR registers
      phy: qcom: qmp-usbc: handle CLAMP register in a correct way
      arm64: dts: qcom: msm8998: declare VLS CLAMP register for USB3 PHY
      arm64: dts: qcom: qcm2290: declare VLS CLAMP register for USB3 PHY
      arm64: dts: qcom: sm6115: declare VLS CLAMP register for USB3 PHY

 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |  2 +
 .../bindings/phy/qcom,msm8998-qmp-usb3-phy.yaml    | 11 +++++
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  2 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  7 ++++
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  7 ++++
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 48 +++++++++++++++++-----
 6 files changed, 66 insertions(+), 11 deletions(-)
---
base-commit: d0f9c0b672a974d32c40d369f63e441a7dd66d74
change-id: 20240116-usbc-phy-vls-clamp-10189efdcf12

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


