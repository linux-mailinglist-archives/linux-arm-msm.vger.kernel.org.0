Return-Path: <linux-arm-msm+bounces-84846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2074CB19D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 02:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F40330CFC23
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 01:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF46227E95;
	Wed, 10 Dec 2025 01:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IJwLtN6E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78892264C9
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331019; cv=none; b=LXx3l0ABQZWrRVdvsTh0bA2g0jlNb5Aj+oTHOotdj99v+qU/1UFhjDtF8yhRgIbnxVIFJPepomEVeExdNv82a80hFW6uf+NPcYhK41QxheiD2kwgVJ6Uk2zYwd5PDFbr89SgnaX4Oz60N6RY9mqDtnaVrtgs5R2jM1QmEoCdqBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331019; c=relaxed/simple;
	bh=W8/D6Zte+WLuzj1BAkQdHKSbz78N81zx1LJo/v0yIRU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nnsM0MhZiL3AZIZEWCWL69wkhJhOig9oxO+FvUWpbI2Xw71mKtBbi+l4s4Z1fE6WIdHoXvrDDh3znVD/klDBoM2ezdnmuswdClgZrC3Q+eQ1Qcz2E8sfp/eyNeOL4pnpRdHSs4Ib7C3sPTJPj89YPN5pVZwROiYJjFR1WzcAvr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IJwLtN6E; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso31727195e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 17:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1765331016; x=1765935816; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=urnGBbYBlge0MPMnEMgs9eDhJcIT7BulOmvs3UtoNbk=;
        b=IJwLtN6EdeV9vU5oSoi58gNLustcSwmWA1Thi8i5/TGrsjiJbizz4ZMmFBZUrZdeTF
         znT/+KyTeIvIjyDyat1rs4FKnZu1IqOO9igv0tppQm+V2OrnsTKZeAYTRb2Y+b26kecI
         LX96d6dSTj8JerlESD5Me44d/XA3XsQ7wNG2gAf5qW1IG7IaN8MMTa2JLJbtw6bQUQ6E
         etlS8FqVzHZ3IokR1OWAcTlMoM/w4MgR1Uun5gFr5QRDh6oQCwRcgLzlZiJm3MXxTecr
         1oSltMo7YyabTtpt0CyYP/Zg+kbiUx+/kO0BWGT3FRdW2tc2zU32SFNtIWlgvbzfdlbE
         5mZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331016; x=1765935816;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urnGBbYBlge0MPMnEMgs9eDhJcIT7BulOmvs3UtoNbk=;
        b=VVCqWoGpAU+ETV7rVgWDdzjNcfbGfpajPpjEqUx5fT3hoKKbbS+mRaJLRVrxCM3x2n
         eRQqs5+1tzrr748Q9xo5FelLRyCWtC0twgsC9agOpXnPPELH14W1TkchQo4QMFAmlcWV
         zAUPwriM00sP4rFEbVjjfcE70bhdDi4saIyCRYtP8Vfk95WhH9aXeHnqDKgJasMcOA04
         phn9YMHPDFtkIYY+llqa7CE53W2aXFwIo7FyLlQ7+SFcv8/SGiw/yH8K6WNITTWCIBpF
         gGhsx0jyYoRRJFc863A9zbpSKm7F32gYUk2O/dfbZe0x8/JCRkwOPepnRM+KIZga6Mnz
         jp2A==
X-Forwarded-Encrypted: i=1; AJvYcCWKRmoJOl+UktDJO+vR1lReC5f/RkEbj7Y9EHqtwD2y/1+pBXPoCIZXOwB2E1ylf6uBnTfLyB+rQp3uKL+m@vger.kernel.org
X-Gm-Message-State: AOJu0YwhuZo8fmSKeFFI26mnqS0+3oJEWrvhZoFMiyTNsHQX/GIdVhuI
	0bAxdhbf3bysIvI28uhbmHSL94Zes0chBgD29yagVX8+2osGh5SYPEthXEVV6HvG584=
X-Gm-Gg: ASbGncuzIShoFgaMAwGHRaJVC2AQR97wZfwlmnZehbmCWZeYaRmwtjB0BIK+AhamPsH
	S602XBAGnKaZVorjIwaAe029pGwJLoabApilxszWli8723h3lfxmDjyJ9PMLulFDXxx4g5ysaDN
	bxDDV2+41jnTvs63r0HbRnBGNa8tDkITjZg5VoAPEqDZ67ZvSb2aCCHkqH/HuZ8/M4/6FM5zQ/h
	ZpsRd2BwYsercWJaqXTz5jMbRAXTMzwm9gIYUP+5kPR82J/qv2T12rZIO4iBQzrynAVwndrICZ2
	a2RWDMdHHyvKybgGav3g6gfsYnNSBBprtaOpqHhCfJGfIao66Zn6c/TeOS/Lq+96A4nnmn5QRum
	MeDP904vxj3KQ4Y3bE9jocuzNT/sJSIeQO/8mToyrYAMaQisperufF1z3ja8DTSP7Wbyunsnlsf
	JBbjsz0HNNFSLicm3NUBeEt5Zqq3fYcKa5os8zP+ENOCeK11aFKaS5tQncQ6pM
