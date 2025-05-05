Return-Path: <linux-arm-msm+bounces-56751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA0FAA8EA7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 10:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FEEB168D11
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 08:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C211F460E;
	Mon,  5 May 2025 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbt+1+ru"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEE3188A0C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435427; cv=none; b=jDbdQuCORvbwg0QvMRPV43D4lONgOdfOc7JKHIt4oRLGPfIw8340UYPo2bhcidrDx2N1UdUXkSz8P9fkS2ckEXuzBozdMfENhR2QBDDQSfM4Df6SKfHlPquMhsJX9d4ixgO+nJqP//S0leEb1QrBz4zZZrWDZ4Co27qNlzmETOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435427; c=relaxed/simple;
	bh=zwQ2WGMJRkig3reMsZHumtlh3zNCndRtN4zYIDuHLec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dcbb6wVuNyZsjvKIpieZLnroBqP5PlYObblF42T0YV70+3mDCjDN1M7z3THil+tiJrV2UfJB51mxgcltpBfrFMYhZ76q0BG+YBc4RxzOY1Jf7zi3eGOhWvBmiAEvi48FK33LOtTNjNjRKKQVMemVsx9CyEBW8L+/S/WeHOeYL2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbt+1+ru; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f6c3f7b0b0so8205184a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 01:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746435424; x=1747040224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twFRaaGQAif63hrg13kb5IFUKfR33Ambpgl1WwN0LnE=;
        b=rbt+1+rulLi1Ty+KpoH8MhEjxhaIO6NTjneMqGWjgGXAsqOfgiWSCUChaEcjc0gDxt
         WvNwF5sYCfF1Z0eksKBatcf39px3IEfgeitePSz0LtJ9v7IQ+HoEHeIu/J1/gLiUEdkM
         2vHg2Ps5XW6ZdsW4eBGkI/of3OSaspGiZBe2bCOAfIXfRRZAWb9/dTyo4C3kx2dFC3K0
         NjIe6vX4ZpTvrBzss9qw/lxeR+/rkR2lwxA6mxJSjztSoHv1nlkz9o09hcAnn1zrN1+K
         P3UyC4RVjE3+upL8Fpb1SxZkvjT75KQTF9azti42ccPCAgtczPsAkpYaL84JZhvmGZhR
         dZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435424; x=1747040224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twFRaaGQAif63hrg13kb5IFUKfR33Ambpgl1WwN0LnE=;
        b=gok/WfGuD/uocR48nPf5+ErKo9R8LatQ5Vosa2ua32xY5TPKqv168JTzjSuo+FZDLm
         R9IwpAvFubjfSDpemiQk7qh0r9VumSAne/HuwF2i5UWG3GYgAo3QRZjxH4jTJ5wzQPRw
         FSqfoaKAL/s7XDskkKKoAEajpLT2C4DdzHQDdUu8wigbeQB1jUn+m9yn07ETeEtDVRF7
         pNBKCN0m9yLU5XgQL68LOzf/RIkoSluSmcJg58XQsvBp9CEkHytRppsRQFJ2CNc4ENBI
         Om/pvSPtHfrMx5ySJKQsCsZf3pP2/vfmBBAlfRiRMPD0NioJ8mV0cda13RY1PgCpgrQg
         9JHg==
X-Forwarded-Encrypted: i=1; AJvYcCUP98SWtUDx5CQ3NRmxZzk62dxxVCM73rnCgbf5SY/Q028oCrodqXF9JZ6NXTH695MZlidZZt+TN4Ffdfvd@vger.kernel.org
X-Gm-Message-State: AOJu0YykqAYG0MTnfnSoO73WabIxqF6TtMZset00WMiJH3oxK069WE5g
	jsVZ+dekwrNyk/IHiQbyQmJAhaG3nvalWSsX3/gL89ZqRzRCb1G3o3VDz5TbM9vvUDi2esJi3ga
	U
