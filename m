Return-Path: <linux-arm-msm+bounces-94743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PL7KylZpGn8eQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 16:20:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B231D0657
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 16:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C33F4300D328
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 15:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04F431D375;
	Sun,  1 Mar 2026 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="zrT/kcBy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ixit.cz [185.100.197.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788192E7F0A;
	Sun,  1 Mar 2026 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.100.197.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772378376; cv=none; b=mN39uojK0ya2ZUknZU9+t8uICtQqadSqU9NMffO6uYUqaeb5zKB1TtyMNtOyDSRDrNT/ZwL/C4CVGS9tBpuapH34W8z/MqwAHDIU7x9xwWMkz3ufyZdZJtHiyvSP4tazslHjr+iQdVGykPh5OLQoYb4MIdPlC8YbtXRriGDe/lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772378376; c=relaxed/simple;
	bh=JATWTpFy1BbeFa0QUJ9rybl3Ew8tkM+7OzHt4oN4FDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5Fycg+X9MyekIWYD/AUGjXnyv6EqllmQp0O9SDfWmMa8xfQqCXutRjAHu9cFXLXKhZ9QmmVQoX+F2zEVN7oFo3FwH4VsmFWcPMtTSwjlOL/1v8ERJF61S1s3p9UV4mnQwks7QFtogJ55ogct73xNyLC3bi0ICNBVf/DKH/CWbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=zrT/kcBy; arc=none smtp.client-ip=185.100.197.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [IPV6:2a02:f000:10bd:e301::1d7] (unknown [IPv6:2a02:f000:10bd:e301::1d7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 25CCF5340EFC;
	Sun, 01 Mar 2026 16:19:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1772378369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c64t1DZ4tPWwJXUbtFxTLZuknhhF5vf+R60GgEYDedY=;
	b=zrT/kcByZ/p5Y1boh++e9cHdOY99QxtXc1TSNx0xojuSVT8vUyWVi/xk1lHG7V6N+uALOZ
	ljPlSGYD73kSAFmQUCGQOEKNlkt4dOsRLMb04z4MgMmJmrPgsz9uzonjAm0WbuD7LXa4DN
	IcIpuH/WiuIDSSmRO3DBfh3tqAXUGwM=
Message-ID: <ba2a59ee-279e-4b3f-8fd7-1274c5746337@ixit.cz>
Date: Sun, 1 Mar 2026 16:19:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] ASoC: codecs: wcd: add common helper for wcd
 codecs
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Joel Selvaraj <foss@joelselvaraj.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, vkoul@kernel.org, srini@kernel.org,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, linux-sound@vger.kernel.org,
 Alexandre Viard <xela@viard.dev>, Marco Mattiolo <marco.mattiolo@hotmail.it>
References: <d5d57177-5c82-43a4-bf80-ec9d336b043e@joelselvaraj.com>
 <9ba9919a-087a-4379-aa9f-ec899a80e7d5@oss.qualcomm.com>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <9ba9919a-087a-4379-aa9f-ec899a80e7d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ixit.cz,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ixit.cz:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94743-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,kernel.org,linux.intel.com,linux.dev,vger.kernel.org,oss.qualcomm.com,viard.dev,hotmail.it];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@ixit.cz,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[ixit.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,joelselvaraj.com:email,qualcomm.com:email,ixit.cz:mid,ixit.cz:dkim]
X-Rspamd-Queue-Id: 13B231D0657
X-Rspamd-Action: no action

On 05/01/2026 12:38, Srinivas Kandagatla wrote:
> Hi Joel,
> 
> On 12/29/25 8:33 PM, Joel Selvaraj wrote:
>> Hi Srinivas Kandagatla,
>>
>> This patch series broke internal microphones in Oneplus 6
>> (qcom/sdm845-oneplus-enchilada.dts). Reverting the patch series fixes
>> the mic in 6.18.2 kernel version. I suspect it is due to micbias related
>> code changes in this patch, although, I havent debugged the root cause
>> of the issue yet. This was initially noted in mobian distro [1]. I was
>> also able to confirm the same in postmarketOS. It would be nice to fix
>> this issue without having to revert the entire series.
>>
> 
> thanks for reporting this, and sorry about this.> [1]
>> https://salsa.debian.org/Mobian-team/devices/kernels/qcom-linux/-/merge_requests/29#note_708300
>>
> I had a quick look at the code, looks like there is typo, can you pl try
> this patch and see if it helps.
> 
> ------------------------->cut<-------------------------------
> 
> commit 854bbda3542d83884dcdb49dcbd94a697956234d (HEAD -> next-20251201)
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Date:   Mon Jan 5 11:31:46 2026 +0000
> 
>      ASoC: codecs: wcd934x: fix typo in dt parsing
>      Looks like we ended up with a typo during device tree data parsing
> as part of 4f16b6351bbff ("ASoC: codecs: wcd: add common helper for wcd
> codecs") patch.
>      This will result in not parsing the device tree data and results in
> zero mic bias values.
> 
>      Fix this by calling wcd_dt_parse_micbias_info instead of
>      wcd_dt_parse_mbhc_data.
> 
>      Fixes: 4f16b6351bbff ("ASoC: codecs: wcd: add common helper for wcd
> codecs")
>      Reported-by: Joel Selvaraj <foss@joelselvaraj.com>
>      Signed-off-by: Srinivas Kandagatla
> <srinivas.kandagatla@oss.qualcomm.com>
> 
> diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
> index c8db33f78a1b..bc41a1466c70 100644
> --- a/sound/soc/codecs/wcd934x.c
> +++ b/sound/soc/codecs/wcd934x.c
> @@ -2172,7 +2172,7 @@ static int wcd934x_init_dmic(struct
> snd_soc_component *comp)
>          u32 def_dmic_rate, dmic_clk_drv;
>          int ret;
> 
> -       ret = wcd_dt_parse_mbhc_data(comp->dev, &wcd->mbhc_cfg);
> +       ret = wcd_dt_parse_micbias_info(&wcd->common);
>          if (ret)
>                  return ret;
> 
> ------------------------->cut<-------------------------------
> 
 > Marco Mattiolo:
 > Microphone is now working on my op6 with the kernel coming out of 
last > pipeline ( #1002286 ).
 > @xela could you please double-check this issue to be solved on your 
side as well?

 > Alexandre Viard:
 > It also works for me in gnome recorder and call.

So I guess your fix was correct :)

Adding both to CC.

David

[...]

