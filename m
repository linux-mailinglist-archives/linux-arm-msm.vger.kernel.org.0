Return-Path: <linux-arm-msm+bounces-51684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A55A66CDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D878919A32D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 07:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B6F91EF373;
	Tue, 18 Mar 2025 07:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mM68mcFq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C481E8356;
	Tue, 18 Mar 2025 07:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742284213; cv=none; b=IVR5I0Xt5qHP8EjdDgEmgbbuoMrv5wuXTjjvaM2HFUj8+vETRHnpKqOigC3+0pfj9j4t3OYqcE5w9p0P+YVfs6jJdeb+UtWR8o266cZokFtAcUllTsQnm79i0wyD5qMB/CTWsgfRSUBD89ac8UDeqq0XB8jC3JfEkfiX4LRW2Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742284213; c=relaxed/simple;
	bh=zC0g8XE+vZUBlWmXNCHyzFi23y6Omzb5EW4AUknHkks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVOUYMIFx8tqtu9Geh9LqOVOGyEFIhIqovhhVkEFcHtSp7gh0p4L1m5oJvQaMo62fPLjfTiiYk/6E9mrfDNVMQSIe2+NU1SKA/L91tOKZIqLLqvFrfMXZMmK7q7FPweURx4qVhHVUCz7gZthazT/vgihnzHUasQVCSmcjY1Chqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mM68mcFq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EF4C4CEDD;
	Tue, 18 Mar 2025 07:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742284212;
	bh=zC0g8XE+vZUBlWmXNCHyzFi23y6Omzb5EW4AUknHkks=;
	h=From:To:Cc:Subject:Date:From;
	b=mM68mcFq2pPm0b2wjfYFO+6wVWfIpXLv5Jnl5kv+39cv1940asMaG6kttYo4IaXf4
	 g1+nlCVBxUKfAv8p/p1m324uUW1E0U8Ey8Jo/v0S/cUdwPmODA+HzySiuvja8HW+wj
	 Gq9ri4DCOq+ly1lfMknJclwrHGhnbxrJlh96769N/gAaRj8yodJybqyIAnTAFsLsu8
	 XuODabNQu4gnmVMUoQNzip0EQ0+7f8UaKr0wAhhecLkrckYWtvzp/yIldBVJDHry1z
	 e9eS/OEOt/NynBA1qIEiMQHoPqFHmn6DHD3aV/iD98aR4Jk4ERqFNIZgJyYGItiYqZ
	 2vmuPlbgPC8jA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tuRiF-000000003dh-1ROy;
	Tue, 18 Mar 2025 08:50:12 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] arm64: dts: qcom: x1e001de-devkit: fix USB retimer reset polarity
Date: Tue, 18 Mar 2025 08:49:07 +0100
Message-ID: <20250318074907.13903-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ps8830 retimer reset is active low.

Fix up the retimer nodes which were based on an early version of the
driver which inverted the polarity.

Fixes: 019e1ee32fec ("arm64: dts: qcom: x1e001de-devkit: Enable external DP support")
Cc: Sibi Sankar <quic_sibis@quicinc.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index f92bda2d34f2..dc1a8f5d485a 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -788,7 +788,7 @@ typec-mux@8 {
 		vddat-supply = <&vreg_rtmr2_1p15>;
 		vddio-supply = <&vreg_rtmr2_1p8>;
 
-		reset-gpios = <&tlmm 185 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
 
 		orientation-switch;
 		retimer-switch;
@@ -843,7 +843,7 @@ typec-mux@8 {
 		vddat-supply = <&vreg_rtmr0_1p15>;
 		vddio-supply = <&vreg_rtmr0_1p8>;
 
-		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
 
 		retimer-switch;
 		orientation-switch;
@@ -898,7 +898,7 @@ typec-mux@8 {
 		vddat-supply = <&vreg_rtmr1_1p15>;
 		vddio-supply = <&vreg_rtmr1_1p8>;
 
-		reset-gpios = <&tlmm 176 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
 
 		retimer-switch;
 		orientation-switch;
-- 
2.48.1


