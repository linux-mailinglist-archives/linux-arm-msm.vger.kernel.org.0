Return-Path: <linux-arm-msm+bounces-44707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE2AA08879
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 07:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A77C3A7EC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 06:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2364F1C5F2E;
	Fri, 10 Jan 2025 06:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JMvb3OmK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDF41BDA91;
	Fri, 10 Jan 2025 06:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736491165; cv=none; b=DKGvYS7j7LLIP9Csk2LE7GObtdIpfm4E/p858p6PhLc8dCgHZEjViHkmTVnb+ao/Xo2dQClFV2FrQ/pSc9XGtJXeVzKG2KMJVrTxePXSw3UcwVyxZdCiOZjE6gtVuRPLYWM7aygGoeMUmbem9u/P//YO2DuhaLt5/Ph0tejypNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736491165; c=relaxed/simple;
	bh=pNLvbBmhzSBEOMHOimtcXWfBejjHqnLHmHFPm5grA1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BzZDYyttr/C8KFQqMWPcM8kBSe0IOoluJE175Hwipb7fxUm/cWbVafjFiPEMW+vINMkzGlbbY90zfw28e2xKlaolb0P2LYZUYUlTBMIY/fqu5jItm2lk6NgVra4jYrz/ekcOiZF+E4xZtV+d5QsReIiXFS6jQKX8nncO18mkxn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JMvb3OmK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A0XgwR028999;
	Fri, 10 Jan 2025 06:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=C1DIVBl28oY
	50Si3/TSV/7FV6JUMAvv/Nmkbg5BbfwI=; b=JMvb3OmKjcJQkm/yxagLa2+Sg/E
	O0QHLbGgp5jscHKoJIFJ3mcaSSdk0F03dZs71d9VUMcw7ZvUiDV6g7D4j3vyKOhP
	ebnP2s38qSp78NHkTAuPAJfl97NfqQfw1LVF6/9eKzhO/BauvcVaVaXH863u0kAE
	dCCPD1fJef0t9ssjPcwcVlQIUpNSwyXng5PaItob3Hi2BzovCTSaI+5vYM0VlVKS
	RTyjGubxM2ESx1FlD/I226QfquHjjqGx4o3LdWmkbMRPVEQadTIuUiY9OuB8QLpr
	xIrIFejLbPzBQ+FTlTEnjhITkC57l9+jx5M2n2/23E22cA81GOQXDP09znA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442s450pqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:39:20 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50A6dHMZ020555;
	Fri, 10 Jan 2025 06:39:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 43xx2m2se0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:39:17 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50A6dHct020550;
	Fri, 10 Jan 2025 06:39:17 GMT
Received: from chejiang-gv.ap.qualcomm.com (chejiang-gv.qualcomm.com [10.233.43.239])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 50A6dGQR020549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 06:39:17 +0000
Received: by chejiang-gv.ap.qualcomm.com (Postfix, from userid 37913)
	id 0873DFE4; Fri, 10 Jan 2025 14:39:16 +0800 (CST)
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chejiang@quicinc.com,
        quic_jiaymao@quicinc.com, quic_shuaz@quicinc.com,
        quic_zijuhu@quicinc.com, quic_mohamull@quicinc.com
Subject: [PATCH v1 1/1] arm64: dts: qcom: sa8775p-ride: Add firmware-name in BT node
Date: Fri, 10 Jan 2025 14:39:14 +0800
Message-Id: <20250110063914.28001-2-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110063914.28001-1-quic_chejiang@quicinc.com>
References: <20250110063914.28001-1-quic_chejiang@quicinc.com>
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
X-Proofpoint-ORIG-GUID: gctfVZl_mQLinS5umx7xBDeJBH4iBTe-
X-Proofpoint-GUID: gctfVZl_mQLinS5umx7xBDeJBH4iBTe-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100052

The sa8775p-ride platform uses the QCA6698 Bluetooth chip. While the
QCA6698 shares the same IP core as the WCN6855, it has different RF
components and RAM sizes, requiring new firmware files. Use the
firmware-name property to specify the NVM and rampatch firmware to load.

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 175f8b1e3..1697c11f5 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -937,6 +937,7 @@ &uart17 {
 
 	bluetooth {
 		compatible = "qcom,wcn6855-bt";
+		firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
 
 		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
 		vddaon-supply = <&vreg_pmu_aon_0p59>;
-- 
2.34.1


