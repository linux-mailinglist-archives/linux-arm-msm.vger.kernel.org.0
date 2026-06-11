Return-Path: <linux-arm-msm+bounces-112778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MY05CXjaKmqmyAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:55:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB6F6733ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 17:55:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kEGc+5EV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VjpSuprW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112778-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112778-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 84F64300CBF8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 15:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B2A32937A;
	Thu, 11 Jun 2026 15:55:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1B032B109
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 15:55:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781193317; cv=none; b=KRPMY6YtLCsN2fKPKHU0TgZQCd6xzlzwC+EIMPrL8hsHj0JQbeL91Mt7GcpAInoe3kGas25ShQoS+RcH9lLUP6EF7hIPXTrbmS7BsPwYjt6u4EJmpaULsSJOibAtzQsSfEnR9M+7QaNaJqaQvWrpy4F9V+kBC3DzcGgdOZFooo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781193317; c=relaxed/simple;
	bh=avkg9TFKpuU2Qu8wzOPGfAq1uMzxTaGqoNOBxxhNwhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JZhp0Tk2sOrffbc+bRSmKYy1AQqArz68BSvmWwYJhspv3/ph5GkIxYPuXVB5NcWyY9mVKtm9G9rtZuetnRUTJRkiITOXyMHweH5iiAUVNypcQFMCC7gBXOyO1jROXMUJGFVLqgC7Y1LeWO/L0pJmbXJ743nKMml0xuAEpeFZ3nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEGc+5EV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjpSuprW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BErmdv832226
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 15:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDDrFdehSIttJDTr4lCVUeMi3IR2K5vas2Hj897Tpos=; b=kEGc+5EVdD+n/3p4
	PYHPGd2a/ejc5G3gxlnFdNd7ZO57JmfPNGqGLTv4wyyqkwiYTbGJltHvyM8RVYAV
	EBb8G88EzN0vNF8uRsuQcFaQ01T+KsL2jAGKv7JVNLCbEHw/9j8+qPb4TCnK8YFZ
	qXfSc+zVkiGUZPjQBOPykYxgd7L0ktQTHRuEKy/IeKUe8J17GldnWN4mRpIXdgi6
	4E8KLRv3tyVhm9OgY6wLCsobLI1/6gD06c2XLrolLrVqbc9jAp/uvFErI9mWbbyn
	sstDrjCTDxBrTVZUtK4eDXQmlzzM/0B/MeTU4sB8swhVDzkng8S3LQGMW8lYe5HG
	gXq5vw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6vc8pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 15:55:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c0532a6588so17005ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 08:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781193314; x=1781798114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDDrFdehSIttJDTr4lCVUeMi3IR2K5vas2Hj897Tpos=;
        b=VjpSuprWEwUJBIq5bPFR4Sxa2YKLNSfUokA8XQypWLKsX1aLIkluVKcLAdq9GwGWSs
         H0s6NH72v4Ngqcy14TxoWzdLOk29MbmAwAOPcCHgfRLjg5uB4nb0JFP3JxymmQXt5utf
         wnW/aCL7DYJUgivo3SOnHIIgY3lY4Q4jbEtNClsgwh+VTT6JL3203PJlXiDaSS0opNla
         RRjBmK2HNtkusGC7IuVqtzo9b50VjVM7WpulYNvpHKLoDMd9XBy1WgwXNdWX/HxPebf+
         HVS1TbFxy7SAhHdjJCGpIe5gktan9x4RS8gXS1ixt6wXYCoAz8qZ26rnIuFFD9JWxhBp
         jXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781193314; x=1781798114;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDDrFdehSIttJDTr4lCVUeMi3IR2K5vas2Hj897Tpos=;
        b=S9zZK0Jip1/+VGH1tbjmzonYeYL/Dr18O7YkYKGUrJRmIZeCzqy274BmzujpDdgp7A
         MS3Lp0qhBhkXsWNKsoLNxaehYtGbIQVdaOY/B0VTofgHnXjq7ugcJREufRRcfhZlXFuK
         GUTlnsd5zQC4vPLchSOt+yVNjYLCYGVRts8+w/R1CXoAjHn1yL3vP1j/hoolTdSrGP1x
         3pqrg8pqtAhw/Lz+QIx5LxK8UCOi+b1XNEMeUtIePHIcyenPY25D+61Lla6uAGSOI9Wo
         CmH3mjIc8d83+i+gINlew/vJvy23EXqfjmFwy/gTrKdd5G8SlSbRtXzS3VLEFnaAy1gc
         JEFg==
X-Forwarded-Encrypted: i=1; AFNElJ/LfLHaNa4gLzDyqVl/Zc9Kn0U8n37R8Z2+xaFwrCcACnA0+5tZ2AdROr1nqqUA37ft9TXu3xNAxsTRV23Y@vger.kernel.org
X-Gm-Message-State: AOJu0YyyHHiuzfWepsn9qqQXpy6xT3BfFLIT7QvikCf1ukRCbcwdi/8Y
	nz6S3U7fLjIX5icA2JiWRp3wK1Gmi84fhzwFH4QpoWuFKBKM7SWaDDwi8sUTt04d9/vFWvev5m8
	sBFy+2Sn+Nuco6BF0+btoivh1JPbVyUjHfS7q09NndexyPBXuTqA9r8oV74t30sRFppuR
