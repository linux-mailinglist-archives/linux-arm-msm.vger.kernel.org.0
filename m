Return-Path: <linux-arm-msm+bounces-58164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFB9AB94B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 05:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06C8C1BA8439
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 03:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D8323536E;
	Fri, 16 May 2025 03:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Uug6xQ2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6C8233145;
	Fri, 16 May 2025 03:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747366079; cv=none; b=gEWjQTt5IU3GCDJhfQdpRww12Attf/5MQke4Uk48xDqLSs89g3NE8W+Lt2cunfHO4wQQj1NjqAba1erAwCzNj+Ene15OCjATtSZ6Jw+Fd9FZDmuUGLqMfP7SXaBR1Sl+KxjGjrVA3bkhOa0HHZCt92XxbzoSnBhxGmqNbXibGfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747366079; c=relaxed/simple;
	bh=Dno8NrWR7vI6wz9yHJ9/beZwst4uLbq4ey5DIBsckeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Bmckr4ev/0dgeuP8bZgLkIpofivdD88jiDqdDrqBgo6u3Ojo4P06YZ10LX4yyIlMKQ/NKbJdzb4Op6Mi09o1t0mKKT2i+nLHUnKi2TantX/lPj0HwG9gNqYh+Bplp+Wd1xIVCa1Ua3+e2HyBydzcpgwmS7KJ+6LA+A7RLt4DkMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Uug6xQ2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFFQ9031494;
	Fri, 16 May 2025 03:27:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mn6Y8R+pZr/tbDr3pCoQrBCvsS0M3Z0CPvcBVK0/d3k=; b=Uug6xQ2gmrlGjuEU
	8oilEIO0FS1wIPTi1vud675PIildYWXkXQolP5P/aFVbAPoI2L3LbwwNKJKohYjj
	XkPD3rHwnmGh1pRzWSlk1++kyMXReNzIy9qm1JU9+/DaXFeGwwtjFmIX/aDy+hHU
	vOLBGU98Rc4WBvOyNlUpuZd8ufPN2daEabdC5y+K22mqgROGiI6cZi9KdlOPdQ7R
	PVSsXcHueny4kn+K+HG6fbdN77FNmoO8DvKzRK9euWWWK02EbkAsutGISr+ogXr/
	GtBSeWifAmGHOC23S0tmg7PZ7yGDyausSXSubZFE1i+7I6+o3lIkXliTUaR0MBW9
	lMwt9g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr87e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:27:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54G3Rq9w023138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 May 2025 03:27:52 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 15 May 2025 20:27:46 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Fri, 16 May 2025 11:27:03 +0800
Subject: [PATCH v3 2/6] dt-bindings: soc: qcom: add qcom,qcs615-imem
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250516-add_qcs615_remoteproc_support-v3-2-ad12ceeafdd0@quicinc.com>
References: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
In-Reply-To: <20250516-add_qcs615_remoteproc_support-v3-0-ad12ceeafdd0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lijuan Gao <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747366059; l=917;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=Dno8NrWR7vI6wz9yHJ9/beZwst4uLbq4ey5DIBsckeo=;
 b=4aUJB9a6heCrdmTDkNyff0JBF+poWzUTg2UJBiI9cfSQiUsGBu63BjzjZUOYeyxbnDRDnoqDC
 ksrk/hqu455DE2i7i16UmcgnImITj7kveiYBvjKxPgz+FFeaVBAYPtw
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _M1iUvuJZfZXKHKMXD7b-Z0dnuh_fw_-
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6826b0b9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=ZKC40KpyvywFQ3VeUqoA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _M1iUvuJZfZXKHKMXD7b-Z0dnuh_fw_-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAzMSBTYWx0ZWRfXz4LNMqODNhtG
 GgsqBZzfvy7Gy07w7gIRP3XXnXGGbT+642uUl3YQseDcyIrM5/G7SH6mjAk47TJzK7ETKOn1fPA
 YyIRJ/7yziJvcaURKdxZ91JDLNRrkqDGzo6uQ7kdVsAvvjVoznBxAAy6GH1DYSGyVRmYMzgOWK3
 OiEPQVEO1stWqfjDsjUbyUpLexsOmlVubM5WcxTcUwcqh4jqvAZEVr9Vn2df4p51ShHCm72BNJW
 WeYd/wfioqhi/UjqjXOs9nGCpIKWekiC43VZ0jDtDAdzgTzvJzAF2UkQIP56XZ+NrMpzTzDlDN8
 EYIQz6ziY8osBJt6KPI5O8jexU3Yk2LNLLsOBuAHY2Aw6NbU8PQUCqHm6Yl0xsK/vnpAeg5At1L
 ZQkqd8L+VY60tkzzbJym+CAe7dF/2RZDpI+Aa1qfGF9HSMxH9hBcO8nnXZ5YDZ8RVXBTSSo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_01,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=717
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160031

Document qcom,qcs615-imem compatible. It has a child node for debugging
purposes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..dc3b5a69b9254e7001a329bb2011305152316689 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -22,6 +22,7 @@ properties:
           - qcom,msm8974-imem
           - qcom,msm8976-imem
           - qcom,qcs404-imem
+          - qcom,qcs615-imem
           - qcom,qcs8300-imem
           - qcom,qdu1000-imem
           - qcom,sa8775p-imem

-- 
2.34.1


