Return-Path: <linux-arm-msm+bounces-1954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEA57F8AAF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 13:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 405ECB21239
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Nov 2023 12:20:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3781FBF7;
	Sat, 25 Nov 2023 12:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="LYGjtIk/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38ECBFE;
	Sat, 25 Nov 2023 04:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
	t=1700914777; bh=QTIX2lakcP39cCuE3Qc425XXiB73jdaU3uagPJrvxtI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LYGjtIk/DHWDP2NVbhlAr1JcfRKrOtq0X+/OC/suBGJlBNCfAhPuYOEgwiZhpcwPP
	 qVJP94AgVGMphHnKtnE8UXiTZjdEX0kD7lHX0/q9dTNmQUA0SwqiqE2Wd3vRLpA7Pq
	 PxiIV/PU6rBSZlD0GRn0ZpqgUlITBN/Cp+WIftwo=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Sat, 25 Nov 2023 13:19:28 +0100
Subject: [PATCH v2 2/2] arm64: dts: qcom: msm8953: Use non-deprecated
 qcom,domain in LPASS
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-msm8953-misc-fixes-v2-2-df86655841d9@z3ntu.xyz>
References: <20231125-msm8953-misc-fixes-v2-0-df86655841d9@z3ntu.xyz>
In-Reply-To: <20231125-msm8953-misc-fixes-v2-0-df86655841d9@z3ntu.xyz>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=852; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=QTIX2lakcP39cCuE3Qc425XXiB73jdaU3uagPJrvxtI=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlYeZYNkegUK0xhOcT7BhUYYzLbqYRKMGegeNEw
 x/Ke8IHHDmJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZWHmWAAKCRBy2EO4nU3X
 VpLSEADMD22OIhmor6tCMPaYWcyWLLl41rH5EcfMIdY3+pt2r0UxptAswlNHepD7BTx+PZ02oEq
 AQP1q/4k0y/Ml0RX0xCJAQdTwvXaa3SBG6lGaHCROvg6sB3l9LpVBWx31zJdwHfqeL1kbYg1LwT
 SXyJQCAR4qnaoE8EOYnqUxZkfzX2g4fwYnDST9yulIJSnHS6aQJgfltTlg3Y7L2tjdYO94mVjj3
 sWacrcGTfL19sEsgWBJOdDf4s0G6tSQUS6dao84WscV9zkeuXeuXRaHGpHdqfopAJEK84q+gAjw
 cUyhchTg2o0ICwXxT6smrjgrD3pYzxWgSlCSPf7A/m7W6lg9i5PMjasmQkMLNEMZBj2u/Pqd8U7
 WFOyDiuBezmr8ab651rtOOTl+AnrTvaYfdWzrU/t55IKJl+rFmlxopa9IL8prGTZ+owRj18jNyK
 vfM9yntrRGvUtXnSm800wgkJxNZk5MTQaNJjySzTY0zcab4NK6wgxS/HD4SRAIuUUkaZZIPaQz/
 FAmizMnfN1MGLfXYZSTjaf0qM7JtF7NPQHHcNRObozjYNSehWdhKf3Ysp1slLnMg9C5dpGP+yFr
 933vhgAADWJByuZfu9IUBeV/4cg+g3t4qYW9wFOuAGtYEfzG/qWNOkWL6VxAqYgbSmQfPi6W606
 MKT3xx84Noqf54w==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Use the qcom,domain property instead of the deprecated qcom,apr-domain,
which in turn also fixes a bunch of dtbs_checks warnings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index a3ba24ca599b..8374f9af8273 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1645,7 +1645,7 @@ smd-edge {
 				apr {
 					compatible = "qcom,apr-v2";
 					qcom,smd-channels = "apr_audio_svc";
-					qcom,apr-domain = <APR_DOMAIN_ADSP>;
+					qcom,domain = <APR_DOMAIN_ADSP>;
 					#address-cells = <1>;
 					#size-cells = <0>;
 

-- 
2.43.0


