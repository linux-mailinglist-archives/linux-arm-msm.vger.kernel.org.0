Return-Path: <linux-arm-msm+bounces-63035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E97BFAED4D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 08:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D1B451896509
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 06:44:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CBA1F4C84;
	Mon, 30 Jun 2025 06:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZlCQHKp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5988818CC1C;
	Mon, 30 Jun 2025 06:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265829; cv=none; b=b5aAH2RNV5YTvzQd2qg8anGcHcXrlb3RbTZ/oV6ECCXxnC3tlZcZq9qGCl8roQiDtc9MI/Z7hlqKeyoVTuPlCS7LrnWgOSkEv8LAyS/8FdiyKArH45MrGF6IXYnYF0LC+v93S8lZgvRXoeSRw0mMPKe/h6P7sa6I9V/x0ugm6VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265829; c=relaxed/simple;
	bh=AoCV/CL2uLxgEJw9pVSZJcmMBZDrZqa07MP+IMSkLTc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cciH6LTozTHOL/03IKlh1qm5HmSgBnw0Qr5XVQGLm4sUqUGi+t8fNREweEGr9d3STz/3qYlsVOsxPckVhzsCsP+dJ0Ph+HILvWgQryN0D6ptu6MOlAzISl0VyfE0E5MphOFc0C7jHzxProot78SPxblgbxPcD2FHz00mRvSXlD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZlCQHKp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TNU1LO005295;
	Mon, 30 Jun 2025 06:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4VYkcedFyAoDplquSeQ//Iiyw69vweBomdR
	n0hYrRY8=; b=hZlCQHKpffAQ3bbOMW4BooCuP8bWIMFLm+muUS392lweVOVMCzW
	/NZaC8sohlWxr5H3N9zgSTR9Bhn/kSx/aDiauxRRP9yg8jFgsk0AK/H6t+Ex38PE
	vhEqKoc0AyxT6Y7FSwHbsC8D4wsefm7AdB4frz9ywrCEMCmNa1o4yBm0LqSeYhFR
	VyzdWEZsFA74rHcNVzdoku+y1U6nXB2Hx67BLzSIcBZ2nVaVffHcJzSqnYvN+Qrb
	9VjjSWykSBkuvXAfeJM9a1Nr4Sxh81ndXR+Ibonp+3WwMR3EkNol3BHut2BNoxld
	1OoMpvRCMnrkOeJykVjmPUM1I9r+sKO1OAQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64gwkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 06:43:43 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55U6he0l026895;
	Mon, 30 Jun 2025 06:43:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47j9fkm1u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 06:43:40 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55U6heO0026890;
	Mon, 30 Jun 2025 06:43:40 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-vdadhani-hyd.qualcomm.com [10.213.97.252])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55U6hesS026889
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 06:43:40 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 7CB4E513; Mon, 30 Jun 2025 12:13:39 +0530 (+0530)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: qcs615: add missing dt property in QUP SEs
Date: Mon, 30 Jun 2025 12:13:38 +0530
Message-Id: <20250630064338.2487409-1-viken.dadhaniya@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6862321f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1G3-eJrk4WENrBlVEWAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA1NCBTYWx0ZWRfX4tabQh/dggR/
 DQt1BWlbj+CFZBHwVIXGHNOXXSN3MswtieDhuxSD/ditcxQwwMR7OfDP3PmpYIT+/NSct+0uhqH
 Rjz+f57ssk+P4BWS5I8xz1cMDtLgDdTslTAdx1+WxlcEZyxIqyIajuB61NylBKx2ocX/RwjXAqi
 Oa6gYJT41IPjzJFLqHZFPVHM1ZcYrMakSEJyIVsDGyznQvKIrnePVKcqZGpZ2LjBXKaLcL2utAC
 mppzg9W0Oz4IlLiyI+9uWL+bdVye1goE63FKXh4RjeCZ08LYL1O5tpY5DVuyco5sJnipZ9YHPcV
 FU7GWS2MN5zAhdBvJbkEH23XmoJBgWnjW8LEugR+MQdpDhciLI9+5UT4Z4wu8G/RZgLWaegVfNr
 IRnA4b8dpRQwxtkDwwXvaZLaEbMKjRa+qGZLTr+xjkhcgGA9afM+zgMgqZz46qLYIHhkmoN5
X-Proofpoint-GUID: SdE5ssLDq0yA4i4k33dyLnhYrf2w53Mg
X-Proofpoint-ORIG-GUID: SdE5ssLDq0yA4i4k33dyLnhYrf2w53Mg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 mlxlogscore=918
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300054

Add the missing required-opps and operating-points-v2 properties to
several I2C, SPI, and UART nodes in the QUP SEs.

Fixes: f6746dc9e379 ("arm64: dts: qcom: qcs615: Add QUPv3 configuration")
Cc: stable@vger.kernel.org
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---

v1 -> v2:

- Added Fixes and Cc tag.

v1 Link: https://lore.kernel.org/all/20250626102826.3422984-1-viken.dadhaniya@oss.qualcomm.com/
---
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