X-Gm-Gg: ASbGncvnvvJl+XbSaqjthupf96TJH0aENSPrG1RQTtN8ggwbxtAp3+nlA7R3Y4QrzOJ
	qCnZYLg4pAJg6VPJSrtzAUfvMa2RdpxEdgBGrO1G97nZooxmpguMHsyi3cxMfE1W8FbV/li8Bgo
	zOz53ibrXbLiP8eCFirMuj1M05P2/6ESin+JzAN9Eeil8yD6J16Ly11k8I1kJx8Z3dVRtmMV2Nz
	1DWg6MP3IdhF1UOZcSAaeOmRmMnv9m22XRps0pSb4ctot2rrrifAMtnDAaci9e3lfKyiMvUv9jn
	TzBMtjAIvm3zfmEk+4nvsIGbSVf+uhPJ997als3eDs3sAa9jLA==
X-Google-Smtp-Source: AGHT+IE7wNqWzTYqeQUTRoeCnQGzyN3VhgiWSTOZ9M/mvZ4hW4jHw55Y7DRHPzUaVluMv512tH+2nw==
X-Received: by 2002:a17:906:dc8a:b0:ac3:afb1:dee7 with SMTP id a640c23a62f3a-ad17b5dbc98mr1130736866b.28.1746435424095;
        Mon, 05 May 2025 01:57:04 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d6d0:d270:a4d:dbd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508d03sm458777866b.133.2025.05.05.01.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 01:57:03 -0700 (PDT)
Date: Mon, 5 May 2025 10:56:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: keep remotely controlled units
 on during boot
Message-ID: <aBh9WL2OMjTqBJch@linaro.org>
References: <20250503-bam-dma-reset-v1-1-266b6cecb844@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503-bam-dma-reset-v1-1-266b6cecb844@oss.qualcomm.com>

On Sat, May 03, 2025 at 03:41:43AM +0300, Dmitry Baryshkov wrote:
> The commit 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM
> underflow") made sure the BAM DMA device gets suspended, disabling the
> bam_clk. However for remotely controlled BAM DMA devices the clock might
> be disabled prematurely (e.g. in case of the earlycon this frequently
> happens before UART driver is able to probe), which causes device reset.
> 
> Use sync_state callback to ensure that bam_clk stays on until all users
> are probed (and are able to vote upon corresponding clocks).
> 
> Fixes: 0ac9c3dd0d6f ("dmaengine: qcom: bam_dma: fix runtime PM underflow")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks for the patch! I actually created almost the same patch on
Friday, after struggling with this issue on DB410c when trying to add
the MPM as wakeup-parent for GPIOs. :-)

How is this issue related to _remotely-controlled_ BAMs?

The BAM clock will get disabled for all types of BAM control, so I don't
think the type of BAM control plays any role here. The BLSP DMA instance
that would most likely interfere with UART earlycon is
controlled-remotely on some SoCs (e.g. MSM8916), but currently not all
of them (e.g. MSM8974, IPQ8074, IPQ9574, ...).

The fixes tag also doesn't look correct to me, since commit 0ac9c3dd0d6f
("dmaengine: qcom: bam_dma: fix runtime PM underflow") only changed the
behavior for BAMs with "if (!bdev->bamclk)". This applies to some/most
remotely-controlled BAMs, but the issue we have here occurs only because
we do have a clock and cause it to get disabled prematurely.

Checking for if (bdev->bamclk) would probably make more sense. In my
patch I did it just unconditionally, because runtime PM is currently
a no-op for BAMs without clock anyway.

I think it's also worth noting in the commit message that this is sort
of a stop-gap solution. The root problem is that the earlycon code
doesn't claim the clock while active. Any of the drivers that consume
this shared clock could trigger the issue, I had to fix a similar issue
in the spi-qup driver before in commit 0c331fd1dccf ("spi: qup: Request
DMA before enabling clocks"). On some SoCs (e.g. MSM8974), we have
"dmas" currently only on &blsp2_i2c5, so the UART controller wouldn't
even be considered as consumer to wait for before calling the bam_dma
.sync_state.

It may be more reliable to implement something like in
drivers/clk/imx/clk.c imx_register_uart_clocks(), which tries to claim
only the actually used UART clocks until late_initcall_sync(). That
would at least make it independent from individual drivers, but assumes
the UART driver can actually probe before late_initcall_sync() ...
Most of this code is generic though, so perhaps releasing the clocks
could be hooked up somewhere generic, when earlycon exits ...?

Thanks,
Stephan

