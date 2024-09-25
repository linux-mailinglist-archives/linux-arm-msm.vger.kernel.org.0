Return-Path: <linux-arm-msm+bounces-32452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA27D985575
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:28:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8947F282905
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 08:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A6815A842;
	Wed, 25 Sep 2024 08:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kS/n5gES"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0998C1598E9
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 08:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252881; cv=none; b=DEMTvqo1EFkyffj6e8jRyHkYaBwXcCFQEyE8g4cRmmiuNdlKvWFcY3CUMbnruFP+2v+8Jnj+coaf9PyNSvqlY31Dg5hShT+HxeKZfaKzFj09t9dgnPm061650EChDPk8Rc7HKyP5sluarg1gQGNumrOo3efcYFTMJ8E+sw1WAg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252881; c=relaxed/simple;
	bh=nF0sfFBbFYVla7AI5yaRpMtwDZALqbKLpYtZvnb2IXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyoBSkM5E10L6a7SavlJ++RCKITMVDkx+2LwnsSzK85F+Ud+TjbDfjuOtf+zTT1KgnQmoojRRVfSVzia+t536E3Ff7hFzcmU49nAiVB+7K+TnInnt2V5CuXOvI2I6bWwS9el6KevDy+cueC7Z/SjQ7pVjXsxPaelTWjRIUktIvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kS/n5gES; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-537a399e06dso3881266e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Sep 2024 01:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727252878; x=1727857678; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hOKdJS1KLSJlTg0CCP5JjFGsRZQRYkLqZ4DmWczY9nM=;
        b=kS/n5gES1qMOJeY8LBmyrY6JoeYILJF0ow1QlaiteeeBvntsOYQgwiA6iVdxZNMpPl
         3wYFLEEpaUGvjyRTJ3ObI36nWkLmOPJJ7ACod9K5yA3xX0BNudgbD2saZj9QNet+dox6
         JlsvBcOQns9FFwg2MArtPCre1WqqXiCJogwpXjY2PuRkXY7GcpdNF6SM+yhmgU64I62C
         J7C8jFXwN6fqRp2tLp8oAr4Gtcqvar/IAJt4hBkHMLgNIWCyP/ThJbYfC2ZfGsfc2q3C
         /VcqmAgdMPpYdmwd8Km1wwV4qroXqyYZq5Z6mP870OL8lyrGU4qHBMxPZNniaaa7uhgt
         WZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727252878; x=1727857678;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOKdJS1KLSJlTg0CCP5JjFGsRZQRYkLqZ4DmWczY9nM=;
        b=cJUI+vGk37kWybaOxz0Fwtg3mKXVT9ZZq4aoPIxvFsXK4ipkCtiZ669n0SU+oUw39w
         CLAjMAes+L1tcg1Bg8c1mrA5Jx/+ySEgafx9PjRU9FQHycVW+EvdMBIY5O01aQk/ssZV
         ctngANBeTs9rsfZcO/blGONc8ulORpkti8sISv/wNV+NPDTlSghgr+f+rbd+yZTZhhEc
         jzvGxbIC0qNvom5V7PhYG0bbl3VRytYxbB1AM7VsVKMWtN2pyh2gSx03r8XwEIT5Joxq
         m/OFDeIxlvEWxeQfHF1DnwR+HDZp5UaZb1ngIFdP/avXonRCQ486BnV/5VxaYzMyr0mU
         L94g==
X-Forwarded-Encrypted: i=1; AJvYcCX+JTOtJTY/JHfcmMY2BtdiaSTVJvQqUVzf2OmJbK6hUaiDgOJ+mjOHGeQQ1YIlCWs8VRNpPZhzG+v4FM/M@vger.kernel.org
X-Gm-Message-State: AOJu0YwWfiag2j4XhWc0maXn/0gvJ2ih2Fi6EdVgj/sG1KwkfWn7ApQE
	I7DXoDlRvcZyemJy+mdzIldaZK31u9bTN7uuT/q13lF9+HYgHPnqDW8W2lQD3hQ=
X-Google-Smtp-Source: AGHT+IEyNLlNKNPuzVS6L2iBVgd1PBFlzz4yy5yLc0ujoQhajP1DHMelGTZ6NiiUvdGv3ibmtbdefA==
X-Received: by 2002:a05:6512:1101:b0:52e:eacd:bc05 with SMTP id 2adb3069b0e04-538801ac047mr976428e87.61.1727252877875;
        Wed, 25 Sep 2024 01:27:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e5c0bsm452613e87.82.2024.09.25.01.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:27:56 -0700 (PDT)
Date: Wed, 25 Sep 2024 11:27:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, a39.skl@gmail.com, 
	linux-sound@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, 
	tiwai@suse.com, alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org, vkoul@kernel.org, 
	klimov.linux@gmail.com
Subject: Re: [PATCH REVIEW 1/2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n)
 macro for DSM_CTL and SEC7 regs
Message-ID: <czlx4thp7thnb6jrauilpbtzgbq637rmnwlpifxq5b5jfa3lqm@toyy3b2viscr>
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925043823.520218-1-alexey.klimov@linaro.org>

On Wed, Sep 25, 2024 at 05:38:22AM GMT, Alexey Klimov wrote:
> Turns out some registers of pre-2.5 version of rxmacro codecs are not
> located at the expected offsets but 0xc further away in memory.
> So far the detected registers are CDC_RX_RX2_RX_PATH_SEC7 and
> CDC_RX_RX2_RX_PATH_DSM_CTL.
> 
> CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n) macro incorrectly generates the address
> 0x540 for RX2 but it should be 0x54C and it also overwrites
> CDC_RX_RX2_RX_PATH_SEC7 which is located at 0x540.
> The same goes for CDC_RX_RXn_RX_PATH_SEC7(rx, n).
> 
> Fix this by introducing additional rxn_reg_stride2 offset. For 2.5 version
> and above this offset will be equal to 0.
> With such change the corresponding RXn() macros will generate the same
> values for 2.5 codec version for all RX paths and the same old values
> for pre-2.5 version for RX0 and RX1. However for the latter case with RX2 path
> it will also add 2 * rxn_reg_stride2 on top.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 71e0d3bffd3f..9288ddb705fe 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -202,12 +202,14 @@
>  #define CDC_RX_RXn_RX_PATH_SEC3(rx, n)	(0x042c  + rx->rxn_reg_stride * n)
>  #define CDC_RX_RX0_RX_PATH_SEC4		(0x0430)
>  #define CDC_RX_RX0_RX_PATH_SEC7		(0x0434)
> -#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)	(0x0434  + rx->rxn_reg_stride * n)
> +#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
> +	(0x0434 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride2)

This is a nice hack to rule out n=0 and n=1, but maybe we can be more
obvious here:

(0x0434 + stride * n + (n > 2) ? stride2 : 0)

>  #define CDC_RX_DSM_OUT_DELAY_SEL_MASK	GENMASK(2, 0)
>  #define CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE	0x2
>  #define CDC_RX_RX0_RX_PATH_MIX_SEC0	(0x0438)
>  #define CDC_RX_RX0_RX_PATH_MIX_SEC1	(0x043C)
> -#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	(0x0440  + rx->rxn_reg_stride * n)
> +#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	\
> +	(0x0440 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride2)
>  #define CDC_RX_RXn_DSM_CLK_EN_MASK	BIT(0)
>  #define CDC_RX_RX0_RX_PATH_DSM_CTL	(0x0440)
>  #define CDC_RX_RX0_RX_PATH_DSM_DATA1	(0x0444)

-- 
With best wishes
Dmitry

