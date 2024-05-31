Return-Path: <linux-arm-msm+bounces-21213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 326998D5D85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 638DB1C237EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DD4156657;
	Fri, 31 May 2024 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ODLFr5aq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A6E15665D;
	Fri, 31 May 2024 09:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146239; cv=none; b=j5KXvC07p/yz0YnetDh14Ous5VHpFqI3r1FuI4xuZysvangMa2/0q08kGsJxofPkuUE1BT2Gyf/FjiKL7zZ0ZEEKAFVrGwXuX9foD1g5x41l2BVTTGkfC9iK9zBVYzz3tbwv7aAacUiZBGZxeSlxwbOeBEgE/TjqjktQKxKXYjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146239; c=relaxed/simple;
	bh=JqJnr4csdLsvyTHVVWaDR63XiDFv/R4RXAaVMiMkG6g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ECyVhPQ5d5ZZ1/z1UXD1A8SQqd5U9v1HBDUxrv5VULAWrinpWMAuX3Jpfky2a4vEWbKk/4QhtW3SfPQ92oDIXGOIrvzYZfU3rAOVhRH+2Bx0l90WtvsWlg4ljn3oyPvLKzAV9Ni76fPJeOrgOc3ZUoR9o5p4MzrPcNpMycFiv4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ODLFr5aq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44UMGL48015871;
	Fri, 31 May 2024 09:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ccc1BKTfq8FctxVu6DIJ7MuR
	sJTBCm0Z8XSx7sAIWmU=; b=ODLFr5aqlUXWl6wH8PVKqyf5KGZdO7wbBJvWIVUg
	yYrpsSkdYQ6sEOgT99GjlHYob8QgqkNr6M4YGgBPIKBb86AH2jRoOhYaLSLZTwpd
	SSTuPI++z+MZZ1f/18IariH3KiZhYKBkfhARrgBUqE13dIYAipxecDV8kEaqR3VN
	W2BjluTrQwSJQfmUTbfxZU+n79gXtqDFKPqalYJrGvCswVGGTgv2MNqJL+UD5Zfw
	kRHsb7GKs8uYD10sNAZ0AIAl7utB4Eg6FeF5jrS0cJhBwtLXNtGZabCztvQ8sKL5
	3OkNB7PKhRM/37tAYql65rPtWSs/ZwwCKM+74USMKbD/XA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23ss67q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:03:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V93sxo003153
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:03:54 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:03:49 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 06/13] clk: qcom: gpucc-sa8775p: Update wait_val fields for GPU GDSC's
Date: Fri, 31 May 2024 14:32:42 +0530
Message-ID: <20240531090249.10293-7-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531090249.10293-1-quic_tdas@quicinc.com>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lv-DfIO0TWCm80d8ziTFe6O-sD-4hlwl
X-Proofpoint-GUID: lv-DfIO0TWCm80d8ziTFe6O-sD-4hlwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310066

Update wait_val fields as per the default hardware values of the GDSC as
otherwise it would lead to GDSC FSM state stuck causing power on/off
failures of the GSDC.

Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/gpucc-sa8775p.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
index 1f7a02a7503d..3deabf833388 100644
--- a/drivers/clk/qcom/gpucc-sa8775p.c
+++ b/drivers/clk/qcom/gpucc-sa8775p.c
@@ -523,6 +523,9 @@ static struct clk_regmap *gpu_cc_sa8775p_clocks[] = {
 
 static struct gdsc cx_gdsc = {
 	.gdscr = 0x9108,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.gds_hw_ctrl = 0x953c,
 	.pd = {
 		.name = "cx_gdsc",
@@ -533,6 +536,9 @@ static struct gdsc cx_gdsc = {
 
 static struct gdsc gx_gdsc = {
 	.gdscr = 0x905c,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "gx_gdsc",
 		.power_on = gdsc_gx_do_nothing_enable,
-- 
2.17.1


