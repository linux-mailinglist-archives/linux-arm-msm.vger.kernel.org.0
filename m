Return-Path: <linux-arm-msm+bounces-22783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22810909FC9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 22:55:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E0DE1C212A7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2024 20:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C72754F95;
	Sun, 16 Jun 2024 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4uwD6lT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E32A2BD18;
	Sun, 16 Jun 2024 20:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718571319; cv=none; b=k+iYFDFODkGhWd5byyPQUVQjjDjAHAFNmYDJgZo3kMdYXtxvmDJ3xb0YZIIYZk4+IEWHvrJ9jjD5kmJKyDFZcG1LY5MiRwnTszNK5JmOiQnFfjWiIxnjhl11kcoHJQvl+C0Jewa0GbrVbWjbEr31bf8cg8kMWPsd6roX0f672ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718571319; c=relaxed/simple;
	bh=WYzuDrXmO6AUW7fbmvjgsYXwIlVa0WM9LgyqmT8vBDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TEKLYuxMqlI2ErP37E4QQryyP9n/kEhMCyf73HL3LeRB9v/KGKnIihnrpqZFHbc+yBW80JlKqtWJv0GhyrxzJTif7Uh9rK434sxQlQZMpt5JsCJIs+nMwNrBQhjIVUQnXBE6ZFYOLmgEtI0O8Mf4ul4kjqp7opJSI6rXerJ/w48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4uwD6lT; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57c60b13a56so4397366a12.0;
        Sun, 16 Jun 2024 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718571315; x=1719176115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=APPaSVkkIkLVp2kGB9USVnluHmcgSJhTWRI3mRmHmok=;
        b=L4uwD6lTSAy2elbCHGJuidEXMF7wCXrvVeXYmqf579YmeqjmcZuasWsb+lUwWnuSFY
         j8sSBuVdiFo+xDnZs5zlyJO5eRMfbKiuvM7KYoyG5iPJSkpOOjIW1QCNfNH3bwsgZ9f1
         R9K68oOGvbTDD4dP0AMb/3xc8JV2K3u3NcBVtKmQM0/2Qth/qRPVAoiXGGNVQ28uMNKX
         4WT1vPKTTPiDvRii+n7O8BjmIuwDktynqJA241BldMfCB5qiA81j5zHUTBKgz/MYpG5p
         bDpmVzMvV2dZrL1wkzqnxiOJeVEZbpjbX+DZ9ZWU2xVbxIX93nSvnqPH5+ywexYwLJil
         OTpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718571315; x=1719176115;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=APPaSVkkIkLVp2kGB9USVnluHmcgSJhTWRI3mRmHmok=;
        b=v+EBDwH7SNfFZTOH/QlfGrUV6DV2OKgKz0PyudbqDZvlnVahD687IF9oaDB9vgmbRw
         bELi4iLw06fRwrWpPdOin+i0pqYD+7UQU0woOGMJ0Ikgs6zL+N67x+fhq0SmUTLHDFaL
         Ay12BBVnen7EjGkBSpqbNJ36lfg5ES8RKnYiCH0rj3Ul0RTfwDzjsekjVk9Gi9cXw5bW
         iMC9GL+kI9pEI4AaxoxWgo8oA9MRIxXhltYGPGMCSaCGkzX49kKd4qbFJFFJZzzyKHUc
         2qCzB0UwdNPFtICKAwBtrSmhTPo0jMgzxHD/6gTCWmmYFqSoB/ACljXdvPUy5d0tdisI
         u6tw==
X-Forwarded-Encrypted: i=1; AJvYcCXTzPU0mSyTIRm2rcVZHX9zStH5P3AtFeu+/0k6QIHYv2bXoTFXefAvl8/aHagG1VrJcMRpgBPYK2fZUmef62LKF5hFT6lhrEhvpbjGbNuNks+2jYGIoEWo0mKvJR8FfyfzXYDYPsz1/pd512//dLW27d0VTpvLwZHdv5CQX4AasPg6BWs6kb5NsA==
X-Gm-Message-State: AOJu0Yx0x0wwZxEltzJ77p4n4CaEJZbgESw/TVfmkuL1//Ut7DOIzRrJ
	yG+JbPad3vPNV/Ih7zI24PgKNw1E1yK6HTJNleiA6tCN9qnaG+/O
