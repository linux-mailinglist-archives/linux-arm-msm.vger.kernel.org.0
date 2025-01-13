Return-Path: <linux-arm-msm+bounces-44895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B49BA0BECD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 18:27:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37DFF18879C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 17:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204B61B87C3;
	Mon, 13 Jan 2025 17:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hypVi124"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709661B6CE3;
	Mon, 13 Jan 2025 17:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736789242; cv=none; b=gdb0QP596thWHu2RMsHWDi7KKwefPjALZdnB38qxNCuvJmUPOjkxQGFEXeiawk7iJnNddq3fyGQZaNqP2KLz07GijipNODEdKp7VS0CQ4sqNfybvMT9dwyi5x3pim0mTZoQiS/V+vwEJIKrckovbBjYfybX+6SJEtJd3sC9tqcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736789242; c=relaxed/simple;
	bh=2rFQ5V+qiVNqzWe99MRI9waBj3AoywN2TQFZDho1GG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UKx4A0nSkBEwYGyp9JeFFHVVuNzqzLms9ph240qBO8N794eo6IEm8Ls9aE4cKMssoDjcHXTnknqb+1y/U8XA7TJPkh31rQbHwxWORHItHT2LdC7m+dvcAB//fI50Vq9LurU3F3L+xg3LXS7YFiY5qUC/zF+wx6yNgGHTzz6Yclk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hypVi124; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DEm4wI024305;
	Mon, 13 Jan 2025 17:27:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQZ4mpJGOb5W8SabxO7F1NHae0Oa6byLQQNJ2o4fWZo=; b=hypVi124z9rAchAn
	GN3Y+CL6YzPzi3Ctw706Cs344j9uWrXE3OarGcNvk6TzH8R00hS6FSrp4j+09FYQ
	dzaM9PN8tYZHXAnqgx35hBpecyFAq4Wu07Od+clo7HPT2BmyAOJPT8aAaobSwZcf
	AQeR/r3swHcFt5u3Bghw1GSapNkbv+lV/0a95DU4HGDO491tudoADULZLb+WpfeD
	zMwzUqxAytyP9glfqlcx+DPKq/91bauu5SjQhkg+WavYouOBRFoIiwJaZ0yjefSL
	WOsjYHdQBDNaQbUuMAkQjYQzw+l8TtWfrclHwLbe16P0Ay5UAzrJXT4WUXrM5cXn
	J5VFcw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 444wt4stq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 17:27:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DHRFJA018932
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 17:27:15 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 09:27:12 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Mon, 13 Jan 2025 22:57:04 +0530
Subject: [PATCH 1/3] clk: qcom: clk-alpha-pll: Integrate PLL configuration
 into PLL structure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-support-pll-reconfigure-v1-1-1fae6bc1062d@quicinc.com>
References: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
In-Reply-To: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5Y6EfRsFZIiWYi9G6lPgEeDaIfIRYe0A
X-Proofpoint-GUID: 5Y6EfRsFZIiWYi9G6lPgEeDaIfIRYe0A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130141

Integrate the PLL configuration into clk_alpha_pll to facilitate future
reuse as needed. This is particularly useful when the PLL requires
reconfiguration.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 79aca8525262211ae5295245427d4540abf1e09a..943320cdcd10a6c07fcd74dccb88be847dc086c2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -81,6 +81,7 @@ struct pll_vco {
  * struct clk_alpha_pll - phase locked loop (PLL)
  * @offset: base address of registers
  * @regs: alpha pll register map (see @clk_alpha_pll_regs)
+ * @config: array of pll settings
  * @vco_table: array of VCO settings
  * @num_vco: number of VCO settings in @vco_table
  * @flags: bitmask to indicate features supported by the hardware
@@ -90,6 +91,7 @@ struct clk_alpha_pll {
 	u32 offset;
 	const u8 *regs;
 
+	const struct alpha_pll_config *config;
 	const struct pll_vco *vco_table;
 	size_t num_vco;
 #define SUPPORTS_OFFLINE_REQ		BIT(0)

-- 
2.45.2


