Return-Path: <linux-arm-msm+bounces-51427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E1A6142F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:55:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D6914617C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5C920124E;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxDgqUfZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AA01990BA;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964107; cv=none; b=reIgXlF6+8eDFgyMngqa7WhDsn5dISxeS8JHmRuSzUhhczcxdLhgSTiGrN1fh791XTBDA2aWIoRsDT8qSjoGfy1bDiQ9z/9WEP04xLHB6YPD1OFW8OK9wo3I7N5ToySD8BxL1hKKI672P+CJS2JPF1F6/BYr0tEXX9JG/C4/i/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964107; c=relaxed/simple;
	bh=TL1x3unFGI6eej+kotTyG0CyOGPF3gwX6bOhF2m87o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R7R0W45AlWNLI8efSaL1+HGc3JwsMsxc3fhbSC6I0X8eQDdxLss0mvOiZoyCwifsHJD0wEvW48Ryj1tKp7U3gsSDw4qCunavLHtvtPUzz0pQZ4N5MRWTLaO/KGr+ZXvAF21Td3edPuyNsMJazjJKjwzY+dUoef/QhGApi/XfBD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxDgqUfZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3701BC4CEEE;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741964107;
	bh=TL1x3unFGI6eej+kotTyG0CyOGPF3gwX6bOhF2m87o0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XxDgqUfZh/bqoJAkA6fik28w1sW6TyfCWhQb2p4R8QGqGUFXoiaac2FZUIlBwNpfd
	 wXU0TYmOKXzO6yO1ZFKoi76hpk+e+kHJLwqbahSLwpoeMweRcnS+Y68mqUppe1IM7G
	 cWm140t5gxRkbLwmGBGho/vQHK1lgtgcPxSuQHocoDM8MJgLfqWhXZlw5mJq+yLpMZ
	 A/CLXmw8NIAXBHBCqxIodqVRUV8tMO141L57EUhFDz9YpTu6mYq442a3tFf2zXbZuv
	 DE2pB+EAtCgNqB6OemO++j4Lug5V3WkemVmxfDMnrr9RdtOg8/sobPWRwAHXT9Ixd0
	 G0DeWOJWS54Ug==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tt6RG-000000002yY-2brI;
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/8] arm64: dts: qcom: x1e78100-t14s: mark l12b and l15b always-on
Date: Fri, 14 Mar 2025 15:54:34 +0100
Message-ID: <20250314145440.11371-3-johan+linaro@kernel.org>
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

Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Cc: stable@vger.kernel.org	# 6.12
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index eff0e73640bc..160c052db1ec 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -456,6 +456,7 @@ vreg_l12b_1p2: ldo12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l13b_3p0: ldo13 {
@@ -477,6 +478,7 @@ vreg_l15b_1p8: ldo15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l17b_2p5: ldo17 {
-- 
2.48.1


