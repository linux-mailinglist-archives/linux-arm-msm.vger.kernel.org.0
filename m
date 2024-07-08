Return-Path: <linux-arm-msm+bounces-25456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B73929BF4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 08:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8EF81C20342
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2024 06:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733F579FD;
	Mon,  8 Jul 2024 06:10:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8295119B;
	Mon,  8 Jul 2024 06:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720419024; cv=none; b=qddUDMIZKuZlvyWhRw1BYQ6Smev5LvC6IbJga2rLwf/iPYDkDXMhQ0G2keGfbrTLD8Jey97Zo/SoWKfgpkgvSqIQ1qO8pFjmY8HlhPimsn2WMldaRK1wkFmAp/rANjOhVv6O0kV1x/WcvohpJ4jg8kRd8+8NBS9hm9wiPUs/Lpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720419024; c=relaxed/simple;
	bh=hG7CzhzxSxDQio/mMJFBeY/COl8b9KFICEebwRSJWeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wn4Matf5mliFk4klykIQO6vSgqWK6zABbhxhdYQfku9auMbbpeZUTiVqySla0qhzHtLl442nmx+qpcx4b4eaAH1GDiuDc3W9FrwloMVLiTVqnrtbVyLGYQdXJDJOYJk6xnXfpYOKogChTbalwij1ay80W2YRQLygzlt+JHBnhIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ee75ffce77so44013821fa.3;
        Sun, 07 Jul 2024 23:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720419021; x=1721023821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJWtXHufDr2I769FCQbgOYlLb1GQEi3ijiiZvrcDH7k=;
        b=N52JMgYTUhkKzO7UcIpscEVYSuoFVRl1ZHnXC5EhA0c65yJLIcP1m4WoJi8Rp5hjEd
         htog4KQ1G5uGwaxg+nI0Tcz+kYCenHYUkbT8Cu8CRbBGxF+avjSn1vYfihmZQesPEiub
         gfa1kXc/5wTBCB86//ax0vAxkJ+uV2B8kWf8iQLuouwjKK5QurpZSON/musswXxz2Vs7
         ujFqjH9XCeL/60DbWrrJpk7IRR9bRO43iTEgpCW1k59ztrWVLe+GzH/u8Q1rZ+/J9vIf
         DMs6f1nnK6ahwOjZIICzP58dEjcgfuxI3mpxUcFt70+ACXevPa7KqKR7RWztvZHedAEj
         4qRw==
X-Forwarded-Encrypted: i=1; AJvYcCUy1fObIWdLMNv0rDLrkYxBtAQk7puAef9WkGRZ2u8ZwGyAdhDPnb/x9W/KwbWG0ezQg8BkLud9My2pfX9c/KK6EH9MFVEELxWdN1BKU8MGksfFuP/MAxbfRkyk9kkkRLtqO61tsV6lYV3BvbRwLj43J3FoggNlauEbYt938Z5UNaC9gjDFUb3s6Q==
X-Gm-Message-State: AOJu0YwR3Hmhs1QqKHgaBtxyLGscnC9EiBdlW2scRFbz8a//vWFMXrC9
	PiHwdEEpVbRLwA/UY8DlqCoumjtU5VBNzwBKSqhI3UmKwgV4eQn9
