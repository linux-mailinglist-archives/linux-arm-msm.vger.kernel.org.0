Return-Path: <linux-arm-msm+bounces-51429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 588CAA61435
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F34987A8680
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B5B20127C;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIhbaPGN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE50C201023;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964107; cv=none; b=C6n/SV8r8Wn2WgzP7KFS6sXJbjupqwqCL6bKy3CWmtRaPkuT8jkOR6UOz9ydedhn8bbW6X267iUXLch8qYOAYaBSnXfpF4JBt4XD+AC/iBMzMzja8adEQ/HbYbWETxlE4FGZpjSVHAkYv1qBL6B5ayzKpEelWIKmIuourOXWymY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964107; c=relaxed/simple;
	bh=Y8prsE6Y5MKFwYqCup4Meyy9MxW2K2AeXHpaDDkmur4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jetUW6TmpJ4/Qx6GpeMPatAyVjXZfCAvZjpg1saJdsvxjjsvLHpIIlCNcXwpmJSxv9anIYgYuO0AFLxxzOh4t8ael+rWIDm/3LciN8vyeu/SEHOhSx4ZwGq0Cy7p8uPp7walL9Vt6zmcrbGzBF3NbJh1yD1d26Bj26be9PYTH0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIhbaPGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63720C4CEFB;
	Fri, 14 Mar 2025 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741964107;
	bh=Y8prsE6Y5MKFwYqCup4Meyy9MxW2K2AeXHpaDDkmur4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PIhbaPGNDHzT/y7NObdZ6d9emLKhChlJUlqybaDts3/vGngHJD24N3ky+oVqDzZj3
	 3iEmGrYZjDMIvM2jBESo38rqW5/JHBTJ7LidilcnoVdtVM5Rcuo2IHt13duh6g1r1f
	 oRP9ddd+JYbhadWkvYFQCIEk4IF1541R7q9lRiK7gtpX0gSvuXo2PqaoY8JHZ9cj4a
	 zxdMEPmVZRzxkyw/Jh7w3/3k38TmMIZUfXnVC2ocPPyX+YEO71lwL0EiVrzoFTHZJg
	 /sTnB2WiDshTN869q0FOMJjG3N+0JMkPFqCBvDPRn2DEZqWZfNtvQo2RfaC8v8ccd0
	 KY8saT5/vFSvg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tt6RG-000000002ya-2wLt;
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
	Sibi Sankar <quic_sibis@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 3/8] arm64: dts: qcom: x1e001de-devkit: mark l12b and l15b always-on
Date: Fri, 14 Mar 2025 15:54:35 +0100
Message-ID: <20250314145440.11371-4-johan+linaro@kernel.org>
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

Fixes: 7b8a31e82b87 ("arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows")
Cc: stable@vger.kernel.org	# 6.14
Cc: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 5e3970b26e2f..f92bda2d34f2 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -507,6 +507,7 @@ vreg_l12b_1p2: ldo12 {
 			regulator-min-microvolt = <1200000>;
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l13b_3p0: ldo13 {
@@ -528,6 +529,7 @@ vreg_l15b_1p8: ldo15 {
 			regulator-min-microvolt = <1800000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
 		};
 
 		vreg_l16b_2p9: ldo16 {
-- 
2.48.1