X-Gm-Gg: Acq92OFe3Tn0zpThoWIzOdg0MUg0NPLi3Iwjak2r2hW3iVyrg2I4zpi2/K4bJODC3Rd
	kErd4EQpwy36uYXiVB7ewbrRsXxgrKKR0vMlDRA64bpV5T2BCkiftHfBaRiTOvZaV7AjEKCg2QB
	79qvzdiKGoqG5TR8iq4om9rrdo5K9lkJxuf95Mub0dtZ0TBQZImFeP7UsvFtObkYg2IGZZL8MeW
	05xx4mbsWTLDYWiEMjeuAdX8mSVep4hMmBWmdiT4cDCSZ9VpvEWZGhP4cNRywYaGdKyurKmK7sE
	zhA+SUOlRJSEh1qMPUPCyBk4QvYD13hvWAR7jrPbc3MjfQWOhToBBjF2O69giW1AnJby7c89zgv
	uIEDEoktWhYLPJ6WhGS1lpV+zrkBrHNhF27Jz6BFH4px2+QYqcpGRC+itw4dV
X-Received: by 2002:a17:903:1a26:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2c2f092f624mr37182975ad.11.1781193314011;
        Thu, 11 Jun 2026 08:55:14 -0700 (PDT)
X-Received: by 2002:a17:903:1a26:b0:2bc:b80f:6782 with SMTP id d9443c01a7336-2c2f092f624mr37182305ad.11.1781193312971;
        Thu, 11 Jun 2026 08:55:12 -0700 (PDT)
Received: from [192.168.1.8] ([122.174.150.90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166391d53sm360566745ad.65.2026.06.11.08.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 08:55:12 -0700 (PDT)
Message-ID: <69a97012-f807-43f2-bb29-f688f4a0aa53@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 21:25:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: remove unused lpi_gpio_write
 function
To: Arnd Bergmann <arnd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nickolay Goppen <setotau@mainlining.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260611130308.3415258-1-arnd@kernel.org>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260611130308.3415258-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BBaRoJWbQYpHX_zVas4cvpWdnvMqIzi-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDE1OSBTYWx0ZWRfX2QU7knLYThh+
 UBTlOnKTY59lsnpfcZaLLRq5/LkJO3gsSC3aGkHNNWQSNCdzQ1p2GgZDqQ2sBmaIdaxqvRF70Ai
 5rJDF4h2FaeyfU7enarSzgVaJsnGzyM=
X-Proofpoint-GUID: BBaRoJWbQYpHX_zVas4cvpWdnvMqIzi-
X-Authority-Analysis: v=2.4 cv=UsRT8ewB c=1 sm=1 tr=0 ts=6a2ada63 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ph9GlEvSy1Vz2RjkXBjw8g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iL-JmrzYUvOobxPIQykA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDE1OSBTYWx0ZWRfXyZlHY0kPUICp
 75q3w7QPyHE2GCTnSfDCMw5LY/8hwmBf5wRu2dmTfHqbl9tpv6x4202CPM5YesqfSAHDay8CMXZ
 fdmGoury0pyYJ7MyLDZP2X1XDb1ikMOA6yjYmaVuIs3aq6dhijWaFdXHQzuF9UhKicQHMqtJp6S
 bKonAbI6dMjg4Pbylj6rRg2x9f0W6CSPs93vCImjlHAEazM+j5bB5MpHZrfFIQwBUHk7wO261Xu
 sNRFAhXVzZ9FZRCFOZ4QExpEqyQ9WXWmpxC15uHrM7HS80aKKk1vV0qNnOkhzWw5VLI5HuuBDWe
 I5HFqZR59TPxkLTHr0kJjFfRYVaf/kyUBatfL0y2hU2CTZELeYA8WaO13CsYogLqZvXSg+R9yJR
 4r3gdKwQRj9ULiacHWkBJb8NN0GXOGX8rSx+itQwoWR7Y3lhv55phHneVeVdgiBS1/D4IqoA9CB
 TNvzczOjw8Lb06S1YHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_03,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110159
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112778-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:andersson@kernel.org,m:linusw@kernel.org,m:arnd@arndb.de,m:konrad.dybcio@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:setotau@mainlining.org,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1BB6F6733ED



On 6/11/2026 6:33 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All callers of this function were converted to calling __lpi_gpio_write
> instead, so it now causes a warning:
> 
> drivers/pinctrl/qcom/pinctrl-lpass-lpi.c:82:12: error: unused function 'lpi_gpio_write' [-Werror,-Wunused-function]
>     82 | static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
> 
> Remove the unused function.
> 
> Fixes: b719ede389d8 ("pinctrl: qcom: lpass-lpi: Switch to PM clock framework for runtime PM")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 4d758fd117c4..fe7ec0176081 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -79,20 +79,6 @@ static int lpi_gpio_read(struct lpi_pinctrl *state, unsigned int pin,
>   	return pm_runtime_put_autosuspend(state->dev);
>   }
>   
> -static int lpi_gpio_write(struct lpi_pinctrl *state, unsigned int pin,
> -			  unsigned int addr, unsigned int val)
> -{
> -	int ret;
> -
> -	ret = pm_runtime_resume_and_get(state->dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	__lpi_gpio_write(state, pin, addr, val);
> -
> -	return pm_runtime_put_autosuspend(state->dev);
> -}
> -
>   static const struct pinctrl_ops lpi_gpio_pinctrl_ops = {
>   	.get_groups_count	= pinctrl_generic_get_group_count,
>   	.get_group_name		= pinctrl_generic_get_group_name,

Hi Arnd,

Thanks for the patch.

This issue has already been addressed and the fix has been applied:
https://lore.kernel.org/all/20260610180012.3505877-1-ajay.nandam@oss.qualcomm.com/

Thanks,
Ajay