X-Google-Smtp-Source: AGHT+IEK4ddfEI+wnLkVRikN53tdJ3qtrQ2FgrihM703ynqyT8YECHSrEAAKkE+ULPFH2hXFwf61Ig==
X-Received: by 2002:a2e:9b8f:0:b0:2ee:8720:b4b8 with SMTP id 38308e7fff4ca-2ee8ee0e946mr83389231fa.39.1720419020270;
        Sun, 07 Jul 2024 23:10:20 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:69? ([2a0b:e7c0:0:107::aaaa:69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367a0b09da7sm9558923f8f.69.2024.07.07.23.10.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jul 2024 23:10:19 -0700 (PDT)
Message-ID: <5619cca5-6d5b-4682-bbf7-51b851cef37e@kernel.org>
Date: Mon, 8 Jul 2024 08:10:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC v1 1/1] tty: serial: 8250_dma: use sgl with 2 nents to
 take care of buffer wrap
To: Ferry Toth <ftoth@exalondelft.nl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 John Ogness <john.ogness@linutronix.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: neil.armstrong@linaro.org, AlCooper <alcooperx@gmail.com>,
 AlexanderShiyan <shc_work@mail.ru>,
 AlexandreBelloni <alexandre.belloni@bootlin.com>,
 AlexandreTorgue <alexandre.torgue@foss.st.com>,
 AlimAkhtar <alim.akhtar@samsung.com>,
 AndrewMorton <akpm@linux-foundation.org>,
 "AneeshKumarK . V" <aneesh.kumar@kernel.org>,
 AngeloGioacchinoDelRegno <angelogioacchino.delregno@collabora.com>,
 BaolinWang <baolin.wang@linux.alibaba.com>, BaruchSiach <baruch@tkos.co.il>,
 BjornAndersson <andersson@kernel.org>,
 ClaudiuBeznea <claudiu.beznea@tuxon.dev>,
 "DavidS . Miller" <davem@davemloft.net>, FabioEstevam <festevam@gmail.com>,
 HammerHsieh <hammerh0314@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ChristopheLeroy <christophe.leroy@csgroup.eu>,
 ChunyanZhang <zhang.lyra@gmail.com>, JeromeBrunet <jbrunet@baylibre.com>,
 JonathanHunter <jonathanh@nvidia.com>, KevinHilman <khilman@baylibre.com>,
 KonradDybcio <konrad.dybcio@linaro.org>,
 KrzysztofKozlowski <krzysztof.kozlowski@linaro.org>,
 KumaravelThiagarajan <kumaravel.thiagarajan@microchip.com>,
 LaxmanDewangan <ldewangan@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, "MaciejW . Rozycki" <macro@orcam.me.uk>,
 ManivannanSadhasivam <manivannan.sadhasivam@linaro.org>,
 MartinBlumenstingl <martin.blumenstingl@googlemail.com>,
 MatthiasBrugger <matthias.bgg@gmail.com>,
 MaximeCoquelin <mcoquelin.stm32@gmail.com>,
 MichaelEllerman <mpe@ellerman.id.au>, MichalSimek <michal.simek@amd.com>,
 "NaveenN . Rao" <naveen.n.rao@linux.ibm.com>,
 NicolasFerre <nicolas.ferre@microchip.com>,
 NicholasPiggin <npiggin@gmail.com>, OrsonZhai <orsonzhai@gmail.com>,
 =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 PatriceChotard <patrice.chotard@foss.st.com>,
 PeterKorsgaard <jacmet@sunsite.dk>, RichardGenoud
 <richard.genoud@gmail.com>, RussellKing <linux@armlinux.org.uk>,
 SaschaHauer <s.hauer@pengutronix.de>, ShawnGuo <shawnguo@kernel.org>,
 StefaniSeibold <stefani@seibold.net>, SumitSemwal <sumit.semwal@linaro.org>,
 TaichiSugaya <sugaya.taichi@socionext.com>,
 TakaoOrito <orito.takao@socionext.com>,
 TharunKumarP <tharunkumar.pasumarthi@microchip.com>,
 ThierryReding <thierry.reding@gmail.com>, TimurTabi <timur@kernel.org>,
 VineetGupta <vgupta@kernel.org>, MarekSzyprowski <m.szyprowski@samsung.com>,
 PhilEdworthy <phil.edworthy@renesas.com>
References: <20240703212613.56024-1-ftoth@exalondelft.nl>
 <20240703212613.56024-2-ftoth@exalondelft.nl>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20240703212613.56024-2-ftoth@exalondelft.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03. 07. 24, 22:56, Ferry Toth wrote:
> Previously 8250_dma used a circular xmit->buf as DMA output buffer. This
> causes messages that wrap around in the circular buffer to be
> transmitted using 2 DMA transfers. Depending on baud rate and processor
> load this can cause an interchar gap in the middle of the message. On
> the receiving end the gap may cause a short receive timeout, possibly
> long enough to terminate a DMA transfer, but too short to restart a
> receive DMA transfer in time thus causing a receive buffer overrun.
> 
> This is especially a problem for devices with high speed UARTs (HSU)
> where even deep 64 byte FIFO's are not sufficient to handle interrupt
> latency.
> 
> The circular buffer has now been replaced by kfifo which requires a SG
> list with a single entry, which still causes 2 dma transfers when a wrap
> around occurs. Fix this by allowing up to 2 entries in the sgl.

As I stated earlier, from the DMA and TTY perspective, this looks all 
good™. So I welcome this.

 From the devices perspective, obviously testers needed ;). I believe we 
can merge this in 6.12-rc1 (or even 6.11-rc1?) and see. So please post a 
non-RFC patch.

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> Signed-off-by: Ferry Toth <ftoth@exalondelft.nl>
> ---
>   drivers/tty/serial/8250/8250_dma.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dma.c b/drivers/tty/serial/8250/8250_dma.c
> index 8a353e3cc3dd..d215c494ee24 100644
> --- a/drivers/tty/serial/8250/8250_dma.c
> +++ b/drivers/tty/serial/8250/8250_dma.c
> @@ -89,7 +89,9 @@ int serial8250_tx_dma(struct uart_8250_port *p)
>   	struct tty_port			*tport = &p->port.state->port;
>   	struct dma_async_tx_descriptor	*desc;
>   	struct uart_port		*up = &p->port;
> -	struct scatterlist sg;
> +	struct scatterlist		*sg;
> +	struct scatterlist		sgl[2];
> +	int i;
>   	int ret;
>   
>   	if (dma->tx_running) {
> @@ -110,18 +112,17 @@ int serial8250_tx_dma(struct uart_8250_port *p)
>   
>   	serial8250_do_prepare_tx_dma(p);
>   
> -	sg_init_table(&sg, 1);
> -	/* kfifo can do more than one sg, we don't (quite yet) */
> -	ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, &sg, 1,
> +	sg_init_table(sgl, ARRAY_SIZE(sgl));
> +
> +	ret = kfifo_dma_out_prepare_mapped(&tport->xmit_fifo, sgl, ARRAY_SIZE(sgl),
>   					   UART_XMIT_SIZE, dma->tx_addr);
>   
> -	/* we already checked empty fifo above, so there should be something */
> -	if (WARN_ON_ONCE(ret != 1))
> -		return 0;
> +	dma->tx_size = 0;
>   
> -	dma->tx_size = sg_dma_len(&sg);
> +	for_each_sg(sgl, sg, ret, i)
> +		dma->tx_size += sg_dma_len(sg);
>   
> -	desc = dmaengine_prep_slave_sg(dma->txchan, &sg, 1,
> +	desc = dmaengine_prep_slave_sg(dma->txchan, sgl, ret,
>   				       DMA_MEM_TO_DEV,
>   				       DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
>   	if (!desc) {

-- 
js


