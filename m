Return-Path: <linux-arm-msm+bounces-117316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /dnQJwn2TGqGsgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:50:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E027571B87D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 14:50:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Hcg+VJfV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DTfF6cN7;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117316-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117316-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C4A8308D499
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 12:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2063340D57F;
	Tue,  7 Jul 2026 12:45:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B764B40B6DF
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 12:44:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783428300; cv=none; b=G6VjO+QeWR777Q3DEbNAX9vDEXTwMcB/yhA5A6aoy2CaolgqE06bmozpsq4HfbyKzBnGVUVyZLdpAhS/OYL1m4WHbFrcVTTd1BkTKadXYThK+sbDszXWLLuR9bxQlzZrjGs4J1woFuOGdq1W4GmaJHPYQNEG6+csokYPUVBqwFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783428300; c=relaxed/simple;
	bh=N3r1vlxocOsnMg4V9tZ7lxxdf2qdmVHvLKewCnnGWls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=btG9kV0NTUruCrbzXB8owE6ilWPaINfvHyIToYG9aPkwswSXD5d8CEB3SzeQyXjf/a3UGbl9GItM3Jh+V+k3lHDE/Wud8239t9OjKWC4hxTmPaUMiGBRohz2VH+qtsRElhh4PAllv9YDhYbDu4/dWgltniGQK+O7jNIYUCwrgfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hcg+VJfV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DTfF6cN7; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8xSj3676802
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 12:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jg0+oAQk4LyIeyzIsoDDXs+dbCZNcdg74MGiSubIQb8=; b=Hcg+VJfVpkV8lEXz
	pRhbVpUE8euP4tGUSgH7y0uwY0o8T98qcBAwNUqlSmHeAcCGIqzto7y7CgDKT6CQ
	u0zKisU3b2IX+nBkeD6smRdHndkGbS7l4JuEx6FyNQBiriDdguugdQAPsds03Hk/
	bKehufyn6v5iOXE4p+GAxj99cS2RwOJddWnp7J3JuoL+q9xxUfWs1eoYS8T/7vus
	aRNaYEMBH563hlaARQJFKTomGo7x93l/z3FteHVgkIwahDTsGAiN8P/v4Sz9/7fj
	DsD7e3WhCEcovpkm2v3oP+rTaCZM6XuF07TZj2enPZ0muY/F2C1bcqSWK9JpTuaI
	aBWHuA==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t15a0cy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 12:44:57 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a153a05578so5332770eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 05:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783428297; x=1784033097; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jg0+oAQk4LyIeyzIsoDDXs+dbCZNcdg74MGiSubIQb8=;
        b=DTfF6cN7RJGqzGwZzyNQJwcn9MMh/7bHAnj+Uje3dEdaL1bYbDSEo5yCa68pMqKTDS
         nPjIQfTqqawlzW/nw6yaRw3E5TU1Vmziuzdhp8WpKZ5xLzAVnpXaqTtgKYbWe76MGqNl
         rbVAKOy80BpP4Fp4ti0D1rv2dw2DEV3IrMMJYnpVx23IQlaaZiaI+IINPBo8mxAOpfhZ
         ac5SAg/4ZHNnkoC7uxGnvx3srSVja6eQux5VLn4UHelisWNSTUG8d5ZgAr8CHipJMhEY
         mzY+d2F946/WqPt3TBVvUJhMLlv6krYSWD47hRCqiYhZzxvzhhyzL6LM6ylixijU9sF5
         +ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428297; x=1784033097;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jg0+oAQk4LyIeyzIsoDDXs+dbCZNcdg74MGiSubIQb8=;
        b=m9oHnKjk7oCyLlCAStB7M7VPxmJOeoB9tRaqcgAfCfVUQtVfotUKGCpEChvMFQYPkx
         ZwjvQ3/SSVRh6Pm2B3RKpW8m7MM2oIFBca9KWTL+EtpPEusK/0BjcfHQMGDATkrYWL1g
         wsX3t9R4G9i3Ermm1LV6/1TFWiXnqhsQ6TiOSEbmZW70FltAj1UEvUhxK6a0Rp5Y2/ER
         uSW+NQeOCEX8jZjv+1d19VDRfgSvZY98m1Zdg2bZDhdbEzmKVmaUWdmanCNYu3GG9RKu
         6/DmxIJQXfcQL4a/BX8az9DUVJ6FkWIvvnWU8LfWutcZ5z6B94/nJmHkBzM4Pd2nblMN
         p3QA==
