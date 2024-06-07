Return-Path: <linux-arm-msm+bounces-22096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1EC900D01
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 22:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1EBA1C21426
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 20:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4B8154BE8;
	Fri,  7 Jun 2024 20:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJI8GNub"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F354E45C06;
	Fri,  7 Jun 2024 20:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792358; cv=none; b=mhVSHNvoNLocVEc/ejkI0Y3ciAZmxWHo1+WDEiIsyiYHOWrgJPsY29qWvRjngHt6+v8jTVd+AOLBe0O8e83kqNjglDUvvNQ7mIePW9lt0h6XI/NYYY/uRwETrnA3jb4HeFYgIc4XkmqAVbEwb3w7WJ00ZFI847D4SMAOrz9eY8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792358; c=relaxed/simple;
	bh=aD6y1F3VSS5CEJ0w5Jd1S8KIHod5Ks8bdj5s9Qths8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AE6/yoVRbJL3fBDd3Z1Bb2W8mR43nZxWRTPXuMFSWDBGm7R2bXUfXoVWT+2SssNp1lPm5dFN1AXRMm959EdtkuijiE2STeIoVVOSs2sILS5sapaW3e5i/U/3gQBUPU3bukQQYkTdnz/lZ+bCRkIAns+oGNCNvx5zx/1AZfGMclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJI8GNub; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a68c8b90c85so319704966b.2;
        Fri, 07 Jun 2024 13:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717792355; x=1718397155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zbN2NOWcjbRapD6qd1t3MtztGq2eBL26rOq0Qw9qaDM=;
        b=PJI8GNubzUrax9jOBdHOrtlH3+vkkZip5M3ofZgNQVORRFEJirI0WatGsY7fY7OJq+
         zEMCc3NkvANpijbWNPcZ9lz4UUfM73W5XtXssPUSJn3XK15rThJEQCMJnAeLG2v3bQ4b
         whBn4/0sulhOcSl7Y9+yQb+EyCtIb1tvFqS0LYzDODS885vrok/xy+Quq6R374osLdwz
         XQxK3/t7oyS9qGu8vVUBHQKLBNKob6yfvmL63vHyZ0MqgSnItXzRjXKUHsv5lIRNXS+v
         SwydYcduttMDJ/p5l4K+hlspU7fBgH436dMSoKHWP96vbCEPas1sGhFbl8J05kDxHwxc
         5lBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717792355; x=1718397155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zbN2NOWcjbRapD6qd1t3MtztGq2eBL26rOq0Qw9qaDM=;
        b=ttmNWFcTh+RUKIc2nRQSmh9VYxYGID0l30gKJdZAQZXFPdxiTVHJx203fx1Lsg/mtW
         fr0wuJYeFlwMY01PmGax44fLYVU0W/PZ10Ryt1c4P5roXBaE7fqpi561GTYXW5CLJ8wU
         muadVOQzgJRErLqNhvkkFEMBixDx8Gn4Et1aAsSQPfHxuZxZ2cWNPYt1rxv+qpvNxSJh
         DGaBMCAh+0Mo3LTBwo3nr2xQWJ3zSJn2pA2zWTxOJ3HiZ+SEdSFmYnyNgmUFkkl6XmTb
         +iR3tCAGdihIbI/cz7A9a8mVtqZa3sjc3GpB/4YfeKFfn8pfT/UrvrOEbDkLCJGplAbP
         ZlWg==
X-Forwarded-Encrypted: i=1; AJvYcCUmzZFr+by9SI7sUh2KRO11mU3m6cD3WE8KAwYQKbH6OI5AIHkHqcJUT2LqAaz0ZH5WZhfBMD1pXcyxyCRJER5/vKP/rm6M9tnab3N8xjVEjhd/BC/5pewBet66uWsxzjObQ0OM9jpkWlIMBQ==
X-Gm-Message-State: AOJu0Yw4eg2WSOdtLLUiyYNTLYV/MjtXPqmURhPZiJjrxIWLGveqmqiB
	pQyndXi8BQ7ftjCwW75NMKnhYLacJAHuRPgk647ScbM6rzGp7S2O
X-Google-Smtp-Source: AGHT+IHFgsFB/gzesC3tXnn4puyao28oEqZrG8vMENeNC+mawQnpnhwNC0WA2HNzCbpIRoU1Bbj2uA==
X-Received: by 2002:a17:906:25cb:b0:a6e:fdc8:ae45 with SMTP id a640c23a62f3a-a6efdc8b4b0mr13273166b.1.1717792354737;
        Fri, 07 Jun 2024 13:32:34 -0700 (PDT)
