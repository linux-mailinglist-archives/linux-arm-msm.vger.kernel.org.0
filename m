Return-Path: <linux-arm-msm+bounces-115431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DcrPKlK9Q2rTgAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:57:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A33B6E4840
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:57:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bxrRU1qb;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WdOu6t7B;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115431-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115431-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFFA4302D127
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71706416D13;
	Tue, 30 Jun 2026 12:55:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583C5416CF8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:55:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824120; cv=none; b=aXpHCZhly/0G1tusdUXFTR8ggCpN25OcmzReyUET9H2NG4MddNpW7LELsmg1ROa5o8YW+7PWeQ3OeJ8n/AwMixS/3liaeC+eknJF/5yEQDa3WaVULtaqdyu1j0FNrTqy2Mvrxhvrm9xB933rcqMjqrVHeYxSUz5blFkqvjfJas8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824120; c=relaxed/simple;
	bh=NuNLlMiP7yBDairGYhXKp2ubw0Ra/YrbYqnS6CpFbhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pr3aFhaGHKfVRkJSH0xhQY39nUGKFg84pnqKc2KlgrOLCKv9+xJ27y6YRCS5FWf0C8gi5D3piCrGnksHSdH2P76ILq+aic6xc4dMiuq8UN0iY9ETPxat56CIFXpKqqC697ExpM/TLvsALAxl1ZuzHeVhvNHuSWszOZhYk9J+rt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bxrRU1qb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WdOu6t7B; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n4Mp1508630
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:55:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4yKws5RnIKmcDwZb8txUvSiZbxtJthFOLruqpk63REU=; b=bxrRU1qbAaoz9naK
	qUWuTCX+D3nFQg6Ptw1m7REZoeCOPJZ1J0VoYG9LZEf3+O7WVvG0X0OGiQnDquuZ
	RmJPHxH30x1Df0ssiAzvjB7b9tuUKVEwm8SNL7wL4vqr35Z8GYgkcl59/M9H6X/O
	n9vtj83RVa2w3emmzLIvVce5oUb80fjVnqTtAhecJKIrX2nkcnR9CAI7BnrokCJL
	yxh+8YIU908wz5lWD3Lyf2+SFkRw87KMQg1EBjRqj8MbkYKAd/DpjNXXHtMy5qpI
	0lZwUWNG+3stJxkNFILBc8WDvGL6UKOr0ltezeBDLBRtyN1SsLwp6nf8Jhx7TAl9
	JFIpNQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9j3kpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:55:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ca81e05bfso4604018eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782824117; x=1783428917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yKws5RnIKmcDwZb8txUvSiZbxtJthFOLruqpk63REU=;
        b=WdOu6t7BAA6GXByAAazoQqIP9dtcvGWRsRSvFXUXSIl0eV+vQyDkHOo9LToDbbf60e
         2tjcH1tbKb+UNKDi1hsUdq8r+U36tcYtvJKG1jNA91ZlxWK+w3+jQGLh5vWe0UimrfmE
         8h9keRlQlTV8NnBIogm2a5IIdheZN78dxP/7tUhvUFObJ7payaRGpS+oXG92NPABSoVe
         HlXYLRkpkSFbniA6Cfn1quuc+aC+HLIcwNaDl578GKXbfCHf0565KfwYN2GjmQs+eqbV
         NNBrHbizXCywDzhtCOoQMFNoe3nm/Ik7GTXcwoio+ow0/jM99gTXnkdwzde09+Upude2
         +Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824117; x=1783428917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4yKws5RnIKmcDwZb8txUvSiZbxtJthFOLruqpk63REU=;
        b=kEMoRg0IdOB7Cfei6JOiWwmzBh4xrgTztgLmOMM7f6Q/cg3bTnTVZiFAtcxVMqPwvz
         EfRLvP95CvDA8fyXNL1sLs4IiYaU6RpevWhMztrRHHx8Qgkg11JSjIuV53n4mQeHXvOK
         q537Bl6xsf9wdBDR90WeRtQZPShwIiM/Oj8wBlIByMsft5ZBtccCXBmWsuy7iSM7xe3T
         IurIKW1+pb+szEzh24ptvtzY3W8Rhbt3goTdFvFjpR4rGnVUb12p6FNjt3WHXUSbfu8f
         O1exWfGmOMQXRW1a1otDPwW88AIyiA9uHD2JGakErhQvTHWrvlzdKQxJFYIGQMQLU40o
         0OpA==
