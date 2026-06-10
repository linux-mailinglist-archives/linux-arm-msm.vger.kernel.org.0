Return-Path: <linux-arm-msm+bounces-112398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DJhUBkJDKWrPTAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:58:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A699B6687EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 12:58:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bz3tNq2I;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PXPAEes6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112398-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112398-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 307A130A27EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1193EA97E;
	Wed, 10 Jun 2026 10:52:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7863C3DD50D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:52:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088773; cv=none; b=gSBIAzPwBeqt8gL+2g0f1sbWXPBciwcPSrlVCH5vJrHOlWk9ugFu+f7rSJ6Nk24R9wHDM3qLFh2Yq/3vwqaseRlsuvHzaFuAcVpYA7hiSubtqpgDYQoWxcxMRhtbIa6Ry1G7wRsdNyV6gEhHovcGEA2x1UCiHLZgh1boUxtm5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088773; c=relaxed/simple;
	bh=+fVsd1Z1+tIzaGhW+BpuLIuaSGTLG0J27IW8uVttLPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fs3mq+PGi8WHPYGC/8MujvZTdW/BIlC0M0fpIWfgsEo8B+qt1ebvYDt6c6QLMa4WX3z3DTzF6URHX7k37Q6Cbv3BgX26aJTcbNku2b2n1Kp8a5CoNO6P3z2XLbAjWJia1UTTneMwGiUL4ddDjmN9LSQ7ZWHlYuWgDV2KiBeolRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bz3tNq2I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXPAEes6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hmYP531598
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TK96IQjgP90UGFdgjcEfW6TzZ2WJM/XtcB+xnxS45I0=; b=bz3tNq2IMi6oxKBJ
	/0CcPf1Q6ZILQx56EV7sbjNaWSukT/dHmMCeu62boRm2mbwH2LhwNwhfgbasC1mE
	iEML19TM0kotrxGdKuylFxjFb2eKb+tfTkvdHLTB4ko07aoUprWS0YgRHFrzNWnm
	6YPMN+agwvhG/8tXWCNKwzAydJQaCERCjyP6KwN4r5rkayRhqBF5Yus3zS9YmrHH
	mUwQ9zu9W+1Qq8J43aziQ5mEET0RuGxY/LQd7SCN8jIt+zeiI+ARHvoJYPsJ+GiT
	cS9yYJQyyhhobAhLiKfebjqpok1qY7BUgTdMY4yC43CJH+oIu9U81bsdVvWpCQTm
	tpbJLQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0m1seds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 10:52:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91574ad6871so810801785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781088770; x=1781693570; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TK96IQjgP90UGFdgjcEfW6TzZ2WJM/XtcB+xnxS45I0=;
        b=PXPAEes6FuM9eUswKJLn1lqirl3DoTY5t0o7AdR+XG7T8OjFFe3OK3/ttCiZ3Bl7R9
         rME7U3Q4EDzJGkCpZk7B5MhvDGxqNG/tjmluUe3YJ3tKrG7sj6FKgLY1rATbBsO6AsuM
         nZltocGoymir18wuHZuMwy2wCb/DJGLvVJiHB359tSm3Wop+mPrQmyWhGYZYCQ+8NoCm
         wl+2sWqj4mrL0uLb0ByX07MDqfYdX6ql4QrSDxhvYaM2YrI/IVK7EWo2K9RBNk5CpfYO
         IcfNyYykYBWG35a6RcOMcbGs5TB3hgby28XaflC+wkAfqL43kjhQ1v21IuZH4foKO6iM
         WmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781088770; x=1781693570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TK96IQjgP90UGFdgjcEfW6TzZ2WJM/XtcB+xnxS45I0=;
        b=TRlV7pzNywjKfHn/NvW78g40ULPjA3DfSPfEJijI7QeNB4IihWefT+tdtYsMoI8Con
         oXJnbilgug8j08buvRF7ukGBleZjQ9hv3VJoM3IminCz/rq23mKzdWcgoKl9b0EXQTs9
         1YcKP+qBup+foXmuSfBJJS8LDWT269OiollHLvrEn3noJ+i1HeWMzOLi1XyWIbMgkz9M
         ocm1SQ0ZfWDQPoKkfqv+XcItMS5Q/FCSZ/k1bcvwj7ylAqzvKw3zI/UxSQOYsRjlZWwE
         YBkrKd+C6/HgJRrUnY59LHioPRdiqDDH7S5acsS5n3YQwNx3gK5xYvBaby9rMA52ZGjT
         2ulg==
X-Forwarded-Encrypted: i=1; AFNElJ81cE48QERjuc2AGDbo1GnCd95zRyQLTiDtdL9Jw0o/5//obNV5ZOIKqA9IuqIikxJYCH0fDoHUOBEim3Re@vger.kernel.org
X-Gm-Message-State: AOJu0YzXbuXv063tfqE+KLgqmfPRT1H7aoeq0L7AnnF0YW2RBHD5cJY7
	MEthlxfg/3UZm1yDSRf04R6ZIDc13bndodfQnHkHRDnaTvT0eyd7+mkcNW3FNEsIM1RYGN1d3Dd
	1LGmBodCttFfzRYGQaNpfTDcvTnm69CRb7Pa9JoQ+MCC8zL5UugBs6jMtVAkd3q7alfGq
