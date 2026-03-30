Return-Path: <linux-arm-msm+bounces-100663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIVYJEAJyml24gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:25:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AE63557C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:25:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5AF7300F538
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 05:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51593815F9;
	Mon, 30 Mar 2026 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jk2MjDRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CqOGOFr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B23134676F
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848315; cv=none; b=DMUf2x0OG4ITmlZBOqj1Kw9wSwGxclCgMNZXSwafUm3vFjssYGj2ZhWf/Y0s/woOFnefKgG6nFHE46sROxhAMFZWWy7pspItVZyw7QuzbrRhf5IRnkYV3N1uKCTi2nqCp8z84MoaXpne30bQe/savnYqlW6+TKTbl2iWTVUlXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848315; c=relaxed/simple;
	bh=D3lO0lhg5hTvmGKJ2ae0KlsLLu8OpKls2Vh506RLu80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtccN5hrFrdI/N4yJFOII5gp/soqSJod2Q3XEYxra7+h3wDUeBY+9OE+f3onPeODd5sT5s/nVuNbiaNkdlksBZw9qJ/PpEGd5udGd2P4z0/J5AM+FP8nqnCCwAH6GnyyNiG2f6qiXcYmtzMBa7SgGM3lDmTyORAjcIkl5nGGzVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jk2MjDRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CqOGOFr7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TMIafn3171980
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:25:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UmA43w79rLl8gL+6ejapyPIrbFnj/6/3VIIghM3uy5k=; b=jk2MjDRJU8RmKdg8
	w/RB3dFeD7f0NRQSpbnWEdTb9j6GXYDMIc3qGNdzN1zA8OnLf59nAAmB1lOeU5B4
	B9gsSdsj8soa1JH9pvVgGQ32Dc7eDyY99/uL5QryRwBGUxnwY0aMhXd0uqWuyLIA
	OYc4qzLzBgpkdKaCD/L5hQ+lMjeMQUG60ALhVbPW3SWoJQtsL8fFXhyfpIy6AEAu
	Tt/gOKaDOOFmjNrv3xVgLeuG1Dr8AjrP4Bsb6kJ47ibPsQo3oUKqsxZbQG+kgs2Z
	STMQkyQKYNrRATfYk9DOjG9nMWvvnZ+rfuSodfcKWmmwRrebaqAl4nJxNRzXQAzb
	b5TBRw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmjksj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:25:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35449510446so4578829a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 22:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774848313; x=1775453113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmA43w79rLl8gL+6ejapyPIrbFnj/6/3VIIghM3uy5k=;
        b=CqOGOFr7CLQohgEWMz7GFoCw+mFO+rATtzxbfPNE6vSeWSngULiUAQBLnxwpCNQQlk
         68E2rKstMA1+RF3pWXHCo7cgKb4bY0JC2/pBTb3km8kCu27JvMguEXb6l8TW2b/3i1CI
         84FbVOpZtRO0gzsScrDW/TgOOOujzM9PC+qIsQLCNL3hRtz5IU3oUTx9qEvisjDGA3vM
         1retOuriDMTb3ubgCEp2PDcU7yJ2JLYyQNr9jmLdmmq9gOqO8ufD5vSg3/GItJqPCNvb
         LOxtGgHUuR6Q8NG+nJo4pEUcfqKOgJzqgqbVC8g3xBEZ6wNAcRk0CV2AYPMuxFKbkoKk
         9CTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774848313; x=1775453113;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmA43w79rLl8gL+6ejapyPIrbFnj/6/3VIIghM3uy5k=;
        b=JfHBsAgs2nq5PLKAIfhhLrDDCpkJIpMjeMY3WSvjjyFgM4mFYptP4Zok5Sy8rZqJyG
         mr4E503VDYWPWxoB1LradysnqREIWTU3hzYXsc9uCJYn47+Gz5XWlwpHJj3uoeCIm9SO
         NlhqwsJC6MQoBg05WsCk6XzoIQYYFXV9b6IN8TvlmaWov454zvg9WM6b+vMsjcgiwHIq
         ake/bCiJo5RJs9FaTDXEFRvpJlyvVtwS3ifeNpOW8ybdoKBURf4U8vqdDbmqSIcbllE/
         XiAKu8aFXZ8Uy8k/OlDBzqStqiIvj+O+IX3EOuBPAToq3xOReQp7wdRpSn6E1Ys+4VX9
         aU2w==
X-Gm-Message-State: AOJu0Yyusg3X9RpQDPEW4pq63lTWe3vopMMoWSCK0wQx+DnbXzgQv6m/
	Robb9Kglstj6NObc9SWUDvSiLLgwXSFtbRJvYjgmVqXPzsmF+U86R51jDEd3ZTXi8igkRqKzjOs
	2SMd+IbVT2tvsTCm7qsq4db6AU4DVnC1587xREsYJllfy3HRJ1xssLjXHzXvewmT7stc8
