Return-Path: <linux-arm-msm+bounces-116100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SIbTGHqvRmpXbgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:35:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1736FC1F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:35:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=HjPDaiQj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DSXZ1gHy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116100-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116100-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 176813049160
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6218A36896D;
	Thu,  2 Jul 2026 18:33:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA18F364058
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:33:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017211; cv=none; b=tx98owtvYW3qwKtRViSk9Q44yStmXjWDQr37IsmQwGdOUfqzPMLj2NK2fi8JDferUPDtmD2TpL3q1eNr7NHN2mNjdcoKooK/5osbKcGcpQzczioI2giKt/V8X3rkgS1fZ4M/+WprZvJSZshLCN+Tr5/0sh1T0E4hmrJxunkzFaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017211; c=relaxed/simple;
	bh=R51D9HeZ+Vg0Rsl0PNUJ14lRccWMdZfVaqTmaO/sjmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X6PoVnjaHyTTZhXoDf9GdtsOa9ne5IykrtknjrolEVtdeUQbmIajGq5EMwD3KZs5EIA74pv5cU4zoHM9QnQ5sZ0XoleV3EDbRkGtrWSAC+U9soFbgYk7lIu47ZO2ZMR557giBXcVcM8eswnFH1Ntsy6ameNeGBkkOf/HxXdyM8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjPDaiQj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSXZ1gHy; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3jPe662802
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zUmmls/L94UwYRqT4cXSw29pARzyX1sbrFhRE5+U1l0=; b=HjPDaiQjg+ZQ8y2G
	ajeEiYVnh0qEqecfGC8epnKna4PusFPBmW5ztmI/DKF3jA09YEITRO9fkm4FAMlu
	KuolbEIBzBdl9urf2n9z+TLkcxiWE7xVb0TfNRj2OPtwJnrf/+xvTfyyjoRyJ0xx
	ndAnj6QVTAPBrStQy1/qcZBEn/uLQCsr3pHMTSeVBZdYx6XHLVeH2aSA21AWrbEt
	RJZiSe7uQ7RyRITS0gBct9px+oWWzq7dt+kpSQwzM2pFIn4Sxp+L2ucx+I+tlSjJ
	5kVYMd+IbfrqYNAW75rK/MlzNaf6coAES07WnCivx4N3JXtg2ogBm82p0qG0nW59
	ROOyQQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5qnp9pd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:33:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c80be91ea3so41746085ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017208; x=1783622008; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUmmls/L94UwYRqT4cXSw29pARzyX1sbrFhRE5+U1l0=;
        b=DSXZ1gHymAHVffZKzrIkcCtQVtzj2T7sWnyRLjFnVjIRaiafOjblB7xRFB+VCU6U7n
         3nRzYVO9wadtxkuI3DfVTjB+Hd82mFLr64Kr6XGuH25ZeY/fyNp66DcLt2dijKyPBrFA
         x7D9elAf5aRDyyHVlA/xHBDMOdJ3IpcIAqLcq8nZAS5Fcmds6Cd9+83SMArMOHdD2Q4m
         d/8jWETtpfRbdT7+hShFQc/IHIttp1UMslUevSHTSJB44HPVqF4pqGHP20UWIK3A/d3+
         U7W+KUWzitzBc02rvhWltoAkKAwGpV56UWvP6rbm71XO5gZEOv8YZyaB0+zSqgcx6b3Z
         LUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017208; x=1783622008;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUmmls/L94UwYRqT4cXSw29pARzyX1sbrFhRE5+U1l0=;
        b=hAXeW4s8lV8QXLGa0ea3wp6ojVkZjzHSnG+1FEAk4Wsx7q0MpvLVzJ2ppehQ76914I
         uzR/OeVrhSG4ivZZ3+LbI+iW7cB47WoYvCWGAXz4lkSLCkI589BuhRDKJchd1k+WW9j/
         QPvwJkSSDdEWwfU+SLsAqg9r2fvnlQPn0lL+4e0xahcG3QgAwHku1eduOVq0qUnLCjNY
         K/aSaD1LNm9PorvNY48BxD6VBvbt31ius+h26VgDquvyXLBC4tUyHKIMc9bS8HKgPd+7
         J1IONDW1cSH6yLivau+O860gL8nhvlIjBUnp5FiVsPJj+rjYFhZXv44avxWSsny9WjW0
         RJeQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FPGi5VsN221z0rNDeuIJvMVJGil4VsEjX0sNwSm8xhaFqWr3LQfbdZnFneaLOo3+yUBBisK/A8j6msVUd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz66maM+gpB+dIou6wWatqPsRApSVQrqBl3vpnw3U0JZzXva8AV
	wUOG5zmXmOh5daJGOYP2r/FozoxW1GUG1wmeARN2KhhnVUQ4QTrTyj8FQRqYdubQBkUEOtbhA0j
	Xdq8VChj9kyShrqalcoUHAqNH296qpPmKR5yDc+ta9+qet5k/Qr7qNaeeU4PgQzIH1m8r
