Return-Path: <linux-arm-msm+bounces-118965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RtkmBRPdVWoougAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:54:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFE6751AD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:54:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hQBcd6TC;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NmgoV44U;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118965-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118965-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FDFE300C306
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A943EAC75;
	Tue, 14 Jul 2026 06:54:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8938B3DA5C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:54:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012043; cv=none; b=Fy/UbmG0MhFPwIQMSvtY85C0iLUeJ8t2I+8LcjOEk9ZNmBSqFQtU5IiVX4DalZky0c8suNOw3tN6Zp5zpcbKYdxB8bcKuuXUarn3tSzZglajN490ToX+s5h8pQG1V9YKtvEJtMMeeQc+L7GjvKgT+3Rg/tO5Ag96l0zhbWMeSVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012043; c=relaxed/simple;
	bh=du1fKzl+zbOOxRTgFJqsNwKglby2lARhz5MLhrd3ZZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZ/d5BWAnyQv1Z10z4Wnx8p+enQlgLuyb3iXzOgKf880F2JWtm+RgQ1VVYVOF/cahuZhijfFtvhKaNhgum8hEajHSkAUmAGfQ2Aq52AI7SL2lKup1yLzWTk4lc9z4+jwWxZWhmQexH491Jvu5ddkHq3oACAhoPTknfheGjAsZSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQBcd6TC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NmgoV44U; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6Sjuv3862223
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gcoCHy1edFFqmcEKY7+Mhve73Yrzs7W+rUiD3MzHC+0=; b=hQBcd6TCFMk1uei+
	3DVeRMg8odbYQdEksVZAVFPi6eAk4p6FpJbPhseav4gSz+ZYSAfFawpiYI2DRT+1
	nPsKmA8K4xkxDqfLLPFy8N323iigAyLo0nXcQ7wuwzCNyAfmuzlzYAdDUJ2aapOl
	5aqdR+LhpZ9NaaY65/V/doJvBLTbksxRX+II1jRdBMWx8TCHB7bckWpOJZhR7Ckd
	elSUj17IgFftdJUTyXHxwUATkwDnya16r3yCl3HGbhwxY5Nz404OTiQXmTd+EL6O
	gtjLxoqSDwxR/R+nxhVUgUb88HvrMpnUS++Ux341WfGOgjctQN2VUYIjR2LDwx1R
	gOBoLA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j2fnf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 06:54:00 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fe0d9ba59bso10510846d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 23:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784012040; x=1784616840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcoCHy1edFFqmcEKY7+Mhve73Yrzs7W+rUiD3MzHC+0=;
        b=NmgoV44UZX/ToGg+4sJhf7vHFqDJObFZctCdKAkCNg7Rv1xPuEulc5A0F6szzYGghL
         jW/snnYQIRBeVSVgRrrmMLQKdng9Uc4jOLDuwGlej8YYEGTL1ibOhc5KvoGO0XnBun9p
         yREBQt1Z7f/S98olIqu511u9s8yBU9pWqv3KDBU4w9UjQ4wtgxFX/kkPp5EQM5lkcAg5
         vGnh1ZdhJDIhX3IllckL4i0xS+E3CftBleh3rdC6JX0fw/tAQvP3gjVnYyGHv4CnmN2N
         vzINGyNsS1yYcTpt5abDUQ7XfGzKcqaLnJyvUkTNC6ucV24h8E9E0cdIfnQQ6fJB5+zI
         m1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784012040; x=1784616840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gcoCHy1edFFqmcEKY7+Mhve73Yrzs7W+rUiD3MzHC+0=;
        b=hMAmNz4okjda9o/Nzjbpi3/Q53/PPbyUjojzhAZlhZP9+B6oRqO76K+219vHDCSQPB
         gPIGXX9RshaJv95aT7vk/ewZf9OYn/W0cMCuY2zRsRgtyYWerIjS7BnzCKJkAxesSKaX
         GS3SyPb6sarHHHjLstU/s6BigFecflhX1aPk12EdHxj2TwvFTvVNvwAZ9cUTFlcN0mJG
         dL6uGIcuLWfo2fiWEUrT4wlwZN3tjswMNFwPdCuSYlw5rSWe26pkLGLoO/HwSCW88bp+
         KDutVSxbk3cuVftbL9Mf3WegeCNZn5zXZVEicrid3LMNOA4zLK/kiyojkDJCWGvyKp0E
         fMlw==
