Return-Path: <linux-arm-msm+bounces-116713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KktlDgx4S2rJRwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116713-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:40:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9578070EB08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 11:40:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=mJvdy0FY;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ye5oM7O6;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116713-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116713-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDE723063CDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A6C422556;
	Mon,  6 Jul 2026 09:11:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9351E3B52E7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:11:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783329089; cv=none; b=Gt3IlpY1Xq+9Ec5R/0DUwezhlFQuwhsN9kR2FNuWmSaBSuQzF73COzJthzv2i0mWiqEDis6M3k4LMOk7qiOy9UOuG9HQH+gPJgA+YtzcpwQ2QB/SChF8PCFmdG0JcsaPUeTFOwG+FLvs9qPvMi0eQghsmfNmkxVh2a2M8+i5s1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783329089; c=relaxed/simple;
	bh=INACSRF0fMlMov5Ke5zow+WhwK613mlG+72Er7VCwbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M4bIDEV9NrUHBGN6oPciJVKLT8UFJlWt+VZiteZvehu19JgsWlgHGR8K7dWhU7/oLej3bz2CiX7H1xz8izkj2nC2lpkq30zr55UV8MT6+t/RkElyOr8Tl3T6YFylIS2u6s5CE4MezFynGmTJL2MoCw6zOKJWK2f+tl94dOFbq1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJvdy0FY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ye5oM7O6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666947Qr104035
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbhTr9uhP0D20AAKNUPS7YeXV2C/L9L9t4Xe4eF6VBE=; b=mJvdy0FYGEC1xWeo
	ZMxMm5fDDkulgM6//y4jhJj3sLS/p7Yc6FqUZmpSnewA9/prOmY3SczBtkkXM5wC
	eWe8I6BmOQn9zNyHQcs1ex0s7nZOJ1SLdvJ77HgPG/retLeWj7c2VXDD6Kupawab
	A7W4vIE/W7ymcSDZuYLOuDsPA+rgp3K88WpRpa+jqxtoD82Pcegi6B9ylq0/L16Q
	GiY6ue9vG94e/WatlEgbZvB01oY60TrTMMj2MSYHFRZoqOJpo+6hJd4G0XpdIUJL
	WikppTlj7PTHh6Gq2ni3yr8HBxe+IcFSBxQI3U671/UcluNwydqQzEX/eXOtz4RN
	yv2cZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h508yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:11:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe75b7dbso9189351cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783329079; x=1783933879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbhTr9uhP0D20AAKNUPS7YeXV2C/L9L9t4Xe4eF6VBE=;
        b=Ye5oM7O6+ktjLZCD2JZ0nAuF/nVQMrxnfRAvyX+felSrjojUxSiv3cH1nhgr2xMJ7C
         WR+BduM56g9SA5RMgNl0LF9NyreNLGhgqi587SBKhpNCIePeb2svIQQg2jl8sOSwMvq7
         3BFnFSNDZDHum5wT8MQ6ZsmgAyDWYfzfhuPo1vSusaq9xv2NODVueVbIICoWjmWmsZz/
         KFNQAYU5jR0jV/NEW1yO79xU6Ns5HZqMbd0LQR/l4YKIpVrgWVf+XFlcbt5lwF0K76AN
         5WWFAhBQkOv4HGPT0eB/hBv5K6r4TXLj5T8D/gKspEQShkE5OsPNUEE0aZbFZLgs1/Or
         Od1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329079; x=1783933879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbhTr9uhP0D20AAKNUPS7YeXV2C/L9L9t4Xe4eF6VBE=;
        b=RdFR16N85Ctt4loNdTSwuvJb/czkfh7oTsKQ3NjRywrf8a83blHyMOykhoRzkMR6ck
         EorChQjOp8V1tXxtj+VMwhw5+GNJLprrSmmRQ6OHD5XTPS9iH7jaX8RTR1B7fkQ6ph70
         I7cZLgoswiTFi7L/fOdih19jclUWxajiyrNGAP1hZWA/2K39wOVhaWqpbL0DAZgAKmQi
         xzOAdPn+TGrFB5izf+5sNWkGXvlXok+LfVxzQw8uJoYVas7VqovYiMzh4dnoFWkF38x6
         9rU+yIX1m2x1LNl7GAOfqzMsUBITW0RAAojuChyu6LcWuvbceImT9kyuJlNJyc5PvX61
         /w6A==
X-Forwarded-Encrypted: i=1; AHgh+Rq7B0sq6x7O4ORfpDMpCDm4APa1AFfbkBIcvvquxRT+r46wPvG0+BOiXFAMKXbevsaQkw4CwvcJ9w7U3JqM@vger.kernel.org
X-Gm-Message-State: AOJu0Yya7dYQV2YfRYqP8UHqwaFqzMjyZ4D12y+LkD8xZOoVLwyorHNM
	srbNE7qIj8l8vCgFgu70kO+YL1lMU/qmSifpOfsExmssP/clrVFdDayVwz8EiY9b5G/3reIX+/y
	fy/qtmU082nfYcMfgXqv/B4vl0bM+hOBS43trHTycz3g/WGhHa+WKU8DJ50gLmD0SdzNe