X-Gm-Gg: ATEYQzzk7ArFafZRL2Lud9l977qNRce3W6VIF4+FZz9Y+c+tFjrHA8vYHP1ijXoIliz
	lBrr29S1UyjF/i5cSJloXrJk8XtBnB9gRqic1zWjbyhAJvsNcHdMlylyUQV9NnaI371igKSc3fZ
	KqIWMlX6L0EZOFf+tBB8iB6tAtxSQJiWNelJz9kpbrTVodTGlGv8ccTdRoxiN+yqbgZGYWNAQ2u
	xKEFuSMVS4O7y5c8iCZN5ogey3mAZdDQXatyb5cDhGdP7I4JNc9nuT7dUf0z89t4RG0bA+KsQDc
	UjPUs5e1Kzji9bUmdftnWXS3DOmVMsrOruOD4/CoxyccWq7PN82f35SU/5d2MD1w9nP4PhhDvqp
	t9TmDkSS7S4t52lSzKs9NiLyJSB0ZQgXj786bAhj+V0OylqeZXeON2w==
X-Received: by 2002:a17:90b:3d86:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35db00a416amr378958a91.22.1774848312865;
        Sun, 29 Mar 2026 22:25:12 -0700 (PDT)
X-Received: by 2002:a17:90b:3d86:b0:35d:b00a:3c54 with SMTP id 98e67ed59e1d1-35db00a416amr378917a91.22.1774848312353;
        Sun, 29 Mar 2026 22:25:12 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d950d9b12sm6892152a91.17.2026.03.29.22.25.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 22:25:11 -0700 (PDT)
Message-ID: <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 10:55:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDAzOSBTYWx0ZWRfX/9CWfLFCREuv
 N3kAXwUGLuXZq5WVcMqcM5PH1TgQQwpLmlmsqqC8zfCVg7rLiGBgjLv5FqG/DdGiS7f2dRgVEhv
 ZeaRX8lcSfi7q+3gMrLYzol/2VPAWi2aQtd79VkIiTnvMZ9lasJ/EVn2DNMfDZ4abF4mH92YYZ4
 /sRrwV5m3GKTN3KOQjiebGfiNTTnwwaa+utLKwBvM2COOZlqhvnj2LwrBCvBuOmoOoSowPHll3P
 lyIqVa04qy3yr8drrOFYDSZCHLfiD8YankMH9DD/LpNF3DGTmKymkDRnmxvY5IEcXBEaJcTePIS
 HGSLaNsl4DOmSBHWtFUw8j8znHdHv3Fe1n5uLyRFb1L4AROrsCFEPdMSyqxW14SHZNVBQtaEuIE
 GXrHz9X/cJ6mOpBYf7b6kthAL6Td4qOc04sBG8wcFQzuaYwkoEldoIyMSGMnJz6fs7hOPpFCoTZ
 Ui3oeLWfsMAtotFM1Pg==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca0939 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=R0B0fMNruX7Akzlv-IwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: xWbp4zmqGq4gYiHdlIUD9igGnVmYH0C3
X-Proofpoint-GUID: xWbp4zmqGq4gYiHdlIUD9igGnVmYH0C3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300039
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100663-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D9AE63557C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/9/2026 7:02 AM, Dmitry Baryshkov wrote:
> On SM8250 most of the video clocks are powered by the MMCX domain, while
> the PLL is powered on by the MX domain. Extend the driver to support
> scaling both power domains, while keeping compatibility with the
> existing DTs, which define only the MX domain.
> 
> Fixes: 79865252acb6 ("media: iris: enable video driver probe of SM8250 SoC")
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_platform_gen1.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_probe.c         | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen1.c b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> index df8e6bf9430e..aa71f7f53ee3 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen1.c
> @@ -281,7 +281,7 @@ static const struct bw_info sm8250_bw_table_dec[] = {
>  
>  static const char * const sm8250_pmdomain_table[] = { "venus", "vcodec0" };
>  
> -static const char * const sm8250_opp_pd_table[] = { "mx" };
> +static const char * const sm8250_opp_pd_table[] = { "mx", "mmcx" };
>  
>  static const struct platform_clk_data sm8250_clk_table[] = {
>  	{IRIS_AXI_CLK,  "iface"        },
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7b612ad37e4f..74ec81e3d622 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -64,6 +64,13 @@ static int iris_init_power_domains(struct iris_core *core)
>  		return ret;
>  
>  	ret =  devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data, &core->opp_pmdomain_tbl);
> +	/* backwards compatibility for incomplete ABI SM8250 */
> +	if (ret == -ENODEV &&
> +	    of_device_is_compatible(core->dev->of_node, "qcom,sm8250-venus")) {
> +		iris_opp_pd_data.num_pd_names--;
> +		ret = devm_pm_domain_attach_list(core->dev, &iris_opp_pd_data,
> +						 &core->opp_pmdomain_tbl);
> +	}
>  	if (ret < 0)
>  		return ret;
>  
> 

Hitting below compilation error on latest kernel

drivers/media/platform/qcom/iris/iris_probe.c: In function
‘iris_init_power_domains’:
drivers/media/platform/qcom/iris/iris_probe.c:71:46: error: decrement of
read-only member ‘num_pd_names’
   71 |                 iris_opp_pd_data.num_pd_names--;

Could you please check and fix.

Thanks,
Dikshita

