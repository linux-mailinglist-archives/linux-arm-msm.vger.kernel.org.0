Return-Path: <linux-arm-msm+bounces-94829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCAtB6lgpWmx+wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:04:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF541D5FCF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 11:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4062307D633
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94AB1394497;
	Mon,  2 Mar 2026 09:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwOdp8N+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K7ZKUQpn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3803921E3
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 09:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445588; cv=none; b=nfLJNReO95iefOrJ4Sk6GBLzubzW67GV6dpRSYRK0FQtImu08cSjkneztoEQ6EAetGp5b0QoM1NZfB1IiMgMr8fNZPvkxWGt1Airg9dMVS1NaTs6yUavwe+i0CyIFHb9BhJh0Nvwkayy6VTJQg4JnhGOLPosthQQcjvIOPtscDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445588; c=relaxed/simple;
	bh=nXtsTn+us+fwpY58enYCSZqAkXtKUfaeKiKjKO34/7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=clUckeOJNBk6aO5EsILR9gxJChz4QhYumzd1VFdgwpORsz4E/QF0smunov7+7eyYEwas6WDyU6E3kte4f7a9IxHCfw4JiRS80ncDyAMIIESWfbqPKtVXjspYtB0zDxgWYP+8yUSJJg5TGyWswbxsF7SZHqDLLRhPb6eoNfxufh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwOdp8N+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K7ZKUQpn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62285Gll2049380
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 09:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pP2Ytg8BGt2H3huZdkXSIBS5YbGS5O84j4mWiuxNbEQ=; b=iwOdp8N+lS7oO8xR
	6HGSDRa4siJJO+pRbn1BV25qWilOLXzEtzplX+Grf4X2mbH1Pmdbh7r2eH/zacIe
	lYJ6Hb4izvUX6wLpG97I4/dHAXXaVI/o9QYJ+vNcKvMYUMcpdTVgIje0WuvazQf0
	wA5KHgRhEq3ALT2gR9AqluiB1pFXdnyasnKuFRM//+5Y0F0L2J+toqFuPHors0LJ
	HHJ7rnCv9S/ltEPHIKHLVVOt0AuVL9F515MavvdzoeyQaXvwTNBmikRwPXwNBVj4
	PDbunac4g9Z1r8PMUXRIoQiYw3nMozFk3qVFARffemf123pEP9ErKTjDMoxRD06A
	d2Jq5A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshkw2wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 09:59:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8273494d873so1659291b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 01:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772445585; x=1773050385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pP2Ytg8BGt2H3huZdkXSIBS5YbGS5O84j4mWiuxNbEQ=;
        b=K7ZKUQpnX0o00dyczHn5iUUjI8CVMgqGEzCPLM9av6LQliOMWF8lB26Xg7AwyXfIlR
         V/SIlmfi+oCgMBi9Vk/MXX0avH5RzKMjCDY+zlEVud1UHMHesUeCo+7MjzWL9p8ypiKA
         SJVog2+KnfFIafAW5DUXG+T6ZzDVQGwMe9ax8RA4y9olqcLqUF9pwFusRX5PQy0xd2P7
         o/xSv5LDBx7Q9qF3REPLafQT0U6C+z1kdqh0V+WfZLRXMl7ugCDKQJWJWN/til8S3lrQ
         MYlUJ2wPEu4wG3kSHWoVhbc6Qm7xaBLMEyP/qhnud2eEt/eGRFqYPtirF0ngdvmVhp0t
         3x0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445585; x=1773050385;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pP2Ytg8BGt2H3huZdkXSIBS5YbGS5O84j4mWiuxNbEQ=;
        b=MjSbsdfDVx4i0eA711TBTVSWLSdwoLeYTwb5F44kIOzFOrp+FERBeU53QDZiZHGFG+
         d9SDr2q57xaOwPrXEacFgvHRw66nc8k8NKFq52rcItU2E2/PfN6gnNtG+PRmTqwq+dqo
         6HI5V5Q/429z5qp2uhG0K5jdEo5wVJPZUha35pi2nM1s+g2kqa4vIOnskn6wVNSRnfgU
         SfnRZjm8wE43APOruISjNNSDIRoKS6Q1DhzaCUaopskxI3wuNdgTEVpb90xhT+ioF+kW
         4cshxnmQnyrKwBjvhwtER9YF2fHxqJWsRsnyLWz4hQduIpB4D+xAxbXc9RRGE1CQ5wAa
         gV/A==
