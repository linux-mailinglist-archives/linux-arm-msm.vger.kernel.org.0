Return-Path: <linux-arm-msm+bounces-25688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 249B492BE1C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10C98B298E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7413E19D898;
	Tue,  9 Jul 2024 15:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EIfVYaPp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0EC18FDBD;
	Tue,  9 Jul 2024 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720537541; cv=none; b=JOvvrObDOy2cxYrGxx1s+zrxyFZnR6BZvvYkrNAt3+jNsv1C5tQScjEVdYNbAQ07Qrt5y3nHHzVQaIbTciK7Mp0XgTtl7OY4oKPidsK/99Y0DBkTsTFlOhqw8r+/xAQjstYKM6GCKjUfbwI+O9hyOfUCiOMP928nihLhrfQ/j8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720537541; c=relaxed/simple;
	bh=F7sxwx+VbFdafr+eirCkMpLzGIBjUnNrqnnfwl+MUlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=M4dfPty2IBUvwjuk9OgRW0yK3oIp3uSmDJ2wTBrO3jC/LhYQC9IPJjBcWzJBd+FeNnVll7/yGAPCvaldUERVS6nYE4ut4z/JtriuU9byES+yto+ze9nKSa1JSTyFlzkXgiTJfDk3nDbASATaF8RzWQ26nd/sLE1vuF4ZGMSVJxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EIfVYaPp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469Bk8sN005080;
	Tue, 9 Jul 2024 15:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V/SAfd1LwJ9PzmDluPlX5KX7UfHQx2JxVE4o3Ws1Vnc=; b=EIfVYaPpRWi39smp
	8YMpUU7mUmgdWyJEbyHek+oW7FCJXMIgAHXjDfZXR1QZoLJVOKDvGkovTKGaF+8A
	9Q1VwXzpfUs65uNsYlr11xYe0GDrd2LIGiLsyiDYEWnINqdHQNuTtPz4QypQWHj+
	FWnmpqorQ7zz7351b0tL1t9/MavGjz2m0F0Ko37b2ByewnyAvOxGyO9DYj8BElMW
	gH0u6A5VEtdNGzAATb5dzXvGM9BVZ0Zhgb9MST81U4g5IMgedfVz4SLZ+Nd/JpT1
	pQSi8CGndAw7Kj5VLc4D8YJlT/LSnkiy5Z3633+WS9Z23RwgR1HSmzyqM5axmvnY
	07P/Aw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 408w0r9n5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:05:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469F5CZT030170
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 15:05:12 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 08:05:06 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 23:04:45 +0800
Subject: [PATCH v2 2/2] soc: qcom: llcc: Add llcc configuration support for
 the QCS9100 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_llcc_compatible-v2-2-99d203616eed@quicinc.com>
References: <20240709-add_qcs9100_llcc_compatible-v2-0-99d203616eed@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_llcc_compatible-v2-0-99d203616eed@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720537501; l=1101;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=F7sxwx+VbFdafr+eirCkMpLzGIBjUnNrqnnfwl+MUlw=;
 b=VbOMk71zWa4A5dy0gP0+xr6jl/YL8QQJyZWia12JWKItAeISKmWoC8izC7GVWc0U2P8Mo8QKx
 0tHocRZyUYYC7bWz/8W6XSJpVLMhmrgZOfc9CRnxXAWDxbxEH1k5/Mz
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1ZDeGA46qikxSDNWBcJ6RW_TcFCdQRSA
X-Proofpoint-GUID: 1ZDeGA46qikxSDNWBcJ6RW_TcFCdQRSA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090099

Add llcc configuration support for the QCS9100 platform.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-llcc" to the LLCC device
match table.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/soc/qcom/llcc-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 110b1f89aa59..5a0840df4ba8 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -1379,6 +1379,7 @@ static int qcom_llcc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_llcc_of_match[] = {
+	{ .compatible = "qcom,qcs9100-llcc", .data = &sa8775p_cfgs },
 	{ .compatible = "qcom,qdu1000-llcc", .data = &qdu1000_cfgs},
 	{ .compatible = "qcom,sa8775p-llcc", .data = &sa8775p_cfgs },
 	{ .compatible = "qcom,sc7180-llcc", .data = &sc7180_cfgs },

-- 
2.25.1


