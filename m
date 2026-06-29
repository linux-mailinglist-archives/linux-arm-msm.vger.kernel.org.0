Return-Path: <linux-arm-msm+bounces-114827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OTSxCrL8QWrYxwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:03:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E786D5F73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 07:03:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GYYZqT6G;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c9N+vD+T;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114827-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114827-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CF01E3006825
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 05:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E89D338593;
	Mon, 29 Jun 2026 05:03:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23DB317148
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:03:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782709416; cv=none; b=QHUTsYsrWESzcDY0F8KdfCCPDTigET9xd0gZSi/hdjoNwQTug4kpzSQMDMok1HM5yiaAX9NgI5BgEKz7UWMbvoWnEgS1I2aomtpwnQEaONoP45U4V+8yjz0YnnYvEhNUXA6yn0gmEka58/coQ/uDwr37IyC5IXnt5/IrmPUDTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782709416; c=relaxed/simple;
	bh=8GGjHz2/I206+Fi11Ux2KHZMbQvRYWzNU1Gr6HP8wZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ft1t0JdhEt1mF6LK2fakMb7um6PwErnze42K+7C9H5ZJtdgXzSghhLvjPMk89hYlBworPGemnw24XzdcI41tkU0nI0ZBp17VZPayr0aqoy9llVwFOdnv1zuM69+8mNnvZbCtpBOfHRf1DsCR5b1Zsx/cSeJi7IbKJpcjvBkAC8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYYZqT6G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9N+vD+T; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NCeK1771884
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W88vWECRU+wrMD9oJnjg+rbsRkfPT9MutHVGHqUs57c=; b=GYYZqT6GAgh/iKVv
	PHMl8k/9bppTUz6ZLT6n/6BHY/t3yDVI2Dyj9X7MaQhyrmg+erO2XqmL7MBB0cnM
	9nh9bi593YU754NyB0hntP+68pgjUmJoWjHhiYpB9PhirnFKeviSaq7nWsINfV9m
	sbH2xAv18wohXAE9tgJpMcuyBMgd/F+eXA04IK/yVZ9qsY0q1u+oc0m7wm05KaAF
	BKzMIX+J4sJDhzE9avTvsqxKznBC5dIPB8Cns4QLLF5VkWGw6h9RkiHe0h0ynYL0
	met+NUZQP2kHRKez4dxMAG61fBQJ5CrDfcZaLhp3dCOKuXh5kDbm2Gw1NY3LKa6k
	b1VXdg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27084gdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 05:03:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845ea8fd3easo1682662b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 22:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782709412; x=1783314212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W88vWECRU+wrMD9oJnjg+rbsRkfPT9MutHVGHqUs57c=;
        b=c9N+vD+TDAsuf0diE4Nw9f6UsnlHWcih+jGBdx/oF2mkaBDkrsAGpNC/guCjxgafi6
         V52RkJjwkVB9uBB3BofcYaQu7Kf8tpmLRMXtPQeKmECa/abIob46qkriFSzNlJ8EFBkj
         zYsHjlHCskDMO3e4oJnSKrzOgvhrpe8GWk4UjqHNLz8pZwNHy5I7ohFKcS1LFAmJQqQR
         MRACTsa0bwRw8MYfDrtz6IFwQrN0917KIGh547YFxiF6v9V2xeI/rkXPtm2Nypax2aw2
         hutijEZGONpOoOp9xIF5qqQR5rbKuncwrS+67jffPgKmgaSHEsMiwmsC3hF5DClyUAY2
         QHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782709412; x=1783314212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W88vWECRU+wrMD9oJnjg+rbsRkfPT9MutHVGHqUs57c=;
        b=W49lX5TK8f+PTMWSviVoXVmZPmEWIsSK6Fu6eMH42AtMbtmBZj/cSLmmLnbfZj+xNI
         QgJWFxBTbpbAHXJvpJq9OzKm7BnQBGkU7674LkZnfa+40Le0G79gtJGtAR6yeZ5zMu1h
         VkBR4R17eSlIv3SDaf5t5ALa3PDo/Wn46GqMLTlrxW8G80H8GVtQksq5ktHapNo4iKiR
         SIUHWPXMw0wkvkmRG9ob/4i0WzqznGTa2ly1ITHiF8POJRs3Ajv3mo/mMA5e/ibnK/tO
         6DR0GpDgOcQyaEIv+WJ4JR+RAaT5u4D7MtmgZeVZwTDQFbZ3LI66afvGi0OqfAJoTfAc
         t1cw==
X-Gm-Message-State: AOJu0YyIGhtzE+RN1BbLUgr3ag1NiGxpYE8UxIMlJbjYhjIdZinZBMKx
	Gz3ktVdTl6Vz/7/9M6iS4dpXtAt/K3fNhd+HbXrqeri6PlRkW6EysPafhxr+qfcE3I80HVJtb7+
	iRm1rJktWxDbNbszdGbZufsksVHC/GW+HxNGeh52yJNaF4tg1IB+f0k+fcmF5uSLnNvPY
X-Gm-Gg: AfdE7cmxHBUSkhI3y0fGy1p/H8L0UG8vDlS+ZkgEtf2lGowyaCOm+bmIDzTczyxvVay
	2cXXIVbuCDr4FVGU+0ztarOK4wK7sBMicuKOzeAztrbLxa8uplNoQNNHEvr7ajKtBKPtOWc0zKm
	ZiBePnqL/9VkviThBkVC3as65Bie0JBErCx9EqLo6BjshY4I+aHU8kf3vGV/rgc8KKJrnBDqSRX
	l9kJlDdBOE0m3HiketlANB6DwWXKsCA31B2gFvP2PRH8cSMeI2k5bkQebsmZ4CVFxfx/mrylUMQ
	YNGCJNzNII0jthOeuENdyxZKDnQK9k19xznNnD4POQ45b91Y/JoykFwZpOt5jZ6NrnRI+Yl/6a1
	ewjQZOIkbquM/cUjuSMeDUwI3efqcy8ljx2DvBOSqctyatAxTyg==
