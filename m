Return-Path: <linux-arm-msm+bounces-40830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFDD9E778F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 18:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EF1C285F87
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 17:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2911E1FFC7C;
	Fri,  6 Dec 2024 17:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a1ucpl49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6551FFC70;
	Fri,  6 Dec 2024 17:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506681; cv=none; b=ma0z9Y0H24dk9qXmzoNlNNl3FgkpTV69XFXFRct9bLKh5zhYqdHUblZa9AJX0r+0ZUN2p7573cN+UJmmxDVgXnYmMO/aiHLPobLrHfiaRE1GmEDltHZFC1pZF//5qWf7Hyuc9BLZtuINBRnjINtKjipxCvN8xk+C4ADkldUKwQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506681; c=relaxed/simple;
	bh=oacXWB356OgoBsOym8amzSyTUjBHyAYYXO7P61ngfhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NPTdC2Ojml5XB7Y+25MQjrEdWzjMS8jktznz0i0sOzpks1+6Yzk5zGu6MvV7tY3DPZ4dgHoLN/V19FfUjzOVkYCjoQQEiGt2e9ijx5JIlVmQKVkffkMfoHcc2MhooZ9WkJZdVovapTrF6SxQeepDbDKy2rB4GZ74hh3UaAMzIiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a1ucpl49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6E86OX003140;
	Fri, 6 Dec 2024 17:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5/9Avx1EJC6nLGs0G8IMoS+AXaU+mJ+YucJrPlVWwho=; b=a1ucpl49ZR3Yo4m8
	AkST2PrIPvj+pu2v831qt5qvXNC6YJFVEmZhg9QCSBTknKiCoVq2WoDT7iqWWIfp
	ayEDzc3NRvkUARvsDbg6iYlXoDqKj3ANvFI+z6UpAbNYuRqNYBSDXvyDDLxxCmT0
	fcKFds4jyn5pQzAE7uZAqlAo9JvgdbPnQ2+4uQRad27FkbWviX+BY6N6eKN27vAj
	okSsH6mID8c066sznmgUNXwJh8r/ZjO72tO6dWdvED2brUTgzRZBLZXvWwkl5HRP
	GXykA1bxJXB/47bjvEKraYN4NgFxxES68BgaDrQSJOKnnSR0Ur9GYmxMI+aUK13w
	UG93BQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43btd3224b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 17:37:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6HbtgF021023
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 17:37:55 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 09:37:50 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 6 Dec 2024 23:07:11 +0530
Subject: [PATCH 1/3] clk: qcom: branch: Extend invert logic for branch2 mem
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241206-sm8750_videocc-v1-1-5da6e7eea2bd@quicinc.com>
References: <20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com>
In-Reply-To: <20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ttAAoeSnvsO94X2tz_8aUZKUdG5CL9qH
X-Proofpoint-ORIG-GUID: ttAAoeSnvsO94X2tz_8aUZKUdG5CL9qH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=772 spamscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060132

Extend the support for mem ops implementation to handle the
sequence of enable/disable of the memories for the invert
logic.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/clk-branch.c | 14 +++++++++++---
 drivers/clk/qcom/clk-branch.h |  4 ++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
index 229480c5b075a0e70dc05b1cb15b88d29fd475ce..6caded8688c081e51ad0649f9c2f82919e461668 100644
--- a/drivers/clk/qcom/clk-branch.c
+++ b/drivers/clk/qcom/clk-branch.c
@@ -142,8 +142,12 @@ static int clk_branch2_mem_enable(struct clk_hw *hw)
 	u32 val;
 	int ret;
 
-	regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
-			   mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
+	if (mem_br->mem_enable_invert)
+		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
+				mem_br->mem_enable_mask, 0);
+	else
+		regmap_update_bits(branch.clkr.regmap, mem_br->mem_enable_reg,
+			mem_br->mem_enable_ack_mask, mem_br->mem_enable_ack_mask);
 
 	ret = regmap_read_poll_timeout(branch.clkr.regmap, mem_br->mem_ack_reg,
 				       val, val & mem_br->mem_enable_ack_mask, 0, 200);
@@ -159,7 +163,11 @@ static void clk_branch2_mem_disable(struct clk_hw *hw)
 {
 	struct clk_mem_branch *mem_br = to_clk_mem_branch(hw);
 
-	regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
+	if (mem_br->mem_enable_invert)
+		regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
+			   mem_br->mem_enable_mask, mem_br->mem_enable_mask);
+	else
+		regmap_update_bits(mem_br->branch.clkr.regmap, mem_br->mem_enable_reg,
 			   mem_br->mem_enable_ack_mask, 0);
 
 	return clk_branch2_disable(hw);
diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 292756435f53648640717734af198442a315272e..6bc2ba2b5350554005b7f0c84f933580b7582fc7 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -44,6 +44,8 @@ struct clk_branch {
  * @mem_enable_reg: branch clock memory gating register
  * @mem_ack_reg: branch clock memory ack register
  * @mem_enable_ack_mask: branch clock memory enable and ack field in @mem_ack_reg
+ * @mem_enable_mask: branch clock memory enable mask
+ * @mem_enable_invert: branch clock memory enable and disable has invert logic
  * @branch: branch clock gating handle
  *
  * Clock which can gate its memories.
@@ -52,6 +54,8 @@ struct clk_mem_branch {
 	u32	mem_enable_reg;
 	u32	mem_ack_reg;
 	u32	mem_enable_ack_mask;
+	u32	mem_enable_mask;
+	bool	mem_enable_invert;
 	struct clk_branch branch;
 };
 

-- 
2.45.2


