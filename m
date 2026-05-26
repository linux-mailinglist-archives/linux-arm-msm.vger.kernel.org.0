Return-Path: <linux-arm-msm+bounces-109912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CT6FfvnFWqXegcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:35:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E68F35DB69E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 20:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF6D030170AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 18:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E15421EF3;
	Tue, 26 May 2026 18:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YTxzee/C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZ4jG3Ub"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619C240B6F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820526; cv=none; b=kZn22/LrlDs9GzK3sGk38025dICXuLTc5FpkbV8ZWkDjeFahPgQSk2+Dk3LT3EDA84neoOkaCqQut494i4pPZzRJsgHjLnshSZ9E2I403gLneI19hKkeC1DllFWThiVp/uhOFyN65Ca31tqb3nADA4W2kIx+YwGSSre0KNdTLcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820526; c=relaxed/simple;
	bh=XShyEC70wvRr1BVvQmCcjGI75vl0OQ839ZipTO+bUMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cQvZXCZvhv58E+llTEY3M1S9ZiYaqCUVrt+l31Pxb/0MfRVGp9eqSIPzyFDhZszOXzp12uGE7M9m7gEYddc92Msjjs+ibZ2g8NIfnWtTKtF9H5pIOQlebgJ9TvBBBpmVh8ZB2JGAPG32poyR6OB4p3I/93za1HBHuwEIhlBvvMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YTxzee/C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZ4jG3Ub; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH0x022977325
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EDQuCbgew80mDW3EHjwEB7on0f9SF/XtcUG6BT86WAA=; b=YTxzee/CpchOd363
	WPNMg0cXc+EFpnguDl8gm9OKElgiR46TSzPAlrct8a0C0qATTHmh/OU97uTCGhhw
	x5ZPoQzK1Z7Fogfu9CGEc8pwQCUTS8RT+i82PNC1rVlVXfZwFpHh5ogXXdHsYHJn
	lg8nXwPWpoP5I62tQgmzfDXMCAqyYRICiIRTd9cgAhVb9+c0qiFXDMRhmpx00T9u
	Kd1zO8VnHtG++NuLLWteMGUH5rZOk2miwFELMWnOt+Fj3C5/7ycPJL6mgeyjLuHO
	dH5Suhkrt08WQoQ8eY1PFrinMCVa3TjuRXg1kYoibrWaVI0nvRaU1gZsWXQh0X4V
	zyLW1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eddqks15a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 18:35:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d51ffb59so9761911cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 11:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779820523; x=1780425323; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EDQuCbgew80mDW3EHjwEB7on0f9SF/XtcUG6BT86WAA=;
        b=fZ4jG3Ubq4tUJ/TOwa9PhHpiS+ls/Dpapg9cY+S3Zl0XMLLhZc8LQsmbkPdP58Djn5
         ZuwvhwadMXa0EXBFsRvzCNRg7gXA/m7P513MecrXNuD2hYhelh4qaSjAQ6yWG2xBGxXL
         6OZaAiUEklc0INfp7I2lE8i31DhntkLQClzQ5mtVDnK3a/TEyeg4sZnJrCcibcaPmmBd
         wlWVsPAgNnipFshAjPeZNhmy6h6IY0GmbojPfA3u9+gJSFxQmTt3O6zTx+sYwh98Ed57
         JL1w/k5aEBtx15vnZr/AaI9hZdMep2eVR3YbEzKMo8wGk8zQeJyp81VxvrWiXW22jPzb
         2IkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779820523; x=1780425323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDQuCbgew80mDW3EHjwEB7on0f9SF/XtcUG6BT86WAA=;
        b=Yx/AXpNjyf5eZCz00C/Q1NB+MIiaIG3qPfcSeNYzj2ALK0cVI2DhgqqfMP181QFTJB
         IYCGKUSrE49k30s54VRMmDK90OhZbkRJzqqk6ktHMWLccepaq3ZOWy8vASaq84Ey1n72
         LVv4k6BKL4RAbgKn+8RBKcnvIMOPcr44vWh4TVEi3J53mfpevJ6esdzyTsRDNlFUi8E/
         8ZTIInLOeVyVpvmGZQBDnXXoOSOqwKpBV6fEXjkWXRsfSaaTp4344SQqNRPnGGjCmYu2
         DhXQG+KRY+KliF1exqMGogabOfLTrGKhz214R44783fwBuND1g8SBqCFvxK+eIm6ixbk
         Rg/A==
