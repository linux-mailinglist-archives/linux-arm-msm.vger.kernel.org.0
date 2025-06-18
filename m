Return-Path: <linux-arm-msm+bounces-61686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CA4ADE492
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 09:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EE0F174FF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 07:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F192127FB3F;
	Wed, 18 Jun 2025 07:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TNNr0NEp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7093B27FB2E;
	Wed, 18 Jun 2025 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231721; cv=none; b=hyx4xMwcHN0cBTXEJsmDP/t/RfNLxR5/vAszLJcrJnwGFIfIeGVjn8b3JLdgpWrj5BjKc0vqY5q4o43SFHPsUOpaSqbmAZ9B9swVQpxblGV9E8jn3viiOlNAOEtscUIqPa/4HTuFCRdrV7yDcsryQfKJeowpr0WhOVPfwdUvpDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231721; c=relaxed/simple;
	bh=b+HMcj2ek0nB7t/THuyAIn1KCdSizhm44JgQ4PKMQ+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KSAh1EB/4UiH5OZqhLwRlbe8LTz9YRRMfE/J3wsD/NGo6lHY/V9D5S9fODkW2C1efI7mwlZ5/NwUxtOxIY1XpGNx8ewfa6epqpJuK40+Dh8DNezoVb3BPa+9ddHdGeVrnRS/ORLKee0dNRx1c1MVoXwx9/MxHY47hZWKwZMyaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TNNr0NEp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I1Q6vU015543;
	Wed, 18 Jun 2025 07:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I9W+fzRJ4P7
	Z+rK1AuztPn1ghFhOvkRoQaGwG5maVq4=; b=TNNr0NEpUjNXm4UK0U8/rKCJPSL
	t7BqYAJa2JJgWysOadBFkaBFoKnMMa818AxaW9uTuzTVswTz5jOA8+gx31JQMg6+
	Hx68n0iauLv6a/QMLjEcST0zWaPQb2c4D3XM0KSNVTcf0lG5kZU/FSTxlf6uzSMt
	0fcKKAtJh7opwwXh7TIW3+pcLi5/VckvS6CjLMF/enBAwumsUkvytbYvhLxP8g8T
	2HTG+6Wp9I+jaxhVYSRIxZ3END7rEmkZD6+zC7gm94LuVVFKjGiHpZKf9XLYICZq
	iXFBmDWIvN8YiRL54uMBcwf93gfr24jOlUakCvg212cFsYxNfyNriBbapVA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfk7ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55I7SNjp024603;
	Wed, 18 Jun 2025 07:28:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 479k1gnd99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:33 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55I7SXP3025018;
	Wed, 18 Jun 2025 07:28:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.147.242.251])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55I7SWnh025007
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Jun 2025 07:28:33 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2339771)
	id C88205C1; Wed, 18 Jun 2025 12:58:31 +0530 (+0530)
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
Subject: [PATCH V3 4/4] arm64: dts: qcom: sm8550: Remove SDR104/SDR50 broken capabilities
Date: Wed, 18 Jun 2025 12:58:18 +0530
Message-Id: <20250618072818.1667097-5-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
References: <20250618072818.1667097-1-quic_sartgarg@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA2MiBTYWx0ZWRfX+4UU0eZ9eK4s
 tBWftHeN6PBwDB19U1o23yWARs38rs8zAMmUyMejPbo9sJ/YV3wBJ8MmpZQyksKE8rmwpml2avb
 p2W+KQW7sR70wKMyykuOefT1UFdkASTHQSxVmxU7NvovUwH+BgIrK47jSoz5mIPHsy6bi3pTIHT
 4ehS6kC/i4cQ+Er0XtYdtAnRQJP+3FzUsxtALPr72Lq8qewJvX88k7BRQkwNZmTO9vwn+GV2HMi
 rdwPfuUlktoiklt2hViYXjEEwLcYG2iRSawOVmI20lCRXpg73FUmxaJDPRxzpTHBAzsutVLxAzn
 4W4h01yZb1zH4j8mqZNx7gi+BL69u+J00DhnYobYRx7JwAY7qksDhvsmiD7GNj/nlnUcE2SpyLv
 P3DlRCNIJHV/EmahoYuU6qGzi4FsijS7jdzf85YaOdXjsgUEUNnDvFhzcaPj9lCa5WXUIfl8
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68526aa5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=V56PYd9v_U8fUFI648UA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Y9Jjw3IIg1SBr2fvQobulZGXaqIkjZ9r
X-Proofpoint-ORIG-GUID: Y9Jjw3IIg1SBr2fvQobulZGXaqIkjZ9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180062

Kernel now handles all level shifter limitations related to SD card
modes.
As a result, the broken hardware capabilities for SDR104 and SDR50 modes
can be removed from the device tree.
Additionally, due to level shifter constraints, set the maximum
frequency for High Speed (HS) mode to 37.5 MHz using the
max-sd-hs-frequency property for sm8550.

Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2..2c770c979d39 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3180,6 +3180,7 @@ sdhc_2: mmc@8804000 {
 			iommus = <&apps_smmu 0x540 0>;
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
+			max-sd-hs-frequency = <37500000>;
 			power-domains = <&rpmhpd RPMHPD_CX>;
 			operating-points-v2 = <&sdhc2_opp_table>;
 
@@ -3191,9 +3192,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			bus-width = <4>;
 			dma-coherent;
 
-			/* Forbid SDR104/SDR50 - broken hw! */
-			sdhci-caps-mask = <0x3 0>;
-
 			status = "disabled";
 
 			sdhc2_opp_table: opp-table {
-- 
2.34.1


