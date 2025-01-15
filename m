Return-Path: <linux-arm-msm+bounces-45134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A62BA12536
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 14:46:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D79D3A80CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 13:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386E024227F;
	Wed, 15 Jan 2025 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GEhiVRz3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA1241695
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 13:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948647; cv=none; b=b4yjkcWJuUnwr7engFvTFSzUNflyC5rNmI7085SiF+4xB+KcnjXDcCaBWkiCLndJXzIV+x5ce4TTiWBfBVTKKudH4Ifw4JmibMZuiCYZmAPbV5QpfP1hhJZ17XjpugdgK5ZMy1kOEQT5Dod2RhVMCv5uqLTg2gDHC62I7plsy5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948647; c=relaxed/simple;
	bh=HUpwnGBEt4rwGDnFjpbfuuVL2SZtqfrSqYqkeUHPV8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=REI8HIkIA83kQEGdr4yOVOnAkZcMRyupAmSpjm0iFmC4XXlfCyLN5wtnDlT3oEcZUTunMahN/Lak4B21twUeF4XlM4N2vYDp/U84plLc/KTiywo4KvK4InNaGT1HNkbYy97ia58VPw1C8nZEwQppMfMnlJZZLY26QNS3Bt3Slss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GEhiVRz3; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436249df846so46774505e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 05:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948643; x=1737553443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKvS4WUPAak4VN3PtmcqFjykY7FtcQpzTFucK5ybaSg=;
        b=GEhiVRz3s6IYAE1sid1vj4LYjXohOI5fWI+7j3MGSzd550dZEz+GkiR06eUNg0/wom
         q2EE3jFbZMCM7u7Tw27hYepFT4NcHx4D+8j6I9VsR6PxsSqXnv1zCd7/BX+ueQp7J6oc
         DtszUWZqTXWUFhkMpBzVRLVIywUSHo3q0jesDe5UXqPzd306xBOxYXwcqTs0ie4Iw4xy
         PV41oaEKrmWTdGqTisxkfUWXaAjod48Q6X3xth52oSQVd14wBg2ujeuVB55Gyo6jq7rU
         9fbG21NLzjURiUkQUVuuNtVZp/J78RuosN+7BpO8SWVXj6Jv6n5SYTlO/B3dcj6vAzW1
         iibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948643; x=1737553443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKvS4WUPAak4VN3PtmcqFjykY7FtcQpzTFucK5ybaSg=;
        b=h5MCYoibzF9CK6hjQu7oGAl8OwLegwop1ZkwTeXB7DzlzfJNt5PYrPRffWOuamlEhG
         vvSIn9QdTEDLeq1b6Lm34v+a+1Fnfwb23WMl1gnupS9sXzTJWBAR0sVl6i7mWldTcREB
         DHs7CnX/LuCYuisCbPMFaTK5+mIBcHXTaGHLZGckS8I4NdLMaRBJzs9SUNF5vcaZ1lgR
         N3b/F2DHkw6ymY9UiD4fJvvtZYr5KSBOEQ7cqmHvJLY8Y0zb1tLEimEWsldCbsItKpf1
         MKDayRofEBtwbT9AS4mQCUgCM3rt/toJUfyK+xFuOcv7YwCHOPsPj/jfUcLfh92EaKG5
         X7UA==
X-Gm-Message-State: AOJu0Yz44JFUkKpfxeVl+EAv9gk49DD2UAtBpMAHqrgRCYLhk9Mv8pgX
	iZUS9xAOh86s9AUsrjWEVPHNwPj/xyih14m2m2Sk4AUke21qXyBoel80Li8kfMc=
X-Gm-Gg: ASbGnctsB4MmhMc0nQ8GDjWMKP4Xhd0OMXKQPiHArF9++5vAg4zOF01px275ED1dkZ0
	LGAZ7/NlIn/9RPYoQNUGPrPXswQby18HFBLkw7uVTgo4ddCXl3IROSWJZ7OtNIRgMQqTq0vrmgp
	v8SEQUqF+MLig/YNSZgppJHU2w8Qe9pQCWqUg0krNoloZg65+YP3PfOjx+hZNQbXAA5wMKus8/K
	eickIlWhpFaW47zrqsHQIo/5FiOZ3vzQwf87YGdiwtEWxVnl349vVu3rVY61xyC5rqAkIY1LPJC
	bQ==
