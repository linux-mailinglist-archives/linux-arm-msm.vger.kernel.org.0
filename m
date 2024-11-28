Return-Path: <linux-arm-msm+bounces-39460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA0A9DB92C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 15:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2EA0281BE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 14:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044151AB6F1;
	Thu, 28 Nov 2024 14:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="teOA1CGK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8F51AA1F9
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 14:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732802575; cv=none; b=blPjiav5FtF1cjXyfIodBqDBfFFhj0BLf3yPCbXnsXWQ8khpXDopBBxUvSXDnBhABKuyVJElLXcPxwlF3kWfGZRhnM05mAnQctc8xvvAEEE2C4QbH8vb9XphJxMgSM4mqIyMNUlVliUbeMD51EdPP2diavF49vhdo313ibmGWzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732802575; c=relaxed/simple;
	bh=F1OqdHp8G/U6BfYahUOiD4IZCrTA9zknZD/n3jUUEAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhKSz8m2F789C0oDyLbYWKC8+BTZu8UAgGD5umgNOUZqB5LODGsJbxuf4rlrFbZWUwag4Mc3TN4WScIEASmRAJWbllKUGKiCu2ICHd+NU15VlMiBwuEJyoqWFtMo0sf8nt0qJRCplvDuk/2S3LkQxcTiAHqKsVOfN5i0pbWnOxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=teOA1CGK; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so13939371fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 06:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732802571; x=1733407371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xeJyMwJQ6XBMrgnGSGmiT0bLRoKdLv7IuRVfpAPwpzI=;
        b=teOA1CGKfs+G/T5ib2yL7TJvENiLF9bZi/7jStpWqfmN/8tpKFB3UM3AORucG3FRiy
         aOBy34DToqr6xzP6A9oOwzpFnWJ5aw6ArIqt6F8c7JZ5sionw6dRPiim92gOm7p1v7ZG
         ro6Gkp8Xydq7GlE0fAp4trHLQlU+NLuA5xShc6KTKiM61oYEce6hcsv3Qc64r1CmA95z
         HQowtJMZfSZlTpDIzjA2y3DAw4n+P8PU42NZZ3b/z7Q/J6n+DLc6He/8OCaaHxluVfNf
         KCPdmKphVOxRODfcNWEcJa+f04iFlcRTmIzIWqFJlELbqJ3MSaQDM3q2V5UwFqf39wKa
         FsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732802571; x=1733407371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeJyMwJQ6XBMrgnGSGmiT0bLRoKdLv7IuRVfpAPwpzI=;
        b=tOg4qH/t80CzyedLzKz9QRdbMKDPQUgD8tc3oTkTtPKIuUY2T1hTKBYnV0Rzi/PeK4
         LM4TlHSVDk31T+zxqUnnXcXrEd2Z3U4ksSiZ9fgfOPDjQrTJtc33qZkuLQ1HQjN5Wn5B
         SErW6TjJphVtCdSchR/WHLfP92SIt6DOyC2qhdk3kteU3RG16gX5o94+/EGZdvmlXwwG
         i7ek0aSWUSI0SVAKLZDkEwCmYoofeBTd18L2LiWQ0rNjb6DLcw1IB42ofNfCPK/byVRn
         cRYw55inxlvmJ6feJm+M6UHnJ6VO0Sl2obmFVbwujIYECDhf7cDSU8jDEZCThWZYrTjP
         rlfw==
X-Forwarded-Encrypted: i=1; AJvYcCWqv91TJF8P8ynArbp5EPs7+EnxaUPlfvfAazwKeySv4Wg0zRvMugEDquBbgsCd3g0f5nZir4HJH60YeFdk@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLmurIgQAsEC+MljnMt0Rj7hZr70d/NaJSqdF0gUk9xTqqDKK
	lNtvTYgu6APlyPe6i0ikSdp8xDSaJgVNSZfK8Cn6oHV+sKn7m/5Uy8MmWvAWx68=
X-Gm-Gg: ASbGncvr6mTFnZT3tT1cHFTVFWDtVIuOQnF0BgrMCcNxRULC51DyHvg3M29aRr9zJ0Q
	xOMyuLMw0qSyT5PagJ8SEPXSHmYu/haCzDvnfFvtuDXCV0PT7qMpuzebS2NdlwCJlzqQFOhqkIl
	sqHOojsBSbxEpM1OmIut3P3O8AyZhfFx6f9kgKzDeHJwMqU2oeW4/XhUayvd8A8kuq5l1TFidyA
	FkJJSZh8l9m1/viDvPQ2h8Iu3zmSrsw8PibE3FU9A+9p3vfpv29ODtfvmTbtq8eJKeKm0d/HXyZ
	eF/t+JIPjY/bK3RbCTtzeHue0JaDSA==