X-Gm-Gg: AfdE7cmaZxL4aztnfsY9iMVg6WG+OBZQIhMKo8aYahTQ2VRRk1I5t3W0ZpsBzkhYp9F
	bGVfFASYLrqkF7Rv1/B+PdZEFukfno6jKoI2rOW2prOYL28WjbvXteA5C/+8dm7Z7Xnj42DLfxI
	lEB6r0FC7RDCwwMtitSC0XxuDYxqou3xgkVOoRjc4h2d6wu9aDzPpK3TP9IjBHn/G7aCtGxlJvO
	VWYCKwl6noAsjWg2C3CmrqjhZG3Poo89oujSXTOPSnm8CiCWFt5PACYfCAgBQ2ooe6G9CpAcWK3
	tiJiLtWXPaAGXGa9l1DOrW15D5HOg92EKX6WJ8yA/U02Ffnl+VQZMB6nA8xYrPCJbnbfoBBEOju
	i0+dq28gqLnyJPLuJdOswnx3p90wxxT0AeoRvXeUIFA==
X-Received: by 2002:a05:6a21:d88:b0:3bf:5539:f93 with SMTP id adf61e73a8af0-3bfed3e8aa0mr8540929637.38.1783017207715;
        Thu, 02 Jul 2026 11:33:27 -0700 (PDT)
X-Received: by 2002:a05:6a21:d88:b0:3bf:5539:f93 with SMTP id adf61e73a8af0-3bfed3e8aa0mr8540874637.38.1783017207255;
        Thu, 02 Jul 2026 11:33:27 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:26 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:28 +0530
Subject: [PATCH v5 06/19] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-6-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX67uUzEjHUTlL
 nWcnVfEAjPy1LJ8azGt6eXTsjZDUyg33+pzm2p2DJEm8PV9turksATqnzQPFwqHQm1N3hbMX5Uv
 5f8JvaPkmYYlqEwv7W+IB/MQgx+SenY=
X-Authority-Analysis: v=2.4 cv=FoI1OWrq c=1 sm=1 tr=0 ts=6a46aef8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5-E6Jl9njFXL_0F9BXgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXw2PSBOQl8339
 QanWGol2nx2+yIrYVwoeRe0ksQPkWLpb0cui1mzze91NKnJde/pf0bXBOyFeghM5Fp7WW3QKlhL
 Ng8VU4rWdYxbhdciNe/0JG2Fj1fG111z0SLmpecvBU5Ei0fuRrpQguOyxt0j7OIIHFgOI73ssqt
 8M3QOaAg9ACreG2+RcPhsn80yfAIm09LT4V+9jC+vNNwyeAM0uAjAwhKuV7B2fP7mF5eB2p+5D+
 0OCtq+zrqU0uGLbDKQjGtTVHGmhwB1MXJoEb/s/p27X4krVpjiWsUwix+OmutuwzBi2YSQYO8Gu
 zohgrionrtZn1/hfc4f1RxvlcpGCflIFsdULMdbVkGI7rMcJnz74TQWZqEanD4I/Wphj1n1Ig63
 wXegObwY8cqVO+sACHKqk8zsNaj540j6aDZkgV+1hweyB2JfbiaVCMJjXYvk1aOk7ILa3Q+loV2
 y+brQLRB3iBbdp9rcXg==
X-Proofpoint-ORIG-GUID: CSfrvb3H2trW9X8E9bSnyLjL_HJwkT1r
X-Proofpoint-GUID: CSfrvb3H2trW9X8E9bSnyLjL_HJwkT1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116100-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D1736FC1F1

Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 4d6aad280ae178426bb70528fcd9699627359ef2..50a0705128a37073a077b560d0c9e57544d54348 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Linaro Ltd.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
@@ -48,6 +49,7 @@ static const struct alpha_pll_config disp_cc_pll0_config = {
 
 static struct clk_alpha_pll disp_cc_pll0 = {
 	.offset = 0x0,
+	.config = &disp_cc_pll0_config,
 	.vco_table = spark_vco,
 	.num_vco = ARRAY_SIZE(spark_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -482,6 +484,14 @@ static struct clk_regmap *disp_cc_qcm2290_clocks[] = {
 	[DISP_CC_SLEEP_CLK_SRC] = &disp_cc_sleep_clk_src.clkr,
 };
 
+static struct clk_alpha_pll *disp_cc_qcm2290_plls[] = {
+	&disp_cc_pll0,
+};
+
+static const u32 disp_cc_qcm2290_critical_cbcrs[] = {
+	0x604c, /* DISP_CC_XO_CLK */
+};
+
 static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -490,6 +500,13 @@ static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data disp_cc_qcm2290_driver_data = {
+	.alpha_plls = disp_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_qcm2290_plls),
+	.clk_cbcrs = disp_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_qcm2290_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.config = &disp_cc_qcm2290_regmap_config,
 	.clks = disp_cc_qcm2290_clocks,
@@ -498,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
 	.resets = disp_cc_qcm2290_resets,
 	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
+	.driver_data = &disp_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id disp_cc_qcm2290_match_table[] = {
@@ -508,25 +526,7 @@ MODULE_DEVICE_TABLE(of, disp_cc_qcm2290_match_table);
 
 static int disp_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &disp_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");
-		return ret;
-	}
-
-	return ret;
+	return qcom_cc_probe(pdev, &disp_cc_qcm2290_desc);
 }
 
 static struct platform_driver disp_cc_qcm2290_driver = {

-- 
2.34.1