X-Received: by 2002:a05:6a00:450d:b0:847:1b77:6eb9 with SMTP id d2e1a72fcca58-8471c5c5170mr2872770b3a.9.1782709412451;
        Sun, 28 Jun 2026 22:03:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:450d:b0:847:1b77:6eb9 with SMTP id d2e1a72fcca58-8471c5c5170mr2872754b3a.9.1782709412036;
        Sun, 28 Jun 2026 22:03:32 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23ccsm11615264b3a.36.2026.06.28.22.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 22:03:31 -0700 (PDT)
Message-ID: <d8659356-1b47-4423-abd8-76ecbd466507@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:33:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: qcom: lpass-va-macro: Add shikra compatible
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-4-mohammad.rafi.shaik@oss.qualcomm.com>
 <3a0890b2-f9c3-439b-a392-fd13e3da850d@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <3a0890b2-f9c3-439b-a392-fd13e3da850d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ObKoyBTY c=1 sm=1 tr=0 ts=6a41fca5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=G8B2rSO7KOTdLhCsa_sA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfX5t3dVUi83seW
 gHhDqnVs2zIuR6sj12SXvdyQgjmyxl4WPILQbEA3OtLpCEqUK1OSdyw4l0a55YV7KsPeMUwhJYs
 FwqsiRdIk6cbdVguCyRmkLHbEjp+KCxH26b1Mtk1eMefGAL2XjWhuRn4SfT2ZGribmiqlAFtwFn
 IdDqLguTU+4qs5moCHwn8UY0LPTTk5s8oO9YBX/SH0lcpmqfcjteT6Sw59b0t54fQeh5frJYCyo
 QXUTZiJiMJ7p7WQYhOyRhF+WqgnSt824cAza/JcZEGcd360PdZVgVyEAWTntFLVx9TuQ+B+Ce59
 vrHk1NsHndWTvEqDCvdvCY5oSE4LWc44EJWftlWY1KSiLuxRG7fs6ZN49ZBduCoWMUHisbWA1Fq
 Pu+T6+HCw2esgu56zaB9QjMTQjc1OLrf1jP/4gYOBUAaHC+/78MCHIF02ASC15n14DGub7wcX3w
 wyT5ZbxuyIXo3os9vJA==
X-Proofpoint-ORIG-GUID: XA2jJV-K7lojTfWbOFbTB0K5EpcM7CFQ
X-Proofpoint-GUID: XA2jJV-K7lojTfWbOFbTB0K5EpcM7CFQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA0MSBTYWx0ZWRfX0y9Naevdk3up
 HXtRw4TCfCLPcGGd1KR1lEUKmeCvDyI0lXy2/D/GkYnfIMspQlLQLtUCIn73c/1cYwd4GzDSZQS
 0iCPT9zdEb6gWV+DbztN5wbtGDwGiIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290041
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114827-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 52E786D5F73



On 6/9/2026 2:45 PM, Konrad Dybcio wrote:
> On 6/8/26 7:20 PM, Mohammad Rafi Shaik wrote:
>> Add shikra specific VA macro data and register programming needed by
>> the LPASS codec v4.0 implementation.
>>
>> This adds a shikra regmap/default table covering the ADPT register
>> range, wires new match data flags (bypass FS control and ADPT block
>> presence), and enables the ADPT control programming path during TX
>> decimator bring-up.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +/* ADPT control registers - Shikra adaptive filter blocks */
>> +#define CDC_VA_CDC_ADPT0_ADPT_CTRL		(0x0800)
>> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_0		(0x0804)
>> +#define CDC_VA_CDC_ADPT0_ADPT_GAIN_1		(0x0808)
>> +#define CDC_VA_CDC_ADPT0_DH_FSM_CTRL		(0x080C)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_0	(0x0810)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_1	(0x0814)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_2	(0x0818)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_3	(0x081C)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_4	(0x0820)
>> +#define CDC_VA_CDC_ADPT0_CUTOFF_FSM_CTRL_5	(0x0824)
> 
> Please use lowercase hex and drop the parentheses
> 

will fix it in the next revision.

> [...]
> 
>> +static const struct reg_default va_shikra_defaults[] = {
>> +	/* VA macro */
>> +	{ CDC_VA_CLK_RST_CTRL_MCLK_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00},
>> +	{ CDC_VA_CLK_RST_CTRL_SWR_CONTROL, 0x00},
> 
> lowercase hex likewise, please keep a consistent space before the closing
> curly bracket
> 

Ack,

> [...]
> 
>> +		if (va->bypass_fs_control)
>> +			regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
>> +					   0x80, 0x80);
> 
> regmap_set_bits()
> 
> [...]
> 
>>   	case SND_SOC_DAPM_POST_PMU:
>> +		if (va->has_adpt_block)
>> +			snd_soc_component_update_bits(comp, adapt_ctrl, 0xFF, 0x00);
> 
> Can you define these magic numbers?
> 

sure, will define and use the same.

> [...]
> 
>> +	va->regmap = devm_regmap_init_mmio(dev, base,
>> +					   data->regmap_config ? data->regmap_config
>> +						: &va_regmap_config);
> 
> data->regmap_config ?: &va_regmap_config
> 

Will fix in the next revision,

Thanks & regards,
Rafi.

> Konrad


