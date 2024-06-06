Return-Path: <linux-arm-msm+bounces-21956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA398FEFD6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 17:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 941561C26197
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 15:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980071B1439;
	Thu,  6 Jun 2024 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZAKGlrDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231041ABE2A;
	Thu,  6 Jun 2024 14:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717684823; cv=none; b=TpcwHvsVmQEpDjiZ2RLaJrNLzaXlx2OMpBoVJzn6zB/4/5OCEEPh7mcJuFOJ49+da34g8OurNk7jOeb9lyDIQB66B/0xaqr3RviY0EAb+g1RjXnzO/stpZfT0DJfNF2bXzzSUglD1MJ3oxc6N4dTHfDzXnafZZgTqhMi9ikglIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717684823; c=relaxed/simple;
	bh=Yi8e6C06Z2hIN8SK8YDlnVlidHkQccKdpZguIQqa/sc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eg+IuRu1gLP3ZLoeqNeg1ulWFRcDx7uQ7j0ZyIqviSbkW26AljJN+iwArq6agvvq6f0UzCScuWahs+d3DT0mTgepmIMw/gjOjYgD8t0rkrL2I2AYl2zGYtTt1FmwU8lH6PXxueqmh24hw63OOhvxsuQ9H88rKUvQnoLsLldSFEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZAKGlrDZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456AhSOW016673;
	Thu, 6 Jun 2024 14:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Iqwn7RUBPS+VCI0b9QeDYJin
	oYGMvMqAN5xjaAaEMDA=; b=ZAKGlrDZ8lpo+O9djBdEZD/Kx3H3FsHK4sIpIyJ4
	qLakEvXAgKmw8hK8eIKY5tMaWSoRJBBYYLNZ94/pQf5d9W9eM40U0h+4b/Z5XxXn
	rCyErBsQGQEuDZ/iO3WVXvNVoZjxSgSnWAsLqm/5kgTHF+gcO502vzY44esgo5oR
	+JgF11tO9cS8MbhGHOP6gRj9OBA4OTJVbzuZzC5FAo3FYCcKDZ1HLQIfcqypmXdr
	1n/pHqV38Xk8YsB5dpMR6lkz9ksizV82lKoUkLr3EbzpeT86d+ZHso32nmjOWQGW
	lQyCZ1ztqH7nXsgBXw0csicWLWj+AW1gebDdc1kUvJY2/Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjan2mvdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jun 2024 14:40:18 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 456EeHM0003408
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Jun 2024 14:40:17 GMT
Received: from hyd-e160-a01-3-01.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 6 Jun 2024 07:40:14 -0700
From: Naina Mehta <quic_nainmeht@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konrad.dybcio@linaro.org>, <manivannan.sadhasivam@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nainmeht@quicinc.com>
Subject: [PATCH 1/5] dt-bindings: remoteproc: qcom,sm8550-pas: document the SDX75 PAS
Date: Thu, 6 Jun 2024 20:08:54 +0530
Message-ID: <20240606143858.4026-2-quic_nainmeht@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240606143858.4026-1-quic_nainmeht@quicinc.com>
References: <20240606143858.4026-1-quic_nainmeht@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IdI-LMgTFPtvDTo7TIg5Ymd6yrG6aYDH
X-Proofpoint-ORIG-GUID: IdI-LMgTFPtvDTo7TIg5Ymd6yrG6aYDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_01,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406060106

Document the MPSS Peripheral Authentication Service on SDX75 platform.

Signed-off-by: Naina Mehta <quic_nainmeht@quicinc.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 73fda7565cd1..02e15b1f78ab 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,sdx75-mpss-pas
       - qcom,sm8550-adsp-pas
       - qcom,sm8550-cdsp-pas
       - qcom,sm8550-mpss-pas
-- 
2.17.1


