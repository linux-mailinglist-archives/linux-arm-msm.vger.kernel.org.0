Return-Path: <linux-arm-msm+bounces-22217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B8F9029D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 22:16:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18EBB2810FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 20:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1753E47E;
	Mon, 10 Jun 2024 20:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MXcrQilT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2AA3BB30;
	Mon, 10 Jun 2024 20:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718050601; cv=none; b=kZaScyQuMsd7cHEfc7eMIzIC2BS9GBzwDVyCDXVmUfoDnRt/GkLsS+GhU/0dQaN0VVWiPOQ98j3cgDZFnZr/pe2iTcxf5R4QwNBWBQUq+Fk0cy5fXP+k5hl/WKUrPju0R6gfUKX5GJhHF+oNZQDi3wljTdpRzVg6fPS4Ek49Avk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718050601; c=relaxed/simple;
	bh=//W7kqXFonvLeGOTPZRMLoM6eBxITBOMJLknJtGDK0w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CQsFhtimlbXLbYEsFv0mWIAUr/8fvkFBdrbtyy3zXc6ht5ZbXC2GcK4vt+uY0K8OpwMNQO85joUMTfIn2hpcWjHj4Y0K5IUvl603U/wdTOGys0yOd5R23UN621WMcGfewyQ0Muv9y0BxA/F2hKBx1uhWtBSliFyT0rCYEENWT0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MXcrQilT; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-57a52dfd081so315263a12.2;
        Mon, 10 Jun 2024 13:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718050598; x=1718655398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pl8T6m4emk3aMt9ImW1yQY4NMWNiVqYmr9bldDIC9w=;
        b=MXcrQilThMC3TUQlan3B+hdqGB9H8g46rqMOin49aN/cvSWanvwuTtwjV13ELFo8Ys
         O5ctzAsuv9tzzYUednMoibWftEN0qMs62J2HriS5Yrlc8QjHLRS10NsSNKf0daizwp0a
         iNs4zlH6YiTbdWD/xH3LA9x1cY4PakMv3IIwcK6UKCgN0CrMU2/aJMjtRhyjHBDbxue8
         aNzV5Nv+vvgUWOPStaa+ldTnbm87nx69JXdaHx+2oT5RGlniroM9aY6+PPiw9OilJU9F
         opNskyojmcIWn2tfJqpKtUNjjiqOCTTviLtn1OoCXPXRyZbExP+hYUj5PnoVhE3EGVQv
         Wzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718050598; x=1718655398;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6pl8T6m4emk3aMt9ImW1yQY4NMWNiVqYmr9bldDIC9w=;
        b=aeBi8rducKmJ2MlKb/uMgZwzGWUzvQFrNWhAebkgA8oHMek7HSOwUCbGcyLWJg2PFn
         wYkj8FFrBlclJsxo0T2uN+vzii6iYW4wpzZ5m9/crMs14PrTTHMoE++c3stgZykDKOyL
         OL7uh6FYH7d5mWuRVwnMtS+hx+cn74EFCKpW3P+9PMqVAELN2ma/2LT6xBQyWjLoeLrE
         P8X1cPo9ccY03ANe+nl7fU3qB3OARV0bb6NhHqYsm01HJrrI5ix6mWO4Y97WdnU0VQL8
         5CQ0itkjMVo2DVpD5vZuXxtjlqsr2LgZOcSYnNJPsyxD7K9XP6kuEOLxdABMbH9Dbu8G
         hzuw==
X-Forwarded-Encrypted: i=1; AJvYcCWxLuWsW/imoUpe/4MtVM0+0oOxJD6VptrOTkJZ8AngKTtzOM26MzonrMJ/v/EeA0Qy3xSUVTQ4WG4RbH3VnRSxdI68Izxpj7MksYBMThNd1dDNuUwrZJxfy1ITot4uQeyAurimxVybzzvwgw==
X-Gm-Message-State: AOJu0YzPkKBr5CZNud7HaXw9ASDFuDblzMlQWac69u7vLctpoKoSSGXz
	aWdSv8kBOaRoPdAVaDPR31VDpPtQNjU0Wh5FAjp7cnXOOeHKSF7U
X-Google-Smtp-Source: AGHT+IETB9mWF1zLj7DTLQxbvtAnMS46L7eWHIrPUE06xGFBHdTgXwhD+GJm3BDLZNBCIpQ3qOZ1CQ==
X-Received: by 2002:a17:906:1503:b0:a6f:118c:2622 with SMTP id a640c23a62f3a-a6f118c26aamr371908066b.63.1718050597938;
        Mon, 10 Jun 2024 13:16:37 -0700 (PDT)