X-Google-Smtp-Source: AGHT+IEVHjAFd1evmZPWjVr799mlnu88TZMUwRhtd/dvcsW1b+V2b2+3ux2JS7O63hkgjP1HoUggcA==
X-Received: by 2002:a17:906:4144:b0:a6f:9a:db48 with SMTP id a640c23a62f3a-a6f60dc5609mr445522366b.61.1718571315054;
        Sun, 16 Jun 2024 13:55:15 -0700 (PDT)
Received: from ?IPV6:2a02:a466:68ed:1:b241:3c58:56ab:2e6a? (2a02-a466-68ed-1-b241-3c58-56ab-2e6a.fixed6.kpn.net. [2a02:a466:68ed:1:b241:3c58:56ab:2e6a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ecd666sm441732066b.135.2024.06.16.13.55.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 13:55:14 -0700 (PDT)
Message-ID: <45d41a5d-384e-4dc9-8b43-8dd8734b822a@gmail.com>
Date: Sun, 16 Jun 2024 22:55:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] tty: serial: switch from circ_buf to kfifo
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ferry Toth <fntoth@gmail.com>
Cc: Jiri Slaby <jirislaby@kernel.org>, neil.armstrong@linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Al Cooper <alcooperx@gmail.com>,
 Alexander Shiyan <shc_work@mail.ru>,
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
 Vineet Gupta <vgupta@kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Phil Edworthy <phil.edworthy@renesas.com>
References: <20240405060826.2521-1-jirislaby@kernel.org>
 <daf06969-15fd-470e-88b8-a717066fe312@linaro.org>
 <cebad7f8-3f47-4e6a-93b7-32fcf2367874@kernel.org>
 <f42ef4a3-4bfe-4354-9220-ed742e093c86@gmail.com>
 <364fbb96-006f-4582-a0f8-a0f9edd50f6f@gmail.com>
 <f6dc3a45-7be8-4ce2-c7da-65c6bd9ce8d1@linux.intel.com>
Content-Language: en-US
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: <f6dc3a45-7be8-4ce2-c7da-65c6bd9ce8d1@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

adding Phil

Op 12-06-2024 om 15:13 schreef Ilpo Järvinen:
> On Mon, 10 Jun 2024, Ferry Toth wrote:
>> Op 07-06-2024 om 22:32 schreef Ferry Toth:
>>> Op 22-04-2024 om 07:51 schreef Jiri Slaby:
>>>> On 19. 04. 24, 17:12, Neil Armstrong wrote:
>>>>> On 05/04/2024 08:08, Jiri Slaby (SUSE) wrote:
>>>>>> This series switches tty serial layer to use kfifo instead of
>>>>>> circ_buf.
>>>>>>
>>>>>> The reasoning can be found in the switching patch in this series:
>>>>>> """
>>>>>> Switch from struct circ_buf to proper kfifo. kfifo provides much
>>>>>> better
>>>>>> API, esp. when wrap-around of the buffer needs to be taken into
>>>>>> account.
>>>>>> Look at pl011_dma_tx_refill() or cpm_uart_tx_pump() changes for
>>>>>> example.
>>>>>>
>>>>>> Kfifo API can also fill in scatter-gather DMA structures, so it easier
>>>>>> for that use case too. Look at lpuart_dma_tx() for example. Note that
>>>>>> not all drivers can be converted to that (like atmel_serial), they
>>>>>> handle DMA specially.
>>>>>>
>>>>>> Note that usb-serial uses kfifo for TX for ages.
>>>>>> """
>>>> Sadly, everyone had a chance to test the series:
>>>>     https://lore.kernel.org/all/20240319095315.27624-1-jirislaby@kernel.org/
>>>> for more than two weeks before I sent this version for inclusion. And then
>>>> it took another 5 days till this series appeared in -next. But noone with
>>>> this HW apparently cared enough back then. I'd wish they (you) didn't.
>>>> Maybe next time, people will listen more carefully:
>>>> ===
>>>> This is Request for Testing as I cannot test all the changes
>>>> (obviously). So please test your HW's serial properly.
>>>> ===
>>>>
>>>>> and should've been dropped immediately when the first regressions were
>>>>> reported.
>>>> Provided the RFT was mostly ignored (anyone who tested that here, or I
>>>> only wasted my time?), how exactly would dropping help me finding
>>>> potential issues in the series? In the end, noone is running -next in
>>>> production, so glitches are sort of expected, right? And I believe I
>>>> smashed them quickly enough (despite I was sidetracked to handle the n_gsm
>>>> issue). But I might be wrong, as usual.
>>> I arrived at this party a bit late, sorry about that. No good excuses.
>>>
>>>> So no, dropping is not helping moving forward, actions taken by e.g. Marek
>>>> Szyprowski <m.szyprowski@samsung.com> do, IMNSHO.
>>> Good news is I tested on Merrifield (Intel Edison) which is slow (500MHz)
>>> and has a HSU that can transmit up to 3.5Mb/s. It really normally needs DMA
>>> and just a single interrupt at the end of transmit and receive for which I
>>> my own patches locally. The bounce buffer I was using on transmit broke due
>>> to this patch, so I dropped that. Still, with the extra interrupts caused by
>>> the circ buffer wrapping around it seems to work well. Too late to add my
>>> Tested-by.
>>>
>>> One question though: in 8250_dma.c serial8250_tx_dma() you mention "/* kfifo
>>> can do more than one sg, we don't (quite yet) */".
>>>
>>> I see the opportunity to use 2 sg entries to get all the data out in one dma
>>> transfer, but there doesn't seem to be much documentation or examples on how
>>> to do that. It seems just increasing nents to 2 would do the trick?
>> Currently I have this working on mrfld:

diff --git a/drivers/tty/serial/8250/8250_dma.c 
b/drivers/tty/serial/8250/8250_dma.c

index 8a353e3cc3dd..d215c494ee24 100644

--- a/drivers/tty/serial/8250/8250_dma.c

+++ b/drivers/tty/serial/8250/8250_dma.c

@@ -89,7 +89,9 @@ int serial8250_tx_dma(struct uart_8250_port *p)

struct tty_port *tport = &p->port.state->port;

struct dma_async_tx_descriptor *desc;

struct uart_port *up = &p->port;

- struct scatterlist sg;

+ struct scatterlist *sg;

+ struct scatterlist sgl[2];

+ int i;

int ret;

if (dma->tx_running) {

@@ -110,18 +112,17 @@ int serial8250_tx_dma(struct uart_8250_port *p)

serial8250_do_prepare_tx_dma(p);

- sg_init_table(&sg, 1);

- /* kfifo can do more than one sg, we don't (quite yet) */

- ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,

+ sg_init_table(sgl, ARRAY_SIZE(sgl));

+

+ ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, sgl, 
ARRAY_SIZE(sgl),

UART_XMIT_SIZE, dma->tx_addr);

- /* we already checked empty fifo above, so there should be something */

- if (WARN_ON_ONCE(ret != 1))

- return 0;

+ dma->tx_size = 0;

- dma->tx_size = sg_dma_len(&sg);

+ for_each_sg(sgl, sg, ret, i)

+ dma->tx_size += sg_dma_len(sg);

- desc = dmaengine_prep_slave_sg(dma->txchan, &sg, 1,

+ desc = dmaengine_prep_slave_sg(dma->txchan, sgl, ret,

DMA_MEM_TO_DEV,

DMA_PREP_INTERRUPT | DMA_CTRL_ACK);

if (!desc) {

>> Nevertheless I got this to work. Very nice. Thanks for this series.
>> I am seeing only 2 interrupts (x2 as each interrupt happens twice), one for
>> dma complete. The 2nd, not sure but likely, uart tx done.
>> In any case the whole buffer is transferred without interchar gaps.
>>
>>> So, what was the reason to "don't (quite yet)"?
>> Before considering to send out a patch for this, are there any caveats that
>> I'm overlooking?
> Not exactly related to that quoted comment, but you should Cc the person
> who added RNZ1 DMA a year or two back (in 8250_dw.c) because it required

RZN1

I think you are referring to aa63d786cea2 ("serial: 8250: dw: Add 
support for DMA flow controlling devices") by

Phil Edworthy<phil.edworthy@renesas.com>?

> writing Tx length into some custom register. I don't know the meaning of
> that HW specific register so it would be good to get confirmation the HW
I see dw8250_prepare_tx_dma() has RZN1_UART_xDMACR_BLK_SZ(dma->tx_size)
> is okay if it gets more than 1 sg entry (at worst, a HW-specific limit
> on nents might need to be imposed).
>
And is there a way to get the maximum nents supported? I thought 
kfifo_dma_out_prepare_mapped() would return a safe number.