X-Google-Smtp-Source: AGHT+IGtbTIkMoWGEjQsDBQ4vvOf84Isx05CyJ/PpULIal2PcMcLSw7j4gX0biAvVxjY2HCd/KPzeg==
X-Received: by 2002:a05:651c:b24:b0:2ff:c4b2:496b with SMTP id 38308e7fff4ca-2ffd5fcc1c9mr55040321fa.7.1732802569509;
        Thu, 28 Nov 2024 06:02:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbe53b7sm1966831fa.31.2024.11.28.06.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 06:02:48 -0800 (PST)
Date: Thu, 28 Nov 2024 16:02:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v1 1/1] spi: spi-geni-qcom: Add immediate DMA support
Message-ID: <wndlbjorghg5tilcoiv47vmxw44euitpomvmlgwqdjwvlhxiy5@jzade5xterdl>
References: <20241121115201.2191-1-quic_jseerapu@quicinc.com>
 <20241121115201.2191-2-quic_jseerapu@quicinc.com>
 <d2ybuvo676ouxhj2rejx6swlwkofycms2iwqsfcnwbfl3llbdr@4yoxxbmalpyf>
 <71d9e588-73eb-48c8-8efb-1ee79066092d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71d9e588-73eb-48c8-8efb-1ee79066092d@quicinc.com>

