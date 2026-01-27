Return-Path: <linux-arm-msm+bounces-90807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP8lLU7aeGmwtgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:31:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB3596BF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3144330C96FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D54F35EDD4;
	Tue, 27 Jan 2026 15:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0wQCVMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvyZEfgF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF8435EDC1
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527026; cv=none; b=XLHOpJvlI4w2hIFDjb2ufjx7hj0hItOwTBQmIoG+LFtXNPEh5uoAoC6lGpOyAnRhdXkwQpFyPGHKFaVM5vjYn+UYIom5G4KZ9iRHsUR1u9eIYwM6qCUy5uwT3XOTBHvuIJOBZEhmmOqwxYDrWTqSgYhVXPF9XLDSa/MubKhlOO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527026; c=relaxed/simple;
	bh=JWBdnz5pkI+iV82GSzw+ArNjbrodHgJkyOm/BLaBisk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJtwvuc9xWaBBnp6I1xPDCac9EQLbHUx1lTe+Oz73fZXvsJ796wMLk5K+OUBNN11gWNh/QyQQMVB2aEKuesN86TuTHKq5zg3d3aSvhr92EfiYfXQHUMjQDImT9HBmdSnqymUt5aEIG5k6E/JuHDcFKKdKCUnkqDrPtIFN8a2RoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0wQCVMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvyZEfgF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RDJ9jZ658432
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GEY2W3pf22NesAWCubbh1bSX
	uZTageutNiMIFhJKscw=; b=S0wQCVMkoYC6Xkrg/EL6D1XkgLx14RP53VkUNueh
	zMIo8cG307ZsKKTbHslldohp/UbdsKAkyKKmt7tfJUJo+tNNuR7dg5aU+xq/gnQ7
	aQKrnVhDqHLlbKqzv1N/i7Xa4G3W/0EraoivhXUtZxl/VnTW0BqwZSNEvvH0RN0G
	3mnRdWPVZa7CA8z7hdZO7PR1KUwLQ0sQHw1I9g/wd6WW1ndd/oaK2+RYOzQEVvZg
	ZTZyeD1CbTsWV3EWgbXZ1X6C6Ny8G195smhKp8ORecFWCm55zx3fkjRtp/+b01T8
	b2MlgzRMwEZ77jPKDD6RxrHh/S7t9XmRasXoxqnxf4OlKA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxryn9hgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 15:17:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56637daaae5so15906763e0c.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769527023; x=1770131823; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GEY2W3pf22NesAWCubbh1bSXuZTageutNiMIFhJKscw=;
        b=QvyZEfgFa8XwQuhHaIBQqOCvG+cyPzBhRTmlejvQvqpb4yePPAYJSmbApHPugIYdxC
         rJcJMGZF9w9MxAc1Suku6xaezzPBUG29DECtRtSDGAh4gLcea8g+5rQpEInUZBCTNhfD
         dHBCRVUOBGKr0JSlRxxv2z4JxVMI+n0+rtMz9YRMGBIhRe3TVhhUXIsgAUVxw338HhHF
         MbERBCXPVRJUCxeedKpAwFFHaQ51IpLDFX3mWg4Pf3tCrCtMpz/8Xgps4Wazz7gX/NfU
         rZakVa44ILuljUWWd8GCqhR3vMmmuKgX9/his5Ogo27zRj2qbyca1Ag9IcsWskEupn8U
         h2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769527023; x=1770131823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEY2W3pf22NesAWCubbh1bSXuZTageutNiMIFhJKscw=;
        b=dYlLSwpIlQZIwLn3cbfgPF9jH/t4XPfwpaRH8g/yFhR/0bGMCxEl2AUJwZkJWgXj+h
         vK9sawNn4JC+Ogt4dI5Ei+eGm3v3l6aISj2SMu3sjNQWq7AYU4ZJ28ZRN8bqq2RVUAx4
         Zc36DHVlUqm76w89U4fAT1m/MJK1ZSljeb0nM6nxgd4u/AV81l0ri/tD7tZ8JO9q/ra7
         QfOdXiLajY92TS/KbkWOQwfH3rVpFSh8n7Flshh5Y24aQh2VQ69qDZojST6ZEeP9YAy1
         2Ga9TEFUvGXGPYU6X9VfCdKoVqVvXqYcM1pGLTwH5sxVputPnHuMpUG9zmuEvsguDcoe
         iN+g==
X-Forwarded-Encrypted: i=1; AJvYcCWKP3j6pdrCV/7/bfcaI1B2f9WbXdTvPXDHNS9D7ZCF6tLxgRM0mcz8+Lk51zSx81L7/sqC7evLyzbJXIDd@vger.kernel.org
X-Gm-Message-State: AOJu0YzbxUL5Z7c+0U8zicKShlf28nCK4+QFrZh7KTnHQC+MUMB+zCSF
	NSZDYA0AbqWBnTbRRgvroqEEeeYV3UaRAmI0xg60JCpTdpY5fbJNe/0D5/oE5tVO5SkJXcHRRtG
	XMPicLpNY+DahCQEEs1PlTc3Jez/JmeKZDe9ZaTYy7yl6RnNUdE7iWuFexhA3JhYLQNMPYTFUYL
	Un
