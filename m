Return-Path: <linux-arm-msm+bounces-115391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kkNoNVSrQ2qoegoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:41:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 869716E3B9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:41:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=RHFj5iG0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z2EqDQLV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115391-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115391-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D5A2300133C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56947403151;
	Tue, 30 Jun 2026 11:39:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B74233958
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:39:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819580; cv=none; b=o1se14G3y+Ienxqok/RpVDT5glTfZJwAAPU94PMgdS8Paw2WEg6GU827d4eMegb5tL4w2y5VVx9NwNupFrJnduhvZFrZxAH7qlJyTRD66YkbM5s8zFsVgyVgLcnOwfH4ii8J0e7GEFwGqj6GV+KP2+CM6b1KX58MAMmvWeqwwaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819580; c=relaxed/simple;
	bh=dTV3MPnIioxdSrn8J02he+ujmPpSp+0/L58Xubw7F3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i2HnSeYNhpfzfrn3qi/FvlrLsD1X0ODQHUuJpws7qs8glY+pl8g/yqlCXP0NT2TZat+iBt2upBWr1uMJUJ0/Vp2Oc1qx9vZvQIXxlv0+Y9rdtkURZGRz4X2UPn6HzAgWUzZQg/zVK0MrvxuhiP66lAWFAaOP0ntZdKS2HbKK5Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RHFj5iG0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z2EqDQLV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9munB1604830
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rdbY7oOtbUjem5ySMQM5N8rPfYTeW7okkUfToKfplx0=; b=RHFj5iG0e4+cC7rJ
	qDaSe6mYVEEvAudWxepD9Woe0NkROI3wLfQ5wZI2KCVVS+apPaeQsBNu84FoCfoA
	Ab/FZvygn1hfEgculA3RtOuvugirEv8liX8UrGMO7G9t49oRQmBB7N1VPkE553Dp
	xu7xG00v+YPyhKg18+ZGpPl/F9t53dK1ars0kUkrm9E/QRwHgH/BmcsoFNPOItEb
	Aln3D81u7ElRWghx9nEQN7/Mk/aoa3JRERwqo4AFRqKT/yA5Ugo/RKPHRp7l6sUs
	SV7qqt4IPkXG6wgoCBYBheNrq/Ru2Jgs1TA7Kp7yS8u8VEaAbZegDpOni8jKyGTO
	a6lwJg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfjesj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:39:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1857417aso62451cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819577; x=1783424377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdbY7oOtbUjem5ySMQM5N8rPfYTeW7okkUfToKfplx0=;
        b=Z2EqDQLVeUCK3xQJSXg3lxYTUQ1s0Wi+lZypmK87d2j1vfUF4phV1rG+a2qS/d/HNz
         2C+VvmOvXOJ6brVaGctkqr7Hi4vC4HqISDaLFHfRlLW5uHy8OUF9KN0YOBTx2BWwhx22
         TQ0rCkG3xbmsoggc+rV1kIoIEK60vzr8Yvbhrek7LbnW0CPd2LPB8hkkSgtqqh39i1fz
         nal7noub1QguEWbmtvdEGJ+luJQcmgjDUsq0b3s11jyE9g9KIu2VOcOGrw5ljjZJbVui
         B1ZdZskYGs5z/tmJ7yXt1JOKYBHjU2OxODf1zX+TeHiqswo6mXCeuR5JH14BnocdDTpf
         36Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819577; x=1783424377;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdbY7oOtbUjem5ySMQM5N8rPfYTeW7okkUfToKfplx0=;
        b=A+67YVnZTDhaEGS2QLhsfadYkjGlKsSO7VIWQP/9j1FpCS0Qr/IvcWSQJH/BDa0Wo2
         sGAywRIISBiBrzwy74y/XAxWVZj4ZF9OWNrzMVMHTpfo+wqIaogNfkvwBVs4XvT6+taq
         8iGDi1m3OAcq3VfMJtX+DeGl0wfU/4nnVwKycmWvthK/aDoC914NP+LKNnmfl6IpzQph
         7soXF52TLxZ4XFYbnlquG1EYfEb4JstTLMG/h0t/CyFA3xkWp7pO7Hfk5PnQBZNlyRtR
         y3nmLC8jPoN9kVBWH+elBTpM/+6+REh6MgNRxIyoJkGO7y/EzZWkmpKHoR2jifwVVYDY
         ZfjA==
X-Forwarded-Encrypted: i=1; AFNElJ9gdCwhSQaR6Y7poxAUqgQjCC+CWOT9r1T01CmH8H6UjFhPuOIsv5+tQnvxyc2DNPFffRRTngplYC5LA+09@vger.kernel.org
X-Gm-Message-State: AOJu0YzelgeLOo0rQwTNaEOKrt5ouzU6rYBq9b0Xrq2oQrP//lcsz7CL
	o5//o+98h7AoGhfhUf1ku6P8HnkSEZvXRrae+7SekgYtI4oOzk7TTuiUU/v8XhkIo2mnoEyJDa8
	qBoF316eWv2FxJnw6pfV3Chan1vlEU1kVVo40yKEBHvvDFwBRa3qYtgnDQlNfy/H0MGA0
