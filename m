Return-Path: <linux-arm-msm+bounces-92283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC+GKvDViWnSCAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:41:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D6C10ED99
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68F2730038FE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 12:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2877F37105C;
	Mon,  9 Feb 2026 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNoqEvrM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GXPGGqTN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54FE23A566
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 12:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640848; cv=none; b=QIzfANDiy8MgAo0DJ/YjbIQvXuCg2SYjNW5cOwOw7aXYs8MtjMf2kS0HUAkW+hG6O44xMfMT6Fu0jD8/aV0WeHi58Chfp3hm+5Z63gfABnd6TSl0zsUvR4MREsG9U2z1sLcafGEeltJzB0rVgvjhcFNTSfWx5ZZ6TTRx91kMKl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640848; c=relaxed/simple;
	bh=ES7MbphzMp+ci3vhRVhNHkGcR1tJN7DXD2qrmd6AbY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7f9Pi0dwfKyelECPpzaW5PMY8yNGsXJjq/33J6Z9CqSN3OOJq2896n3CtOo2dEDFKUsQiJU26RcaqJLkR6JAmEmeLVBxvE5Q1xUdH8IQrEciY8Dhp0lLx+xfCHujXSUeo7FJqEwCkyHwiGEvv4PQeS2twY76HZtbl32AwDc1n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNoqEvrM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GXPGGqTN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619ApFKd2586852
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 12:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WN9tqgPbQkP4/Pfcl6gFkd0S
	cSfsJMCMs7d+UWaJzng=; b=WNoqEvrM09Wsw8usGz80NQGG6WKRvfAFMrzAgYLJ
	p3466wSDr9DjQCVaT4PisUBgkOI7xYKvgkzdcHdRHBqsNMVGty8ZUvD8ZbcUlA10
	16J684vgIGb5cM72zf+RqscUbvVLfQj3vcBPy9w6PUu9opkVKBM1mr6N5YWTCmBd
	vm7OO57eG0evtfEjht0QFfBec4pcuM7snPdZNCcULdpK20iu4CyGFEkm80KZ+x6p
	Y/IQVEpCgCjw4Aw+cXMhNEMdbKMBVPpSdCweaWgBtmHOz1DZSIa3lAbpz3cHV8H3
	r8Po0t3wh3nPc1qip9Ooylm4UryxnL0X/1FFMlVaYM9/og==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c793bhfe2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 12:40:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb9f029f31so1856570085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 04:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770640846; x=1771245646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WN9tqgPbQkP4/Pfcl6gFkd0ScSfsJMCMs7d+UWaJzng=;
        b=GXPGGqTNH+yFAPLlyiZed+Z/HBUIcZ1VjSFTS8Jj3QxRLUMdWkdSgzCqWIezdOcMRG
         0zxrXfK/uzO/2u8yZOwl5pl1GfjcDeO0moy+TzuOC2hMZdhOXhqy9w0FZ0sCK1iH1SS8
         0HDUfmNF0tNUp31s2lkXcOBbe+jBt1UXsVJEO0tsljZb7LgKrezVRsFGLEGzEMNii3O1
         tr4D5yBfSho+WXuU29yH/PzdkfNjYcPQeDYJTWNeuvOnVbLJQO0XIx9pA40xvQMmw+OQ
         I+5QQiTK4kyaXyiFxNzPYZ86CPtGYNmNnXn9VBs7linSHBcaZ8/8HfDcHpYfxZOf8PA0
         SfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770640846; x=1771245646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN9tqgPbQkP4/Pfcl6gFkd0ScSfsJMCMs7d+UWaJzng=;
        b=l+2r7tYqX/f19LlR4jy5sXU38fQqTSIUVDUa+ecddcnapw3hJ6740t1hvd9zCgeNMO
         Z2/qBlHzxuhnLljJCwEumYmnJSWc2bEBgFKtKftE3dNk7+QLVeHFsG2SoFEgwjdW+cli
         WgDMkQ+3c43peFRNlhGUpdOwczKPGbDUukNdPYrRiejzlemXgGdvuH9X3ujJXKvk6ycg
         RH5HPUyeL6s+IB4b0iHOmossNTgR9EPgI0J+fkZvx366e17h+5kATk6PC8jdyhQ7TkXf
         r0/ao3P7twjIrrw2f0EN08HIdHbgxN0lOW0XNIi+qupSHnEj36mVmFg3px1tb4pbv2o0
         P9Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVGPhycR7YerTxWKg5wKJy1IUyL2mVWg+xryXpTrZBkuG2aaa6IfuqQhqkOpIirfz66bQwbKbWVa80JNSHu@vger.kernel.org
X-Gm-Message-State: AOJu0YyTWYWU222vT5JycXQAKEEdNujKTsBbeyztWtZk81FKiVZuKHJH
	GDtKKjIEqBe/sEVFLrqI+l8JMTz3Re6CQocs9dBWkxg2LFLrBViKUD9hFxtw9DZOuj4kCYP8Abv
	fLOBeAYZmlw+mlXV7j4sQc8FZXuGQ+2XV6dde1gphfc/k6ouDvaWgThYwYENeqsXgrAK5
