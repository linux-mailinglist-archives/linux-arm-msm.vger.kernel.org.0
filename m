Return-Path: <linux-arm-msm+bounces-39461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3049DB932
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 15:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CB90281CA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 14:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13681AC43E;
	Thu, 28 Nov 2024 14:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dXjsJq5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB121AA786
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 14:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732802782; cv=none; b=gpuTuf3Y1qv8TvC0i5TNS4Ozl2RmGrFEKUct90zIdrJplC9VZiiF/LllblHYTRU0odUrDcmIKuSImyUIlQmH9H3hy3NasgrP8oc0vR2KA2iMZDJw7qMm66UaEkuggRxMC9VSsD1sqvYDHe2Om9VfVCVTlBDoak5HMSp7sC43F0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732802782; c=relaxed/simple;
	bh=8u4WHlHlXdoHUtL7x7iWsPFH1aFzthA492+VfAh+1hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmXutulsokLy0DbAcDU7wbzBS9dhasWdrJQVdkdNaYgfPGqsgtGUMCnxwjVaqfzkJ8TvKvHRBjFkxvpDs8QuhMrIPO8Dnx1RSVVkise2ZWKO3TsRtA9zgNJy8InThPJDlMjB7l+uFK3rIziUZh2kufX8P6dXqXFB7S/3MRO/ufU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dXjsJq5v; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53df80eeeedso556916e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 06:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732802778; x=1733407578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/o2zy7i5114Efr8+iIYf65CIfVuVv3coOHufvDEg/14=;
        b=dXjsJq5vgM8Pbww0oKbCMkIU4GUJU/t0b9FIJBS2UI/cGudHz0+iQUj6Xw4y8uqR+a
         fkKO+6cg5HMBYn0UuxKWMlHPo8JxWICeRQWJcKk0D8J2lEisCIebAANWXZB+p/xj++4v
         BfY1hensvnvI1xLpdFK0uuabJ7x8CWrbcTJ42ryd/UULc+Vi2K2tsaBBR7AoDa3swD61
         +dL6Ks90eVWpOQYDWWojNexNORILRTR6HKUkzPJJLxF+d4SE2lIMQUJ8VfMeGrmKA2sJ
         0E6MTyDOBog8hhrb+E6gnc5orWdE/g4ADU9NAsM4K92i+v4Xs1ssvLHoaidCtvNICvro
         ttEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732802778; x=1733407578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/o2zy7i5114Efr8+iIYf65CIfVuVv3coOHufvDEg/14=;
        b=WABsO0DiHIYBFFbYHlj0mz6OUN8W9TkECLuJSiYZap4cS9qmiqZG8fMaepg85URYuT
         dRruh5w+AIF/vwKFTH9GBTfStKZvxGt7sY4rDhscgu/s+1HVmzAEHC74+BoSsKuV19v2
         X6NLxbwwkddM8amfyhTNYD7Iw74gMPmsU4CP6mpMSLqUjbTmmNNpMjtR2fyMGLWr+OGH
         0lm+s2cli72zv+5QEbbshFoqmCOZSRw2Ic7PuSdV2ttJlsTRYQ5bGi+CcO/frLQpFcU4
         wkphQqm+svATwNerf6e96EKg8B5RQZFPmY6LrZVykW4p54HnOfYS3rQ9kEuUkKLesMKI
         bm0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUs0RD2LTDL8pl17BeYOxqQRdRi/oihwuUIrT869QFNLpxcvBVbsa+NRx9TNms2/aTFmMFKx1usIwaRQ9SD@vger.kernel.org
X-Gm-Message-State: AOJu0YyQPUumGrPo7yJmXkkbzLHBnwwSqXFg9uluh0nDENAOz50Sdlt4
	pSwD4W7fMOzOicHhe5LL9l6V6aRpDJVxdvsuPJqLG2cr8tIB2Vyo16W2SpcegPA=
