Return-Path: <linux-arm-msm+bounces-59947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFE9AC9AF9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 14:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B2F04A07BD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 12:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FD923C397;
	Sat, 31 May 2025 12:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FVRSlNbE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FC923D282;
	Sat, 31 May 2025 12:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694465; cv=none; b=gtmFip3DcQ1+hyZasMQJ1XHHvJqaybqSO9dac7rus864jG7N9sEVlp7ve/g6Oj7IKKlojBwjoUL9kTd1KyEeyCr3vOjONbeCHP5NUlZMbG+fFvWrdulqpecv3SMqV1YMBIPHGZtNzeKI+xtYCu3+eAkGxY0JJAEir9qdSLD+2Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694465; c=relaxed/simple;
	bh=+F1vXg/AAtz5oxl9FcYED3Q9njesbIHn0YR6CMxuNto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAdbpDydEvFgU1AzlpcxqqcqDGsRy+qFAIHlSZJoUoxUtqoHvhEpVVLzguJAJ41Hpppk4pYCs1i/VwUYRXMwNY1YeeixFDPs2Cxo5NiMM0VB55Dbe6ecEqqdKtbhpaeDxtC6ciV4UXtMyHOeoLm9+RQA08QcIBjr06Ikuf4NnJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FVRSlNbE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19221C4CEE7;
	Sat, 31 May 2025 12:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748694465;
	bh=+F1vXg/AAtz5oxl9FcYED3Q9njesbIHn0YR6CMxuNto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FVRSlNbELy+GcYPIoYD3RrGuMWhGDhHsH0yHA0wPvm3nSZEP2xUyoqXo5i58MxlEn
	 XFYr5Z+NUFRAXUyI+csgVlQu0jhZZIxv9jxJYE4P0nu/mOkaHV6kezg1PJzrQu5gJO
	 A49IdyaTnUJ1K6q5wXVliYl36hJ08xLUqBXNp4gOSGa1ry+fl9lNP6JJuAxnoHNiY5
	 t6G8hQXUFqQeiGeVJ62DoFT8VO9+0pnw1rLZkKsiJXhSKOlOW+U/I15kg3F4zd+AEo
	 bwAAO9rI3/Pc3KKMh6B/55DT1xB07i99ysDHf8YmdO2NtTsPzx6QKNAyot3ELFFwYG
	 O6UMXLMgALJ3g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 31 May 2025 14:27:21 +0200
Subject: [PATCH 3/5] arm64: dts: qcom: msm8998: Add Venus OPP table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-topic-venus_opp_arm64-v1-3-54c6c417839f@oss.qualcomm.com>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748694448; l=1728;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=yDZsBBZI7f9NYvTIyZujCFr+qic5oH4rSUKpCq7lZdE=;
 b=hOdkHHgucquDuB0CLJ27V6Oh+BOZtt2BAk6ARwun+pKW3Inppu5dQJKQYXplBPgzhXk+WfKZE
 MCznrd4oT8KCt6HJv9c1GEaNB37aa+egO/a1NMRvX00t7SlE8o1MZ+Q
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Describe the DVFS levels explicitly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 58cee37cb8eecbdd43a474d548dcae1606aba6c7..76691e5b2608f33fa58b39ea338e41172a9e111d 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -3160,6 +3160,7 @@ venus: video-codec@cc00000 {
 			reg = <0x0cc00000 0xff000>;
 			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&mmcc VIDEO_TOP_GDSC>;
+			operating-points-v2 = <&venus_opp_table>;
 			clocks = <&mmcc VIDEO_CORE_CLK>,
 				 <&mmcc VIDEO_AHB_CLK>,
 				 <&mmcc VIDEO_AXI_CLK>,
@@ -3188,6 +3189,35 @@ venus: video-codec@cc00000 {
 			memory-region = <&venus_mem>;
 			status = "disabled";
 
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-269330000 {
+					opp-hz = /bits/ 64 <269330000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-355200000 {
+					opp-hz = /bits/ 64 <355200000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+				};
+			};
+
 			video-decoder {
 				compatible = "venus-decoder";
 				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;

-- 
2.49.0


