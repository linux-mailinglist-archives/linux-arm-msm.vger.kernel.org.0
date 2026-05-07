Return-Path: <linux-arm-msm+bounces-106304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPe4MxJS/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:49:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EB04E51DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23D6C307B040
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:36:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71B03806B5;
	Thu,  7 May 2026 08:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXU4aRlS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GoGdyGom"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF31A31AF3B
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142905; cv=none; b=kExnMV+LgGPl43GOB++LsNT2JhmwYxQvCA440rJi8s3rC11HfiLo81aJyeaqDsbeKmO3Vk9v60n+dzunUSO/Q0IRbPRCAsT+6NBJsrMmBSRiLGzckOfuWiUpjSq4xlFUolxEz/u9t7wIVQyh4HTbkUPPDyACS7y8vyiHyOfBHiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142905; c=relaxed/simple;
	bh=LMqROSuajz+PWuBt0xHHNxUH2N+B0UWtP08N5eUq/EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nf5TQQyt7LLbbcBeuzUWkTe0fpdbsmVtokPU02GOwCL/Rp6sSqPje6VT29scI+W/dKDSvTbtHKKxzSWcNG7ELHwzmwPjWRfi/yQobYIzLZxFj9xBePDlbHsCaY9kFhQW0A4JUXLLG4SeH+HiFnV2zLHpubN4JIYseYvtfCVJQPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXU4aRlS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GoGdyGom; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6477q64k1425037
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 08:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZLEprv08ng8QG4vA0GtRduxj5Wj+FiN0/pWFH+mdbAQ=; b=NXU4aRlS/JmpC5eR
	cUlBEq8qGqxgW6cfAxwVVUvXABKgoKQwHwXKDJ0M/MwZtL1tvqB9l2IygQYo4HWk
	WvXIcZT3o5AFiTheHs+9HXFceIjGDaSZ4l3YnLmFyEWM11hdpZpGLmf8QtJWmsqj
	hkIYutdAfDWRS82ZpuOVfyrkAonzScCr07zYbI9b+nlvPoQvbcOVGBMXuu+kZuzB
	AVUJ2Mcg0bMV3db/K9wuiYuJ15uD/GqRH7VxqbiW/SuzlieemXdDE7j1brNP3t28
	YVcXFtDNeb9VyzeS6aR+finbuN9HNi/G8Wi1JKcMron3uUy+E7SnmVuWR/BlB4yM
	QEidkw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0pqfr5bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 08:35:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d84b5f73bso17497011cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778142899; x=1778747699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLEprv08ng8QG4vA0GtRduxj5Wj+FiN0/pWFH+mdbAQ=;
        b=GoGdyGomDuly17nT7Sjtn2mBXLekLBOjFNtbacHcqs/2TYU2cRMjCyNj5HNi0iE08T
         e74NNNxQlbZg2CI3XHj6dJ4IUxUVRuHCgWMh7rYpLAWrPQ06Xinnj+NAYiWAVImWG2d0
         wGEeUffWcaKmfg+g9okXwvSs9gNWijvPzGj+G2s5svDiQYuD2quBAetICTDezH8iR5eg
         FfaUIMMg67fVsgJ99HjKm96pOHg8vUQeG5zE4dRqaNvkjfg12lx9cAGSBO85CCfkSRae
         WcnN49YssLS/ZB7mtQWPTB5u2Ge/17+fzexJrZrs2DdLd6pdC0J5ld47ktjcb6h2o6B6
         w2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142899; x=1778747699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLEprv08ng8QG4vA0GtRduxj5Wj+FiN0/pWFH+mdbAQ=;
        b=UbNJofrbYgJci59RzRrp3UV2RIYYBTeWVO66n2mCAIG/STs2X6YbZkvbrlWIbNJAx5
         Ah8PHumjzn/O+6EfaugLhKLClaOXZZJUTXxx91N/igeT6gSy/7TMuuZI/Bv8NZPDI71k
         gn3JDBdhMSJLpRJd8A0xrXPppS+FP63W/AW5jCD0POsgQMF0I43S8yxYoMSGvclMw234
         eE4XqWx+rVzNORTP777fuSAr+WC6m6/oo/keUL+oqRTIM7sAJYDu5KQh2IAsG4xzgxMW
         x/DU2v+5fMcVeDJGkrRyElgB6xjp3Fi/e42X189zF/BurK7Q3VuSUh1ObMuCDogiICpQ
         TcXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9twihitYYYHDXvZCcbhSlkUua7A0uaM/xH3prTAf5LBSOIQZ7A5TpBbib5BxmN68qV9yRF5+RtVhCZ49Gp@vger.kernel.org
