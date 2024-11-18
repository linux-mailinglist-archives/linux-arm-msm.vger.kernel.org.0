Return-Path: <linux-arm-msm+bounces-38176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A03989D0A1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 08:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15E48B22D5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853541547E3;
	Mon, 18 Nov 2024 07:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iLOGeucS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0322215381A;
	Mon, 18 Nov 2024 07:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731914350; cv=none; b=WTKbaxY0nHQ/qaM/ZfYCV7+h5M42EM7MGTXl7QIIe5vIzsm4b66QXntbsJ2M3BQBgtTXbYDhRGw3xrhQTZR9Gq6pOyIjhk6aarzWJBM4qwa9jDm6Tkz++WFTkpChTN/vm0NEwZcDLVFAx4r3Tk8YNDt6x/vwA4iKDpVsq7g1euU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731914350; c=relaxed/simple;
	bh=31CHqzgtaZCfAcyRsIJxo7eF1aLy+hAwSbgnaFPi7XI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k3iVnaUn/GgWnoru2p2IuApjsamy5Na64Ujg2aZrc7qbfTLBU+mNjiPx975dzFQX6xQO8vGD7PmGp/vufvpD+KY8QuD8gxuMCFAlA33rPWKaPtbCyrxni41CPK1Yci0Zy+qqJ9wJaVlcFtJerxzHbW2EwCEKaW+MideEKDNqXCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iLOGeucS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5Rkpj009831;
	Mon, 18 Nov 2024 07:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m/eyM8AbaTdd8Y8kGOeQRFu/aupos60y4IbTTxADsag=; b=iLOGeucS2pWyJhM2
	8WQ2HQ+idFGF5vk5IyanBkUSw/vj5+wzLRHykAPLSgAvv88OaCoTkrh4YOsmYNmC
	/w41VARLF9vosR28f9oiFpd1/kvAHBILYnQYveNAc37/p437F8BwXYMMXNMiJ7h9
	EaGtBsS65vctoNYCRqn+1u1byozEkn8YgvEP+9LD9kgkTvH5MfqF8bIhOrJZwCDu
	IksMUyBR3tm9vW3XNg5bREsqXQot1RDY7Fbxt1TOfqka2IYhoc7OG69BeYLs0rae
	bn/+UDgHvxzbJtz//kxr/96sCpOxOxRm1CDTJ8/vqB5uHb7cKoXBax1y/F6VtR6E
	7ZvY6Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkrm3pqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 07:19:04 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI7J39R014807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 07:19:03 GMT
Received: from yijiyang-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 23:18:59 -0800
From: YijieYang <quic_yijiyang@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <quic_yijiyang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: add qcs8300-ride Rev 2
Date: Mon, 18 Nov 2024 15:18:42 +0800
Message-ID: <20241118071846.2964333-2-quic_yijiyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118071846.2964333-1-quic_yijiyang@quicinc.com>
References: <20241118071846.2964333-1-quic_yijiyang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: puiHKkOOcWDvsUJGYMzJTyv98cqqIQru
X-Proofpoint-ORIG-GUID: puiHKkOOcWDvsUJGYMzJTyv98cqqIQru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411180060

From: Yijie Yang <quic_yijiyang@quicinc.com>

Document the compatible for revision 2 of the qcs8300-ride board.
The first revision and the secondary revision has different EMAC. The
previous is 88EA1512 and the later is AQR115C.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b40c3d7b63fe..056b27b5492b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -899,6 +899,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-ride
+              - qcom,qcs8300-ride-r2
           - const: qcom,qcs8300
 
       - items:
-- 
2.34.1