X-Gm-Gg: Acq92OG6p1CxGSxWNitTxf+T/LuGlliYqFPgP2TqYUgkpGaJ75JyO1zz4aEvuKRyKZv
	5FwMH520UrRoV8K5AMYtNXc+2wpiugGWQoU5/TFmvLgcFjWv6AXg5hhmryBvMJ5WCkWv+jJ/Me1
	MI/bFLPWZOOKTGIKAD0nkHZBC93fTlWd4jnq9LWJhce+f7pEwqD+07x81OftTSNexsOWB4w+fUG
	L6GuHGdXrtrfhIyEw9hIHBG6cdkYjCyaou/IoM6KzRrR/NUDJtxMRxGmkxB80SeutDlSLSpcNpD
	yoFsWHcp6zQXViM5EHoLcLyyPepilHD1EyboiRzYLQsVr6n/kj6Bq/fSkiYn3E+cT96a0ErfMI5
	aeUSNR8u4GyCUQ/KjvcLbbd2NPzsPp3VzZXwk/GVRTW3z5VNWdFoQdMrej0U=
X-Received: by 2002:a05:622a:53c7:b0:510:1325:58b9 with SMTP id d75a77b69052e-51795c56255mr369073611cf.41.1781088769699;
        Wed, 10 Jun 2026 03:52:49 -0700 (PDT)
X-Received: by 2002:a05:622a:53c7:b0:510:1325:58b9 with SMTP id d75a77b69052e-51795c56255mr369073261cf.41.1781088769303;
        Wed, 10 Jun 2026 03:52:49 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf055309368sm1154147866b.49.2026.06.10.03.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 03:52:48 -0700 (PDT)
Message-ID: <311ceabf-23ff-471b-9553-797c7d76af74@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:52:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: Fix LPASS Codec Version for
 SC7280
To: Luca Weiss <luca.weiss@fairphone.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260526-sc7280-va-macro-2-0-v1-1-2c1b572fa388@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwMyBTYWx0ZWRfX2/q80D9l4m6y
 QivtvWP2UwkuOK71ykFBLEVrQSOVbXZD+FtjwxPkepPiE8Kc0bapOCnw7UW6EwQ77AlhD8bykt1
 kR8fPoVLzxQbglLtBLLHh+7X5idBUKMoUJJsFeZHxLILo8tBnjCDLocqnIruXZ30LibXIk/HXX1
 u2e4XA+j9CNGQFMGe2+czLoMsjyQZim9yEcXPnFvQOalRd67Fq4PkrdsRmSVMczojMBLEzwHuhZ
 6wK1KGKbnyxS7sMlkeNnSx9k6UrUp3TRlizg9PzgXFDA+A9lRKQnSES/H330buamnsSsPcG+9ld
 ysYtCCoxw04YfrTNN92H8ffab8ZtnTypHSTJ7WkzKt5E8UPngjeNTmwrzUITr3yziTU6iubaHdt
 JdiyXyqb/s9CxEoHDToUME5w4qkYrnAwKz58qNyOHFRkh2Qay6pfDe45eTP5rh62hphAVDAHEVa
 nmcGt4iXHjKe81UBiPA==
X-Proofpoint-GUID: HzQQWyqSqjxerYlUtvW6Pp5kk6UQBcs1
X-Authority-Analysis: v=2.4 cv=UdJhjqSN c=1 sm=1 tr=0 ts=6a294202 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Vj5VumI9SRvEE-TA0EoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: HzQQWyqSqjxerYlUtvW6Pp5kk6UQBcs1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112398-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:lumag@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,fairphone.com:email];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A699B6687EB


Thanks Luca for the patch,

On 5/26/26 4:03 PM, Luca Weiss wrote:
> According to both the static definition in downstream...
> 
>   yupik-audio-overlay.dtsi: qcom,bolero-version = <4>;
>   #define BOLERO_VERSION_2_0 0x0004)
> 
> and the runtime detection:
> 
>   CDC_VA_TOP_CSR_CORE_ID_0=0x1
>   CDC_VA_TOP_CSR_CORE_ID_1=0xf
> 
> SC7280 has LPASS Codec Version 2.0 and not, as declared with
> sm8250_va_data LPASS_CODEC_VERSION_1_0.
> 
> Create new va_macro_data with .version not set to use the runtime
> detection and correctly get .version = LPASS_CODEC_VERSION_2_0.
> 
> Fixes: 77212f300bfd ("ASoC: codecs: lpass-va-macro: set the default codec version for sm8250")

Can you help me understand if this change was fixing any issue, if so
can you pl add CC stable

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> I'm fairly confident this is correct, but please someone double check
> this if they can.

Yes, you are correct, this is actually Bolero 1.1.0 Version where things
have changed in codec. if you read major number it will be 1
This has been artificially tagged as 2.0 in the driver.
So the change that you are doing is correct.



Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
>  sound/soc/codecs/lpass-va-macro.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
> index 528d5b167ecf..58a5798823d7 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -244,6 +244,11 @@ static const struct va_macro_data sm8250_va_data = {
>  	.version = LPASS_CODEC_VERSION_1_0,
>  };
>  
> +static const struct va_macro_data sc7280_va_data = {
> +	.has_swr_master = false,
> +	.has_npl_clk = false,
> +};
> +
>  static const struct va_macro_data sm8450_va_data = {
>  	.has_swr_master = true,
>  	.has_npl_clk = true,
> @@ -1755,7 +1760,7 @@ static const struct dev_pm_ops va_macro_pm_ops = {
>  };
>  
>  static const struct of_device_id va_macro_dt_match[] = {
> -	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sm8250_va_data },
> +	{ .compatible = "qcom,sc7280-lpass-va-macro", .data = &sc7280_va_data },
>  	{ .compatible = "qcom,sm6115-lpass-va-macro", .data = &sm8450_va_data },
>  	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
>  	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
> 
> ---
> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
> change-id: 20260526-sc7280-va-macro-2-0-f0d4591a611b
> 
> Best regards,
> --  
> Luca Weiss <luca.weiss@fairphone.com>
> 


