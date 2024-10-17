Return-Path: <linux-arm-msm+bounces-34755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8629A2589
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 16:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 454801F24339
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 14:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2041DE4F5;
	Thu, 17 Oct 2024 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="luD3pylD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0521DE3B8;
	Thu, 17 Oct 2024 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729176629; cv=none; b=cLpAiwVSECRf5ACsSpVXxMqB2SGE0B5owxyk5UCy2Yyn/Fpnj3pz2yJ6MrkiUJdqdG/kpT/WrN2Sw1mlNonIiXTYx4DG3HX6t4+EnkxYU98Lh9VQrUrE5R3yYSBWKeMqoHVZwa98UVMeRQAWlDpMGTRefNQnE4vEqaPJrCPYO2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729176629; c=relaxed/simple;
	bh=GHvEzbOWl+PDbhAncKAm/Vp6rg1rgiDvkNIJWZTKT9g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DGvksP2hGK20Vc4qUglVEN4UjEEvfPb1oMIsuKdg1fYQMsVtz+HzKMwONQNYkXMD8h8vh+p+9fvyyQce6TUFKWlriAYWZNGSP0VL0jJ5IHH+ZN+xXc0MFRCuP0JtpGEehFziLVtfixnPr9+HRST/0zGvKpVss19+quuGlE96cPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=luD3pylD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HB4PYc010253;
	Thu, 17 Oct 2024 14:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fWOaa4w82UIsMpW3IvqH8q
	SQhhaD1GpYE+EEn1JPJKw=; b=luD3pylDZNvLcPBbjVAvKAiCzXJ2N1YGL+dQDq
	E/qAQq/dhyvoGX2LpzBSkuyV/oaROQKO5Jzrp8y6DBeB/44ELem5XfO6eAvzHsJR
	T6Nto32BSor7nOh2pkVu0sSOIMUpz39ONUxj53zWPd+BpnvG8KrvrXZbxgTY8i7G
	8AbG6NojAO7zZERyuhvGsrWyTfSR0XPEeyFwsn4s+Hk/daKluoIaBvcs5vDpowuK
	AgfZIRr1a++2XFdeW0m+UnGmiJ2U10A5aFJnjglFFtLfgvaYKUFLICFO5GV+mRwN
	KYRWbSImB9D2CcTCHOuHr2xlCfCaPJdw/BcI5Dkkfn/cxSdA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ar052499-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 14:45:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HEjJRJ015965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 14:45:19 GMT
Received: from hu-yrangana-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 07:45:14 -0700
From: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_yrangana@quicinc.com>, <quic_sravank@quicinc.com>
Subject: [PATCH V1 0/2] Add QCrypto support for SA8775P
Date: Thu, 17 Oct 2024 20:14:58 +0530
Message-ID: <20241017144500.3968797-1-quic_yrangana@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zN6LFvbM2qxryfZc5cXuB3LrNty9PHde
X-Proofpoint-ORIG-GUID: zN6LFvbM2qxryfZc5cXuB3LrNty9PHde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=779
 clxscore=1011 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170101

Document SA8775P support for QCrypto driver and add QCE 
and Crypto BAM DMA nodes.

Yuvaraj Ranganathan (2):
  dt-bindings: crypto: qcom-qce: document the SA8775P crypto engine
  arm64: dts: qcom: sa8775p: add QCrypto nodes

 .../devicetree/bindings/crypto/qcom-qce.yaml  |  1 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)

-- 
2.34.1


