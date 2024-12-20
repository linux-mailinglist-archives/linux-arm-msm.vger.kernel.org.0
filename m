Return-Path: <linux-arm-msm+bounces-42925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9978D9F8CFB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 08:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00F70167A59
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 07:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BFB18B464;
	Fri, 20 Dec 2024 07:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i9+rknv1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2ED2594B4;
	Fri, 20 Dec 2024 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734678096; cv=none; b=Bkg6qd1+LMJeqS848vsCKVFhS0RpJF53WpvaC2S7692jMgh+OoDVm2ZvPylnY2rV2ROQL+snimVytpeYx+/TEC9uhGH0eYgwlBsRly+Sh57FXFrZAz/a9+4S9xcxdTApEfE56F/rjXKt5LhgQem2vdvFSjHk4KDttuS07R9j8Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734678096; c=relaxed/simple;
	bh=G/+AYnRocne9i034wkNXIYB0js0KhauS0RMx/UjaQ80=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KMfLzha9EqEG7xsamPv833wMxMBO0DrEaYO0LRGMa5jUseJ3jXinoCTBs7DcuMfwy7JwKlUk0Fl8r9s13ln4sUGcN1VOZT7sxvVNqQC7bRnnzXjAZOfk4HS0oaKN+WR8+xun7xicfhECsLcOQ/GVk5PVGYDxArTSaSfbPiDF/10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i9+rknv1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5fgAX006609;
	Fri, 20 Dec 2024 07:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yqpjR+gZtOeEjgxuQ6ZdcVaOVDHpZ7Z9yGTdpNoS0Mo=; b=i9+rknv1mPCmawXe
	EdWok//k+pnEZp95Vz3IHm/M1443wz4jSNQrlEaqbmAoxIw0wU4mVZqp2kKbJND3
	BmYyWwQcmjH39wHnQug7QKU2yFlpJZTu4KTi9dNiOhmyTUsnMh+L0QPiCr5MEIBa
	/Fs+tGKBOVXsfm/p8G0tMiqt0vM3dng8cAufPvgbQyltgHXkjg9CkOop6MG1veH2
	cdar+P6oGVDMDS1Ot4XYejwKKgiKQPo10MJYUFE+pznTX8UVkTot4zXXZIId/dDM
	Cy8Rkzmev6MiiI46qc03pDOXARIX5t3Cd+i+VbYFd48jgOe4LAjjLSV2MvtdvbIe
	oaOyfA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n2n5r68f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:01:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK71DWO017131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 07:01:13 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Dec 2024 23:01:09 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_mmanikan@quicinc.com>, <quic_srichara@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_mdalam@quicinc.com>
Subject: [PATCH v2 2/4] arm64: dts: qcom: ipq5424: add TRNG node
Date: Fri, 20 Dec 2024 12:30:34 +0530
Message-ID: <20241220070036.3434658-3-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
References: <20241220070036.3434658-1-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YN80oVXg3GrIdf_BlHcXwl9Otq6nbGsG
X-Proofpoint-GUID: YN80oVXg3GrIdf_BlHcXwl9Otq6nbGsG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200058

Add TRNG (Truly Random Number Generator) node for ipq5424

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v2]

* Included Reviewed-by tag
* Updated commit heading from "Add TRNG node" to "add TRNG node".
* Changed "add TRNG" to "Add TRNG" in the commit message
* updated compatible string

Change in [v1]

* Submitted initial patche to activate TRNG for IPQ5424

 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5e219f900412..aab1cf787863 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -145,6 +145,13 @@ soc@0 {
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		rng: rng@4c3000 {
+			compatible = "qcom,ipq5424-trng", "qcom,trng";
+			reg = <0 0x004c3000 0 0x1000>;
+			clocks = <&gcc GCC_PRNG_AHB_CLK>;
+			clock-names = "core";
+		};
+
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5424-tlmm";
 			reg = <0 0x01000000 0 0x300000>;
-- 
2.34.1


