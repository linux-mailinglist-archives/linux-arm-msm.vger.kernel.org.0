Return-Path: <linux-arm-msm+bounces-40262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D056D9E3B72
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:40:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FF76160801
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 13:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992281DF745;
	Wed,  4 Dec 2024 13:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VqqzEq5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22E81DE4F9
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 13:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733319601; cv=none; b=RveFDFyOrQEUoPQ7BkafFldX+NIRt+E5eJ1LNp5SYM5jfoH4bQyWWDUDHtDdZjYNhCRAKZljxz8y3+opUfc02twIsk3ZDm0dT68dnFsLuw0BYI7vC1y1SlM8RqjWU0M60dG8D6RuirjLuv5DwdSmO4ZgDGBfk7s5mxneFdFj4T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733319601; c=relaxed/simple;
	bh=dXR/hQxy6alqtubsk2QTUtiJW3+TFICSXnIhbptppC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNqp4mIzUIjY+LqN6FI6Dl/kjkoSkVyRG1gsZbf35wxGs5dgeXUGQi4gfsx0BEclM8Tup0XCg3jdeMAae5N7oy21PEWUWUeShJ2AF/BEnZPt+k4X892ojsJM8uWFpAXniDUc8jTuNLNdEwdbHuyQkWcA/QWszqp/78pWCQyg2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VqqzEq5E; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e398823d6aaso868672276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 05:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733319599; x=1733924399; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rA975cv/VjNdMzrH6rk9INU4ce1m1noL+JfQkgCeIxA=;
        b=VqqzEq5EwtYYFVMYNehtTyVGR+3E1bR8mMtSLGF47kXGueJyHkco2AtSr10TdQ5VxW
         otjw60Ps2d2T4RN0KreDYwfkCERmifbhzwAb27dDeI4yk5y8YoefOIDaP7p2Cqk46907
         2m//amDyTsr/5obcKWcYFsD5YZ5HcByZagwvwg6lMtj6AgCmhRyX42IGM+GTxLaVe4S1
         Q+qXjIucbGpGsOqLmpkXCjGgwjQfqyj22FqpKCzlf2vlddk+UlWronURwh8zhNH0tu1c
         7uEAvtbjX7k2xUbTytPKIBKgr7LUKRQY1/YP99ykyaz8dYfsZ+WZAP435nzfg3aaNxzZ
         li5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733319599; x=1733924399;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rA975cv/VjNdMzrH6rk9INU4ce1m1noL+JfQkgCeIxA=;
        b=caDAXpRLfRH7F1QFqQ5pz4sEGb/aTPMJw++lOID3DWfBjpJtVGwN9b/T+wdd+B3lB4
         P6/vXzupAmGbsNx0laPhGt2UXKnGb+jb8zidcT1PvJtL2WHG5jBOIE5EvxkoXrmAIeDD
         bCkz70btiD1VgL0K5g4g4PHeri9t6iUFRf8987iLB/ivJnSXtxiwW+pfd9YZHF38ghVN
         RS7pMY7XGPCfDb2tJVoTDhTI7xzJqttfmJmHVGxiHyQVxJvm9XjqtN1NjGONjJl5oz8E
         LxWDdygOHNjh0ykS7w8paohZLBfUWoHNeAJQ1mt49NgITTn/1XfeoZe9himNlrTs1oqQ
         mkDA==
X-Forwarded-Encrypted: i=1; AJvYcCUzYoP2i6lsKlPNhrcyX4/1oUPn4+nv94bAlPgEivJFlFG1KA8B2fUSwEU5uuHkQbyZilSe4oKgpNhTdbFz@vger.kernel.org
X-Gm-Message-State: AOJu0YyAXxApxfBpfR0z1/JMFcAa530PjwphB00912IePPdwyBezbaG+
	UnAsf06+PkFRPq9VZshA8TwTg7Y/u18JahYwvMK3QzbDP2KRHDVsrmLPKeqUxNhMadXkxEGYR4v
	bR3U8YjeaEtSCA4y6pfwGUt+wJOm2MR/h+1mWCw==