X-Gm-Gg: AZuq6aL3i8yOT0AidmHMmOcIdDgiO13vu9FXtCZheeHKHTcxSNYLNm+fajoJwDokOf5
	Gpd3E8l42/lqJt/c0QS8qtV6s16yfk6NHwb4CzpH2+ZwytTR0C3/JJZ6bEcJcAgDX7PDlqBAwPt
	mjj1nCw7bUBgg+lf0ul3HI4RMKnvwAR9qP3wSIz5lh2wMDkCnlPLkGxpUmo9dbPtnFHn6NH3UDw
	2GSPMTZXoZF68SeDiejKHun48Esq8dl3QidDkwOzVcvapOdQMa9Rc9xumarFAmRS4rdOS8RtZqI
	IVLyktB4aLjyQXgETkljrvdZhac+FYgmrhxMo6VKcCahJBxt4apPXU0Fr/Ko0QqNx8B5vT/eCQS
	SWGjlcbE5+Qsr39GS+Go3pIGtU7JtQK+9WEigEMbDTQSwLn5eaAA+0kvi+O3zv4/OUuwh0GhZ86
	Dim5x2q7fV3g/I3msWdIwKgW4=
X-Received: by 2002:a05:6122:20a2:b0:563:5143:e3ec with SMTP id 71dfb90a1353d-5667949f159mr624187e0c.2.1769527022675;
        Tue, 27 Jan 2026 07:17:02 -0800 (PST)
X-Received: by 2002:a05:6122:20a2:b0:563:5143:e3ec with SMTP id 71dfb90a1353d-5667949f159mr624157e0c.2.1769527022211;
        Tue, 27 Jan 2026 07:17:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da170f7bsm32392151fa.25.2026.01.27.07.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 07:17:01 -0800 (PST)
Date: Tue, 27 Jan 2026 17:16:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: pd-mapper: Add support for SA8775P and
 QCS8300
Message-ID: <e6broy5txvtit5m4otegrmyip5f2iotr3usnpsi2pzvkpeyakl@t5n4smiovw64>
References: <20260127144315.4125110-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127144315.4125110-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: xVREFG5TnJ10XS5t68bwwFPb27voBgNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyNSBTYWx0ZWRfX6vIhri1tVz3G
 AtuWLT8hlzArdqF/Bb03H3yEYNa+brMF2OFXFrTer6SaFgopSkqhL8G3lB1/U09zF4YXZQ56PM+
 3sC88zRS+cPqDAXvz3mmYyx6lEN1jyoKXC5Z5veYiTGVx8tQdRNUgumRItdclzMxZ+11vHGUVP8
 HEtXmLNYuViG12fKPfxse5P+y//l8Tp3H2JpxLMvrvZ7+97vze4/lZQYOX5cwVVcEKOszCzXzlc
 CC7UD+NhwZaoH+X1WNUnZqf6Bw2nzTs/QUl9XrOz5RWkhVjvD9/MLvcbDeMZYs9UdSnJPs/HbOM
 v2bnysEtH0sBsM1pj/TU9LicWsSeGekmEbWtjVGtUMV101pD26zfJDJKe3WgIMQDZ97HQ4dRyVy
 2y/hp+LOM1Va7pY251u8g34fPfY/wP3WDPBiTJidSb/EL0Q65fAmGX08G2Iaf6fwZvU5Yzj9LNh
 0UiZZe/pG9xNL3s9EVA==
X-Proofpoint-GUID: xVREFG5TnJ10XS5t68bwwFPb27voBgNZ
X-Authority-Analysis: v=2.4 cv=FsEIPmrq c=1 sm=1 tr=0 ts=6978d6ef cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Pdx24sCGM6MBHu4ez38A:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90807-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1FB3596BF8
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 08:13:15PM +0530, Mohammad Rafi Shaik wrote:
> Add support for the Qualcomm SA8775P and QCS8300 SoCs to the
> protection domain mapper. SA8775P and QCS8300 share the same
> protection domain configuration as SM8550 with an additional
> gpdsp domain, except for charger_pd and mpss_pd.
> 
> Add an entry to the kernel, to avoid the need for userspace to
> provide this service.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
> changes in [v2]:
>  - Added missing GPDSP power domain configuration as suggested by Dmitry.
>  - Link to V1: https://lore.kernel.org/all/20251230102508.1491296-1-mohammad.rafi.shaik@oss.qualcomm.com/
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 1bcbe6968..aec7ff054 100644
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
> @@ -401,6 +413,16 @@ static const struct qcom_pdm_domain_data *qcs404_domains[] = {
>  	NULL,
>  };
>  
> +static const struct qcom_pdm_domain_data *sa8775p_domains[] = {
> +	&adsp_audio_pd,
> +	&adsp_root_pd,
> +	&adsp_sensor_pd,

I don't see sensors PD in linux-firmware.

> +	&cdsp_root_pd,
> +	&gpdsp_root_pd,
> +	&gpdsp1_root_pd,
> +	NULL,
> +};
> +
>  static const struct qcom_pdm_domain_data *sc7180_domains[] = {
>  	&adsp_audio_pd,
>  	&adsp_root_pd_pdr,
> @@ -572,6 +594,8 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>  	{ .compatible = "qcom,qcm2290", .data = qcm2290_domains, },
>  	{ .compatible = "qcom,qcm6490", .data = sc7280_domains, },
>  	{ .compatible = "qcom,qcs404", .data = qcs404_domains, },
> +	{ .compatible = "qcom,qcs8300", .data = sa8775p_domains, },
> +	{ .compatible = "qcom,sa8775p", .data = sa8775p_domains, },

THis is definitely not correct, QCS8300 and SA8755P have different sets
of protection domains.

>  	{ .compatible = "qcom,sc7180", .data = sc7180_domains, },
>  	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
>  	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

