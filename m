Return-Path: <linux-arm-msm+bounces-105751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC9DINKg+GkgxQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:36:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F74BDF39
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 15:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B48B300876C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 13:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27AF43D75DE;
	Mon,  4 May 2026 13:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="uincUZpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2333D3D0E
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777901767; cv=none; b=d6osl4WYl+CvQV183LpmxrSYhreYdXgxjEZo2R39qBJWX9Tx5tPJbVIkrd7cN4jW2tdi46MKOFHjdqr8q+vo/76XljSBNam0DfqZDGkdSz8Q4oi5ELNJ5sS/Uiz4QFVfMwvUrHC8oCEA+0cdXjIq4ProtLnRC6SFqbdhO7zG9l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777901767; c=relaxed/simple;
	bh=LERfixZ4A/mCAlL4UIEjVNTDqF1ZRae/7FZpoHehMsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ueb4AE7LZClaTQ4lsU15IYwvVo0+OGI1D48JsEHn23pBJp5b8MLZjRA+AVwC8Abxw5abilTeHf36u0GgxbyNy/z9z5X3Qkl9INl7KopEm745z/FabeU4AYJjZyQ+O1jZ8b6i2J+KojW6MiBmdFRxNvWDbc+iltzdSkwOloRwREU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=uincUZpy; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8ef2118b478so405077685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777901765; x=1778506565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z9fU46qFzoianaIQCMZvMdojbyNNsa2tYadi8NkaEg8=;
        b=uincUZpyQyXqvG2nseIYqBdFhOtC/F998c4JWNN8VIz83igZnlmBwOJO7uMXmPKHgG
         7NPHDCkjxrVkjG+nXRtngo2rOAATdDdK/Pephk+Y04/pYrGPkfOHuG/WytkaGqU8B3Y0
         aJSvi1PcaZbSTnWYZEuH3t4m6uJpNDU7ZlGtd6xivvb4/jyPhy4UekcKkD3R7mM/OuXb
         RSvD/eJ/Fkg2ihVaziysfOxQpCPXPDT4RXNhvk7t0Z82tFzidLa+RS/LRCm1U2bNyYEV
         71UyuKiqYKWVcHV5CBLhU0g+waujWIaKq5LgKL/2PFW0GViTXbMS4In5FrnwIqfnbp2a
         9dIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777901765; x=1778506565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9fU46qFzoianaIQCMZvMdojbyNNsa2tYadi8NkaEg8=;
        b=RLaV7EfEeEcsSgz4Q42M54b7CFb1i4nepTonRY6B4CmdCEJFAYLfLjw0VzZSFSKg1b
         8stIKeEKey2NgP8OHz4agsy0mb5PvOUmJNNnJoT4UPgfrwz7ovjGwSih2oa+VhV3IWdP
         w5QcernKipFx0zlPC7dwpoYXa0I1b9wxEKuagsFVp9bZY4d7ggMnV37cn/p/BYWZ0PTO
         JkZfY8o62ljjVdwpY5M6fV2K6LHeJko2Ns7Br8dHsqMNllzf66MjRfPColEZNed1OWMP
         Qqm509Y0D4OAC9Wzb5RqzbDpCO0shNIuZYUsGS98APYi1v5p97M/otncREvZGUAtH/nR
         xh7w==
X-Forwarded-Encrypted: i=1; AFNElJ817Sl2yg7mowunHYBN+rmyPI75tCjudkH5RsKdSgS5nzE8kz6zMdz5AbybnKNrdDc6dUm2SRmUgQCkbJmT@vger.kernel.org
X-Gm-Message-State: AOJu0YzHLuhU2s5k2apEUHcaH4F7WnFn34zajrL7S6VjfjNhWrYzNmIC
	vrl2dBf+zmUjXN5Ca5kAzlvIdPMIO89wue78f7qpR5BPjTHnp6SxiVM0wXRuDi4+NQM=