X-Forwarded-Encrypted: i=1; AFNElJ9+ILQx5m/FkQtGX4/ZeeoOHsWBN/XsdHpPqvgU79UdqHoDMgAKSCslDPZl4noKmRiY0MiMDwZyg0PN62TT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8SouwNymd3qxiKs7pB1PyYAXmziuo8i+tnbP2olRlehgR2xWQ
	v8qYWBc6d48NHQora6rexgzS6+f42H8x5dbr+RqvHGqPJDXQGuYQKShMxW6H4dXieEDV8Q05GlN
	OImq7U/tF0spO+9Z1viuig/gu8Sk96HI6Yp2JNLPFeHDkfCfMAFL16Sl1pO0xAUwd7PW3
X-Gm-Gg: AfdE7cm1WSHMmc1wDW5tCIQaLMPTE2h9linXOalLQbB9qnsaZGY2zsKRbpzs535Gb6J
	miPLjuNzV6uSsv0X408+KA1Pp4XtjzPQu//2lgrnogHw1JzFL5aPzbEez+SH+W8wSPnIHlofVYq
	tbmX0Cy1UQAIgF1D1vykh+ZPNr0Jpqmkg8Ag5Lo3qq5zi/0A2SAamt7+pS4SjKirk2tzqChgS3W
	22ibKeHDfF6fqgslknPum+M/90h6oNdHtwqGDTooHRaMpgR+6O1YzmBoGvefdqF0MovKHJXcLTC
	urYCfwrsBRrFQhGIer74tQKQeO/2WfAuUeZhCp09zXfjW4leVZXRMI8YRCi8i6aOqWHfEOgH6ax
	U/895eP1mUqd8odmuMmle2r0jwf2tZfH9toLvcG65F+Ml
X-Received: by 2002:a05:6820:4b09:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6a35536af6cmr3143973eaf.17.1783428296927;
        Tue, 07 Jul 2026 05:44:56 -0700 (PDT)
X-Received: by 2002:a05:6820:4b09:b0:6a1:5ca0:d52d with SMTP id 006d021491bc7-6a35536af6cmr3143964eaf.17.1783428296510;
        Tue, 07 Jul 2026 05:44:56 -0700 (PDT)