X-Google-Smtp-Source: AGHT+IEolp6cGR3YEAAGusmS3sj41Oj/a1jkfDq7xx+m2XDJVgtI6f9p5d5Ev+9LcT9+PbUHYzD/ww==
X-Received: by 2002:a05:600c:1c98:b0:434:a04f:2557 with SMTP id 5b1f17b1804b1-436e266e802mr261216245e9.4.1736948642789;
        Wed, 15 Jan 2025 05:44:02 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7540ae7sm23454655e9.33.2025.01.15.05.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:44:02 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 15 Jan 2025 14:43:55 +0100
Subject: [PATCH 03/10] arm64: dts: qcom: sm8550: add OPP table support to
 PCIe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-3-eaa8b10e2af7@linaro.org>
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3309;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HUpwnGBEt4rwGDnFjpbfuuVL2SZtqfrSqYqkeUHPV8c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnh7ub+b1hbxLsQltzCy1XzsAC+oPn/NP2HCCFRn8J
 cziXRDmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4e7mwAKCRB33NvayMhJ0WT3EA
 DIAgXld+eCg46MU+BfbLtCVeKKTCUVWpAxnFngrw1eZvVPNP6j+j/Vv2o8LrGU8qpZQ+e8ed9sAKzP
 ETkpcJXRDbyfE7D++Xy6JJtNnfGDmnQlY7JYycaG7aIxk6dgiuPRGxY7VUw3LAGgmKr6TL5hRLLSHC
 D21vzwnVsipECWyXkhmTcOZ1uQjumMPeW9+iD1Ro8ALBADZKO9dM/RCWbMIv3pjNwQVpGB8HFa9oKT
 GQPQZNK3F3JjDP3+z3GipBWDQJZBfU3QkK3Ry5XIyeLQvFDrYxrabl5zDTuFjwRZsrP4Tq0oU31A8K
 3Rn6omrp7RyItaNxSXS7RxkXwsgns6EUvzJFnNRL1wosHNy4Xihj04rh3X+Kl+I+3iVe7tq63D+WIk
 KvH41iFul40TPJNti1lAsa3yHwHYCA2v2DFN7gvLGDsn8u4AWRUVpobIgG0sfcu8vc6/8Qpu6F4CZS
 JFMKmpeVBT4Ki6oyYOEQSyQ4GMQgcglNWcWxZvYoVcAqSSOlrAvgsqgoqCJ2fTf6RBzIYvq9yCkjxU
 PnbDp9+9ZHfZFVENbkETW1CdqxEFZUBz5sBKhkfxjSjC32AeVgOiY/w2ITSP6dH9EdjsdmK5sMJ0kF
 qA2qL8zTTC6SaG7JqIQ8qLCKdPrp+9Ot4Sb6MCOoxLoxXVLEI+mqycf1TmPA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The PCIe bus interconnect path can be scaled depending on the
PCIe link established, add the OPP table with all the possible
link speeds and the associated power domain level.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 89 ++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index a04a405a3f78f34fddf14a26a6996148cf60c85f..4b3c51fad9f19a1ec1e5d563a18fec9633a4e4ae 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1897,8 +1897,49 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie0_phy>;
 			phy-names = "pciephy";
 
+			operating-points-v2 = <&pcie0_opp_table>;
+
 			status = "disabled";
 
+			pcie0_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* GEN 1 x1 */
+				opp-2500000 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+				};
+
+				/* GEN 1 x2 and GEN 2 x1 */
+				opp-5000000 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+				};
+
+				/* GEN 2 x2 */
+				opp-10000000 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+				};
+
+				/* GEN 3 x1 */
+				opp-8000000 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <984500 1>;
+				};
+
+				/* GEN 3 x2 */
+				opp-16000000 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <1969000 1>;
+				};
+			};
+
 			pcieport0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
@@ -2023,8 +2064,56 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			phys = <&pcie1_phy>;
 			phy-names = "pciephy";
 
+			operating-points-v2 = <&pcie1_opp_table>;
+
 			status = "disabled";
 
+			pcie1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* GEN 1 x1 */
+				opp-2500000 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+				};
+
+				/* GEN 1 x2 and GEN 2 x1 */
+				opp-5000000 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+				};
+
+				/* GEN 2 x2 */
+				opp-10000000 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+				};
+
+				/* GEN 3 x1 */
+				opp-8000000 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <984500 1>;
+				};
+
+				/* GEN 3 x2 and GEN 4 x1 */
+				opp-16000000 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <1969000 1>;
+				};
+
+				/* GEN 4 x2 */
+				opp-32000000 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <3938000 1>;
+				};
+			};
+
 			pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;

-- 
2.34.1


