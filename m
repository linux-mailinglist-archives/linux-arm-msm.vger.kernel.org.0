Return-Path: <linux-arm-msm+bounces-110668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wB+NBs/OHWpeewkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:26:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C24C2623EEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 20:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10F2230B457A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 18:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787A23EDE41;
	Mon,  1 Jun 2026 18:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5Xuf+3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QVWXfJ7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123343E8C5A
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 18:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338157; cv=none; b=e03xMo8LqtlOy3j9YKpSGuWSXkop0LnXDijyNE5eXBKszaba2vpebVbNfWKTXdKFJ2fiQSE/1+QPuuPO1WEr6yM2BQVuDz0j44d7NLKYyKxx/IpyWolCx5xaqvUpBMcrIEKtIcFg7uk9U2xsoaorUHMIL1hz89xD9xVKCR0FN6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338157; c=relaxed/simple;
	bh=sfuATI0fCC0PdMmc4wHiyaBvpIQ5ZcPp15gGK/db0jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sbMkC8ebbeKsbpbkUwZThhNDmjjGqPE1BR5KX7rtQX7+xU4mdliFQY6cfw2C30W/3FHunTtvX+tNqOsYoa2NH0K+AbMMPzYm4RSkfeQOA1x4vbQidmrL9rqI3vhpUWIBWv1GpQl7182oPEkQhxNmP4ylpSryn2bz+mkYuvQCjGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5Xuf+3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QVWXfJ7L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651HaW8T621991
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 18:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WzeyjYyJNfSQbXmAFrqFQg8Zn1md9eGVWpG1i9pHV7E=; b=K5Xuf+3V9nbpfT6N
	pL2edrR6xRTb71Bjg74yDeeGzAS3fjbRDCqIKmmfbv56/EgZkpiLC69avL5EkCUW
	KuW6zBPwGfOj50Y2qXAJFTDUqY3nkEvUxihLcRQe/j/SEqSefBIBppqwpkQEiQ18
	fTIxkapOycmiv+zIGEvU978pFdbXUGKHLoydNCDjVz5RFna/vTwuxNA5Jy7aBTP8
	FLrEgk7yCDkUlN8wq5zEc4ilZ8VYGhtVm31ig/9FWp9ezDPm9uQKqWFf/FTQ3Ysj
	0pVbRqFH13O1puLLNZXRVpxRzATTmBLquouFEdBnUxi1bFmJC+ko6HkkzWgkTIFo
	ofgQiQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh954hvs4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 18:22:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b74447so1313373a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 11:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780338153; x=1780942953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WzeyjYyJNfSQbXmAFrqFQg8Zn1md9eGVWpG1i9pHV7E=;
        b=QVWXfJ7Lj6m+WWiP0jgClQLLeypXSLpL+XbP+nGXxItxRDPdgV5DUYINFChLGQd7/b
         gWfeT10ZtuVTcAHKWA4x7V7NLqYtBBfq01sDIAlTGWcEIICINt6BiFTuR8Mta2aOUvyE
         ZL4GbBS/gNeozvUcvqU/SppFJFQSTem/fqKsrJHdXkgFq9DhYFM6UcqXpsE7/ZtifbP1
         Kg8eVWL4IWp5iJYfD369cD2B46EeuLFiwKCJZJJTnbIDLuHD+n+3ExEXQD3gpTT4738u
         3wgBJi972fy6gFpOchH/AjF1S6lnW/gBkx8zHeXuCnE+kW+GLfFzCtRenhulPZp1cFZS
         6Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780338153; x=1780942953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WzeyjYyJNfSQbXmAFrqFQg8Zn1md9eGVWpG1i9pHV7E=;
        b=F/ruMj9aarTjeayqtyBQI7vl9rphu2gHqEhoxhXJwg9GU4X9R8Ag4x2f5nI1tkvo5Q
         gLLimH1rIp3Fk/Q99Vv8az3k0s8devaHNj1io2zwPvzFsZNfuwnw2sO725n09oYbJ40p
         3hTqsDNOmo/NxA2xPxTKUAzKZGHXPmAISB3qI7e8feZAFBeBTKG40AnFW3gWSLXvxwpw
         zyxtgdZUkcOL/4DM0DZ1SGrro8vmACDvRdb0OFqlee8jntevoWE13Jow57yWWyeLLzUu
         2pP8+gBAb/xG+LP1UpPJKHenbsMylEOKWF1YV2LZksqA4JY3c0U575FiSAT78qGbKeJw
         92ig==