Received: from [10.219.49.166] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb13e15esm14448014fac.3.2026.07.07.05.44.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 05:44:55 -0700 (PDT)
Message-ID: <afc1fb30-1b9f-4124-b939-30600921de0b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 18:14:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: codecs: add Qualcomm WSA885X codec driver
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
 <20260701135913.1641328-3-prasad.kumpatla@oss.qualcomm.com>
 <317be447-316f-4120-9008-2a1593328c68@sirena.org.uk>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <317be447-316f-4120-9008-2a1593328c68@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: STt7bd_VR9A2TacBpkbwCOxtNc8yaXbj
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cf4c9 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=zFzosQrJfojMdPK_vqAA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-ORIG-GUID: STt7bd_VR9A2TacBpkbwCOxtNc8yaXbj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX0ZYzb7IIhz02
 mmeHL2/qJNh7wJ1Fa4B8eDqJDnhsNvjtRz3toHeZGbyctnRtzcWEZr7XDiPSMAIoOSKp2KEYsvn
 XD6ej2f3eGvCZzQAgZwBnPn8ex2GwTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEyMyBTYWx0ZWRfX9pP1Wuuo7U7u
 i2IQny83hmHt1nfGxq16ysKPyrUFDEJnVsR8U3QOZDQ/C5yDa2v6V4cpC7McnIQ0wR9LUuGma4/
 k5ajsUB3LGqoSJDMVWqrNgZBT+xtlrp8uFCFM37Kju4KsJpSj0hbnvgc9H01glWBHAat3hmFqsF
 T2lBFNt0y4WRz8Dc6KVefHmLjWiWkDGtgN0BomK8ZWISHCiOUzTS4rJfk/aMPIbkj7wtqUKrsWe
 6tZzBB3BcJLPaeT6fpIgj9mtmZ848b+CdYQ01+w971XhOGXnjdHZEz1pxTmkSbUCjDntTScerQA
 0UaBf13fQJYHkaHU++nFlv/DP+TSzflGF8gfGeciBW/dm3VHb3fViD5hpNemwXNNRCFTYWYWknL
 UCzyin0zAU6tKeDocztFX6JRfYuKhtrVwrXNgawYxluQKuC8aqRjmW67gxmuDymCyo9kLW5eBtB
 62zK0iDn4k8g2/lEvXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070123
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-117316-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: E027571B87D


On 7/3/2026 8:37 PM, Mark Brown wrote:
> On Wed, Jul 01, 2026 at 07:29:13PM +0530, Prasad Kumpatla wrote:
>> Add an ASoC codec driver for the Qualcomm WSA885X stereo smart speaker
>> amplifier controlled over I2C.

Hi Mark,

Thanks for reviewing patch and feedback.

>> +static struct snd_soc_dai_driver wsa885x_dai[] = {
>> +	{
>> +		.name = "wsa885x_dai_drv",
>> +		.playback = {
>> +			.stream_name = "WSA885X TDM Playback",
>> +			.channels_min = 1,
>> +			.channels_max = 2,
>> +				.rates = SNDRV_PCM_RATE_8000_192000 |
>> +					 SNDRV_PCM_RATE_352800 |
>> +					 SNDRV_PCM_RATE_384000,
>> +			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
>> +					   SNDRV_PCM_FMTBIT_S32_LE,
>> +		},
>> +		.ops = &wsa885x_dai_ops,
>> +	},
>> +};
> Does the device actually support all the rates advertised, 11.025kHz for
> example?
Thanks for pointing this out. I have only validated a subset of the 
advertised sample rates and
have not specifically verified all rates within the range (e.g. 11.025 
kHz).
I'll restrict the supported rates to those that have been explicitly 
tested and validated.
>
>> +static int wsa885x_rx_slot_mask_put(struct snd_kcontrol *kcontrol,
>> +				    struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct wsa885x_priv *wsa885x = snd_soc_component_get_drvdata(component);
>> +	u32 mask = ucontrol->value.integer.value[0];
>> +
>> +	if (!wsa885x_is_valid_rx_slot_mask(mask))
>> +		return -EINVAL;
>> +
>> +	if (wsa885x->rx_slot_mask == mask)
>> +		return 0;
>> +
>> +	wsa885x->rx_slot_mask = mask;
>> +
>> +	return 1;
>> +}
> This looks like you're trying to put TDM configuration in the control
> API, it should be done via set_tdm_slot() - the driver does have one,
> but it only configures mono vs stereo with no control over slot
> placement.
The slot mask is use-case dependent and needs to be switched dynamically 
at runtime
(e.g. stereo speaker playback versus mono voice-call scenarios). The 
mixer control was
introduced to allow userspace to select the appropriate slot assignment 
when the active
use case changes. Given that `set_tdm_slot()` is generally used for DAI 
slot configuration,
could you please advise if there is any preferred ASoC approach for 
supporting runtime slot-mask
changes driven by use-case transitions?

Thanks,

Prasad


