Return-Path: <linux-arm-msm+bounces-49142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB29A41A49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AF773BD231
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E9E24BC09;
	Mon, 24 Feb 2025 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Yg2U+VQI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB521CC61;
	Mon, 24 Feb 2025 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391473; cv=none; b=qWItCudVpfsdDEOZJ/mRviWcUZieKuE6yXLqdVJr9dfsJwv29WlvnrWDWZaKF0GtSn1aNzKDrBahYlaVBtNzGD4jPOf9qrHhrwU5fPFDG/lL87ZY79XQESfs3YoiQXb+Xn1ZVW9dSAFAFw6OK9MdN6wD0zsXNSrSUD/xlMM+3kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391473; c=relaxed/simple;
	bh=NT7gh5BIToLiCcGd9vlyWqLoVKuOYrT1mPORrvCywpo=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=HynSu/TPnU7DU/a8SXhpcofYxRQSmVyryIyKPAwG30TufgcxH7O7aJsoUg+D2J6Nn51UhwbatElik93/eRqJY3cPax00hOEZkD3PE5Bq7Gsc4YD9jtnR0W8iDI6qgsqtbtTvxYh3f9wqTIGlUjK+TmQXZxpZEl5ud89EUXsJ7b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Yg2U+VQI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O94YAP006045;
	Mon, 24 Feb 2025 10:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=e9sHA5BgH/NoLFO9fPXwOo
	tzzmN556j6iDEmhKzeUks=; b=Yg2U+VQIZkYQC9pmmVzTEt9hZKfSu0LLZa6+vi
	CF9o+2tYRmsZS1/nvoo5v28Igy4Qsc/+1aPxow78vOwIUWVdYoGoa7RRwcFmV8Ui
	JnCDmvh81pIvX0NQxT76ILEfGBK9Y8umppX8id0gOK0d6E+ewFH0b7Q/il5OKNTp
	tber0aTPAmO5JAXAV9SWW+qALcCLRHoNFs2s4uiS0/efNOlL9MWqsnVVitkN0Er0
	sXFpiggVJSiS5H8DbO46/cHpq8rzq3UZo78loBLUvGteH6QF/4Gzv+tNusuylYlD
	n60tWAU3Q8QwCCXFgv/NskWCYpN8DoLwEPbokTXNcTBPIYuw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y7v9cgr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 10:04:26 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51OA4P75020107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 10:04:25 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Feb 2025 02:04:21 -0800
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Subject: [PATCH 0/2] Enable Qualcomm Crypto Engine for QCS615
Date: Mon, 24 Feb 2025 15:34:09 +0530
Message-ID: <20250224-enable-qce-for-qcs615-v1-0-e7c665347eef@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABlEvGcC/x2MwQqDMBAFf0X23IW4miL9FekhTZ52QZKagBSC/
 27wNMxhplJBVhR6dZUyDi2aYpP+0ZH/uriCNTQnMWKNyMiI7rOBdw9eUm4sz95ywOAmP1hjg1B
 rfxmL/u/v/D7PCwtSA0tnAAAA
X-Change-ID: 20250224-enable-qce-for-qcs615-de3a8c3505d2
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
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinaba
 Rakshit" <quic_arakshit@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M7gwyfJDVAMZLAwus_PjAxjSUHvpnA50
X-Proofpoint-ORIG-GUID: M7gwyfJDVAMZLAwus_PjAxjSUHvpnA50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxscore=0 mlxlogscore=695 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240073

Document QCS615 support for QCrypto driver and add QCE
and Crypto BAM DMA nodes.

This patch series depends on the below patch series:
https://lore.kernel.org/all/20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com/ - Reviewed

Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
---
Abhinaba Rakshit (2):
      dt-bindings: crypto: qcom-qce: document QCS615 crypto engine
      arm64: dts: qcom: qcs615: add QCrypto nodes

 .../devicetree/bindings/crypto/qcom-qce.yaml       |  1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)
---
base-commit: 50a0c754714aa3ea0b0e62f3765eb666a1579f24
change-id: 20250224-enable-qce-for-qcs615-de3a8c3505d2

Best regards,
-- 
Abhinaba Rakshit <quic_arakshit@quicinc.com>


