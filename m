Return-Path: <linux-arm-msm+bounces-57136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F74AADC75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 12:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AF201C226F7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 10:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0219217709;
	Wed,  7 May 2025 10:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pabszj20"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59115215F52;
	Wed,  7 May 2025 10:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746613625; cv=none; b=aOmA7z3UKvFOzPBs/xlk0EiUtEvxfnheNGMnSqc99/4oyRAEKks98oQhhCXXumiMUbftMaA+B2hWsMTgmoU3Zu9G+JDWig7sYemOM401a6j4rAhdr4mLlFVdDxU6yKZImMVVGhsry2pBRZ3IwWByY++3q7lXFGJu0/AkR/dyJnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746613625; c=relaxed/simple;
	bh=RvLKNaPJEVYP6Ev/MDZOLS3jpKKlTut2RwMuln30MGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dfZngP3Yp9w3U3V/l07Hjjx60R7GdAQVHYONvnVDD1eKxlxQ/iFz3Hgd72qBycnJ2injt0n/ZVVwvINQn4KknW8GB/33LDJlgZCsTutZQ2XV1QElSDmphsefgFcgscMjoMmWQrUqL+5sP8w3IxPBcwcL52zohS7Tkn2t/S937wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pabszj20; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547A8ZDW009125;
	Wed, 7 May 2025 10:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rYJA968e5FAGnSEC0jpvnZdyQ7cPc/QBI3D+iCq7oyE=; b=pabszj20byrfAQCC
	SXBLgKBeBEkJUQ6J6gABY+mu8BDH7CvphFGTJ3WNP2Xzy9dSwmeFo0GJXqjuhFS2
	PwDISo+JaADXJLIaiSgqGuUSJwf2fzVfVxPGTZrvTFlmRqUmkbO3MZLLr6LmpWxb
	A6U29L7r1r2WxmvMLn5YQYHDu0U6ed2eU3zUTYq0trTmy4LHA/4KbRHzAPDqvtW4
	e15dYDchYgpB+PJBeFnVEi1FkrUz6wwa8CahxgciTIqtdfwbGlnKgze+BNOyc9Ra
	nbi9Rf5lRgJcYZvlCeVvVKchYaYLsz8uX78lYtFNg1aUrM2Ag2yWPNZIjt3j0oML
	PQqOHA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46g5gh81hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 10:27:00 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547AR0sF021181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 10:27:00 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 03:26:53 -0700
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Wed, 7 May 2025 18:26:12 +0800
Subject: [PATCH v2 2/6] dt-bindings: soc: qcom: add qcom,qcs615-imem
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250507-add_qcs615_remoteproc_support-v2-2-52ac6cb43a39@quicinc.com>
References: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
In-Reply-To: <20250507-add_qcs615_remoteproc_support-v2-0-52ac6cb43a39@quicinc.com>
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
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746613605; l=861;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=RvLKNaPJEVYP6Ev/MDZOLS3jpKKlTut2RwMuln30MGg=;
 b=VWsOZzy4br8W/mjW5Otw2EYu/H9KQYHYf4NWMCk1lG6btq4g3H9Q1zgogETpECrTU8cgg0DZv
 4Fexw8f8d/OCR6BKCQ43HaoXSZlPHKP0s8HjN0wke2Q1OqaiVJrPUq7
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UEOhfNH73Y47Hc0kn5OgNDzoIYbC8Z28
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=681b3574 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=t81gwU7txs9n4WTBcGUA:9 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA5NyBTYWx0ZWRfX8D/R1ZP8tmlD
 2/hFXqUXowsI/fBBj6q0qj0Y/fNCsyUQ3r+TEl4OhmbNzEdiLemeTcFsu9cyuv+NSjpoGDL53WZ
 XGrp+Kh7q/aF1e43kt7XBkFV8EMQr0wYHhoERdQefh2+EXz+y2LDXRpDMuwz+HuTObXBzion1am
 x4+5y53zK1KChgT6HQwwD/cZtGEUNMf9Ig0Qpz/isvVfpx2qenizi6FPCWJ2cvzpNVsMU5ruJdB
 AvIJtL3iNLASd3KfPcjz0syBVjyWsBHzZLRxQB77/VwwUNHFLfasYc8QtBLE6wpwY4uaOw6c7P3
 TEJfcklW/IaF2bEdxKjyHB9PII0JkM7ErydFBqgeUJOWxl9qcNrovNdfn9RzvkzSjUixsdKU0Lo
 GvrNqyy8aIENcegd5u9qJmwq4gQWcH4UmLFTgSCUCvdeLugFQfRUkXfYmtsHWeDtUxDMprK+
X-Proofpoint-ORIG-GUID: UEOhfNH73Y47Hc0kn5OgNDzoIYbC8Z28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_03,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=734 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070097

Document qcom,qcs615-imem compatible. It has a child node for debugging
purposes.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664..dc3b5a69b925 100644
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
2.46.0


