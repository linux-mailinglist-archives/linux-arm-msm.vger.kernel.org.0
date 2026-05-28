Return-Path: <linux-arm-msm+bounces-110084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IsxLjwXGGqKdAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:21:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E3A5F0855
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 12:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7BCFE30B8D1D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 10:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9151F3AEF4C;
	Thu, 28 May 2026 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHYxw5GC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VZvxKZsM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A23A376A0D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779962867; cv=none; b=aZGMgKEg/Crhtv/Fp+5bClyMQTNc+asBZ3aFRWBeFu9OIUxfzbgKb4nDzAEgpKYXRsWCmoHEDmUOtT3NbGI1uUxqdLncp0yJA5YXvCkyFaL99+ZGAKOM5rfi9H/ELieejji6FMz7EeWnGeecoux9ItPoQMesnHcG4ZSg0JmQaQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779962867; c=relaxed/simple;
	bh=s+tAFQWynP4FEurcpkqp4lvBgWrs0E8Ljg1RJ4bZBmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQOf/U+7OdVH7r6ut/xdm3KDD8IMN5POFanypZ+IUnopO+SkX5ks3bUKZr2XmaHHKvOz3STUHa/xsHgs03diJgR7CsxRYT6MDP/SJ5R7V7FKZD5eiZLlJsR43lwIMqKLGSxvHhYdpijtd8WllBTH3w1m44eV1e9Jd42lRiwHMXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHYxw5GC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VZvxKZsM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vN1M3545339
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8WvFekrIRFFLcAxHpLyvBVm8/1Vp7yHnSBk/lA+7KQA=; b=pHYxw5GC4RZgy/eN
	Quo54oSfMLuXWfR8+2eohjw/vDVMv0uPsuRksctEluC7V64nmvxuCTH1Jii3d56l
	orLlcyJNwGH3v7epf1uF2ea0BdZLctDAtJpTGMctgDPFEOVa0hTXnVs5R/HkPd2V
	Guib1TkbE+4h2Sgf5kJNZaULGlvmRQ/99w1SEiLl1u3Zqmg26ORYwZ+yXx0wqrn+
	nkFxOd1dP+qB+nae2yknuCG75j09rJrvxl3E6rD/JJm0O26K9nT8GMnU2qWZTKJO
	5lcWUbDN6ExW46GW5dmiZaV0wvW83GNNzFOLHMajZvoaKjAaMO1RZYyHVE3VkD+n
	oyYSxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3tace-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 10:07:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36781927b4dso6611315a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779962865; x=1780567665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WvFekrIRFFLcAxHpLyvBVm8/1Vp7yHnSBk/lA+7KQA=;
        b=VZvxKZsMqUliI5jDTaFWJVTbGNUYBsWmcaPOorhyNRWuNS9rhYMnr//zCpYomaFkEa
         Jr5q/0EkDGtzZgLJPHgBviRC1y2BzlMQ1L2oL8EVtFD4VS6kIDDlMGep/UxP2IoQvmml
         DRJfYW7+8QTQ6osr0uUdMLvfSZy58cKVWxlbi8WFCDI1EXCzBSBcCUdWU3ydYByDFtNt
         yCCrQhOeTSbAsk3rGHbT8bYrCPU5YG9s560I6ncEuFB7C9bmnuhfmdloVN3bjfzkICfQ
         gS04atK5PPA+hmG9lOZEUBhFVvLCVWIwxBVilQaFlTV3auwIywbHiHTroKbfHs4yBOYC
         6gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779962865; x=1780567665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8WvFekrIRFFLcAxHpLyvBVm8/1Vp7yHnSBk/lA+7KQA=;
        b=R4Af7GrKlTN8H7NzGMt+7KHMrmxQ3mbI//QxfQdlE49kmJ3HvcWohxgADUaorPWYjU
         bt91ezFdx+ilsqOG0mgSAPXvu/qewL4YKwavk/wKzmDspPtHZGtdmQeclWz6ziyFIxJy
         s6sgNvqWWXGuI7d/otTb2TI2PE5xx8XKlAnLOIBGg0cpJb8DGNAnKxuhD+Pqbe5x2ZDa
         +U+h3kmPpg6w4YQYeAcvWT9OJqgadnpjNphtKIyXh9KRaLECYQWZ9CUfSsqidsk03wuO
         ZJDQv5a+VnYHqTFKkj8H2rPKo46U8T3pNYaszbpQFVLpB+7+qHaKiZI6KcpH7lglImBu
         xEqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8X5tAfE9kHSaD5YvZQiOSY6P4b6lW+TgG3A2Z3CbFQTlWSfOMNnd+4G+BZRZM0yuPy69osWfbr2eLYvpl@vger.kernel.org
X-Gm-Message-State: AOJu0YzEWQxArXpdBOo/m9WJF4abVre4VhzbQD5R6CX6B7jsysI0pLoc
	gEJ9BBOls9DhTZCZXWgCXCsbMuc+bzSEoni26VXLXx66KHGoro4r/PBdDeMyWoNDXGl7EB9ltPd
	zpVeh4k54SGUIT5JSnsL28AaXKUG5FURKllpxj7dWaXX4HorlW9Czs0oUia7BdxTiQY20
