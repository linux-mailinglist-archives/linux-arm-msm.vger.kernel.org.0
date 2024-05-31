Return-Path: <linux-arm-msm+bounces-21233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C0D8D5E7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76D231C21876
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3893155A34;
	Fri, 31 May 2024 09:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jCaDq3Ja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246F135A79;
	Fri, 31 May 2024 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717148160; cv=none; b=SCW+IlEwB7jrJyY+A8Hsnbja0CXOzDTqybPH8CAfkTFHl+OM9E8wRHGBOYpJH8tgfJbQP/iGQgPr7m7lQS3d8SwFsJDiKTiCp8ld6ctT7BQtYwXZUPwTa8jAfKZmaum0YhiegXLD+ybXZ8FUUJJT6EEMPn02gRi2hZbMqCg6rxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717148160; c=relaxed/simple;
	bh=4VxoEvVUBSNHKzOswEZlQ04WHSLg0sZ+I/BNz/QpoBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgqezW2dZvv2VTnKqJ+b4sTs0W7BnD+MQKi5gqs8BhBGmGp7xRPD80MARllStq6A6kA95/WBAW5xqxi3el26sMzRYOi7pno0yqavxBmBdjPvpzV6xmWsMbcBfj3PlkLT0tGhjye1meDBVhUhUKUh1lcpuj5hALokeRVZzxfnBIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jCaDq3Ja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V8aJg1029210;
	Fri, 31 May 2024 09:35:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fF00rAlcyC8xas2IdPBpf9L/XR6cAiVh/5MAW3K9l50=; b=jCaDq3JaqfdeZO8C
	sFF0GHEKqG+dddU3lPtlgfgrrF4/GldqqChhfPH+B1Rtw5FrQzXYphPU7Re+bIe5
	WhKne7OF+O4jEVLITO70aeyU7iA+MxKsK1tjXQi+E+BitQXNuPpFqFXcy2QoEci2
	xk/ZZ/5a8b38lt2wY8BxyovvF19Ml+j+tQZUiwnqA1prN/eDtj6jnZtZ+PCjWisy
	g2y9npspDo6Tsnnve4ZJoi7IHrhir36rAciTlOjotXrG55i9bxQ5sLQ8MWgCZ+40
	qC8685FTP3ngzOwnDhp4rlkJq8EVOZLwTbscAOzuSxfGYGJZ+gmlsZ9BPRzQg0LI
	18YAkQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2hebxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:35:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V9ZtOQ018983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:35:55 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:35:49 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_kbajaj@quicinc.com>,
        <kernel@quicinc.com>, Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sa8775p: Add IMEM and PIL info region
Date: Fri, 31 May 2024 17:35:31 +0800
Message-ID: <20240531093531.238075-3-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531093531.238075-1-quic_tengfan@quicinc.com>
References: <20240531093531.238075-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HfgRrAVpW-KTeJGgw0nZEVqq5p-d0jXw
X-Proofpoint-ORIG-GUID: HfgRrAVpW-KTeJGgw0nZEVqq5p-d0jXw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=598 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310071

Add a simple-mfd representing IMEM on SA8775p and define the PIL
relocation info region, so that post mortem tools will be able
to locate the loaded remoteprocs.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index eae0de9720b5..89496728d840 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3044,6 +3044,20 @@ tlmm: pinctrl@f000000 {
 			wakeup-parent = <&pdc>;
 		};
 
+		sram: sram@146d8000 {
+			compatible = "qcom,sa8775p-imem", "syscon", "simple-mfd";
+			reg = <0x0 0x146d8000 0x0 0x1000>;
+			ranges = <0x0 0x0 0x146d8000 0x1000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sa8775p-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;
-- 
2.25.1