X-Forwarded-Encrypted: i=1; AJvYcCW41OeoNhKQ/vM8yjslrW8Lemgp9FBk5psreOrec2GvC3xOpK+ApLGhjmGCX9HF8QfJ8sNZ2+cDTKNjPS5t@vger.kernel.org
X-Gm-Message-State: AOJu0YxXZMsX+LD3nmqve/OR+LVMmwsNOfUYPguDqdfWBRKTMtfcchXj
	wLp16sTbljT/2iFfGFqxnhd7DaoigRPGM+hKm4bnkW2MkF4CX01m9kswt32aIHc1R5Yb+lWkXOS
	Dk2gNPpcIkHeF1LrPAk9fOuGDEHEv8I3CKE4aVqc4+2Scjp51dYHe0t6jQkikyhknuoiW
X-Gm-Gg: ATEYQzxBPhskmvJKMoAjaPTD7QyvNq4XCmRdtHxSEM1xbli3KPUpgW4v5og8UOIq0fD
	tOXNIVDmx0V/EYiyR9wmQNORwB5gy5gcBrWLVxYy7iMWCEvPmj+ZCw9Y+krX2RFlXXhS/EBy9nA
	cbh1iZuppc+Y/xz7HNkNY81kpzkG8WqK3y48WLtwjpHyEZJ8Lnduv6uj24oPxaFDCjQD2EY0vVT
	ZoFEqSITmOYQT0CsNedMg8cRjrthyZy390R4BjwgWl7AbXiSPoVXoMBQnKumLVz7mHY66fdWfL/
	5kWRhaGVHb0StoIvY2yxcXu8n9TTiHB5xgliG8TjtTXpgNynZlxyxey1CTwDje+jS6TkjaCzWUK
	9BqwanVjCJrDr08IelmhE0H53KXEbq0wgzfqgEuBJ8ln+u+Dtp+YJ5w==
X-Received: by 2002:a05:6a00:1da3:b0:81e:8e66:38dd with SMTP id d2e1a72fcca58-8274dbf31famr8430946b3a.33.1772445584843;
        Mon, 02 Mar 2026 01:59:44 -0800 (PST)
X-Received: by 2002:a05:6a00:1da3:b0:81e:8e66:38dd with SMTP id d2e1a72fcca58-8274dbf31famr8430915b3a.33.1772445584343;
        Mon, 02 Mar 2026 01:59:44 -0800 (PST)