X-Gm-Gg: Acq92OGF+2IsZgosH+ovEykvYzPtApFX62xeq9W3wFJ8aGYmwQ7ifQHvS1Pa1BjJ3BL
	tjujtiPSNJ3C2G25oAtbe94iZMDDnsS1YW9U8sRRSMMeVY8QAzWc1AvC87RH3KeRyWY/MSZaX7/
	PmeZtjCSej27m/IPMwg/XRRMLtXXdUGOLF4KJ8S6DwtgnBfzn8SJlij4HZkTXroCN34+oXk+VoM
	U1DRRz+K5q7LTqGfcaAkfykl9umYmOg1e8e383Id60SbIu3Koat/Keg8SykpvTNGrQgn9MiVe11
	3oA8aqWHqIlUB9N5m5bQtmvUt7s15OCkKrL7IK6b2dOL0EB5ifoTa8l6wks6RfmK7bYTPO2XBDX
	MTGclZ23n9+pOuCTPLNW2XN2XhXfjkKRMEubUtye6LNjBS1kCOE3VMXUfW7HFrU8=
X-Received: by 2002:a17:90b:3d09:b0:367:cb53:7435 with SMTP id 98e67ed59e1d1-36a678478c0mr26699314a91.24.1779962864871;
        Thu, 28 May 2026 03:07:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3d09:b0:367:cb53:7435 with SMTP id 98e67ed59e1d1-36a678478c0mr26699284a91.24.1779962864454;
        Thu, 28 May 2026 03:07:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b7e38af60sm575296a91.1.2026.05.28.03.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:07:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 28 May 2026 15:37:05 +0530
Subject: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: Add support for Qualcomm
 Shikra DISPCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-shikra-dispcc-gpucc-v2-4-953f246a0fbb@oss.qualcomm.com>
References: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
In-Reply-To: <20260528-shikra-dispcc-gpucc-v2-0-953f246a0fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: DL_N9CyBoaLd2eq2c4n1GsFRGTaVYX8p
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a1813f1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=c-iP70gTdw2rVZxswl4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: DL_N9CyBoaLd2eq2c4n1GsFRGTaVYX8p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMiBTYWx0ZWRfX33I75mX/Q8uO
 bOD4KQRmQph6rxndKUyKBfSsHiVu/spoggnBxndLbXutMy1ZPTtw8pIqhU5R7YwjXLXbJmKn2jo
 86dBzn8n+kA3VUvV0zO33l0CWbyYZ66uRUxNB2Nnq+rWlewc4pQOQUzSbz4H83pAad9i7yWaIsn
 pJiqGAYexAgJ1FgMLMxWy3mHk3hQD4eYpQ4WDIeH3WyN6AFeEHgoWJXIOHSzd6fUfDJN+f8bPKj
 ZMoTMToYIgzeWS6877DVxQcj8Kyro6dEprWy0GxCLe01vK9PZ2QAqZK3YZNbeLzhkc0Pc0lTuK2
 hKvegtXuGc+XsX2SUYq+RBQd/gcocdyBwbyr7ewgwYAfKybqmm97gkj91ZEZSvOvqLPFII8Zp2y
 XbXFExOPYX+qLrHMUVh90PhDebsaSrv3J/qIJWUzlWalZQQJ3N62zlX9XCmgRHTm7ACt/oy6hJH
 7rmTabgcZ6psibcXSsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280102
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110084-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6E3A5F0855
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Qualcomm Shikra Display clock controller reuses the QCM2290 DISPCC,
but has minor differences. Update the parent data of mdss ahb/mdp clocks
accordingly to the hardware clock plan and correct the GDSC *_wait_val and
flags which are applicable for both QCM2290 and Shikra SoC, and add the
support for DSI1 PHY source.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 6d88d067337fa132114b0d8666931b449f86de17..19c997f3fe9f197d2c252a9dd1e8169947200f5f 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Linaro Ltd.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
@@ -32,6 +33,8 @@ enum {
 	P_GPLL0_OUT_DIV,
 	P_GPLL0_OUT_MAIN,
 	P_SLEEP_CLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
 };
 
 static const struct pll_vco spark_vco[] = {
@@ -84,7 +87,7 @@ static const struct clk_parent_data disp_cc_parent_data_1[] = {
 
 static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_BI_TCXO_AO, 0 },
-	{ P_GPLL0_OUT_DIV, 4 },
+	{ P_GPLL0_OUT_MAIN, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
@@ -101,17 +104,19 @@ static const struct parent_map disp_cc_parent_map_3[] = {
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &disp_cc_pll0.clkr.hw },
-	{ .fw_name = "gcc_disp_gpll0_clk_src" },
+	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
+	{ .fw_name = "dsi1_phy_pll_out_dsiclk" },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
@@ -153,8 +158,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
 	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
-	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
-	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
+	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
 	{ }
 };
 
@@ -450,11 +455,14 @@ static const struct qcom_reset_map disp_cc_qcm2290_resets[] = {
 
 static struct gdsc mdss_gdsc = {
 	.gdscr = 0x3000,
+	.en_rest_wait_val = 0x2,
+	.en_few_wait_val = 0x2,
+	.clk_dis_wait_val = 0xf,
 	.pd = {
 		.name = "mdss_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = HW_CTRL,
+	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
 static struct gdsc *disp_cc_qcm2290_gdscs[] = {

-- 
2.34.1