X-Gm-Message-State: AOJu0YyvCqQirtBWCD7SYKcvc+J72BQfWawSmLQDYoOsyHx89o3A2I38
	pSftZj9a95InX5NC2PvdzvhybKWRk7Axt3KPrrBvV16Pc2ehfFYfMVxHPFC3SvdbHhHWeKyBc8C
	iODnMS+ygXVMxHaS/ITfk4Misxodtc6PoMG2bYo6RmQWnXhjrBCVE/xu+Hn7Hh+fC5Dzt
X-Gm-Gg: AfdE7cl0bsQpbVrLX7JCfZYmY+iff4Jv3Qm35Bne7P/TCLGGDAklxzNgGNnDo6YDsy7
	aYciLx8TfCJH/EiI09bHUVFw7KWn/IHHJjJlv8eVv4PS+cnmRpkY6d82XJ/BFQfrQmdRk6es90g
	cibWKyKm79dHYBjMccVuTDdnvD2hz9E4YH/WViMCITYK/NQ8hw7FzDxsLlP7HW8Q8pEeYp2YB1Y
	kCxWo3wGniRbzdRqffgjmZ7BhOsC5GFWAKku4Rkce1PkksIeQWAUsO2VMAxzwYaZPrN28uYsVO1
	t0eeNZ8WNOulYgRppV+eBdTJ5tg1ZHHJr60+4fjvlV/79rbL4JoHJfGNv6dJj3Gv6x7iOZQ5d6V
	DlBvbrRbXBwGPLUlZcn2p/4I5DAXNSeV8I+OrMfvJ18LLKAA=
X-Received: by 2002:a05:7300:6d03:b0:304:9b48:53da with SMTP id 5a478bee46e88-30ef09017d0mr344391eec.26.1782824116881;
        Tue, 30 Jun 2026 05:55:16 -0700 (PDT)
X-Received: by 2002:a05:7300:6d03:b0:304:9b48:53da with SMTP id 5a478bee46e88-30ef09017d0mr344370eec.26.1782824116310;
        Tue, 30 Jun 2026 05:55:16 -0700 (PDT)
Received: from hu-faiyazm-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2cd21bcsm15936443eec.0.2026.06.30.05.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 05:55:16 -0700 (PDT)
From: Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>
X-Google-Original-From: Faiyaz Mohammed <faiyazm.mohammed@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:25:09 +0530
Subject: [PATCH 1/2] soc: qcom: llcc: Add configuration data for Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-shikra-edac-v1-1-287b3233241a@oss.qualcomm.com>
References: <20260630-shikra-edac-v1-0-287b3233241a@oss.qualcomm.com>
In-Reply-To: <20260630-shikra-edac-v1-0-287b3233241a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faiyaz Mohammed <faiyaz.mohammed@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: zAoN6QfU1akKGOWj2WC8kB874dtISwuz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfXz3wmTvUlekAi
 S70frPMa0TY/Ox9XKkx8p2a8hMBHgiljcs6aj0lg1xptdMmDGOKKKcyd8sCuDff1F7f2K9t+nfN
 GnWLLipUUfOywQYZ7mIP9y3UThfNeNTGpQDsot175HCl/2tIeT7RfUyLYngGUqDNE2YJbaUhojz
 CfcEnzvY/jMA7B1t7ZtTKvOvwBTMdrXvlPWCew68vqjTRNKGXPOTuulkGSiTBh3PcMjkdXoSXZ4
 fAkPNl6N0yTxQpm2uj/3CUx2BCVu1fWDJsqgtc96KdOEse89jnzrtyTZXM+yIUOs9N7ugXQDv4i
 HOpP7sLnka8JGRdMjYU3o+QSze7n3mvlloTrDjXm/W6ayyg6S0lKldPnWgdU9vDdWPLT1T+y6TZ
 mo5YarSA2Fa7kHyGbQyhjggc0UY+KUrbHwhgHcp7IRWSG1IRf5T0dLenrjk/yVzSPYuznXDmdv7
 3crkTO41OPEW6BMfpAg==