Received: from ?IPV6:2a02:a466:68ed:1:2173:d612:de41:2058? ([2a02:a466:68ed:1:2173:d612:de41:2058])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f1b7f5b12sm217710466b.196.2024.06.10.13.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 13:16:37 -0700 (PDT)
Message-ID: <364fbb96-006f-4582-a0f8-a0f9edd50f6f@gmail.com>
Date: Mon, 10 Jun 2024 22:16:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] tty: serial: switch from circ_buf to kfifo
From: Ferry Toth <fntoth@gmail.com>
To: Jiri Slaby <jirislaby@kernel.org>, neil.armstrong@linaro.org,
 gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Al Cooper <alcooperx@gmail.com>, Alexander Shiyan <shc_work@mail.ru>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Baruch Siach
 <baruch@tkos.co.il>, Bjorn Andersson <andersson@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 "David S. Miller" <davem@davemloft.net>, Fabio Estevam <festevam@gmail.com>,
 Hammer Hsieh <hammerh0314@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kevin Hilman <khilman@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicholas Piggin <npiggin@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Peter Korsgaard <jacmet@sunsite.dk>,
 Richard Genoud <richard.genoud@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Stefani Seibold <stefani@seibold.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Timur Tabi <timur@kernel.org>,
 Vineet Gupta <vgupta@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
References: <20240405060826.2521-1-jirislaby@kernel.org>
 <daf06969-15fd-470e-88b8-a717066fe312@linaro.org>
 <cebad7f8-3f47-4e6a-93b7-32fcf2367874@kernel.org>
 <f42ef4a3-4bfe-4354-9220-ed742e093c86@gmail.com>
Content-Language: en-US
In-Reply-To: <f42ef4a3-4bfe-4354-9220-ed742e093c86@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Op 07-06-2024 om 22:32 schreef Ferry Toth:
> Hi,
> 
> Op 22-04-2024 om 07:51 schreef Jiri Slaby:
>> Hi,
>>
>> On 19. 04. 24, 17:12, Neil Armstrong wrote:
>>> On 05/04/2024 08:08, Jiri Slaby (SUSE) wrote:
>>>> This series switches tty serial layer to use kfifo instead of circ_buf.
>>>>
>>>> The reasoning can be found in the switching patch in this series:
>>>> """
>>>> Switch from struct circ_buf to proper kfifo. kfifo provides much better
>>>> API, esp. when wrap-around of the buffer needs to be taken into 
>>>> account.
>>>> Look at pl011_dma_tx_refill() or cpm_uart_tx_pump() changes for 
>>>> example.
>>>>
>>>> Kfifo API can also fill in scatter-gather DMA structures, so it easier
>>>> for that use case too. Look at lpuart_dma_tx() for example. Note that
>>>> not all drivers can be converted to that (like atmel_serial), they
>>>> handle DMA specially.
>>>>
>>>> Note that usb-serial uses kfifo for TX for ages.
>>>> """
>> ...
>>> This patchset has at least broken all Amlogic and Qualcomm boards so 
>>> far, only part of them were fixed in next-
>>
>> So are there still not fixed problems yet?
>>
>>> but this serie has been merged in v1
>>
>> Ugh, are you saying that v1 patches are not worth taking? That doesn't 
>> fit with my experience.
>>
>>> with no serious testing
>>
>> Sadly, everyone had a chance to test the series:
>>    
>> https://lore.kernel.org/all/20240319095315.27624-1-jirislaby@kernel.org/
>> for more than two weeks before I sent this version for inclusion. And 
>> then it took another 5 days till this series appeared in -next. But 
>> noone with this HW apparently cared enough back then. I'd wish they 
>> (you) didn't. Maybe next time, people will listen more carefully:
>> ===
>> This is Request for Testing as I cannot test all the changes
>> (obviously). So please test your HW's serial properly.
>> ===
>>
>>> and should've been dropped immediately when the first regressions 
>>> were reported.
>>
>> Provided the RFT was mostly ignored (anyone who tested that here, or I 
>> only wasted my time?), how exactly would dropping help me finding 
>> potential issues in the series? In the end, noone is running -next in 
>> production, so glitches are sort of expected, right? And I believe I 
>> smashed them quickly enough (despite I was sidetracked to handle the 
>> n_gsm issue). But I might be wrong, as usual.
> 
> I arrived at this party a bit late, sorry about that. No good excuses.
> 
>> So no, dropping is not helping moving forward, actions taken by e.g. 
>> Marek Szyprowski <m.szyprowski@samsung.com> do, IMNSHO.
> 
> Good news is I tested on Merrifield (Intel Edison) which is slow 
> (500MHz) and has a HSU that can transmit up to 3.5Mb/s. It really 
> normally needs DMA and just a single interrupt at the end of transmit 
> and receive for which I my own patches locally. The bounce buffer I was 
> using on transmit broke due to this patch, so I dropped that. Still, 
> with the extra interrupts caused by the circ buffer wrapping around it 
> seems to work well. Too late to add my Tested-by.
> 
> One question though: in 8250_dma.c serial8250_tx_dma() you mention "/* 
> kfifo can do more than one sg, we don't (quite yet) */".
> 
> I see the opportunity to use 2 sg entries to get all the data out in one 
> dma transfer, but there doesn't seem to be much documentation or 
> examples on how to do that. It seems just increasing nents to 2 would do 
> the trick?

Nevertheless I got this to work. Very nice. Thanks for this series.
I am seeing only 2 interrupts (x2 as each interrupt happens twice), one 
for dma complete. The 2nd, not sure but likely, uart tx done.
In any case the whole buffer is transferred without interchar gaps.

> So, what was the reason to "don't (quite yet)"?

Before considering to send out a patch for this, are there any caveats 
that I'm overlooking?

>> thanks,
> 

