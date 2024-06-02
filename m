Return-Path: <linux-arm-msm+bounces-21398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2692E8D73CE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 06:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7DBE1F217CF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 04:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93182C8FB;
	Sun,  2 Jun 2024 04:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwBfu0bR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67057AD2D;
	Sun,  2 Jun 2024 04:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717302215; cv=none; b=MZ7jnnVJnnqNuvXFwFLtW4qltl/xeZIimQ0lLcDZAQRarsOB0t5Q95TW+aCCyO0GAbO20Uq9VNiGDjWPy+I85sypzIfyep3xBlSq9Pmg4LV+Gv8y6p7EqVRIz3dWB6UXq32Wu14ZM6moJyTOBrqqqX6v+cstGqb2Ao2ePGocQD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717302215; c=relaxed/simple;
	bh=t3NPqJkk+SwSAxF9jIi4Udg7haRJ/INOmuYkJneaTVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KH7AZsGvABrNFOKtOofvYLTpilA3u0rDw4P4ZuB87jeYBj+sOh0tFNeN8NaBPciF3YRMbGm6swazer+boWWp1m4LoBUq8Nej1Yy5cmqhzZLTrRPn8LQ8iAp6Y9cQN+/yxOsqHkDuqttf4/ill0XCSa+Z7Yp+pJeu9iV/FSfnkGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwBfu0bR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5526C2BBFC;
	Sun,  2 Jun 2024 04:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717302215;
	bh=t3NPqJkk+SwSAxF9jIi4Udg7haRJ/INOmuYkJneaTVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UwBfu0bRIw4YSjrdPS+0JfY/vcvheGz6Afhx2SJjOWDow/xVIGO8CjhI6+OITNut0
	 qfVYsyxmpvcyjK3D5z7a/pCvMqJsMdxPXpY78Rdmqg5QZxKECvYLzdfcg8+4t6bGwC
	 FrFrHvx6NOsaoQmg67FWFvI1pRwKp83yurhWP31mupnxdWsc43H4+5kYFSoWaX1dUm
	 5hwmhH0sR6OV+r/ja5rxElVijKKlZK271XfGhjth4JhSfpP3pDh69z1Mle919ye1D9
	 4UjyYjeA9hXkFpxK1NvsL8Z2BmSnVH78aBZS4S2EbsER0uuazqLWBkmzbPIm9HuhiS
	 qTGXw+rCouvdQ==
Date: Sat, 1 Jun 2024 23:23:32 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org, 
	John Ogness <john.ogness@linutronix.de>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org, 
	Yicong Yang <yangyicong@hisilicon.com>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 1/7] soc: qcom: geni-se: Add
 GP_LENGTH/IRQ_EN_SET/IRQ_EN_CLEAR registers
Message-ID: <nuxdwhd6vdickuctf75wjan3x6vtwkbypydhj5d5wewkafe66n@h5aduxfym6iz>
References: <20240530224603.730042-1-dianders@chromium.org>
 <20240530154553.v2.1.Ife7ced506aef1be3158712aa3ff34a006b973559@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530154553.v2.1.Ife7ced506aef1be3158712aa3ff34a006b973559@changeid>

On Thu, May 30, 2024 at 03:45:53PM GMT, Douglas Anderson wrote:
> For UART devices the M_GP_LENGTH is the TX word count. For other
> devices this is the transaction word count.
> 
> For UART devices the S_GP_LENGTH is the RX word count.
> 
> The IRQ_EN set/clear registers allow you to set or clear bits in the
> IRQ_EN register without needing a read-modify-write.
> 

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Since these new definitions are used in the future UART patches the
> hope is that they could be acked by Qualcomm folks and then go through
> the same tree as the UART patches that need them.
> 
> Changes in v2:
> - New
> 
>  include/linux/soc/qcom/geni-se.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
> index 0f038a1a0330..8d07c442029b 100644
> --- a/include/linux/soc/qcom/geni-se.h
> +++ b/include/linux/soc/qcom/geni-se.h
> @@ -88,11 +88,15 @@ struct geni_se {
>  #define SE_GENI_M_IRQ_STATUS		0x610
>  #define SE_GENI_M_IRQ_EN		0x614
>  #define SE_GENI_M_IRQ_CLEAR		0x618
> +#define SE_GENI_M_IRQ_EN_SET		0x61c
> +#define SE_GENI_M_IRQ_EN_CLEAR		0x620
>  #define SE_GENI_S_CMD0			0x630
>  #define SE_GENI_S_CMD_CTRL_REG		0x634
>  #define SE_GENI_S_IRQ_STATUS		0x640
>  #define SE_GENI_S_IRQ_EN		0x644
>  #define SE_GENI_S_IRQ_CLEAR		0x648
> +#define SE_GENI_S_IRQ_EN_SET		0x64c
> +#define SE_GENI_S_IRQ_EN_CLEAR		0x650
>  #define SE_GENI_TX_FIFOn		0x700
>  #define SE_GENI_RX_FIFOn		0x780
>  #define SE_GENI_TX_FIFO_STATUS		0x800
> @@ -101,6 +105,8 @@ struct geni_se {
>  #define SE_GENI_RX_WATERMARK_REG	0x810
>  #define SE_GENI_RX_RFR_WATERMARK_REG	0x814
>  #define SE_GENI_IOS			0x908
> +#define SE_GENI_M_GP_LENGTH		0x910
> +#define SE_GENI_S_GP_LENGTH		0x914
>  #define SE_DMA_TX_IRQ_STAT		0xc40
>  #define SE_DMA_TX_IRQ_CLR		0xc44
>  #define SE_DMA_TX_FSM_RST		0xc58
> -- 
> 2.45.1.288.g0e0cd299f1-goog
> 

