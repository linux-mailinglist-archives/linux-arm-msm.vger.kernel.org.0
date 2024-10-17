Return-Path: <linux-arm-msm+bounces-34723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9B99A1FE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 12:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FAF0B2568E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 10:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4711DA61B;
	Thu, 17 Oct 2024 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dHtpjmT2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CCD1DA618;
	Thu, 17 Oct 2024 10:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729160876; cv=none; b=r9Scv63T/G0z0og7726byJXgdfpi7v4lvPjM8PBLb0OxGP6a5VGQgRQvNB5rZirf0GJoQGMkny6ivZd3GMy25uL4gh7kkPhMXk7LbcvCWOryKwMChWpw9fFCVoI+LNrX9qBS4eGHmTd30uEeqLuFUvdSqo8numpiW2FLdgnsDgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729160876; c=relaxed/simple;
	bh=/chp6du7u0Qd03Lgb4IT9+Pgtjo4W0jp/3rU4LrpYwY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ifnyDwACLvlj3nQWxP4psORmBygdOs9TYvwXzeUW2601i4p5LMQCxDRpFE6hbz53yPoGBi6ITz8vgoVQtOleQLIf/d4hPDIV5EfFCAbR9Z61m6nc/Zc8MxCTWjSMwUlLrN2iceqXN/DfK23zUFbMnT82xI7pKyHAj+Em+1zfoBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dHtpjmT2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H7klkN007441;
	Thu, 17 Oct 2024 10:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TSJVe/TqQuZ8p5iY3AHZ5mJdOa86eP6ema2ggShM6vk=; b=dHtpjmT2CyLM9JWo
	e8His9xvKQPMYDx1SZ6jjiQiKI/eONjNnAtup0EVd9UrOdEJ4BtSlUM/NQc5+sGJ
	y1mAoCbbEyqw+qT7g4GnaSWsYKROzTHOT9kVd01oqanQ3Wl7NS827//DjXFt9Gox
	8uleK5VtS+dSdgZUlcQ4nNDbw3N5QqC4zsW8QzWHubtlPqEtT4oWEqr53b7AfiIp
	daXtUAzViS+5SQA1mTFEnWIwYn9J6xFHt7K+6cSiwYCB6P2hzfsk0gMq0gFZWRvu
	asW9gy6guVE/PX/p0L8ExOCEmgD6+KUpl3RVxG0+mXr0nv3YReHFzEmi1EVh7UKY
	pO4WKA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mjy7t2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 10:27:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HARj3o007439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 10:27:45 GMT
Received: from yijiyang-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 03:27:41 -0700
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
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: add qcs8300-ride Rev 2
Date: Thu, 17 Oct 2024 18:27:24 +0800
Message-ID: <20241017102728.2844274-2-quic_yijiyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017102728.2844274-1-quic_yijiyang@quicinc.com>
References: <20241017102728.2844274-1-quic_yijiyang@quicinc.com>
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
X-Proofpoint-GUID: -W9wvwbo9H41WQsMjEyZhhJxwS8zfdgX
X-Proofpoint-ORIG-GUID: -W9wvwbo9H41WQsMjEyZhhJxwS8zfdgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=927 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170071

From: Yijie Yang <quic_yijiyang@quicinc.com>

Document the compatible for revision 2 of the qcs8300-ride board.
The first revision and the secondary revision has different EMAC. The
previous is 88EA1512 and the later is AQR115C.

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


