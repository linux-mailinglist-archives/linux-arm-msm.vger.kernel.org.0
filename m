Return-Path: <linux-arm-msm+bounces-78672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CB5C04605
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 07:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A3A04E45DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 05:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6C725FA10;
	Fri, 24 Oct 2025 05:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1Pk+GBB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD41B4224;
	Fri, 24 Oct 2025 05:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761283308; cv=none; b=GdP75eBF2R9Fv4+yyVTXU1+2is7mDziJX/C+u560mF1xXn/xnB2JQohSDrT1zqfXssGA3cA1tf/oMcvGFBCXybazV9osn0reiNln5vxa/utj9+eNQCXWUsTUIh/n4XIrutbQcKvDbjS8/DAtTP/prk00v5iKWqZxCcNE0KMRed8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761283308; c=relaxed/simple;
	bh=vzm6mP61BU/bRw8GcH5rFHfwHA5PAU7GoOtUxNq/pgI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sis8T2BESp6D620MsjgUapwnxyjUV0XhOppVDY3QNdih7mPIfZlTom7FxVyPmrKGwbimSNbvs2gZX+o5aSUUTbL2pbyfmtd9e/Fm1S4/X2BjteidG2vxtL2hggmIelhhwUWIyJh2bZJAPwtFGyTHKQ2lc+iOzZ7xPA0u/YpY7nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1Pk+GBB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8814C4CEF1;
	Fri, 24 Oct 2025 05:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761283307;
	bh=vzm6mP61BU/bRw8GcH5rFHfwHA5PAU7GoOtUxNq/pgI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=B1Pk+GBBvN1DrMxN+3h9OTzWQtTd2snzYHeDg52D/wRQFi/KCCX0pBpfI3erKxC47
	 b/MuCut0naJIoYnJy+qu4gqxmaLczBJ/Lc08GyBVAt417FtEP1s5k9AQ7/D2xlTYa0
	 JptRAPip9RrhMOeB9Ep8Hh6sTNxEDzWDpGHWK+6mnzLJOFT7QmarYkPQI5993wVcJ7
	 nzkH/ZOOsEclmKcqZTv1J0IyTzrr6gMJfJ8SF849/w34x6PDA1MPrAeFTroucQuzYe
	 A1X4O0nPOadyVfHgqE4r6ULCmNq2ng0uCyXgYOdgj87mZx9tPRvKgkunbABjsfZLEl
	 7ZdsFhS/iVePQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4608CCD1BF;
	Fri, 24 Oct 2025 05:21:47 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Subject: [PATCH v6 0/4] Add DisplayPort support to QCS615 devicetree
Date: Fri, 24 Oct 2025 13:21:00 +0800
Message-Id: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMEM+2gC/6XSwU7DMAwG4FeZeiYocdN0nRDiPRAHJ3Eg0rp0S
 VeBEO+OuwkYYpMYnCL78H+y49eqUI5UqtXitco0xRLThgtztajcE24eSUTPdQUSGiWVFui98LE
 Ma3wZUh5F2Q37d0xi64pRjfAc42jMRIIcojfQogxYceSQKcTnPXf/wPVTLGPKL3t9UnN3hrQCJ
 S+DJiWkkBCWGjtwWtu77S66uHHXLvXVTE3wEf+HOSbgeAWy86HVXit5l0q53u5wzfH9l1H/x6j
 ZaDW5zlhcKq3PGPrYaC40NBuI4OxSt5I6f8ZojgxQFxoNGx0EGWobtOnCCePtcAuZ+JdKHA8HU
 fVUCu4vbrW4mXHZyfoY/4RDyh8y90cuezEt5/11rXKy8QoM/HBv5xM8gShzQAbh0mbMab2m/I0
 qPUty/iElvDeSrPW8fPq1AObsDk+O0vIo3jXkEZ1xYE9DFguJuRPH1YKCBYNQk28CL/jtHcEM4
 J7aAwAA
X-Change-ID: 20251014-add-displayport-support-to-qcs615-devicetree-ecaad627a0fa
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com, 
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761283305; l=4343;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=vzm6mP61BU/bRw8GcH5rFHfwHA5PAU7GoOtUxNq/pgI=;
 b=sSIH6bHGMApeU1e+mFHDbcUUSqY4PD4rLaClW21LoHpwmGaBzpDV9syXcWhNLEU867X/miA+R
 dm6caWTOcqiCe4ardDB1SogtZCNqQ+vr9nF0lBqkwl4al0lmGH4lzDI
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com