X-Google-Smtp-Source: AGHT+IHVpoG1RYPG0Fo88j3DEV1z2Ax9xc3BWFe84CbZR5zOE94zc2qjuEfQYpMaSAgy5ZkutBnSVA==
X-Received: by 2002:a05:600c:444f:b0:477:7a78:3016 with SMTP id 5b1f17b1804b1-47a8374ce6bmr7128495e9.8.1765331016267;
        Tue, 09 Dec 2025 17:43:36 -0800 (PST)
Received: from [10.200.8.8] (p99249-ipoefx.ipoe.ocn.ne.jp. [153.246.134.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a7000c984sm705234a91.6.2025.12.09.17.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 17:43:35 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v4 0/9] Various dt-bindings for Milos and The Fairphone
 (Gen. 6) addition
Date: Wed, 10 Dec 2025 10:43:24 +0900
Message-Id: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD3QOGkC/23PzY7CIBQF4FdpWIvhR4q4mveYuKD0Mr2JpRWQO
 DF998FqYjLp8pCc71weJEFESOTUPEiEggmnUMNh1xA32PADFPuaiWBCsVZImkbdSkX93FIMmNF
 eKFdwYB68kq4ntThH8Hhf0e/zK0e43qqdX4+kswmom8YR86kJcM/06XPBDHkWBkx5ir/rUYWvj
 fe+2tovnDLaG9dLIcA63n15i3EepgD7OrKSRXwYzTe/UURl4OiN1UejmNpk5IcxbPsaWRnGuXY
 CvOed/s8sy/IHAZUpu3cBAAA=
X-Change-ID: 20250623-sm7635-fp6-initial-15e40fef53cd
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765331010; l=3801;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=W8/D6Zte+WLuzj1BAkQdHKSbz78N81zx1LJo/v0yIRU=;
 b=iidJCYi5UY3L2gSm3zjrS8o9I3QIjjHa+ajT0HkiP1WdsM3r384T3hm3AJhYRmiDnw4wKu6cH
 yxNWjdO9eZ5Ab46KfOFpWdoij5U2fQS5w4/32PzBKqpbp5SpBTf2udJ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document various bits of the Milos SoC in the dt-bindings, which don't
really need any other changes.

@Rob: Please pick up the cpufreq, crypto, and pdc dt-bindings, they've
been on the list since many months and weren't picked up by any
maintainers, so it would be nice if you could take them through your
tree. The patch for arm/qcom.yaml will be handled by Bjorn I think.

Then we can add the dtsi for the Milos SoC and finally add a dts for the
The Fairphone (Gen. 6) smartphone.

Dependencies:
* No dependencies on other series anymore

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v4:
- Fold in PM7550 & PMIV0104 dts additions from their series, since they
  were the last patches of those series (Konrad)
- Rebase on next-20251209
- Pick up tags
- Link to v3: https://lore.kernel.org/r/20250905-sm7635-fp6-initial-v3-0-0117c2eff1b7@fairphone.com

Changes in v3:
- Rebase on linux-next, drop patches already applied
- Pick up tags
- Drop simple-framebuffer to drop dependency on interconnect patchset,
  will add back later
- #interrupt-cells = <4> for intc
- Move protected-clocks to dts
- usb_1: reg size and assigned-clock-rates update
- tsens: reg size & interrupt fixes
- thermal trips cleanup based on review comments
- Link to v2: https://lore.kernel.org/r/20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com

Changes in v2:
- Rebrand SM7635 to Milos as requested: https://lore.kernel.org/linux-arm-msm/aGMI1Zv6D+K+vWZL@hu-bjorande-lv.qualcomm.com/
- Disable pm8550vs instances by default
- Enable gpi_dma by default, sort pinctrl, update gpio-reserved-ranges
  style, update USB2.0 comment, newlines before status, remove dummy
  panel for simpledrm
- Link to v1: https://lore.kernel.org/r/20250625-sm7635-fp6-initial-v1-0-d9cd322eac1b@fairphone.com

---
Luca Weiss (9):
      dt-bindings: cpufreq: qcom-hw: document Milos CPUFREQ Hardware
      dt-bindings: crypto: qcom,prng: document Milos
      dt-bindings: qcom,pdc: document the Milos Power Domain Controller
      dt-bindings: arm: qcom: Add Milos and The Fairphone (Gen. 6)
      arm64: dts: qcom: pm8550vs: Disable different PMIC SIDs by default
      arm64: dts: qcom: Add PM7550 PMIC
      arm64: dts: qcom: Add PMIV0104 PMIC
      arm64: dts: qcom: Add initial Milos dtsi
      arm64: dts: qcom: Add The Fairphone (Gen. 6)

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          |    2 +
 .../devicetree/bindings/crypto/qcom,prng.yaml      |    1 +
 .../bindings/interrupt-controller/qcom,pdc.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  790 ++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 2633 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/pm7550.dtsi               |   67 +
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi             |    8 +
 arch/arm64/boot/dts/qcom/pmiv0104.dtsi             |   73 +
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       |   16 +
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |   16 +
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |   16 +
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   16 +
 19 files changed, 3725 insertions(+)
---
base-commit: 8ebfd5290c6162d65f83f9a8acdbbf243b49a586
change-id: 20250623-sm7635-fp6-initial-15e40fef53cd

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


