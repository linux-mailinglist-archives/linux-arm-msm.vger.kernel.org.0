Return-Path: <linux-arm-msm+bounces-4412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE6D80EDB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 14:33:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2913D1C20BB1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 13:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE7661FBA;
	Tue, 12 Dec 2023 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YHG8C1o9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18DBF83;
	Tue, 12 Dec 2023 05:33:25 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BCA6YHg019610;
	Tue, 12 Dec 2023 13:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=WiwISKr
	ta03GsjC7RA50OM5yZACKJsWKrxM3ona5Oqo=; b=YHG8C1o9z9QzS30YH4o3NhJ
	8QzkTr+VTKhvjjF1wP1YMU4F1D/xiuagXgoABDqeL1QIdXCFEcnTt9vRmB8pIIXG
	/DpcyrbeDwezBuikUKOMHCpjGP090rO7KnwpAlPdWfVuLYCEXGp3+H6vBYEMa5I4
	Pi9q4YeGin14I/1c7u19kfxDVPPcYF+DG8eRbybai0W11+3iPghjb7CU3eKq+qKj
	9f6xRBYjypHZxzIDnGv/s1kqtoCQes4bOKFiPF2yHP02oY/2qL/TSoFuRrOcxAhC
	QKTnNnmHIF6Pa5Gej28HDNvTMOb8IPQWwK2bQdhxv8y1dIXlx8oR/968E5c/5VA=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxnf70dp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 13:33:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCDXDaZ022462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 13:33:13 GMT
Received: from hu-omprsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 12 Dec 2023 05:33:08 -0800
From: Om Prakash Singh <quic_omprsing@quicinc.com>
To: <quic_omprsing@quicinc.com>
CC: <neil.armstrong@linaro.org>, <konrad.dybcio@linaro.org>,
        <agross@kernel.org>, <andersson@kernel.org>, <conor+dt@kernel.org>,
        <davem@davemloft.net>, <devicetree@vger.kernel.org>,
        <herbert@gondor.apana.org.au>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <marijn.suijten@somainline.org>,
        <robh+dt@kernel.org>, <vkoul@kernel.org>
Subject: [PATCH V2 0/2] Add QCrypto support for SC7280
Date: Tue, 12 Dec 2023 19:02:45 +0530
Message-ID: <20231212133247.1366698-1-quic_omprsing@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FEFgNBZzeDXqK1HL075dB4Nmd7QOKr93
X-Proofpoint-GUID: FEFgNBZzeDXqK1HL075dB4Nmd7QOKr93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 mlxlogscore=661
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312120104

Document SC7280 support for QCrypto driver and add QCE and Crypto BAM DMA nodes

Om Prakash Singh (2):
  dt-bindings: crypto: qcom-qce: document the SC7280 crypto engine
  arm64: dts: qcom: sc7280: add QCrypto nodes

 .../devicetree/bindings/crypto/qcom-qce.yaml  |  1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi          | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.25.1