X-Gm-Gg: AfdE7cmcgA5wepLV1WaMSxTy6/aLhUFw21T4r5H6qQPiM28ZAzqMXcc745/Q4tX0nIo
	c2gC2wsAPSLXkX5AJHd6cll82GpIe6nG/qiC7B8E+QS4tvV5j9H/n9jr0IWnEyYkLGO50IGQ/Nn
	0SOO3R+TY1shKhiM98ZvES2LLkHj3CSws6/MbRQnj7gYdFkpa8JZyBZQj1GEWiXBTazUJXb3YSd
	ZdIMnRGl6hE5my71jJq7WchH4jkuVAwmNY2ihAA/8aN1/2pYRmnpMIy+RchSs3UGOMQx38Gq8MA
	ZAqyl4lmPl1pf7ZoU//w31L0jRjTgqUZltiKCF7SWsRbBZMLX9dBgzIfC+LlnK21jTChUUJ4jnj
	rB+WcVIuC0QAA6r15R0rEPLcIXuD4fOpDWuc=
X-Received: by 2002:ac8:7d84:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51c1074ddbfmr27483661cf.4.1782819577364;
        Tue, 30 Jun 2026 04:39:37 -0700 (PDT)
X-Received: by 2002:ac8:7d84:0:b0:51b:f40b:2faf with SMTP id d75a77b69052e-51c1074ddbfmr27483481cf.4.1782819576932;
        Tue, 30 Jun 2026 04:39:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f0cb71sm109324966b.39.2026.06.30.04.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:39:36 -0700 (PDT)
Message-ID: <ba7d8d85-0c9e-48cc-b238-597653115c7e@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:39:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] ASoC: codecs: lpass-va-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260629-xo-sd-codec-v7-b4-v7-0-fb37ce457c42@oss.qualcomm.com>
 <20260629-xo-sd-codec-v7-b4-v7-2-fb37ce457c42@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-xo-sd-codec-v7-b4-v7-2-fb37ce457c42@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AScbztVvW63FPSkE-BV-Oubvc8ryY_CK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNyBTYWx0ZWRfX6vlHQ9e8DyGV
 K4gKevD3m7LVDSqQ959c2OF/9Y88Q6zkeCSeZ7xn11XrpRJo6ZRQ4wWnCY7IztUwlYFMJHQdwc2
 7j0mZ2UHv3rG9Gi83tAPr6IXCohgihyuMIlGe6eguxK8KCPAEK5zE4WWn+N3/zOVfeDYwYSwkae
 RuV1Hx3s8jxRVrjuN3bzZgqAan6x7VZepcPUv00rE7Kl+j+vYBiEI1Tnb7GM+znHiyyNhGcWaGq
 hORu98horm2grvAlfgjyR8gcsMn8TvjO/nj9gGzsv/gNcDEPioExaC1A8/L8iNXRUxA2d7JCPVJ
 sdr1JJWOPdSgtpGy2hLddtI1YP3qbML0qGSYlT4SbGvQ0sHFzf0uWDJADL4XkZRxqf2lZVyMUtv
 mJevQdbkoFSxnJmsY0+AZK0JgNKwaJSKvzpBlDs19tQ+fwg6AsQPe1DPfyp2sstMGe+aMm28NTl
 qCz+utuwzNnvcKZIovA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNyBTYWx0ZWRfX2mhsszmlFPWC
 rYBo9pV+rv6C4ucOrNZNKxjInw4CnDQnfMUI8PoeOia5Z2RNfbtpgJiFnasKA2o89d/QenRd1Ho
 n0r68vl+BdDKMclYqV12KGjtLgtXtRg=
X-Proofpoint-GUID: AScbztVvW63FPSkE-BV-Oubvc8ryY_CK
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43aafa cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vZmOQDSLvvN2LDkdrM8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115391-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 869716E3B9B

On 6/29/26 12:05 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS VA macro codec driver to runtime PM clock management by
> using the PM clock framework.
> 
> Replace manual macro/dcodec/mclk/npl clock handling with PM clock helpers
> and runtime PM callbacks, and keep runtime PM references around fsgen clock
> gating so PM-clock-managed clocks remain active while fsgen is enabled.
> 
> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
> after idle while still avoiding suspend/resume churn on short gaps.
> 
> Add a PM_CLK dependency to SND_SOC_LPASS_VA_MACRO since this patch
> introduces PM clock APIs.
> 
> Improve failure unwind paths: handle runtime PM put errors in probe/fsgen
> paths and restore regcache state correctly on resume failure.
> 
> Suggested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]

> +static int va_macro_setup_pm_clocks(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = devm_pm_clk_create(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_pm_clk_add_clks(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
>  }

https://lore.kernel.org/linux-arm-msm/84167531-b252-425c-bea5-49992a9c4500@oss.qualcomm.com/

Konrad

