Return-Path: <linux-arm-msm+bounces-67313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D00B17E84
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04D091C80C61
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 08:47:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5907922759B;
	Fri,  1 Aug 2025 08:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jp6cXhd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7D3223DED;
	Fri,  1 Aug 2025 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754037944; cv=none; b=tcxa6khu/+Oudrjv/enLN/XXogciiPnz6s5Lwlrz6HE4S1KpeMVUr1AbynOlflCvw/LdI7V7g2JImn0VEwEm9hI6eSdqmMVGHA5h1kmvm+5/+mDOrZyvtPBiczwl03TtqRB6A3GW4WfclTyW0Rn+WujvyzSuelhw/zdJtOaiBaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754037944; c=relaxed/simple;
	bh=0vyE3UCyjkj/o1K3T7y2waAk5yGOj6bxA41NSNPvr7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DNI0rzjfYNdnGZq7yYL68aZuKlb5fewdgGqvtK/FWe+OC5itoql7Uwx3NAWu8TtrMl/oB+NERd99ZfdwbAm01FHKUvKmP/Ro39N3R0+VvVQaQjOyqYlNfuTYkWDYuzkPCZta2gFEWreAi9wzi5w4TCXkBiBDxa93jmBus4VmRyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jp6cXhd0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5710HeXO022949;
	Fri, 1 Aug 2025 08:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a9YziugwfDj
	3Lcvi/AidcVUYP95GX74Yw1Z/Ds18ka0=; b=jp6cXhd0lo+PcWRVm+WkzJbAv0O
	/DdvYjJEQVWb2B/wfK3c5XqlJi4uy9kPow+nYC4JlBMeW24LzOtOcTNknOIli0YW
	B0MWTX6W8hS3JMYGJKjEsrjkxPoKsC3rl95qdnCbBvnAk/gdRb5BBwlpxf9ieFnC
	r41dQn9CuTbp6Qs+x2nqijf9sUREKJQXkjLKSwU7L+7cCBMEWY3uTV6zxNUO+r1N
	xIlF+oCfOL/zGRd6MVMMS0Xno1S4671lwOwttmjdGCEUygnRt2vXOAA1wLHgMbeH
	OAQYlVuRmlQs7mDbtuZDXi0ecQBv4wMwwnffmXmzNyg8KRHmUDJfS7xzw0g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcrka59-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5718jWfx016931;
	Fri, 1 Aug 2025 08:45:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4859bemgt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:33 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5718jXGX016940;
	Fri, 1 Aug 2025 08:45:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5718jXaR016937
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 08:45:33 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id 4324E5CA; Fri,  1 Aug 2025 14:15:32 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V4 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50 broken capabilities
Date: Fri,  1 Aug 2025 14:15:18 +0530
Message-Id: <20250801084518.2259767-5-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
References: <20250801084518.2259767-1-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDA2MiBTYWx0ZWRfX5xYefqMgqvMl
 eVk5KSAcetZqV+I2XpYp1R7/0qJY3K3BnmTw7s7gPxWca27N6AJi5gGInzgEu4MPJFjpfJHQgd4
 U449ONcSzJLekzoPJFscmIXJmH1xx90wcz7HcOXcoywsGwMHlFVqmHuAmnfXZw1D2X0nzqJHeQv
 lLseJg7qku4QJ+OWi0HKRkJhBoVBUSP2VhpMtjS6n565cfCu4fF1idYjz5iKjUXhkQP4zp1mE0F
 n41yAf1L/O4JAb4U6/ieg+rZ3f+YpkM3oGSES8d9mwJHHzSE9UzC8wwn/zBOcSySTgyePIug2O0
 lTZ/R2aSHGvqp2L976hZM1ddkLTCXuPyTiaQ0RNwtcynQHfIBG6rx8UFTS3nFQ7kMYBEBV7Ko+b
 cKZURW2DMdpL2QMLFDFBKtnv5G1dc5H1vbO5uVHy89i63a+AnOYOQyVZkbf+f6KIAPhDUZ5x
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=688c7eb1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=XT_FJVZuhd4KiCc4GssA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WhPEeeMeSP_pEBElCitlD7lkzaENfJUN
X-Proofpoint-ORIG-GUID: WhPEeeMeSP_pEBElCitlD7lkzaENfJUN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_02,2025-07-31_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010062

The kernel now handles level shifter limitations affecting SD card
modes, making it unnecessary to explicitly disable SDR104 and SDR50
capabilities in the device tree.

However, due to board-specific hardware constraints particularly related
to level shifter in this case the maximum frequency for SD High-Speed
(HS) mode must be limited to 37.5 MHz to ensure reliable operation of SD
card in HS mode. This is achieved using the max-sd-hs-frequency property
in the board DTS.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 1 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                     | 1 +
 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 3 ---
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 29bc1ddfc7b2..a6bc3c11598b 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1164,6 +1164,7 @@ &sdhc_2 {
 	vmmc-supply = <&vreg_l9b_2p9>;
 	vqmmc-supply = <&vreg_l8b_1p8>;
 
+	max-sd-hs-frequency = <37500000>;
 	bus-width = <4>;
 	no-sdio;
 	no-mmc;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 5648ab60ba4c..166d3595633d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -818,6 +818,7 @@ &sdhc_2 {
 	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
 	vmmc-supply = <&vreg_l9b_2p9>;
 	vqmmc-supply = <&vreg_l8b_1p8>;
+	max-sd-hs-frequency = <37500000>;
 	bus-width = <4>;
 	no-sdio;
 	no-mmc;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index d90dc7b37c4a..039ead5b8784 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -716,6 +716,7 @@ &sdhc_2 {
 	pinctrl-names = "default", "sleep";
 	vmmc-supply = <&pm8550_l9>;
 	vqmmc-supply = <&pm8550_l8>;
+	max-sd-hs-frequency = <37500000>;
 	no-sdio;
 	no-mmc;
 	status = "okay";
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2..bc7c4b77f277 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3191,9 +3191,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			bus-width = <4>;
 			dma-coherent;
 
-			/* Forbid SDR104/SDR50 - broken hw! */
-			sdhci-caps-mask = <0x3 0>;
-
 			status = "disabled";
 
 			sdhc2_opp_table: opp-table {
-- 
2.34.1


