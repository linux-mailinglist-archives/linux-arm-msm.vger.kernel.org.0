Return-Path: <linux-arm-msm+bounces-51431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 438F9A61440
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC6137A9838
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623AA202C4F;
	Fri, 14 Mar 2025 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVZc0CG9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1F20127E;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964108; cv=none; b=uIllAUHhY49+L9MKzgmZ4qnD8ixnM6SnuEKJaJswlU6fbrfLsXKPkG5k/FS7OBTEPtyXbjQSuBqzampNHVf2W6OuH85CoNwGsZUHbG2NNMOMnci0R2kPDU6jRJHbhGb1Wvv1Px082CDkxFCbXBHpqsAdyl5NAXmvmhqEstyVFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964108; c=relaxed/simple;
	bh=fyUDZ20iDp3j6LvLZUitJHWbZq4/yDo+RueH3P32NK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SeoI5Oj1ISVY8eWFxu7qSpf7O0wTrUW2p+ZCFKTYrgqmsQbT9baALYClwwHmOmj8C5Gk5N7aCoaO+o/VwiMheWyjUvRqyavPGcgMhre1sl/J3SXmy6KdJIUz/9kyguE5/S3oshdSE7f8pPnO/fVRKhxlX2NHbRD/e0Uw7WJJw/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVZc0CG9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D42DC4CEFE;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741964107;
	bh=fyUDZ20iDp3j6LvLZUitJHWbZq4/yDo+RueH3P32NK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tVZc0CG9T4+TmRYrkfPJYroB2muYLjtNC6CUPFi9AD9X1fzwBnEPg/ZBNpiS64f2H
	 +0juCQBOuwXMsmiwH/zYz4uVUaowViXIetB5wENNjbPr6ssqgQcOwrxQnztIzbawgC
	 FDakKWDeZTDunJP5fPjKWj5qejdO3qyas05A5TZoDKto/Af2pkDPM6vW/sBRpbZleD
	 qqPhrcl85kdDSBP1IGGQHXlDVY1D+VLrdANahA/dEfmAsKWV95N2pBTQXSDDnQTdFc
	 +OKAgAKYA6h1aeI5GrndPuZsajTmabOC44t8cdPn2W6G2AQt/1kzvEXycS1FOUJcfY
	 fjtbBcMk5iuFg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tt6RG-000000002yf-3fQG;
	Fri, 14 Mar 2025 15:55:06 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 5/8] arm64: dts: qcom: x1e80100-hp-x14: mark l12b and l15b always-on
Date: Fri, 14 Mar 2025 15:54:37 +0100
Message-ID: <20250314145440.11371-6-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314145440.11371-1-johan+linaro@kernel.org>
References: <20250314145440.11371-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The l12b and l15b supplies are used by components that are not (fully)
described (and some never will be) and must never be disabled.

Mark the regulators as always-on to prevent them from being disabled,
for example, when consumers probe defer or suspend.

Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Cc: stable@vger.kernel.org	# 6.14
Cc: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index cd860a246c45..ab5addb33b7a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -633,6 +633,7 @@ vreg_l12b_1p2: ldo12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l13b_3p0: ldo13 {
@@ -654,6 +655,7 @@ vreg_l15b_1p8: ldo15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l16b_2p9: ldo16 {
-- 
2.48.1