On Thu, Nov 28, 2024 at 07:06:22PM +0530, Jyothi Kumar Seerapu wrote:
> 
> 
> On 11/22/2024 3:38 AM, Dmitry Baryshkov wrote:
> > On Thu, Nov 21, 2024 at 05:22:01PM +0530, Jyothi Kumar Seerapu wrote:
> > > The DMA TRE(Transfer ring element) buffer contains the DMA
> > > buffer address. Accessing data from this address can cause
> > > significant delays in SPI transfers, which can be mitigated to
> > > some extent by utilizing immediate DMA support.
> > > 
> > > QCOM GPI DMA hardware supports an immediate DMA feature for data
> > > up to 8 bytes, storing the data directly in the DMA TRE buffer
> > > instead of the DMA buffer address. This enhancement enables faster
> > > SPI data transfers.
> > 
> > Is it supported on all GPI DMA platforms, starting from SDM845?
> Yes, it supported on all GPI DMA platforms.
> > 
> > > 
> > > This optimization reduces the average transfer time from 25 us to
> > > 16 us for a single SPI transfer of 8 bytes length, with a clock
> > > frequency of 50 MHz.
> > > 
> > > Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> > > ---
> > >   drivers/dma/qcom/gpi.c           | 32 +++++++++++++++++++++++++++-----
> > >   drivers/spi/spi-geni-qcom.c      |  7 +++++++
> > >   include/linux/dma/qcom-gpi-dma.h |  7 +++++++
> > 
> > How is this supposed to be merged? Please try to separate the patches by
> > the subsystem, letting maintainers to handle possible dependencies.
> > 
> Sure, separated  the patches in V2.
> > >   3 files changed, 41 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> > > index 52a7c8f2498f..a8df1e835e27 100644
> > > --- a/drivers/dma/qcom/gpi.c
> > > +++ b/drivers/dma/qcom/gpi.c
> > > @@ -27,6 +27,7 @@
> > >   #define TRE_FLAGS_IEOT		BIT(9)
> > >   #define TRE_FLAGS_BEI		BIT(10)
> > >   #define TRE_FLAGS_LINK		BIT(11)
> > > +#define TRE_FLAGS_IMMEDIATE_DMA	BIT(16)
> > >   #define TRE_FLAGS_TYPE		GENMASK(23, 16)
> > >   /* SPI CONFIG0 WD0 */
> > > @@ -64,6 +65,7 @@
> > >   /* DMA TRE */
> > >   #define TRE_DMA_LEN		GENMASK(23, 0)
> > > +#define TRE_DMA_IMMEDIATE_LEN	GENMASK(3, 0)
> > >   /* Register offsets from gpi-top */
> > >   #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)	(0x20000 + (0x4000 * (n)) + (0x80 * (k)))
> > > @@ -1711,6 +1713,8 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
> > >   	dma_addr_t address;
> > >   	struct gpi_tre *tre;
> > >   	unsigned int i;
> > > +	u8 *buf;
> > > +	int len = 0;
> > >   	/* first create config tre if applicable */
> > >   	if (direction == DMA_MEM_TO_DEV && spi->set_config) {
> > > @@ -1763,14 +1767,32 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
> > >   	tre_idx++;
> > >   	address = sg_dma_address(sgl);
> > > -	tre->dword[0] = lower_32_bits(address);
> > > -	tre->dword[1] = upper_32_bits(address);
> > > +	len = sg_dma_len(sgl);
> > > -	tre->dword[2] = u32_encode_bits(sg_dma_len(sgl), TRE_DMA_LEN);
> > > +	/* Support Immediate dma for write transfers for data length up to 8 bytes */
> > > +	if ((spi->flags & QCOM_GPI_IMMEDIATE_DMA) && direction == DMA_MEM_TO_DEV) {
> > > +		buf = (u8 *)sg_virt(sgl);
> > > -	tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
> > > -	if (direction == DMA_MEM_TO_DEV)
> > > +		/* memcpy may not always be length of 8, hence pre-fill both dword's with 0 */
> > > +		tre->dword[0] = 0;
> > > +		tre->dword[1] = 0;
> > > +		memcpy((u8 *)&tre->dword[0], buf, len);
> > 
> > Drop all type conversions, they should not be necessary. memcpy()
> > functions accepts void pointers.
> Done
> > 
> > > +
> > > +		tre->dword[2] = u32_encode_bits(len, TRE_DMA_IMMEDIATE_LEN);
> > > +
> > > +		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
> > >   		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> > > +		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IMMEDIATE_DMA);
> > > +	} else {
> > > +		tre->dword[0] = lower_32_bits(address);
> > > +		tre->dword[1] = upper_32_bits(address);
> > > +
> > > +		tre->dword[2] = u32_encode_bits(len, TRE_DMA_LEN);
> > > +
> > > +		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
> > > +		if (direction == DMA_MEM_TO_DEV)
> > > +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> > > +	}
> > >   	for (i = 0; i < tre_idx; i++)
> > >   		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
> > > diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> > > index 768d7482102a..53c8f6b7f3c5 100644
> > > --- a/drivers/spi/spi-geni-qcom.c
> > > +++ b/drivers/spi/spi-geni-qcom.c
> > > @@ -472,11 +472,18 @@ static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas
> > >   		mas->cur_speed_hz = xfer->speed_hz;
> > >   	}
> > > +	/*
> > > +	 * Set QCOM_GPI_IMMEDIATE_DMA flag if transfer length up to 8 bytes.
> > > +	 */
> > >   	if (xfer->tx_buf && xfer->rx_buf) {
> > >   		peripheral.cmd = SPI_DUPLEX;
> > > +		if (xfer->len <= QCOM_GPI_IMMEDIATE_DMA_LEN)
> > > +			peripheral.flags |= QCOM_GPI_IMMEDIATE_DMA;
> > >   	} else if (xfer->tx_buf) {
> > >   		peripheral.cmd = SPI_TX;
> > >   		peripheral.rx_len = 0;
> > > +		if (xfer->len <= QCOM_GPI_IMMEDIATE_DMA_LEN)
> > > +			peripheral.flags |= QCOM_GPI_IMMEDIATE_DMA;
> > >   	} else if (xfer->rx_buf) {
> > >   		peripheral.cmd = SPI_RX;
> > >   		if (!(mas->cur_bits_per_word % MIN_WORD_LEN)) {
> > > diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
> > > index 6680dd1a43c6..0eb96e62a1f1 100644
> > > --- a/include/linux/dma/qcom-gpi-dma.h
> > > +++ b/include/linux/dma/qcom-gpi-dma.h
> > > @@ -15,6 +15,11 @@ enum spi_transfer_cmd {
> > >   	SPI_DUPLEX,
> > >   };
> > > +#define QCOM_GPI_BLOCK_EVENT_IRQ	BIT(0)
> > 
> > Unrelated, please drop.
> Sure, done.
> > 
> > > +#define QCOM_GPI_IMMEDIATE_DMA		BIT(1)
> > 
> > Can GPI driver deduce whether it should use immediate DMA based on the
> > transfer length?
> protocol driver like SPI will update whether it should use immediate DMA or
> not based on the transfer length and GPI driver will configure it
> accordingly .

You are describing your implementation. I asked if it is possible to be
implemented other way around. Otherwise you are adding too much
knowledge to the SPI driver.

> > 
> > > +
> > > +#define QCOM_GPI_IMMEDIATE_DMA_LEN	8
> > > +
> > >   /**
> > >    * struct gpi_spi_config - spi config for peripheral
> > >    *
> > > @@ -30,6 +35,7 @@ enum spi_transfer_cmd {
> > >    * @cs: chip select toggle
> > >    * @set_config: set peripheral config
> > >    * @rx_len: receive length for buffer
> > > + * @flags: flags for immediate dma and block event interrupt support
> > >    */
> > >   struct gpi_spi_config {
> > >   	u8 set_config;
> > > @@ -44,6 +50,7 @@ struct gpi_spi_config {
> > >   	u32 clk_src;
> > >   	enum spi_transfer_cmd cmd;
> > >   	u32 rx_len;
> > > +	u8 flags;
> > >   };
> > >   enum i2c_op {
> > > -- 
> > > 2.17.1
> > > 
> > 

-- 
With best wishes
Dmitry