X-Forwarded-Encrypted: i=1; AFNElJ9tW3V4COm3Ot1+/tu2dUVolCiQ+QMGUjsVIjIvaDfk/DqnROc891Gt6Pk5lbtupg8noPC2ZoOZ4Sox+RNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgkmdmXXGQjUACT8A0Vh4QFfXG/kc57b3Qj55QqGAr3Esdbv6n
	yy7vH6nPY+oEMfN3H2QsQZrKamN1nhkogIlzm/cZiSj6QNTqW8BM/sljz02O4kl7jKcyrnhtC9w
	5v98+eBye2J26530UAVKKp+4/wO8X5y/4lgtO2JsFR65Ti5TA+OeYcpzb18OcEcaZAOzC
X-Gm-Gg: Acq92OFj5ttuuKE1IMCH7WlMKgl+jtvyhRv8GNkl/SK792fasSZprKtuKpp1lE9P3lO
	/JfVfrSuSvUVSLirTYxx/ZdauPvVskERYl3gV0XAl1axV85Wf4cOFViFHEB4L41EoiU2pdJoulU
	KLOS5AFzNPB2EDCqhjBTpK0B0X4RKJadt4Hfx1nhCVWYvZSh3POz6pXllxe6rbhbDXRS5EZbotF
	c8p7pvvd+20TpaPTnE0r1y5FjuGN4DWubb66ICOfraYhRn5Sh+yyaIYOQvwIsFOMZ2oc4Ug3hmz
	UuVPJEpqF1VptDaM+fiA0Qpu22preqLcJSTJUyOaysHg+6hV5BjfNFOjiIz9yItl0PJU1LsE0FN
	B4HHc/149Z1HrxxNEfXao51xTTRE3Ji4s5mCL/3ODhT9IOxIYo1aHapwGJggi6Sk=
X-Received: by 2002:a17:90b:578c:b0:366:3ac:f730 with SMTP id 98e67ed59e1d1-36c6848bd46mr11006977a91.25.1780338152888;
        Mon, 01 Jun 2026 11:22:32 -0700 (PDT)
X-Received: by 2002:a17:90b:578c:b0:366:3ac:f730 with SMTP id 98e67ed59e1d1-36c6848bd46mr11006915a91.25.1780338152280;
        Mon, 01 Jun 2026 11:22:32 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd918f069sm326613a91.1.2026.06.01.11.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:22:31 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 23:51:28 +0530
Subject: [PATCH v3 06/12] clk: qcom: dispcc-qcm2290: Switch to DT index
 based clk lookup
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dispcc-gpucc-v3-6-61c1ba3735e8@oss.qualcomm.com>
References: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dispcc-gpucc-v3-0-61c1ba3735e8@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: oPvjq0v6nC3ExwTmfOPxxgYZy9HVR7DH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE4MSBTYWx0ZWRfX1ony0d6d3wzr
 Wowcg9ozcNist7N1ptZPoa1b1KqXVrMLpS6A5oh4dG5jQcpP4Z1e6BPN6it7Nyp1ND1ziAYRAUz
 cQJcsUlwlQ3VU8r0dUQz9ZVGIbR4PZ33UP7fGt5AixMGUmt34GtSZQmqIO2fDZjmK34Y3t02YyO
 3wtt6WEmTRecCzZEJlEizX8VbovHzcl9rWiCLtSZvc0zUGzT6/wcL1IAlyosjO68ws/uAAmBTmM
 lPlfE/DmaYgXwLGhsCpN0jViAtN/6a5xxr+ncbR7XKhE8wTefClqi6uSvmY12/z6ND+OJic8xc2
 MFz2oxyaMTB4jwCLWcm5ACvW1Neo0pg6vZXQH8CuDuP2asuT6yXRNWRWzAn5GqD7far+RNPxpPy
 xGyyVvPYAOArItw8uCz4eem3jW1tHdWGJfh3bWMQHf7MOUrVX+ZR8LrkBCuH4Gywdd7dKSTL1f/
 qbeYCnmAZmSrotBae7g==