X-Forwarded-Encrypted: i=1; AHgh+Rpkgpht4mt4ToTvEpngPwOJVt+9/TJDoEt6BgzY1sHn3bZLrJrt1+KmCS4BAYOO8BJxCsPk8iXpWCGYeikP@vger.kernel.org
X-Gm-Message-State: AOJu0YzMGAN6/TFOduP+IykyeSlhX9geUAK/vVT/urdVQ2XItgKW2qVS
	JEkMacltH/zb+9cYa/hGT5tc4+03phQw4B+/GT50c2wfu4e8fmuct9qRg7eLRDmKCwziJmPVyk3
	LTDZF13o5Bq7RVKHXyi7Q5ZL5/wb9R6X8efEqIMbs4DwIvlpbV3g/Z25kLWtmvuabkQ6T
X-Gm-Gg: AfdE7cmovMSFg8OLVTplBYoXBNXmZGI3DaF238CXRLjYbkRay4BVJomCowA4jN2Sq5N
	vRNArXKjVYj/97Z3bmFWPYgyrj7VZQXa4hmO6Wg/ItXI/PH0FT+BrYHlzMTh1R/HZj1sDINpC1U
	f+G+ODeq7z6LUjJnfRCxeNo0G3XrN/SZZjwcn+df3wBugXGwilHXD16p6aYyzr7xnLuGWuIoZcd
	BXqH7QRsYH+XHncFy7wp7xOS3P10tp6j991oD46iOMRxVguXgbH+WofibVdT2Mr3JIpF5yN5SmP
	wfUsZnsGMjkA7TWUqc5aF191i55LLhpfN/EXTnlb2vHXtXHYd969LFK2iYKLL4tlVCjdhhTDOqf
	8fxPNkIc47FvoEhds1o/i6fKWGsL3cuZ0oF0=
X-Received: by 2002:a05:6214:4f14:b0:8f2:d8fc:47e4 with SMTP id 6a1803df08f44-90410c668dcmr103925416d6.9.1784012039918;
        Mon, 13 Jul 2026 23:53:59 -0700 (PDT)
X-Received: by 2002:a05:6214:4f14:b0:8f2:d8fc:47e4 with SMTP id 6a1803df08f44-90410c668dcmr103925286d6.9.1784012039462;
        Mon, 13 Jul 2026 23:53:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd295656fsm862065a12.29.2026.07.13.23.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 23:53:58 -0700 (PDT)
Message-ID: <d132334b-f920-4858-b690-baeda6c527a0@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 08:53:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
References: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
 <20260714-master-v1-2-1ebe5993225e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260714-master-v1-2-1ebe5993225e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA3MCBTYWx0ZWRfX7lC9Opp8IBCZ
 vhxHioJnH8YFQ/TNXCGbjqN1jUgq+40Sw5/mk2dVg6TB7cEmyMDhcceZJnfxT7nRREwoJ6Jf7GA
 ueGmX+tdYQOqZJ1zySeVxlWXLYHGmkY=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a55dd08 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=9XzChZoegFnburFei4AA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: VnXQnoGJnTXf2ijA_x3YgRaJ0oJwqTCq