X-Gm-Message-State: AOJu0Yxl7WWy2LKhvVmv9VzaC4RPHisBVpDq3/7wqmBkBllQp56+Heqg
	wgA4WFZAWWlrBNldRc/NBUbSO0eN38ibOppleN90DEbOsNvvZ2aPBaD+u/Nf1qb3k90zhwQzuO/
	yvGw06BwJIBX6cz3pLymluo8wh4Hows9l2Q6oGMDGpSEowtInfl/9Hrftw5DNOBAF7K+5
X-Gm-Gg: Acq92OGRUvPlTGSDXoPWDZtoRp0uBAxRb5BFal81da3lDG2qhri86gGayEzbuz+QqUv
	5LwNNCfBruxMitpxittxp8WSejbNitiVxN1W6jChB5a9EUAPLM1roeHdh5qSLHWBsOKZ5OniWo0
	kQrutjRCD8AxSzVxTKblGCI3par+KvLyxdIETlfb6z0sIG31Z5LgrV2pI1S4Ba8y5oA0XrCasR9
	0HlNYI06g3y7SiApya3M62ynuDo9Xo+DojKbWJW99OKeBTlTYL6XgkupICu5AXDhOqbQ5rKvH2R
	RO9yC8y0My0Sn6uTar/1kPcsN079RlqUGqqPTKZYKLJFGM/gpDQu+RI6nIPc33S7rX7Ni7SLWG0
	u6/NNpX7QBd5h5DSBqTzLRodt2gJxBWrmUEajH9DeeW5IhKDiXGJhaztioXLwU498I2VJfqDuYf
	e/yWmw+wlj
X-Received: by 2002:a05:622a:43:b0:516:ea00:2eb2 with SMTP id d75a77b69052e-516ea00353amr171988621cf.21.1779820523053;
        Tue, 26 May 2026 11:35:23 -0700 (PDT)
X-Received: by 2002:a05:622a:43:b0:516:ea00:2eb2 with SMTP id d75a77b69052e-516ea00353amr171988091cf.21.1779820522594;
        Tue, 26 May 2026 11:35:22 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb548dfasm132928f8f.4.2026.05.26.11.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 11:35:21 -0700 (PDT)
Message-ID: <06029f19-86f3-4a41-aff1-d6fbc6a45193@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:35:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] thermal: qcom: tsens: switch wake IRQ handling to PM
 callbacks
To: Priyansh Jain <priyansh.jain@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526-tsens_interrupt_wake_control-v1-0-6adcd75555b9@oss.qualcomm.com>
 <20260526-tsens_interrupt_wake_control-v1-1-6adcd75555b9@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260526-tsens_interrupt_wake_control-v1-1-6adcd75555b9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Zubd7d7G c=1 sm=1 tr=0 ts=6a15e7eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Xd9C5ExLNSSwwYgCP90A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE2MiBTYWx0ZWRfX9WPA4Zshm95a
 +3nvw5AV+SJGKWlU/ltPiEv1i7HkQZKRHARA7yi4twI7ccPVCg/kTGGBIUhlq8dvEE+VailgGEQ
 LebuZPjlM01pVNR7b0iQ4lTs3OseVyQKktKMPIQm+HNs/34JeslZ1F4vk3pquDYBMoNF2J48JM4
 tl22N7cDGGekSkUbDicrNNLpnz/8OaL7dJeoIsIR704ZZ9uORNwXFJtu/Eots84Y3+On5IO2OVK
 ON8H99K7BmuRgtU+J2lHacyAVJEWEiNQSaGKSxylxljXDeZC7VquIsaHJv2ovjdyQGYrEk+3sVr
 F0WTf+70BQxchMCWEdYQadjNs2b3ZvT//3YZ/dRLhP3yBiZ1wUBU6Ncm3clge0ce43oQ2l0uhih
 LvOmx5KPz5PIQAuArQ18AH2Z11n3NS9ZfWQ5aik/rvqDN4GkDb3p7IJx8ws0tg4VChaVLukjDbK
 Xb6w9rqQ73C31RsusGQ==