X-Gm-Gg: AeBDievZxi5o+njkxvCDmPydMz1fpvkTksTQAAPbGS0C76OkBBAwjHmzczPeGXHllVt
	Kbmcx66kv6vUYRg8mToQqlartZITVzCEVR330y/QNMW0J6ayyphZ5uWTXmJPLTCvAdtfBuafi4x
	oPHYDTGOFgVutS7Ne6BxBRwtJb6QUvWEXOvVIgHNYRcs4PI/zfpYq2GNkcPgOW0eM/cobcR8KUs
	x3bJAjIVnsU3XW0Hz6fD5783lvu1m/CU/MEQDp0xmX8mvpU2CbrVCGfBTvMQ5GpG+Y3qgLPXQI5
	vpgiPAhi4X6fUWQCPdUlJA9OOXfc6Us/LAReCXBN+HaTt5z9mAdPGMDILI7E4qQ4m8g2FdkpwFi
	95qzcsA7zYWuHuY3OzuwKQmPmiPrRtTrbyJ6VDT/i/fsqtt+N0zqV3Z/AdmAZPxR9+XAb2TL0kU
	Io/bg8izr10XY6394mQQIqW6oXONibAVLKeyWHR2nwCT1zytzmhcY+3WOAtve1k3pNmeBCs5TeT
	g==
X-Received: by 2002:a05:620a:2905:b0:8eb:f3c7:224a with SMTP id af79cd13be357-8fd17d49626mr1448021685a.30.1777901764463;
        Mon, 04 May 2026 06:36:04 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29a80784sm1058189985a.12.2026.05.04.06.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 06:36:04 -0700 (PDT)
Message-ID: <7fbb8bb4-5626-4908-ba80-2db35661e30a@riscstar.com>
Date: Mon, 4 May 2026 08:36:00 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 04/12] net: stmmac: dma: create a separate
 dma_device pointer
To: Andrew Lunn <andrew@lunn.ch>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com,
 rmk+kernel@armlinux.org.uk, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, linusw@kernel.org,
 brgl@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 daniel@riscstar.com, mohd.anwar@oss.qualcomm.com, a0987203069@gmail.com,
 alexandre.torgue@foss.st.com, ast@kernel.org, boon.khai.ng@altera.com,
 chenchuangyu@xiaomi.com, chenhuacai@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, hkallweit1@gmail.com, inochiama@gmail.com,
 john.fastabend@gmail.com, julianbraha@gmail.com, livelycarpet87@gmail.com,
 matthew.gerlach@altera.com, mcoquelin.stm32@gmail.com, me@ziyao.cc,
 prabhakar.mahadev-lad.rj@bp.renesas.com, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, sdf@fomichev.me, siyanteng@cqsoftware.com.cn,
 weishangjuan@eswincomputing.com, wens@kernel.org, netdev@vger.kernel.org,
 bpf@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-5-elder@riscstar.com>
 <9203d8dd-8ec0-415e-9c2e-5b06b1b8dc11@lunn.ch>
 <539b9de3-4a78-44cf-9085-06cd0cab2d17@riscstar.com>
 <4cbe1a04-4a49-4e4d-95f4-ed4df1afa24f@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <4cbe1a04-4a49-4e4d-95f4-ed4df1afa24f@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CC9F74BDF39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,bootlin.com,armlinux.org.uk,arndb.de,linuxfoundation.org,riscstar.com,oss.qualcomm.com,gmail.com,foss.st.com,altera.com,xiaomi.com,iogearbox.net,ziyao.cc,bp.renesas.com,fomichev.me,cqsoftware.com.cn,eswincomputing.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105751-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:mid,riscstar-com.20251104.gappssmtp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]

On 5/1/26 3:55 PM, Andrew Lunn wrote:
> On Fri, May 01, 2026 at 01:06:23PM -0500, Alex Elder wrote:
>> On 5/1/26 12:13 PM, Andrew Lunn wrote:
>>>>    	if (priv->dma_cap.host_dma_width) {
>>>> -		ret = dma_set_mask_and_coherent(device,
>>>> -				DMA_BIT_MASK(priv->dma_cap.host_dma_width));
>>>> +		u64 mask = DMA_BIT_MASK(priv->dma_cap.host_dma_width);
>>>> +
>>>> +		ret = dma_set_mask_and_coherent(priv->dma_device, mask);
>>>
>>> I'm nitpicking, but i don't think you need to introduce mask.
>>> DMA_BIT_MASK... is already on a line of its own, and is within the 80
>>> limit. Nothing changes here with s/device/priv->dma_device/
>>>
>>> 	Andrew
>>
>> I did this.  It was simply to silence a checkpatch.pl warning
>> about a long line.
>>
>> I don't care either way, I'll gladly put it back the way it was.
> 
> Please pull checkpatch fixes out into a patch of their own.

That's what we'll do in the next version.  I'll undo this particular
change, and will add it to the end of the series.

Thanks.

					-Alex


> 
>         Andrew


