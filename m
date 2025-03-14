Return-Path: <linux-arm-msm+bounces-51430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 00622A6143E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40504462683
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62411202C50;
	Fri, 14 Mar 2025 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnD7jXoi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA920127F;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964108; cv=none; b=Ipydt/qX/O9Qw/Iad1QGDHQTTuRbHmdqrZy0h2JpkjzhwrVtbKRRf/Wmrayhps8XYox5R8Awc4PQekmBR2kK/DpkCK/7KwdoD0nsHMsAy0fEtX4YvjNO9ldboikD3NPKRQ2u9l/8K5WGQIPOEW78hhmnC2TR13LkSHR9Bea1BpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964108; c=relaxed/simple;
	bh=ZfL0Nio9i8WqvtbYroDAaV9ncJyzYPS4PrbFpZjWVLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbezZmprt9TLyRo9nNSeISb9ziGtySlVb7tAOyCh9/KcD02fYGbk9VKD8Bd5bGoTZuqS5v3EHLQygbsIGILZbb6sR5xNe6uCTN/Kw+z2/ZXBINHK+D+9m07IZF6VOGTblLVcfSkR6mCZg4SFhdI48ZhDelWl/mUq5NPoZhtTP08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnD7jXoi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92963C113D0;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741964107;
	bh=ZfL0Nio9i8WqvtbYroDAaV9ncJyzYPS4PrbFpZjWVLg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EnD7jXoi2O4pfXG7cjoW1ZXD5nz7kB2TSmIu3M5LKP5oIeoFS4nY2CcM9IURuqxYA
	 bPyjXDSP/TDhdRAq11PfbD1fLbMP78uo4Lycv81/W2Gyzbg40KENVhmvprSN8Of0eP
	 Xqg0hBin94xP4STgmw5iOBqI7baWxDVL8FfuXbEPECOXB81dk1hQ9WDZ38Tf7ndRqh
	 tkUBsJmX9a1VTsdfoPEg5OHQRZVMLUXfCeCen6PqKs5qYVT8NNN7aYSmBBoLP3UvU0
	 4T31S99riKSlA/omB+sHnWulg3PA/raKfJ3OOSeul2R0IR5g8XERPbSilLt0C40bhn
	 N35nZj+iN9rQw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tt6RG-000000002yj-45US;
	Fri, 14 Mar 2025 15:55:07 +0100
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 6/8] arm64: dts: qcom: x1e80100-yoga-slim7x: mark l12b and l15b always-on
Date: Fri, 14 Mar 2025 15:54:38 +0100
Message-ID: <20250314145440.11371-7-johan+linaro@kernel.org>
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

Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Cc: stable@vger.kernel.org	# 6.11
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index a3d53f2ba2c3..9d4ba9728355 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -290,6 +290,7 @@ vreg_l12b_1p2: ldo12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l14b_3p0: ldo14 {
@@ -304,8 +305,8 @@ vreg_l15b_1p8: ldo15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
-
 	};
 
 	regulators-1 {
-- 
2.48.1