X-Proofpoint-ORIG-GUID: AaAIJt1TgYW-y5Pzt-ZHwiaxQCR89K2d
X-Proofpoint-GUID: AaAIJt1TgYW-y5Pzt-ZHwiaxQCR89K2d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260162
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,intel.com,arm.com];
	TAGGED_FROM(0.00)[bounces-109912-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E68F35DB69E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/26/26 12:18, Priyansh Jain wrote:
> This change improves power management by using the standardized PM
> framework for wake IRQ handling.
> 
> Move wake IRQ control to the PM suspend/resume path:
> - store uplow/critical IRQ numbers in struct tsens_priv
> - enable wake IRQs in tsens_suspend_common() when wakeup is allowed
> - disable wake IRQs in tsens_resume_common()
> - mark the device wakeup-capable during probe
> 
> This aligns TSENS wake behavior with suspend flow and avoids keeping
> wake IRQs permanently enabled during runtime.
> 
> Signed-off-by: Priyansh Jain <priyansh.jain@oss.qualcomm.com>
> ---

[ ... ]

>   static SIMPLE_DEV_PM_OPS(tsens_pm_ops, tsens_suspend, tsens_resume);
> @@ -1172,7 +1180,7 @@ static const struct thermal_zone_device_ops tsens_of_ops = {
>   };
>   
>   static int tsens_register_irq(struct tsens_priv *priv, char *irqname,
> -			      irq_handler_t thread_fn)
> +			      irq_handler_t thread_fn, int *irq_num)
>   {
>   	struct platform_device *pdev;
>   	int ret, irq;
> @@ -1204,8 +1212,8 @@ static int tsens_register_irq(struct tsens_priv *priv, char *irqname,
>   		if (ret)
>   			dev_err(&pdev->dev, "%s: failed to get irq\n",
>   				__func__);
> -		else
> -			enable_irq_wake(irq);
> +		else if (irq_num)
> +			*irq_num = irq;

You can remove this check, it is a static function called inside the 
driver which is supposed to know what it does (like not passing a NULL 
pointer parameter).

>   	}
>   
>   	put_device(&pdev->dev);
> @@ -1232,11 +1240,44 @@ static int tsens_reinit(struct tsens_priv *priv)
>   	return 0;
>   }
>   
> +int tsens_suspend_common(struct tsens_priv *priv)
> +{
> +	if (!device_may_wakeup(priv->dev))
> +		return 0;
> +
> +	if (priv->feat->combo_int) {
> +		if (priv->combined_irq > 0)
> +			enable_irq_wake(priv->combined_irq);
> +	} else {
> +		if (priv->uplow_irq > 0)
> +			enable_irq_wake(priv->uplow_irq);
> +
> +		if (priv->crit_irq > 0)
> +			enable_irq_wake(priv->crit_irq);
> +	}
> +
> +	return 0;
> +}
> +
>   int tsens_resume_common(struct tsens_priv *priv)
>   {
>   	if (pm_suspend_target_state == PM_SUSPEND_MEM)
>   		tsens_reinit(priv);
>   
> +	if (!device_may_wakeup(priv->dev))
> +		return 0;
> +
> +	if (priv->feat->combo_int) {
> +		if (priv->combined_irq > 0)
> +			disable_irq_wake(priv->combined_irq);
> +	} else {
> +		if (priv->uplow_irq > 0)
> +			disable_irq_wake(priv->uplow_irq);
> +
> +		if (priv->crit_irq > 0)
> +			disable_irq_wake(priv->crit_irq);
> +	}
> +
>   	return 0;
>   }