Received: from [10.0.0.3] ([106.222.233.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff3667sm11967742b3a.41.2026.03.02.01.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:59:43 -0800 (PST)
Message-ID: <b119a17b-4728-ea1b-20d9-fa843ec96ff3@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:29:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/5] media: iris: Add platform data for X1P42100
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
 <20260209-enable_iris_on_purwa-v1-4-537c410f604f@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260209-enable_iris_on_purwa-v1-4-537c410f604f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4MiBTYWx0ZWRfX+pTMj056wSM/
 boF24bJY2+bWGcATrpeYDz47bnWFnJBOgI6CjmN6K/rP27q58h2Mh7J+i4d+/2q78x5LkoRHg70
 XScotF25WINMhVpXabcePodujlyhRV5TJzApl2Eecf9KU8QhmqLCWIdfSFb9kC0D8lrDJqPDUIa
 IdJYEUbqiCUDOENlhbiBxxdU8iJip7QbWi0ulSkfpz9ZgJuxau3NSdy9mruXwYkhBoagDeABqcP
 3JOVLq4tG2jQ6U+ze1HI0nJtdXTUsXzT0CWTrqoxddJSgxZQvR+n6Q6t89wOorqh78cBq8G1j7z
 FFNGq2FTaV7SabVtTBzKG+44qCcBR0yrpqgOoI+BzjRHkU5dyWsICUxm3hlAJ4Mf5L22Jq3p/Uj
 3UM/1dI/dOpilKZSjUT92VTBloVqXSQXO3nN4DcSxTrGYdISWasEwQn/OExw2uAcH8UDsyxQLe1
 wbYkUJr16VzVy+hB0aQ==
X-Proofpoint-ORIG-GUID: zLYmVeFW8YE9-pRfDXTW81IQtmTDPL-q
X-Authority-Analysis: v=2.4 cv=EvbfbCcA c=1 sm=1 tr=0 ts=69a55f91 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Rcr8AszoUWCL+GUTnXSVkw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TPCKnYQExiOLhkRsxaUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: zLYmVeFW8YE9-pRfDXTW81IQtmTDPL-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-94829-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AEF541D5FCF
X-Rspamd-Action: no action



On 2/9/2026 1:09 PM, Wangao Wang wrote:
> Introduce platform data for X1P42100, derived from SM8550 but using a
> different clock configuration and a dedicated OPP setup.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_platform_common.h      |  1 +
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 86 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 ++++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>  4 files changed, 113 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580eb10022fdcb52f7321a915e8b239d..2e97360ddcd56a4b61fb296782b0c914b6154784 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -47,6 +47,7 @@ extern const struct iris_platform_data sm8250_data;
>  extern const struct iris_platform_data sm8550_data;
>  extern const struct iris_platform_data sm8650_data;
>  extern const struct iris_platform_data sm8750_data;
> +extern const struct iris_platform_data x1p42100_data;
>  
>  enum platform_clk_type {
>  	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..a9389f1b3ac5862f7bd4f4cb165648b5c6feb459 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -15,6 +15,7 @@
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
> +#include "iris_platform_x1p42100.h"
>  
>  #define VIDEO_ARCH_LX 1
>  #define BITRATE_MAX				245000000
> @@ -1317,3 +1318,88 @@ const struct iris_platform_data qcs8300_data = {
>  	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>  	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>  };
> +
> +const struct iris_platform_data x1p42100_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu3_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = x1p42100_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
> +	.opp_clk_tbl = x1p42100_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu30_p4.mbn",
> +	.pas_id = IRIS_PAS_ID,

what about inst_iris_fmts? why are you not initializing that?
how is working without that structure?

> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> +	.tz_cp_config_data = tz_cp_config_sm8550,
> +	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_sm8550,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((7680 * 4320) / 256) * 60,

Hope you confirmed these values and verified the caps.

> +	.dec_input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.dec_input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.dec_input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.dec_input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.dec_input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.dec_output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),

av1?

Thanks,
Dikshita
> +
> +	.enc_input_config_params =
> +		sm8550_venc_input_config_params,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_input_config_params),
> +	.enc_output_config_params =
> +		sm8550_venc_output_config_params,
> +	.enc_output_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_output_config_params),
> +
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> +	.dec_output_prop_avc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
> +	.dec_output_prop_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
> +	.dec_output_prop_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +
> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..d89acfbc1233dad0692f6c13c3fc22b10e5bdd80
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef __IRIS_PLATFORM_X1P42100_H__
> +#define __IRIS_PLATFORM_X1P42100_H__
> +
> +static const struct platform_clk_data x1p42100_clk_table[] = {
> +	{IRIS_AXI_CLK,		"iface"			},
> +	{IRIS_CTRL_CLK,		"core"			},
> +	{IRIS_HW_CLK,		"vcodec0_core"		},
> +	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
> +};
> +
> +static const char *const x1p42100_opp_clk_table[] = {
> +	"vcodec0_core",
> +	"vcodec0_bse",
> +	NULL,
> +};
> +
> +#endif
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ecb9990af0dd0640196223fbcc2cab..287f615dfa6479964ed68649f2829b5bbeed6cd6 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -374,6 +374,10 @@ static const struct of_device_id iris_dt_match[] = {
>  		.compatible = "qcom,sm8750-iris",
>  		.data = &sm8750_data,
>  	},
> +	{
> +		.compatible = "qcom,x1p42100-iris",
> +		.data = &x1p42100_data,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, iris_dt_match);
> 

