Return-Path: <linux-arm-msm+bounces-25690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0229B92BDE3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A15671F21A60
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4BB19D098;
	Tue,  9 Jul 2024 15:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VYdvdTph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B46419CCFE;
	Tue,  9 Jul 2024 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720537834; cv=none; b=PzDf6UmSNzw1T5vynSYkPQaqbGoj1oXcIaPjF324MfphKPKkZCA6WW1zWD4W/54QZHEGt8LLdnwF5y2wcYAnhdVnW6qOiX8xsNgnXOO7b04KZUjT6CXBJR0yCSY4TB9gw8/y2nXspWraiskjGVYXfQBkDf5Gl9hKtEjxhK3Idww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720537834; c=relaxed/simple;
	bh=lYRulP3U7+TO8DxkBj036tBqim0tAy4JwaAnDPvzX7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=DaHWDR1qmFt2+9AzyOhbKC7m5CjmIUAhECiAaIEtRgzaSSwmqi4NYSpcdTq4h2Pb44hOGdt/owoDWZ2q8HNMl668aD4J6QEhss7qXOL1F35YaSZEWozTR62ShLyKAepRFe/AgPMmeyqJKaIfn+W2yddjE9ijcOhH3q7AGLGC9TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VYdvdTph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469CHCLx011903;
	Tue, 9 Jul 2024 15:10:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+jfOd2IfFtBUQXRGk3ei0/bu8WDVK2zzF42sNWpoPs=; b=VYdvdTphxFbfqgHX
	KZEKRjsxh/I4TpCLmFOMnLufz8S9DlpCHSVNiz9s20G1NK6iIVmaM3DbzCn7zq0S
	Nno2TCgyzVolKI2tSjGsEEMTPj7bRO7rMq2hMl0swfDp1uv/LfPd+RpNe+/osdOe
	bEiwWcaDYP1ZrQLuLEaHs0gweZZfYpiP8tjcwzU+JJ6bw1FgkvLLAFZ/5NY5Gd21
	gg2hupYd5Il0HD72bJWdEcj1WzsQaqZMDHfmIzPgbDKH6nYt8WFG+/bvxowNzR0f
	oXooOF73wRPZmBc9iavPNeL/N+nQW+MgJgnO1N8Lsu2fT3hEGd8Z5PhVNMB0nw67
	0Hjseg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xpdphrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:10:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469FASeG006180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 15:10:29 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 08:10:22 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 23:10:08 +0800
Subject: [PATCH v2 2/2] clk: qcom: add the GPUCC driver support for QCS9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_gpucc_compatible-v2-2-c206bccc495b@quicinc.com>
References: <20240709-add_qcs9100_gpucc_compatible-v2-0-c206bccc495b@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_gpucc_compatible-v2-0-c206bccc495b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720537816; l=1048;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=lYRulP3U7+TO8DxkBj036tBqim0tAy4JwaAnDPvzX7c=;
 b=iazaeUBxRHcv5blmGbU7h5aByr31aggDcAvQih4LEyutbrn6Xgdom1bY6S2GsRYkSKMWYq/RD
 yGwq2FfNJKwAnVCFCIme6OCiCm+BDu/VzoF3zNMzJz68DUwOZ8IQUBV
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pk-xwShqJUwuAQ1bjr5DdGn6Nvbf2QDE
X-Proofpoint-ORIG-GUID: pk-xwShqJUwuAQ1bjr5DdGn6Nvbf2QDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=972 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090099

Add the clock driver support for the Qualcomm Graphics Clock control
module.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-gpucc" to the GPUCC clock
device match table.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/clk/qcom/gpucc-sa8775p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
index f8a8ac343d70..89ca1289cd74 100644
--- a/drivers/clk/qcom/gpucc-sa8775p.c
+++ b/drivers/clk/qcom/gpucc-sa8775p.c
@@ -584,6 +584,7 @@ static const struct qcom_cc_desc gpu_cc_sa8775p_desc = {
 
 static const struct of_device_id gpu_cc_sa8775p_match_table[] = {
 	{ .compatible = "qcom,sa8775p-gpucc" },
+	{ .compatible = "qcom,qcs9100-gpucc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, gpu_cc_sa8775p_match_table);

-- 
2.25.1


