Return-Path: <linux-arm-msm+bounces-39997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0305F9E123F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 05:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8E7B163C64
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 04:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6050F187325;
	Tue,  3 Dec 2024 04:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YVW+/Xvp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C247166F25;
	Tue,  3 Dec 2024 04:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733199626; cv=none; b=fkq5iB974wZa8CetvPGpYlvvxU/ImPUw347T3qVd/we2EwU7D//wfz7k6Pmu3a0BUoGtUz+LC2qIGkLBb5o44kt7Mkz6/2DJtys8SoFTV2yb8NXpsCXUpDR8I3Smi8I42ORIq0GO29jEdzzDob/1HEu5Wdu8oKTTa7QjN+bPnWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733199626; c=relaxed/simple;
	bh=DfsTpQhuDVPTpBwxnbE96woq0PpXEf79V1MdViROPLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JZkzBC+XRF4xMXi7M7cHOg5ITBoe+sxalrRbc8W26wYBOnFplqv32prHRiATzmp5M0hOxW87WK35RDB0zGBJCQDMnQ/hxtl8W25r9ZbplhHXLpB+/vUK0TKcy4R/P48otNWFHqZVKw824SOPqCJSK2NJMDqZmFv7RFVLM3LQ7cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YVW+/Xvp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2Jn2e0003080;
	Tue, 3 Dec 2024 04:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O4bWYQjlUTtsncfGn51zMsyUq6OeHDQHavuJcZ+eD3A=; b=YVW+/XvpNRduslLv
	5rbM+jGmoIJyU8shvcToFXbyWaGRnOQV4bcPiZpiG3rGun+RcEdorbWGMwDMMbvD
	KhiXSSFySEunczvA7Ln7BgOUwe8+GDVkckfZ5lYHwAbNadCoYpyxGCfreYK10+sr
	DjQZGsWL/kRbhyHdEdySYi9Z1SsBa23rKP0ESYN9AxPjF/ojDPDmpqxrZusJTeeK
	G4mNx/Qmkw/mODYOhrohEf/VectW2aQuSY6yDbRm7rbyp4uoG+lRAa1jis4FUhNC
	+aw40cHStsAtkvNFb7934fBLEJXOQlwDANozHJpVlJI9umWTYVY1JiRhSkGb/kTP
	dEDXng==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437snqxv5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 04:20:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B34K8wn024268
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 04:20:08 GMT
Received: from hu-azarrabi-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 20:20:07 -0800
From: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Date: Mon, 2 Dec 2024 20:19:25 -0800
Subject: [PATCH 09/10] arm64: dts: qcom: sm8650: add support for QTEE
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-9-f502ef01e016@quicinc.com>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
In-Reply-To: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-0-f502ef01e016@quicinc.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg
	<sumit.garg@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <op-tee@lists.trustedfirmware.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Amirreza Zarrabi <quic_azarrabi@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _8JIZmuVEHs8ZWhLHMzQa9YHubpc-4US
X-Proofpoint-GUID: _8JIZmuVEHs8ZWhLHMzQa9YHubpc-4US
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=923 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412030034

Add qcom_tee node.

Signed-off-by: Amirreza Zarrabi <quic_azarrabi@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb..41505b032e3a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -372,6 +372,10 @@ scm: scm {
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
+
+		qcom_tee {
+			compatible = "qcom,tee";
+		};
 	};
 
 	clk_virt: interconnect-0 {

-- 
2.34.1