X-Proofpoint-GUID: oPvjq0v6nC3ExwTmfOPxxgYZy9HVR7DH
X-Authority-Analysis: v=2.4 cv=VpcTxe2n c=1 sm=1 tr=0 ts=6a1dcde9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Thq-9bDrPsIKtHylmFsA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010181
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-110668-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C24C2623EEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the QCM2290 DISPCC driver to use the DT index based parent clock
lookup to align with the latest convention. While at it, fix the parent
data of mdss ahb/mdp clocks to use GPLL0 main output as per HW clock plan,
and update frequency table accordingly. Also, add the DSI1 PHY PLL input
clocks support.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 44 ++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 1c21267ae0f7a86c1de88e888c2a990c35f0a0e0..f5dbd19d0a0334362a44f91a69229cb0f018f309 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -24,6 +24,18 @@
 #include "gdsc.h"
 #include "reset.h"
 
+enum {
+	DT_BI_TCXO,
+	DT_BI_TCXO_AO,
+	DT_GPLL0_OUT_DIV,
+	DT_GPLL0,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI1_PHY_PLL_OUT_BYTECLK,
+	DT_DSI1_PHY_PLL_OUT_DSICLK,
+	DT_SLEEP_CLK,
+};
+
 enum {
 	P_BI_TCXO,
 	P_BI_TCXO_AO,
@@ -33,6 +45,8 @@ enum {
 	P_GPLL0_OUT_DIV,
 	P_GPLL0_OUT_MAIN,
 	P_SLEEP_CLK,
+	P_DSI1_PHY_PLL_OUT_BYTECLK,
+	P_DSI1_PHY_PLL_OUT_DSICLK,
 };
 
 static const struct pll_vco spark_vco[] = {
@@ -58,7 +72,7 @@ static struct clk_alpha_pll disp_cc_pll0 = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_pll0",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "bi_tcxo",
+				.index = DT_BI_TCXO,
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
@@ -72,8 +86,8 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_byteclk" },
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
@@ -81,17 +95,17 @@ static const struct parent_map disp_cc_parent_map_1[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .index = DT_BI_TCXO },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_BI_TCXO_AO, 0 },
-	{ P_GPLL0_OUT_DIV, 4 },
+	{ P_GPLL0_OUT_MAIN, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
-	{ .fw_name = "bi_tcxo_ao" },
-	{ .fw_name = "gcc_disp_gpll0_div_clk_src" },
+	{ .index = DT_BI_TCXO_AO },
+	{ .index = DT_GPLL0 },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
@@ -101,19 +115,21 @@ static const struct parent_map disp_cc_parent_map_3[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .index = DT_BI_TCXO },
 	{ .hw = &disp_cc_pll0.clkr.hw },
-	{ .fw_name = "gcc_disp_gpll0_clk_src" },
+	{ .index = DT_GPLL0 },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK },
+	{ .index = DT_DSI1_PHY_PLL_OUT_DSICLK },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
@@ -121,7 +137,7 @@ static const struct parent_map disp_cc_parent_map_5[] = {
 };
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
-	{ .fw_name = "sleep_clk" },
+	{ .index = DT_SLEEP_CLK },
 };
 
 static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
@@ -155,8 +171,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
 	F(19200000, P_BI_TCXO_AO, 1, 0, 0),
-	F(37500000, P_GPLL0_OUT_DIV, 8, 0, 0),
-	F(75000000, P_GPLL0_OUT_DIV, 4, 0, 0),
+	F(37500000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	F(75000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
 	{ }
 };
 

-- 
2.34.1