X-Proofpoint-GUID: zAoN6QfU1akKGOWj2WC8kB874dtISwuz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEyMCBTYWx0ZWRfX3zFNrDP/LM9Y
 jYEdBgUIAYPDeIy8CXYCLE3vebmmdSCbjuBbzkIT7XBZ7/5FipogNV+kz5ZqaSBpG0AshPpaGlu
 YZ1vusntB47JwZmslc+hD/tBDVQgmws=
X-Authority-Analysis: v=2.4 cv=SINykuvH c=1 sm=1 tr=0 ts=6a43bcb5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=29tAaoYp5FuYdP7YvlsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300120
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115431-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:faiyaz.mohammed@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[faiyaz.mohammed@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[faiyaz.mohammed@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2A33B6E4840

From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>

Add Last Level Cache table and configs for the Shikra SoC.

Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 8948b5fd42d2..22c8099cf6bb 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -2305,6 +2305,20 @@ static const struct llcc_slice_config sdm845_data[] =  {{
 	},
 };
 
+static const struct llcc_slice_config shikra_data[] = {
+	{
+		.usecase_id = LLCC_ECC,
+		.slice_id = 26,
+		.max_cap = 256,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x3,
+		.cache_mode = 0,
+		.activate_on_init = true,
+		.vict_prio = true,
+	},
+};
+
 static const struct llcc_slice_config sm6350_data[] =  {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -4575,6 +4589,15 @@ static const struct qcom_llcc_config sdm845_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config shikra_cfg[] = {
+	{
+		.sct_data	= shikra_data,
+		.size		= ARRAY_SIZE(shikra_data),
+		.reg_offset	= llcc_v2_1_reg_offset,
+		.edac_reg_offset = &llcc_v2_1_edac_reg_offset,
+	},
+};
+
 static const struct qcom_llcc_config sm6350_cfg[] = {
 	{
 		.sct_data	= sm6350_data,
@@ -4752,6 +4775,11 @@ static const struct qcom_sct_config sdm845_cfgs = {
 	.num_config	= ARRAY_SIZE(sdm845_cfg),
 };
 
+static const struct qcom_sct_config shikra_cfgs = {
+	.llcc_config	= shikra_cfg,
+	.num_config	= ARRAY_SIZE(shikra_cfg),
+};
+
 static const struct qcom_sct_config sm6350_cfgs = {
 	.llcc_config	= sm6350_cfg,
 	.num_config	= ARRAY_SIZE(sm6350_cfg),
@@ -5632,6 +5660,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-llcc", .data = &sc8280xp_cfgs },
 	{ .compatible = "qcom,sdm670-llcc", .data = &sdm670_cfgs },
 	{ .compatible = "qcom,sdm845-llcc", .data = &sdm845_cfgs },
+	{ .compatible = "qcom,shikra-llcc", .data = &shikra_cfgs },
 	{ .compatible = "qcom,sm6350-llcc", .data = &sm6350_cfgs },
 	{ .compatible = "qcom,sm7150-llcc", .data = &sm7150_cfgs },
 	{ .compatible = "qcom,sm8150-llcc", .data = &sm8150_cfgs },

-- 
2.34.1