X-Gm-Gg: ASbGncvuKNjy6zG2G4NLo0b9ibdMS12GxoK9NusjWq1R9RC3hR/2pnEXDkGQhMT21pc
	50HbULWomtDV7CBs6fA8TTYI51OnZmw==
X-Google-Smtp-Source: AGHT+IHjLCC3ZI6GMy2ysLoHvvgMYW5kv3TIjIoX2VB4eMvHzXE/1pMkunSST1tpmplgwNIZ0BeYOZybXpNKgrzQpUs=
X-Received: by 2002:a25:d846:0:b0:e38:2551:d79b with SMTP id
 3f1490d57ef6-e397199ca75mr23007626276.15.1733319598695; Wed, 04 Dec 2024
 05:39:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204122059.24239-1-quic_jseerapu@quicinc.com>
 <higpzg6b4e66zpykuu3wlcmaxzplzz3qasoycfytidunp7yqbn@nunjmucxkjbe> <052c98ab-1ba4-4665-8b45-3e5ad4fa553b@quicinc.com>
In-Reply-To: <052c98ab-1ba4-4665-8b45-3e5ad4fa553b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 4 Dec 2024 15:39:47 +0200
Message-ID: <CAA8EJppynecscUbUW7Ue=+oYyhFzftiYVgTc6rEuXbUhpxF7iQ@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: qcom: gpi: Add GPI immediate DMA support
 for SPI protocol
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Dec 2024 at 15:25, Jyothi Kumar Seerapu
<quic_jseerapu@quicinc.com> wrote:
>
>
>
> On 12/4/2024 6:15 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 04, 2024 at 05:50:59PM +0530, Jyothi Kumar Seerapu wrote:
> >> The DMA TRE(Transfer ring element) buffer contains the DMA
> >> buffer address. Accessing data from this address can cause
> >> significant delays in SPI transfers, which can be mitigated to
> >> some extent by utilizing immediate DMA support.
> >>
> >> QCOM GPI DMA hardware supports an immediate DMA feature for data
> >> up to 8 bytes, storing the data directly in the DMA TRE buffer
> >> instead of the DMA buffer address. This enhancement enables faster
> >> SPI data transfers.
> >>
> >> This optimization reduces the average transfer time from 25 us to
> >> 16 us for a single SPI transfer of 8 bytes length, with a clock
> >> frequency of 50 MHz.
> >>
> >> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> >> ---
> >>
> >> v2-> v3:
> >>     - When to enable Immediate DMA support, control is moved to GPI driver
> >>       from SPI driver.
> >>     - Optimizations are done in GPI driver related to immediate dma changes.
> >>     - Removed the immediate dma supported changes in qcom-gpi-dma.h file
> >>       and handled in GPI driver.
> >>
> >>     Link to v2:
> >>      https://lore.kernel.org/all/20241128133351.24593-2-quic_jseerapu@quicinc.com/
> >>      https://lore.kernel.org/all/20241128133351.24593-3-quic_jseerapu@quicinc.com/
> >>
> >> v1 -> v2:
> >>     - Separated the patches to dmaengine and spi subsystems
> >>     - Removed the changes which are not required for this feature from
> >>       qcom-gpi-dma.h file.
> >>     - Removed the type conversions used in gpi_create_spi_tre.
> >>
> >>     Link to v1:
> >>      https://lore.kernel.org/lkml/20241121115201.2191-2-quic_jseerapu@quicinc.com/
> >>
> >>   drivers/dma/qcom/gpi.c | 32 +++++++++++++++++++++++++++-----
> >>   1 file changed, 27 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> >> index 52a7c8f2498f..35451d5a81f7 100644
> >> --- a/drivers/dma/qcom/gpi.c
> >> +++ b/drivers/dma/qcom/gpi.c
> >> @@ -27,6 +27,7 @@
> >>   #define TRE_FLAGS_IEOT             BIT(9)
> >>   #define TRE_FLAGS_BEI              BIT(10)
> >>   #define TRE_FLAGS_LINK             BIT(11)
> >> +#define TRE_FLAGS_IMMEDIATE_DMA     BIT(16)
> >>   #define TRE_FLAGS_TYPE             GENMASK(23, 16)
> >>
> >>   /* SPI CONFIG0 WD0 */
> >> @@ -64,6 +65,7 @@
> >>
> >>   /* DMA TRE */
> >>   #define TRE_DMA_LEN                GENMASK(23, 0)
> >> +#define TRE_DMA_IMMEDIATE_LEN       GENMASK(3, 0)
> >>
> >>   /* Register offsets from gpi-top */
> >>   #define GPII_n_CH_k_CNTXT_0_OFFS(n, k)     (0x20000 + (0x4000 * (n)) + (0x80 * (k)))
> >> @@ -1711,6 +1713,8 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
> >>      dma_addr_t address;
> >>      struct gpi_tre *tre;
> >>      unsigned int i;
> >> +    int len;
> >> +    u8 immediate_dma;
> >>
> >>      /* first create config tre if applicable */
> >>      if (direction == DMA_MEM_TO_DEV && spi->set_config) {
> >> @@ -1763,14 +1767,32 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
> >>      tre_idx++;
> >>
> >>      address = sg_dma_address(sgl);
> >> -    tre->dword[0] = lower_32_bits(address);
> >> -    tre->dword[1] = upper_32_bits(address);
> >> +    len = sg_dma_len(sgl);
> >>
> >> -    tre->dword[2] = u32_encode_bits(sg_dma_len(sgl), TRE_DMA_LEN);
> >> +    immediate_dma = (direction == DMA_MEM_TO_DEV) && len <= 2 * sizeof(tre->dword[0]);
> >
> > inline this condition, remove extra brackets and split the line after &&.
> Hi Dmitry Baryshkov, thanks for the review.
> Sure, i will make the changes mentioned below. Please let me know otherwise.
>
> immediate_dma = direction == DMA_MEM_TO_DEV &&
>                  len <= 2 * sizeof(tre->dword[0]);>

I was suggesting to _inline_ this condition rather than having a
separate variable for it.

> >> +
> >> +    /* Support Immediate dma for write transfers for data length up to 8 bytes */
> >> +    if (immediate_dma) {
> >> +            /*
> >> +             * For Immediate dma, data length may not always be length of 8 bytes,
> >> +             * it can be length less than 8, hence initialize both dword's with 0
> >> +             */
> >> +            tre->dword[0] = 0;
> >> +            tre->dword[1] = 0;
> >> +            memcpy(&tre->dword[0], sg_virt(sgl), len);
> >> +
> >> +            tre->dword[2] = u32_encode_bits(len, TRE_DMA_IMMEDIATE_LEN);
> >> +    } else {
> >> +            tre->dword[0] = lower_32_bits(address);
> >> +            tre->dword[1] = upper_32_bits(address);
> >> +
> >> +            tre->dword[2] = u32_encode_bits(len, TRE_DMA_LEN);
> >> +    }
> >>
> >>      tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
> >> -    if (direction == DMA_MEM_TO_DEV)
> >> -            tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
> >> +    tre->dword[3] |= u32_encode_bits(!!immediate_dma, TRE_FLAGS_IMMEDIATE_DMA);
> >> +    tre->dword[3] |= u32_encode_bits(!!(direction == DMA_MEM_TO_DEV),
> >> +                                     TRE_FLAGS_IEOT);
> >>
> >>      for (i = 0; i < tre_idx; i++)
> >>              dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
> >> --
> >> 2.17.1
> >>
> >



-- 
With best wishes
Dmitry