X-Gm-Gg: AfdE7clWKutd3NirhFgEjlhfwzzuez7Vz7wHczjD4QGDpn4C5L95+qcavx+U70rzTBd
	9VlgSQJ6yGJhasqR7iEDfVgy2DW3lx2ya+SUMvYCEvpy/qzrb0ijbIvrXC3C/pGt3fhT/CylnRH
	DAKgAXCJws1Ms2PZlZYp2ZKpLrXagk9eOJiTOump8fPwVjpssTHHkVdhhn3gHyUC2IzJ1YIk31v
	cwqCcqVKTtWq97M3klyi7rqUvhjtPxcQWdEodb3+XbmgFhkFMUABlzYV7Y9Oa8jpBbTo4jcUr2W
	AG/o1dXtZ6CWlYQjpD9t9WnYhRg5uvpCDG4ZnXlJvD28P/titx2jaB8BbEZG5mjoDn354m8GyFm
	PNKOu+dx5uD5LP9ejfx22fYSuT34ViS+K8lo=
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84781141cf.10.1783329078902;
        Mon, 06 Jul 2026 02:11:18 -0700 (PDT)
X-Received: by 2002:a05:622a:349:b0:51c:d16:b498 with SMTP id d75a77b69052e-51c4bf1e961mr84780971cf.10.1783329078449;
        Mon, 06 Jul 2026 02:11:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b628c16fsm722188166b.37.2026.07.06.02.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:11:17 -0700 (PDT)
Message-ID: <a0c117c0-26c0-4aa6-a81a-aff9567e29e8@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:11:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 5/6] ASoC: cs35l36: Implement set_tdm_slot to program
 RX slot register
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-pixel3-audio-v1-5-3b66f33859f1@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s53SMMhKMj6CeosZMo76c9hK8HHcs_MD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfX6PufPD4kin4+
 YSuqCh92i3xwO/RtcPo/LCskajW+vC0AxmU720URM+6gOLHxG35Jt51cK1L4iWBX0mkl8iBXXFU
 x4TaRC97lmqMh5VRv6IBJbX4oSRCtFY=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4b7137 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=PWbkM1JAYS1s-zoVCkcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5MiBTYWx0ZWRfX8u+2zo0VSmDa
 zUtLUr6gMOy5Ykwv6vSMYZ8/hDoNoBnoPYlrIaU9NoQCLaIlx21sRdty5dTO+OouUlQvwBUScr6
 Yp5YpTHx8xbO2GxPsEDuIOoqRc+bJQQ+nlIcE9Nk6k9+drSpyrMvltoq37UNAhxMJxnvoi1Arax
 9dSfcF1J2jWb5/dZvF+TSMTt1Run5klrT+UDVNYRS+zjov/TJnrepYSnt1Xvl4tREqtnMnmGSn6
 qgMvJGLmpChMXwXatbtmttCCLKHzO12plXH86Zcjt/2mIFDRNZlLt4CrxnXd98UiXp6eaCavD0b
 NtfUxXrIydSNCtMbiX2uLJfX4K9FYkT07E5pT6eHmfDqlsRhdZ+GsiuunbnfKXTB/0GTUC2133b
 NiZgOuaqy3jKLf1qGLGTV0Os90ayrDpM3ua68fc1G47VmgHaWK5QwlVvOWhUWjzVNM950ZaJwDz
 IVm3rTwgAoHX17DD6tg==
X-Proofpoint-ORIG-GUID: s53SMMhKMj6CeosZMo76c9hK8HHcs_MD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116713-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,perex.cz,suse.com,cirrus.com,opensource.cirrus.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:drhodes@opensource.cirrus.com,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:devicetree@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ixit.cz:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9578070EB08

On 7/5/26 10:06 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Program ASP_RX1_SLOT with the first set bit of rx_mask so the
> amplifier listens on the correct TDM slot when configured by
> machine drivers.
> 
> Assisted-by: Claude:claude-4.6-opus
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  sound/soc/codecs/cs35l36.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
> index 89645327945f1..944f4cb5763e4 100644
> --- a/sound/soc/codecs/cs35l36.c
> +++ b/sound/soc/codecs/cs35l36.c
> @@ -942,20 +942,36 @@ static const struct cs35l36_pll_config *cs35l36_get_clk_config(
>  	for (i = 0; i < ARRAY_SIZE(cs35l36_pll_sysclk); i++) {
>  		if (cs35l36_pll_sysclk[i].freq == freq)
>  			return &cs35l36_pll_sysclk[i];
>  	}
>  
>  	return NULL;
>  }
>  
> +static int cs35l36_set_tdm_slot(struct snd_soc_dai *dai,
> +				    unsigned int tx_mask, unsigned int rx_mask,
> +				    int slots, int slot_width)
> +{
> +	struct cs35l36_private *cs35l36 =
> +			snd_soc_component_get_drvdata(dai->component);
> +
> +	if (rx_mask)
> +		regmap_update_bits(cs35l36->regmap, CS35L36_ASP_RX1_SLOT,
> +				   CS35L36_ASP_RX1_SLOT_MASK,
> +				   ffs(rx_mask) - 1);

if (!rx_mask)
	return 0;

(or does the field need to be cleared?)

return regmap_update_bits

Konrad