X-Gm-Gg: AZuq6aJKMyfVWS77TPaNhfSGgBlvH1vDGikiYd2xIdncEW57yEiQ6l7wR7yhxOZ3sTW
	CfRkYgzgDRFeqZtSPw3XgOzcMYuRjgfpKpaj+/jeRDC2+Hc4O+HMWUryzzdkHUok5/u0vR0rjDw
	0W7y/p7D1wMnl6F7IJ8O2CxTy8cmS16bIJnWDRd3PK5s1FhlVpjTbgnukNVdjaL3cTzCwneNYpK
	UP3vnbD7fzYau/kOXoissR64nhimXaKDF10l5uKH7lvBMxLWnV+EnpiNopZuY/9041DoeVDionE
	UDu9+U6oaiWaqFLBhGBSA+/zWQLUrnKGPzrIhi3tmFQzUcNAx2wlmbmb6fiGVZORgEZN6UXhOt/
	ZedFjOSpLPUO3ON+jTkIx78y3iddJHyNmGbaQZ11bunnrnX2NcdOhm0XItCXCiLsWhXLGm7f7S8
	rj2ICWt4Qbh/oaApwy4Q3CwdM=
X-Received: by 2002:a05:620a:410e:b0:8ca:44c8:3540 with SMTP id af79cd13be357-8caf1305d73mr1509010785a.64.1770640846105;
        Mon, 09 Feb 2026 04:40:46 -0800 (PST)
X-Received: by 2002:a05:620a:410e:b0:8ca:44c8:3540 with SMTP id af79cd13be357-8caf1305d73mr1509007485a.64.1770640845656;
        Mon, 09 Feb 2026 04:40:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b63b043esm24955091fa.32.2026.02.09.04.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:40:45 -0800 (PST)
Date: Mon, 9 Feb 2026 14:40:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] soc: qcom: pd-mapper: Add support for SA8775P
Message-ID: <x4muzue44tizvlrhtrmat6f2rdlqkzwuuo6l4553lgrewlsr4a@n24bqtl6jn6s>
References: <20260209112947.930853-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260209112947.930853-2-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209112947.930853-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ctOWUl4i c=1 sm=1 tr=0 ts=6989d5ce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=DdPnDyeCPROT9MEh6rcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: kO6bcWHWoUy2dWRkIxUAIj91HcN9DsO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEwNiBTYWx0ZWRfX8iEIf+/7TUQ4
 0QFRcVj0xD+CaLHFaPeq8Jr/WtKlPY7MFrcuBC+7eliLh1jd6HQlmwGAI4k4L6wcujl0vf535+e
 lsBxEyLEO6OiHwY1W/D5m2pJ0ZfHlAH8jUSaj0WmjG01QlDHiEtrc8qGIOZLcZEslKbNPzxQy47
 mPiv/6p/BWTkAQApxi0OmOONdTivSdM6uIgMCOuNRF9zs+Og9p+YRjIlpypaeS4cKvOXaV7pPKs
 3qcNw3sZ+uiQBijzWKvr879AgsTg9XyAwuxNoCUTZgocQ+0qRAj3snmwTlSZ1HXuy4JnePiiEFN
 DfiJ9lDNTvvq7S+q0RX0X06tCg2eHeEMTyRMz50onWbZH+sROQxbU5u0jfE2k8xBJv8Jg6eLz4d
 aqizM0PC82Dn3trBQ2x5RVOxXNVUmHh4jjBkhHM9Dd3cVWgopQi/i2z/TFatGkIp7GM/TN7yvhe
 5f4jtnnw8DXV6Duyq0Q==
X-Proofpoint-GUID: kO6bcWHWoUy2dWRkIxUAIj91HcN9DsO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92283-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 18D6C10ED99
X-Rspamd-Action: no action

On Mon, Feb 09, 2026 at 04:59:46PM +0530, Mohammad Rafi Shaik wrote:
> Add support for the Qualcomm SA8775P SoC to the protection
> domain mapper. SA8775P share the same protection domain
> configuration as SC8280XP with an additional gpdsp domain,
> except for charger_pd.
> 
> Add an entry to the kernel, to avoid the need for userspace
> to provide this service.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 1bcbe6968..8b899ec7f 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -305,6 +305,18 @@ static const struct qcom_pdm_domain_data cdsp_root_pd = {
>  	.services = { NULL },
>  };
>  
> +static const struct qcom_pdm_domain_data gpdsp_root_pd = {
> +	.domain = "msm/gpdsp/root_pd",
> +	.instance_id = 192,
> +	.services = { NULL },
> +};
> +
> +static const struct qcom_pdm_domain_data gpdsp1_root_pd = {
> +	.domain = "msm/gpdsp1/root_pd",
> +	.instance_id = 241,
> +	.services = { NULL },
> +};
> +
>  static const struct qcom_pdm_domain_data slpi_root_pd = {
>  	.domain = "msm/slpi/root_pd",
>  	.instance_id = 90,
> @@ -401,6 +413,15 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>  	NULL,
>  };
>  
> +static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd,
> +	&cdsp_root_pd,

Is there no separate PD for CDSP1? What is the difference between CDSP
and CDSP1?

> +	&gpdsp_root_pd,
> +	&gpdsp1_root_pd,
> +	NULL,
> +};
> +
>  static const struct qcom_pdm_domain_data *sc7180_domains[] = {
>  	&adsp_audio_pd,
>  	&adsp_root_pd_pdr,
> @@ -572,6 +593,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>  	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
>  	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
>  	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
> +	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },
>  	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
>  	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
>  	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

