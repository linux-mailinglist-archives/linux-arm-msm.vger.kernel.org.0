Return-Path: <linux-arm-msm+bounces-62622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53874AE9BB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 12:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD6067B69DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 10:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CFEB2DD61D;
	Thu, 26 Jun 2025 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1r/ohTW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755012DD60C;
	Thu, 26 Jun 2025 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750933720; cv=none; b=l0FHZVVibPpZBENFlqD3AUCRhHZt71VcY3DogVewRDvZsjRzHpogoB+Ejl6yOCYVDKlvIm8+Ta3Vp4c20mkpVcw/5zKoVlkIQ9iTU6mONmkYJOQ21EecP3B/f4qvMR5tMIdWqg4UuPQtlidTQZaXY01xmbGT+/EWIpMQj1KaZkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750933720; c=relaxed/simple;
	bh=bvpOkAMpzHS8oh7L3wWFi/ltw7jkDSBZk8sItDcmbAY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=awt366ahcSwBDBUuXD8IzsvQ5zlErhxcS4cSaS4v3WbCBb0So4e5FjcDJub3qRwI063e5mRrA9pHEH2WmEQQxm7ksTxtq1xpk96bmIaG7ZblTbiXlpnunrv/wdyrQ6h2WHWZ1qbKTED58OeTgpp0uzmAwc6bPn2sMV4gfFcXKFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1r/ohTW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9jU0N008621;
	Thu, 26 Jun 2025 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=P9H9I0Zid2ElxZzG9nHIoJCCkbfatFdEgx7
	axb/TZ/w=; b=n1r/ohTW4bo6LGt0tyiUCdJ0/iZN1FW5OHz1hT3yF7WoYfAmJdc
	FUXRxFPnuZm3TMXAYp5akc0/dzCs4JmIbZE9lZIsqzInWKsvsktIQ5SvCZ4Jrntk
	0vD4qY02xvJC8qflS7Mw+TINfACfxgibtMPxnaIv3QYUJh+qgHLMZn9YFuFasWPP
	eNot2umQIGcZjzDJX2vULiVGCGT53JSxqAiQOS6fU9X8NH8kNVJt2phpu4S7KWb0
	wB4lQTGWtqbpRqb2XzRyAwTN+K5su686yClLHREcgEYF4qrHby5WJzwO1Sc2L+0x
	zvTarX7HkY/F1xKvCMAb8IL21YcJI1bKxMA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqsd7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 10:28:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55QASTGG024436;
	Thu, 26 Jun 2025 10:28:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 47gph7tebp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 10:28:29 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55QASScs024431;
	Thu, 26 Jun 2025 10:28:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 55QASSr6024429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 10:28:28 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 764EE513; Thu, 26 Jun 2025 15:58:27 +0530 (+0530)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH 1/1] arm64: dts: qcom: qcs615: add missing dt property in QUP SEs
Date: Thu, 26 Jun 2025 15:58:26 +0530
Message-Id: <20250626102826.3422984-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: gQXf_YexrHdA1x2wpDeQWhWqMIzYxZSG
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685d20d2 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=606z3SnXk7aKuM2rapkA:9
X-Proofpoint-GUID: gQXf_YexrHdA1x2wpDeQWhWqMIzYxZSG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA4NyBTYWx0ZWRfX8tnHkpHTgZjb
 snah0ShFoqw9yHNiI5F4pKuCwYFShwsKhnPv8AZ2Uj847kKQG0rM4+1YwT1HDfTa9AlObMkrzbv
 QyXoxsDKxh5VzS2jb7YzXUJV2F5KYHpIlVlX6VwPqmpsKkxUl3ijK8yQpS5iTZKhVwn0fJ6Q5aY
 lfDg8VSEmm7ZWZ3RSSkvHiEiniYjfD9xc23lSE89pFEtkxNEYumkMKdeSHZ/Zf2Hw02FpvkusaL
 F5mqNqDkEGN+anUz9ML/LER/VQl7an29CcB2YoNmcqb4Pe+tpTF/i9f2m9kL+KgFCcePFfiKsSI
 8GdNh3j//Tayxc7NFy7m3wjh91lZ2MIdUXNm2w6Gda0YpjTYtjucgQRWOdp8CCuechim1DxbZDh
 4n+42WWzTGWizBLqEdoNB8WB3x4zeP2FNDmggQ0hmS8X6OzfwMaaTRApJOPKCwz2/IM8QnEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=932 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260087

Add the missing required-opps and operating-points-v2 properties to
several I2C, SPI, and UART nodes in the QUP SEs.

Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index bfbb21035492..e033b53f0f0f 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -631,6 +631,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 				interconnect-names = "qup-core",
 						     "qup-config";
 				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				status = "disabled";
 			};
 
@@ -654,6 +655,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -681,6 +683,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
 				dma-names = "tx",
@@ -703,6 +706,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 				interconnect-names = "qup-core",
 						     "qup-config";
 				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
 				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
 				dma-names = "tx",
@@ -728,6 +732,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 				interconnect-names = "qup-core",
 						     "qup-config";
 				power-domains = <&rpmhpd RPMHPD_CX>;
+				operating-points-v2 = <&qup_opp_table>;
 				status = "disabled";
 			};
 
@@ -751,6 +756,7 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 						     "qup-config",
 						     "qup-memory";
 				power-domains = <&rpmhpd RPMHPD_CX>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
 				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
 				dma-names = "tx",
-- 
2.34.1