Received: from ?IPV6:2a02:a466:68ed:1:b5d2:cd90:17cf:ee79? (2a02-a466-68ed-1-b5d2-cd90-17cf-ee79.fixed6.kpn.net. [2a02:a466:68ed:1:b5d2:cd90:17cf:ee79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6e2e1d4cb8sm120597966b.5.2024.06.07.13.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 13:32:34 -0700 (PDT)
Message-ID: <f42ef4a3-4bfe-4354-9220-ed742e093c86@gmail.com>
Date: Fri, 7 Jun 2024 22:32:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] tty: serial: switch from circ_buf to kfifo
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
Content-Language: en-US
From: Ferry Toth <fntoth@gmail.com>
In-Reply-To: <cebad7f8-3f47-4e6a-93b7-32fcf2367874@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Op 22-04-2024 om 07:51 schreef Jiri Slaby:
> Hi,
> 
> On 19. 04. 24, 17:12, Neil Armstrong wrote:
>> On 05/04/2024 08:08, Jiri Slaby (SUSE) wrote:
>>> This series switches tty serial layer to use kfifo instead of circ_buf.
>>>
>>> The reasoning can be found in the switching patch in this series:
>>> """
>>> Switch from struct circ_buf to proper kfifo. kfifo provides much better
>>> API, esp. when wrap-around of the buffer needs to be taken into account.
>>> Look at pl011_dma_tx_refill() or cpm_uart_tx_pump() changes for example.
>>>
>>> Kfifo API can also fill in scatter-gather DMA structures, so it easier
>>> for that use case too. Look at lpuart_dma_tx() for example. Note that
>>> not all drivers can be converted to that (like atmel_serial), they
>>> handle DMA specially.
>>>
>>> Note that usb-serial uses kfifo for TX for ages.
>>> """
> ...
>> This patchset has at least broken all Amlogic and Qualcomm boards so 
>> far, only part of them were fixed in next-
> 
> So are there still not fixed problems yet?
> 
>> but this serie has been merged in v1
> 
> Ugh, are you saying that v1 patches are not worth taking? That doesn't 
> fit with my experience.
> 
>> with no serious testing
> 
> Sadly, everyone had a chance to test the series:
>    https://lore.kernel.org/all/20240319095315.27624-1-jirislaby@kernel.org/
> for more than two weeks before I sent this version for inclusion. And 
> then it took another 5 days till this series appeared in -next. But 
> noone with this HW apparently cared enough back then. I'd wish they 
> (you) didn't. Maybe next time, people will listen more carefully:
> ===
> This is Request for Testing as I cannot test all the changes
> (obviously). So please test your HW's serial properly.
> ===
> 
>> and should've been dropped immediately when the first regressions were 
>> reported.
> 
> Provided the RFT was mostly ignored (anyone who tested that here, or I 
> only wasted my time?), how exactly would dropping help me finding 
> potential issues in the series? In the end, noone is running -next in 
> production, so glitches are sort of expected, right? And I believe I 
> smashed them quickly enough (despite I was sidetracked to handle the 
> n_gsm issue). But I might be wrong, as usual.

I arrived at this party a bit late, sorry about that. No good excuses.

> So no, dropping is not helping moving forward, actions taken by e.g. 
> Marek Szyprowski <m.szyprowski@samsung.com> do, IMNSHO.

Good news is I tested on Merrifield (Intel Edison) which is slow 
(500MHz) and has a HSU that can transmit up to 3.5Mb/s. It really 
normally needs DMA and just a single interrupt at the end of transmit 
and receive for which I my own patches locally. The bounce buffer I was 
using on transmit broke due to this patch, so I dropped that. Still, 
with the extra interrupts caused by the circ buffer wrapping around it 
seems to work well. Too late to add my Tested-by.

One question though: in 8250_dma.c serial8250_tx_dma() you mention "/* 
kfifo can do more than one sg, we don't (quite yet) */".

I see the opportunity to use 2 sg entries to get all the data out in one 
dma transfer, but there doesn't seem to be much documentation or 
examples on how to do that. It seems just increasing nents to 2 would do 
the trick?

So, what was the reason to "don't (quite yet)"?

> thanks,


