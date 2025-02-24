Return-Path: <linux-arm-msm+bounces-49137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD57A41988
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 10:51:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D514188DE95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 09:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF7024A065;
	Mon, 24 Feb 2025 09:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZwgxFpUC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AEA23F406;
	Mon, 24 Feb 2025 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390654; cv=none; b=ri1cxIMdsLs+LjR9Zny58DepNE+7LnKVx6GD9ZOlwGtLqK699+v9mTEM4/nRWJSXw/Diix+GOc26CIfRNoLAL7BbiJm/lNLjuZoR28vZWuiTDoZ0MV9G/bA/uDb9dRpACLKA1uci5MCxuPkyyuMBQrBoVYWK3RjqfL5OhmIstDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390654; c=relaxed/simple;
	bh=tgRDQ2JKVnAJyXX23bN+d55dM+weA7AwYagNUyqPUYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=e+wE3Zc1gbBsSP8VR23m6+Wkr16typ0d5KX5womA41ITMYxOnrprhmUADyJNZx44OdDnbnX2ib5vI4fPWNbDKa1kcSC4vn17OgNYJE6+YhgGunuQRsjGlwXhEbisH8WLGvUtgIq+CQyTnexAGHjbShcQ/TRiu1Qn3gWfzO5ySiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZwgxFpUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O9grDl011838;
	Mon, 24 Feb 2025 09:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8aYZz6VYviQdIbFB0TbUDpCRGxpHhi/t62FVrdIaG8=; b=ZwgxFpUC0QWZ+98O
	bBnSADU5zMLf/B1aupPyahi6PJzHsIdrk7Gojp1FhVqC4IR+JMrl0AyCT+SXN6iC
	HAePiMmfOPhFSW4pynmO3aOp0Z63JygGT/dfem9EpoRaSV9BEwWmwPSJbV+sXGAl
	/C1SadWWl5hRFYTvHps3exex7evsoBV5R2uk79gbNpp0dCCoTVvF2m8ODMPFUYdI
	mXKE+WTwFjJd5DclITNECB+grBBbT6o9iPWQFzbuzgNcqXhHwzffTCwbq+2jrLzB
	QKLems+fpZS0o/ZRZpyPnQaSq3R2Dj+wuFoU35bPZllU2KYEzwLIgKrnhNPeDeZh
	/99aeA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y7rjvcam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:50:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51O9ojtF019980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 09:50:45 GMT
Received: from hu-arakshit-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Feb 2025 01:50:41 -0800
From: Abhinaba Rakshit <quic_arakshit@quicinc.com>
Date: Mon, 24 Feb 2025 15:20:08 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,prng: document QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250224-enable-trng-for-qcs615-v1-1-3243eb7d345a@quicinc.com>
References: <20250224-enable-trng-for-qcs615-v1-0-3243eb7d345a@quicinc.com>
In-Reply-To: <20250224-enable-trng-for-qcs615-v1-0-3243eb7d345a@quicinc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller"
	<davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul
	<vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Abhinaba
 Rakshit" <quic_arakshit@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o_HlrHtXKxv-jpDzCo5RaP5RopGwdKim
X-Proofpoint-ORIG-GUID: o_HlrHtXKxv-jpDzCo5RaP5RopGwdKim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_04,2025-02-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=905 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502240071

Document QCS615 compatible for True Random Number Generator.

Signed-off-by: Abhinaba Rakshit <quic_arakshit@quicinc.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index 5e6f8b6425454d6440a8653567235380d934cc2c..fa22bd42b25009b557cb2b195ca45c0dec73b8b5 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -17,6 +17,7 @@ properties:
           - qcom,prng-ee  # 8996 and later using EE
       - items:
           - enum:
+              - qcom,qcs615-trng
               - qcom,ipq5332-trng
               - qcom,ipq5424-trng
               - qcom,ipq9574-trng

-- 
2.34.1