X-Gm-Gg: ASbGncvPI51e7AyyxaTgCMKGXhUURyqqG/QqqExzApqIlGzAK/NF/xGBl+4r5ZUflzh
	gmwUqXwPE7+p4hGyiSU9hBBTQS1qt3VQqGohEc0Z2mrp+i2zYaXHov7d6WSs+xKP3315x1Gpy+F
	Ox2PSkMQr1B+DOj4yWB0FwQuQfc8wBhLb9WpXqZVNFRH14JIw/mfzHfbbtN2WqMQk2ZMItv+D6o
	hEgnw0gxl9OkeZv5ZlyA/VQ3ZtlAmWkQKz4LgYOTZvQTifYk4wpUf/pDDqF0GtVdE5p3Wb1cQNY
	wZX5/SYQcbgUyuBYUFswznMDOsDcQg==
X-Google-Smtp-Source: AGHT+IFsOdfp2e1GEmTXUNNuiA5M1HdtsT/qwpeAjD8lPPqRXA9Imbs3wJner1XQ5fKID4zal6nk5A==
X-Received: by 2002:a05:6512:3c89:b0:53d:a2cb:349e with SMTP id 2adb3069b0e04-53df00c5ebamr4575727e87.4.1732802777846;
        Thu, 28 Nov 2024 06:06:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f1a7sm183496e87.165.2024.11.28.06.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 06:06:17 -0800 (PST)
Date: Thu, 28 Nov 2024 16:06:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v2 2/2] spi: spi-geni-qcom: Add immediate DMA support
Message-ID: <dou77hbrpdqsdlzx3ymco6fgbbmimimt6rrzzezghzmc3a2hle@fgdnpbmg6xsb>
References: <20241128133351.24593-1-quic_jseerapu@quicinc.com>
 <20241128133351.24593-3-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128133351.24593-3-quic_jseerapu@quicinc.com>

On Thu, Nov 28, 2024 at 07:03:51PM +0530, Jyothi Kumar Seerapu wrote:
> The DMA TRE(Transfer ring element) buffer contains the DMA
> buffer address. Accessing data from this address can cause
> significant delays in SPI transfers, which can be mitigated to
> some extent by utilizing immediate DMA support.
> 
> QCOM GPI DMA hardware supports an immediate DMA feature for data
> up to 8 bytes, storing the data directly in the DMA TRE buffer
> instead of the DMA buffer address. This enhancement enables faster
> SPI data transfers.
> 
> This optimization reduces the average transfer time from 25 us to
> 16 us for a single SPI transfer of 8 bytes length, with a clock
> frequency of 50 MHz.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
> 
> v1 -> v2:
>    - Moved the spi changes as patch2.
> 
>  drivers/spi/spi-geni-qcom.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 768d7482102a..53c8f6b7f3c5 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -472,11 +472,18 @@ static int setup_gsi_xfer(struct spi_transfer *xfer, struct spi_geni_master *mas
>  		mas->cur_speed_hz = xfer->speed_hz;
>  	}
>  
> +	/*
> +	 * Set QCOM_GPI_IMMEDIATE_DMA flag if transfer length up to 8 bytes.
> +	 */
>  	if (xfer->tx_buf && xfer->rx_buf) {
>  		peripheral.cmd = SPI_DUPLEX;
> +		if (xfer->len <= QCOM_GPI_IMMEDIATE_DMA_LEN)
> +			peripheral.flags |= QCOM_GPI_IMMEDIATE_DMA;
>  	} else if (xfer->tx_buf) {
>  		peripheral.cmd = SPI_TX;
>  		peripheral.rx_len = 0;
> +		if (xfer->len <= QCOM_GPI_IMMEDIATE_DMA_LEN)
> +			peripheral.flags |= QCOM_GPI_IMMEDIATE_DMA;

NAK. Please finish discussions in the previous iteration before posting
new revision. Sending your responses together with sending next
iteration is a bad practice and is frowned upon (unless one agrees to
all the comments).

There was an open question here and your answer doesn't sound convincing
enough. Please continue discussion in v1.

>  	} else if (xfer->rx_buf) {
>  		peripheral.cmd = SPI_RX;
>  		if (!(mas->cur_bits_per_word % MIN_WORD_LEN)) {
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

