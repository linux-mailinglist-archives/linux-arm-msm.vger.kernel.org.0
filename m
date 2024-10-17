Return-Path: <linux-arm-msm+bounces-34677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D068E9A18D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 04:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 610051C212D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 02:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69C57E0E8;
	Thu, 17 Oct 2024 02:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KstlsRLf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F7A69959;
	Thu, 17 Oct 2024 02:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729133606; cv=none; b=S1FNxbFAZYDiduoIamVxMlLlB1TZWtHzu/fv0mbBQWJOikd+IKwPPbvJcM3YfxJmAtj8vRt89zWYUWTki2yYdEey2c1QdX+2tkffNxe3Rgdb776xgcTwBjiWD6lm+GtsTH+mI745ZQwD/sautzSASVkuCJ0RBgbcMG2FJyeS5bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729133606; c=relaxed/simple;
	bh=CxHDQd/PeHLQRWbX3+Mpt1qywY56HIHmDXqLQlkFW3U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l5R7jE6xTqQy4cCqGQJCVc8VWc9rStCbBtnoVbNW9UVD0YWthrF3H1gbIqcDOT/cPl+jaZvUk1yH++UajYITG1BQ5EHXnWuvQ+gcB0j27xDaGkNWroc194nnxTpm0CiBx2OZKrhGGtsGfrQX9OYUsuY3neSgnk56ATxh21tOZnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KstlsRLf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFYUFY008411;
	Thu, 17 Oct 2024 02:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PmY2upVwwmk
	HPYRNJM9Z++Ov17fGTg+3wGtZlWbaoSE=; b=KstlsRLf3+bayzKzYq/Nide9/xH
	8NjIXUae1aspkHGKMBd5tcmlcxH5qGlfOQa/CVb0hd7WELJKCi6ab9SCuHdiZrvO
	PcQlR1sXcOwR7lxxxFb9+/RsyHjxR0TvSPA+57NdLlgeiPUuecwouaSx50ahnNSt
	rLO1YaoixJfxod3bAUSZh/b39/j9bCzVtvtaOW4kBDcn9EzCYY+ng1YzuHTemEC5
	R10KOy0a3ccqhjtjmxZhK6wZ+AQIzuxY/fAL20LyQb9sCHUAB07oD+PDO5NYibf9
	UTmSCyRrtZRVO6mFXZ5ol7eaVN+tnX6eQfe6XWLOZqyVNlGxKI9W07xt8uQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429mjy6ny2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:21 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 49H2rIwt023692;
	Thu, 17 Oct 2024 02:53:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 427j6kxfhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:18 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 49H2rIIx023676;
	Thu, 17 Oct 2024 02:53:18 GMT
Received: from chunkaid-gv.ap.qualcomm.com (chunkaid-gv.qualcomm.com [10.64.66.109])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 49H2rHvW023673
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 02:53:18 +0000
Received: by chunkaid-gv.ap.qualcomm.com (Postfix, from userid 4533072)
	id 65F4321BAC; Thu, 17 Oct 2024 10:53:16 +0800 (CST)
From: Kyle Deng <quic_chunkaid@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com,
        quic_aiquny@quicinc.com, quic_sudeepgo@quicinc.com,
        quic_taozhan@quicinc.com, quic_jiegan@quicinc.com,
        Kyle Deng <quic_chunkaid@quicinc.com>
Subject: [PATCH 1/3] dt-bindings: mailbox: qcom,apcs-kpss-global: Document the qcs615 APSS
Date: Thu, 17 Oct 2024 10:53:11 +0800
Message-Id: <20241017025313.2028120-2-quic_chunkaid@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017025313.2028120-1-quic_chunkaid@quicinc.com>
References: <20241017025313.2028120-1-quic_chunkaid@quicinc.com>
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
X-Proofpoint-GUID: 6DsuSxjvggOIqpFm9VAoS_TcVh24T84N
X-Proofpoint-ORIG-GUID: 6DsuSxjvggOIqpFm9VAoS_TcVh24T84N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=987 phishscore=0
 mlxscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170019

Add compatible for the Qualcomm qcs615 mailbox block.
QCS615 mailbox is compatible with SDM845 use fallback for it.

Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 982c741e6225..54deb5740d66 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -44,6 +44,7 @@ properties:
           - const: qcom,msm8994-apcs-kpss-global
       - items:
           - enum:
+              - qcom,qcs615-apss-shared
               - qcom,sc7180-apss-shared
               - qcom,sc8180x-apss-shared
               - qcom,sm8150-apss-shared
-- 
2.34.1