X-Gm-Message-State: AOJu0YyksRSIxPmlebyPqwtzanxLGf3zZTfrkYs9ZKrUc7eU7Xnp8eEb
	3+y0yI3g7Pfi0Aeh1hWl6PEpaxR1iXjFZmyCbpYiRaYaZewMkyLIT3fxuuC3V2ftFM3dhuVtHf9
	AvQjPUqv8ZBTCD0uh6kZmdb7NkE0jR1SPklMRZdtA2aHaYnrIJ8wsGE7/Z0weJis9m9d9
X-Gm-Gg: AeBDievyyjjjDqYJmHRQnE0hL29VGJ2BUChy6ITwhKTXc2mmhcJI0F9dx/uph8Od/cG
	GWHs294ubNlqFtuMzqPjZGXR0tm24bDLbBslBB6rU8xSC7DVjCKqkqHDnaW6GdxkwkxhM9wvJ9o
	uUXqr9l8plBgXXifwPNV/tJeNzqhGSPRC+GAUXhblU4t2vgAw0fW6nv5ZKMM+5EKXA48z+8Ud/g
	F/WFrqiwXi7cnXqYRxvG+VWDC5Z8z0+1E4/mXiRNQ40BRHu7P9W98ZxnxUdC0SmpjknbHjUTmBw
	qoJrseZwGNyN5rDMCJ2obaOnhZxaGclkLMc4uagZ7OUAKFmN6CmiQv+yETB8w4C7KmNC3VPFmZV
	72v+jmYq48oYfZPavYuSt3X4JbKfEUNpCC6cbbmFCsIeboS0fQAUSMp/osKE=
X-Received: by 2002:a05:622a:620a:b0:50b:2d93:97bd with SMTP id d75a77b69052e-51461e671d4mr94196191cf.24.1778142899546;
        Thu, 07 May 2026 01:34:59 -0700 (PDT)
X-Received: by 2002:a05:622a:620a:b0:50b:2d93:97bd with SMTP id d75a77b69052e-51461e671d4mr94195901cf.24.1778142899098;
        Thu, 07 May 2026 01:34:59 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-67cd904fe68sm1872140a12.0.2026.05.07.01.34.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:34:58 -0700 (PDT)
Message-ID: <f586f504-ab76-4641-a80c-1ba7cc2d58a8@oss.qualcomm.com>
Date: Thu, 7 May 2026 08:34:55 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] ASoC: qcom: sm8250: add Senary MI2S RX support
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260506204142.659778-1-val@packett.cool>
 <20260506204142.659778-4-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260506204142.659778-4-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJB1jVla c=1 sm=1 tr=0 ts=69fc4eb4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-T4oWIldSm4hssfr7QUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA4MiBTYWx0ZWRfX/WJBjpjOaSgS
 dxImP2b0YiqTqH9s/H1H3KjuAm2NrtAgaH5Wyc05CMYYs4H6J4+McG9bqMNQDLoZFJE3Kz8rmoU
 nzeAfCDDK/qXay8DkcS9B7qGJlqCayuHMKg82PJAOmmLX2boZ13vPGRf1NuwJb0t2yHXIXozgRb
 XLzTG5FblNVaVQErcL6DkFgMqsUh+rjrgfbWnO+8qbMoa5GQrjcp/IbP+2ZWhrO9Ue21jrkGSx3
 5TdPTFFsTYSVYMVE6rnGolcMe5waFMzPe7fQcHFcNyS40EmOl1+AiHYdBhryPY2k+jyNdk1/ywX
 p+ziT1RvjTaFFB1Lp2DacRpRJWlpSFWaBpoUCdV+EFEUKbw0czwWuOI5jf1AN4zvmv8ycv4+lUq
 AIrfeFhtvwVsDvH9f5KxC4jPR++1NuMXXAQd7spZ6947lvEz1KVZCzuENdkeCr7J5OYxRN/TNFQ
 EVrmesFdAn67Db2qeNA==
X-Proofpoint-GUID: pvveMvtLJZw0jki6sKHsQHmZZ4DK4fg4
X-Proofpoint-ORIG-GUID: pvveMvtLJZw0jki6sKHsQHmZZ4DK4fg4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070082
X-Rspamd-Queue-Id: 36EB04E51DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106304-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[packett.cool,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,packett.cool:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/6/26 8:33 PM, Val Packett wrote:
> Add support for the SENARY_MI2S_RX DAI which is used on some devices to
> send audio data to speaker amplifiers.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sm8250.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
> index f193d0ba63d0..a675913da943 100644
> --- a/sound/soc/qcom/sm8250.c
> +++ b/sound/soc/qcom/sm8250.c
> @@ -112,6 +112,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
>  		snd_soc_dai_set_fmt(cpu_dai, fmt);
>  		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
>  		break;
> +	case SENARY_MI2S_RX:
> +		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> +		snd_soc_dai_set_sysclk(cpu_dai,
> +			Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
> +			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
> +		snd_soc_dai_set_fmt(cpu_dai, fmt);
> +		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> +		break;
>  	default:
>  		break;
>  	}