X-Proofpoint-ORIG-GUID: VnXQnoGJnTXf2ijA_x3YgRaJ0oJwqTCq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA3MCBTYWx0ZWRfX7k4y+Dz48VdS
 5YDoNlcRorGE3JlXwoAytMHX0H1kiA/GJ3svsJOdPzlvBh1qZnWoQVUooQad48B1s0xbRG0eId3
 23b8DR9HpsBn7y4FAo1AL5ayuWjEPX0ioxn9m9bvbDQWG2jD/W35B3r4u2KMvHqYPEYTLlOVa+7
 dJMAjmfPRvQCfvVKr6Lo/DNHM8/7xJjm3wHlYi/26HsdJXBkkP3Vj+aLq8G2LEGyouBxRlMBBog
 NXVQSF7TwWrqPSWLxO7Lb0D9LwMTb9lydxZ/phqu5ET4U76ZoN0petFLFiANOzGfjVn9s9BHryi
 XOUGnp7h744GeE5ao2ArT5ovBseaDC9oRDNfxrLnl6HreL4CbXR5GzZ95hdCsMzjqB8uHghLEGL
 TK1iLRciBkTGRLPFQe1qTfb1t6baUyn70UMP/4HjaxAZnHqXZaaX3zyNZpawJXLfBA0JoB+sBHx
 jCvo4+P41EFjCEdaTNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118965-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:sarath.ganapathiraju@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: DBFE6751AD7

On 7/13/26 10:05 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecases
> and can serve as a periodic wakeup source for the DSP.
> 
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the
> other clocks during runtime PM resume and suspend.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---

[...]

> +#define LPASS_RATE_GEN_CTRL		0xD000
> +#define LPASS_RATE_GEN_COUNTER_0	0xD004
> +#define LPASS_RATE_GEN_DELAY		0xD010

lowercase hex, please

> +
> +#define LPASS_RATE_GEN_MAX_REG		LPASS_RATE_GEN_DELAY
> +
> +#define LPASS_RG_CTRL_EN		BIT(0)
> +
> +struct lpass_va_csr_data {
> +	u32 counter_0;
> +	u32 delay;
> +};
> +
> +static const struct lpass_va_csr_data hawi_csr_data = {
> +	.counter_0 = 0x960,
> +	.delay = 0x16,
> +};
> +
> +static const struct regmap_config lpass_rate_gen_regmap_config = {
> +	.name = "lpass_rate_gen",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = LPASS_RATE_GEN_MAX_REG,
> +	.cache_type = REGCACHE_MAPLE,
> +};
> +
> +struct lpass_va_csr {
> +	struct regmap *regmap;
> +	const struct lpass_va_csr_data *data;
> +	struct clk_hw hb_hw;
> +};
> +
> +#define to_lpass_va_csr(_hw) container_of(_hw, struct lpass_va_csr, hb_hw)
> +
> +static int heartbeat_pulse_enable(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +
> +	regmap_write(csr->regmap, LPASS_RATE_GEN_COUNTER_0, csr->data->counter_0);
> +	regmap_write(csr->regmap, LPASS_RATE_GEN_DELAY, csr->data->delay);
> +	regmap_update_bits(csr->regmap, LPASS_RATE_GEN_CTRL,
> +			   LPASS_RG_CTRL_EN, LPASS_RG_CTRL_EN);

regmap_set_bits()

> +
> +	return 0;
> +}
> +
> +static void heartbeat_pulse_disable(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +
> +	regmap_update_bits(csr->regmap, LPASS_RATE_GEN_CTRL,
> +			   LPASS_RG_CTRL_EN, 0);

regmap_clear_bits()

> +}
> +
> +static int heartbeat_pulse_is_enabled(struct clk_hw *hw)
> +{
> +	struct lpass_va_csr *csr = to_lpass_va_csr(hw);
> +	unsigned int val;
> +
> +	regmap_read(csr->regmap, LPASS_RATE_GEN_CTRL, &val);
> +
> +	return !!(val & LPASS_RG_CTRL_EN);

regmap_test_bits()

Konrad