If tsens_register_irq() fails, tsens_register() fails, then 
tsens_probe() fails and tsens_suspend_common() / tsens_resume_common() 
can not be called because the driver failed to start.

With the version of old DT without irq, the device_may_wakeup() should 
always return false (no irq == no wakeup)

Using the check on combined_irq / uplow_irq / crit_irq is not necessary 
because if the code goes after the device_may_wakeup() block, it is 
because interrupts are set.


> @@ -1276,15 +1317,18 @@ static int tsens_register(struct tsens_priv *priv)
>   
>   	if (priv->feat->combo_int) {
>   		ret = tsens_register_irq(priv, "combined",
> -					 tsens_combined_irq_thread);
> +					 tsens_combined_irq_thread,  &priv->combined_irq);
>   	} else {
> -		ret = tsens_register_irq(priv, "uplow", tsens_irq_thread);
> +		ret = tsens_register_irq(priv, "uplow", tsens_irq_thread,
> +					 &priv->uplow_irq);
>   		if (ret < 0)
>   			return ret;
>   
> -		if (priv->feat->crit_int)
> +		if (priv->feat->crit_int) {
>   			ret = tsens_register_irq(priv, "critical",
> -						 tsens_critical_irq_thread);
> +						 tsens_critical_irq_thread,
> +						 &priv->crit_irq);
> +		}
>   	}
>   
>   	return ret;
> @@ -1343,6 +1387,8 @@ static int tsens_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, priv);
>   
> +	device_init_wakeup(dev, true);
> +
>   	if (!priv->ops || !priv->ops->init || !priv->ops->get_temp)
>   		return -EINVAL;
>   
> diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
> index 2a7afa4c899b..83a8f3580ed0 100644
> --- a/drivers/thermal/qcom/tsens.h
> +++ b/drivers/thermal/qcom/tsens.h
> @@ -567,6 +567,9 @@ struct tsens_context {
>    * @ops: pointer to list of callbacks supported by this device
>    * @debug_root: pointer to debugfs dentry for all tsens
>    * @debug: pointer to debugfs dentry for tsens controller
> + * @uplow_irq: IRQ number for uplow (upper/lower) threshold interrupts
> + * @crit_irq: IRQ number for critical threshold interrupts
> + * @combined_irq: IRQ number for combined threshold interrupts
>    * @sensor: list of sensors attached to this device
>    */
>   struct tsens_priv {
> @@ -588,6 +591,10 @@ struct tsens_priv {
>   	struct dentry			*debug_root;
>   	struct dentry			*debug;
>   
> +	int				uplow_irq;
> +	int				crit_irq;
> +	int				combined_irq;
> +
>   	struct tsens_sensor		sensor[] __counted_by(num_sensors);
>   };
>   
> @@ -639,8 +646,17 @@ int get_temp_tsens_valid(const struct tsens_sensor *s, int *temp);
>   int get_temp_common(const struct tsens_sensor *s, int *temp);
>   #ifdef CONFIG_SUSPEND
>   int tsens_resume_common(struct tsens_priv *priv);
> +int tsens_suspend_common(struct tsens_priv *priv);
>   #else
> -#define tsens_resume_common            NULL
> +static inline int tsens_resume_common(struct tsens_priv *priv)
> +{
> +		return 0;

Strange indentation

> +}
> +
> +static inline int tsens_suspend_common(struct tsens_priv *priv)
> +{
> +		return 0;

Ditto

> +}
>   #endif
>   
>   /* TSENS target */
> 