This series enables DisplayPort functionality on QCS615 platforms.
It introduces the required bindings, updates SM6150 dtsi for DP controller
and QMP USB3-DP PHY, and enables DP on the QCS615 Ride board with
connector and link configuration.

Depends-on:
https://lore.kernel.org/all/20250903-add-display-support-for-qcs615-platform-v8-1-7971c05d1262@oss.qualcomm.com/
https://lore.kernel.org/all/20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com/
https://lore.kernel.org/all/20250926-add-displayport-support-for-qcs615-platform-v7-1-dc5edaac6c2b@oss.qualcomm.com/

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Changes in v6:
- Removed useless remote-endpoint addition from previous version. [Dmitry]
- Fix indentation and blank lines in dt-binding example.
- Fix OPP values to correct clock rates in dt-binding example.
- Fix blank lines between the last property and the following subnode [Konrad]
- Link to v5: https://lore.kernel.org/r/20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com

Changes in v5:
- Update commit message and fix example indentation in binding
- Update order in dtsi includes [Krzysztof]
- Link to v4: https://lore.kernel.org/r/20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com

Changes in v4:
- Update commit message to reflect data-lanes changes.
- Link to v3: https://lore.kernel.org/r/20251014-add-displayport-support-to-qcs615-devicetree-v3-0-74ec96ba8144@oss.qualcomm.com

Changes in v3:
- Move data-lanes from board DTS to SoC DTS [Dmitry]
- Add missing assigned-clock PIXEL1_CLK_SRC [Dmitry]
- Update subject prefix to qcom: qcs615-ride: for DTS patch [Konrad]
- Link to v2: https://lore.kernel.org/r/20251014-add-displayport-support-to-qcs615-devicetree-v2-0-1209df74d410@oss.qualcomm.com

Changes in v2:
- Update register padding and ordering [Dmitry]
- Rebase the series on the latest driver
- Link to v1: https://lore.kernel.org/all/20241210-add-displayport-support-to-qcs615-devicetree-v1-0-02f84a92c44b@quicinc.com/

---
Xiangxu Yin (4):
      dt-bindings: display: msm: Add SM6150 DisplayPort controller
      dt-bindings: display: msm: sm6150-mdss: Fix example indentation and OPP values
      arm64: dts: qcom: Add DisplayPort and QMP USB3DP PHY for SM6150
      arm64: dts: qcom: qcs615-ride: Enable DisplayPort

 .../bindings/display/msm/qcom,sm6150-mdss.yaml     |  42 +++++---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  30 ++++++
 arch/arm64/boot/dts/qcom/sm6150.dtsi               | 115 ++++++++++++++++++++-
 3 files changed, 170 insertions(+), 17 deletions(-)
---
base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
change-id: 20251014-add-displayport-support-to-qcs615-devicetree-ecaad627a0fa
prerequisite-message-id: <20250903-add-display-support-for-qcs615-platform-v8-0-7971c05d1262@oss.qualcomm.com>
prerequisite-patch-id: 58be7053007469980bd7cc9fe315b66bbe021c31
prerequisite-patch-id: 3c2120117f72c64f69beff32c0239fbc7f808f36
prerequisite-message-id: <20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
prerequisite-patch-id: eb07ea58347e77ee18fb6dade040affb0ab68954
prerequisite-message-id: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
prerequisite-patch-id: 8c6c905df7ee55a92a4e52362c8fa7cd9742de04
prerequisite-patch-id: 0dba0fafd032bbd6cd117175f61efd1e56ae9228
prerequisite-patch-id: d954b18774cfc0cfdb23de09aab3c56cefb8e1ea
prerequisite-patch-id: 13f2d2efbcee6337001b5f8519a6da9a41d05276
prerequisite-patch-id: 3a7144645ede23ccc7d54420e5a32e5bfa3bb776
prerequisite-patch-id: b3ea55e92953c1526eaf7c5c21d939a5f8502711
prerequisite-patch-id: 977189ef7cecbe7237175a8ef611fffb814193b0
prerequisite-patch-id: 3a12c1b4f00eb1d074e51d586f2dae3a44de0613
prerequisite-patch-id: 7f80e93057c1fd088ac6b4b0652cdfe2ea221cd5
prerequisite-patch-id: 8b29d292717782982e4450a509f4428fe6e895f2
prerequisite-patch-id: 621c3ba6bcf5b5782a5264faed72fdadfd47c630
prerequisite-patch-id: 9c63f2c5bb39527e3031b2d168e3c9419441e8df
prerequisite-patch-id: 364f6a7d8f4e1bc79a8f236b8d5a2425ffd225fe
prerequisite-patch-id: eb09ea48625b5c0d39ffb37babe7d8c32a4b3122

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>



