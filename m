Return-Path: <linux-arm-msm+bounces-59370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E17BAC38F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 07:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21FF91892A9D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 05:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0BAF1C8621;
	Mon, 26 May 2025 05:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aLqBXiRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335591C861D;
	Mon, 26 May 2025 05:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748236943; cv=none; b=J2z0e3+c5qjihzScCuvFyiVsB6uKV2t+bjUFII2MmLZy9+AlZwFT9O5NGo7Ah+u6TCwyVWlnsXt9EL2YlQniCsMD8tZJDqslA1tTEgyAPc+Zy5JC8A5o+jiHYXE99GiWIza3ZmU4CjGNz4itDpiVZSBxWgARGGMsSejj5iH8ljQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748236943; c=relaxed/simple;
	bh=Dno8NrWR7vI6wz9yHJ9/beZwst4uLbq4ey5DIBsckeo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uApNa36ehIOmZCrq00YHsNSLggePTRS4N+xHsbxpTm5duqq+Lp9ZerLybNWicxI/rXHxj2udzKAE2iQ9mc0oQn4vcpxrV+Jh0uBU+ToJxmyHUARUjiN52m/HtmD7jKEKA3zrxoN5A1i4+5c9pvZuIRPOdpgnUSvD1jUe7hU8dkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aLqBXiRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PNPo7N005035;
	Mon, 26 May 2025 05:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mn6Y8R+pZr/tbDr3pCoQrBCvsS0M3Z0CPvcBVK0/d3k=; b=aLqBXiRWhb3U9n82
	ndJlzx9Bw8ySJ9QC2ZHLHb0gDBuu7UazPK8+N3dDBsAff1Z9gTusGC+ngG5OuTE7
	CdUPd5KpplNydLa/94Rnl5e7cpBDnr8H3oIwEtSrxV68MU/rpM0ohDyroLbhqkSr
	V4WXLf7B8KyyrTVlrI3+ZqkUUXZSn3OdwRlORWmodVIKUG0BgllgB8+X1OekdE8+
	SiqlrNG+XndLTNK3GuEsaQzukdAXxaLZLpBuF28x+2KBJyy2zne1hPhivmWZM0P6
	TK+QIFA4fLd6+DE1B5rekEc+O64suSoMF3l/rLHFTwBljvOJDKJgRdk5PHdmWEB0
	QwOlnQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5eju25n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54Q5MGGR013922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 05:22:16 GMT
Received: from lijuang3-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 25 May 2025 22:22:10 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 26 May 2025 13:21:48 +0800
Subject: [PATCH v4 2/6] dt-bindings: soc: qcom: add qcom,qcs615-imem
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250526-add_qcs615_remoteproc_support-v4-2-06a7d8bed0b5@quicinc.com>
References: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
In-Reply-To: <20250526-add_qcs615_remoteproc_support-v4-0-06a7d8bed0b5@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748236923; l=917;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=Dno8NrWR7vI6wz9yHJ9/beZwst4uLbq4ey5DIBsckeo=;
 b=Qoz3yZ61sJEZGxoU4T+6FLtaOSHZ6eR3mOpw9KhGFSiFEC6NoMOdgk5rOKrJRDLpsW6NI4+at
 oB2QWLvAhFaB7cEonsX4N8oKV+NoDKsEbTRho/y+2VWujwk4e2PWkjW
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6833fa89 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=ZKC40KpyvywFQ3VeUqoA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Zz19rgqUCSEmJB1izwJcuHANWgfb-LvN
X-Proofpoint-GUID: Zz19rgqUCSEmJB1izwJcuHANWgfb-LvN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDA0MiBTYWx0ZWRfX9u8qs72VrNe8
 WzTNXyRFS+Hw2iLV+W54pgxkuzLd/wjAF/8LyekgSGGchr2OSnIIjc72NcxqZOLt9DUXDGEo++R
 149USizkSNDwx+xfEEhNhPhSDYItkqOUWMybAIpe4P5Ky6zFzHs0zD+W7jtoepyuvq+Cz4xoyfH
 LmESs3RrYf+fx2qimqXIWgkROaQViOb+qPYUC8b46rFdEAHdIzeNPxyqKZPEomeemcC3gp1wieK
 puNFnBBe6p0pB4Fs10+GTrZIN1RtQNt/OSV7OL3Rq/xLMgDoVycblaaGcs5z0kmowD0HQrJIH8Q
 3MxQrtuiQmTXnHTDqUK7PKQ3T2aloVaoOf83szSKBJY2Pwn505utdr+HY+DES09OWT+32+v47Bg
 TbCUVpWwB5xTtq+dmuSqC9DzEewi4cfW/QuyHn3Ox2dMmLp542ch+iUecgGMH+eLXuJwDRaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=716 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260042

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


