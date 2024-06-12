Return-Path: <linux-arm-msm+bounces-22496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F58905A9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 20:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 785E0B24177
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BEC381C4;
	Wed, 12 Jun 2024 18:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bHRTkPkw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D037EED0
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 18:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718216307; cv=none; b=ZP4U4wOBQnc6gRmQqWfA8LT3LkpmHTHdq6GNQCkKowiEGEWRhbj40//XsdbRRwRpWf1zzppNUMAL4f2B66xAIXxzGv02tu+IhJyaz+pUnnMC/L2gFUF1KQGAw6q4AmmTCqZVRC9xWNqq5+rV7Thm6HNUpXlHyihSGFjsCasqrAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718216307; c=relaxed/simple;
	bh=uM3A/QTCQEjzoE7Sb7paEO05DthHFo3RxVjPzBe73CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=twTn1uuTDI61/YKqkZ4ZPi5Jf0U3sIUpju2vGnkn6+HnJh8YbYm8OUnEGNCYhfc01InBdRwuZnNQTTLbGFYm7VkG0xahKprr2bJg2bkEhdgsICsA8d0nh3noFo1mpzRFLbEtSQbGR0kIyK66vfeIspxVo7jbR0kg0PziOHN3N4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bHRTkPkw; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52bbf73f334so280289e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 11:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718216303; x=1718821103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8DheaBl17/wrTIWUg8nbFGKDT2XQ2iKfGsx9zy/UKyc=;
        b=bHRTkPkwW4p2uiqbr9P65B02DNhZtxcSlAMZ3nUD9lnmcvzpvZsaGipbphYmYNXHR1
         uDxqJPT8waiY4mFkLBJs/H8iNaD2WkMUXwjq9NasHQVhf/cPtIcNndNXbo+S9nmhniGf
         a/fCdZ7Nc3/SZCldSMZ8GJ3YEROBwGccCVOFHb7DVtOU8U6RXm27b4tuDn6E7S4gTBeR
         WUCyU3TxgKwswLU1cyAtCYydVxr8jH5Q4YRmu4AuzuUdJysApaYRhU//QrO5T6K80m2P
         OLxEJmZF7+mxPsJGmdobaG2T7Jo94l1Z+KoAII1ye8ecBNuWIf4TNIoA+U40xNV3q/Qm
         UyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718216303; x=1718821103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DheaBl17/wrTIWUg8nbFGKDT2XQ2iKfGsx9zy/UKyc=;
        b=CmG9/syXvS6SEmjdhlLWc9KZFas8JJSWshGl7lpGXGo9ZA2W/h6gLI6ekptJ+JgXba
         KxRLgd4Ti2PbFV+Zl9gkMP8ieMclt3uZrbyfLBEvqg6ZMbA4k9PlEhPIA3CP9bSaUKap
         zG/n6KuDoeRN58KK0Hva1rriIeb60hzrokm5SLrOpVE4N4JKH8NV3j4Wm4nfxYVc7HIn
         aAhEikzZU8pDdhWnqbOjhPRJVoJb2yqiME31RDzU+CJ/c+15tf7QlErjGRwt2tBG79BD
         +WWb5Mx/eZTgcOs87X+ssI5sS6UuWe/vRu46Wbbemhv6cCnJNam5F6gQbwzpUupcEnNL
         lbMw==
X-Forwarded-Encrypted: i=1; AJvYcCVY1TKVspSWy0HX3ygmi7ti34ptChsEy3qR58qHmeGkQnF9ifKltveRW8zqe2lZH1sR4GfSECp668a84a28PMcDCzEoAiDQfPILqlNuzQ==
X-Gm-Message-State: AOJu0YwXqmC07vFtRgOu3XjL3Av3bwI5+WiN174oq8560aMo0Bi1Ig1K
	rf+hCGiwe/xUcPv67piV7WhED12aN6leuC8YdqBkXK32LINIkDMQ/LgOt0rBn7Y=
X-Google-Smtp-Source: AGHT+IFcasEe0j+9Di1GUyrChBO1YQv6qWzK+DWEa4zNpTKfqOdA++2fywZcmCRWBqpOyN+ZJKK/+Q==
X-Received: by 2002:a19:e05c:0:b0:52c:9ab1:a312 with SMTP id 2adb3069b0e04-52c9ab1a41fmr1520496e87.4.1718216303424;
        Wed, 12 Jun 2024 11:18:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c97093be4sm606349e87.157.2024.06.12.11.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 11:18:22 -0700 (PDT)
Date: Wed, 12 Jun 2024 21:18:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Banajit Goswami <bgoswami@quicinc.com>, neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	krzysztof.kozlowski@linaro.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 3/3] ASoC: codec: lpass-rx-macro: add support for 2.5
 codec version
Message-ID: <dxkgfqxdx4kovs4lfgl6y22chv7b7skmacpttp2z5nzhqj2ijh@6sofslw756mp>
References: <20240612-lpass-codec-v25-v1-0-9f40611a1370@linaro.org>
 <20240612-lpass-codec-v25-v1-3-9f40611a1370@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240612-lpass-codec-v25-v1-3-9f40611a1370@linaro.org>

On Wed, Jun 12, 2024 at 05:57:23PM +0100, Srinivas Kandagatla wrote:
> LPASS Codec v2.5 has significant changes in the rx register strides.
> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
> after SM8450 have only Left working.
> 
> This patch adjusts the registers to accomdate 2.5 changes. With this
> fixed now L and R are functional on Headset playback.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 220 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 207 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 8beeacbd6ae6..7e8bb005b0b9 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -262,6 +262,53 @@
>  #define CDC_RX_RX2_RX_PATH_MIX_SEC0	(0x0544)
>  #define CDC_RX_RX2_RX_PATH_MIX_SEC1	(0x0548)
>  #define CDC_RX_RX2_RX_PATH_DSM_CTL	(0x054C)
> +
> +/* LPASS CODEC version 2.5 rx reg offsets */
> +#define CDC_2_5_RX_RX1_RX_PATH_CTL		(0x04c0)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG0		(0x04c4)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG1		(0x04c8)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG2		(0x04cC)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG3		(0x04d0)
> +#define CDC_2_5_RX_RX1_RX_VOL_CTL		(0x04d4)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_CTL		(0x04d8)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_CFG		(0x04dC)
> +#define CDC_2_5_RX_RX1_RX_VOL_MIX_CTL		(0x04e0)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC1		(0x04e4)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC2		(0x04e8)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC3		(0x04eC)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC4		(0x04f0)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC7		(0x04f4)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0		(0x04f8)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1		(0x04fC)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_CTL		(0x0500)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1	(0x0504)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2	(0x0508)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3	(0x050C)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4	(0x0510)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5	(0x0514)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6	(0x0518)
> +
> +#define CDC_2_5_RX_RX2_RX_PATH_CTL		(0x0580)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG0		(0x0584)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG1		(0x0588)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG2		(0x058C)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG3		(0x0590)
> +#define CDC_2_5_RX_RX2_RX_VOL_CTL		(0x0594)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_CTL		(0x0598)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_CFG		(0x059C)
> +#define CDC_2_5_RX_RX2_RX_VOL_MIX_CTL		(0x05a0)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC0		(0x05a4)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC1		(0x05a8)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC2		(0x05aC)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC3		(0x05b0)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC4		(0x05b4)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC5		(0x05b8)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC6		(0x05bC)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC7		(0x05c0)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0		(0x05c4)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1		(0x05c8)
> +#define CDC_2_5_RX_RX2_RX_PATH_DSM_CTL		(0x05cC)
> +
>  #define CDC_RX_IDLE_DETECT_PATH_CTL	(0x0780)
>  #define CDC_RX_IDLE_DETECT_CFG0		(0x0784)
>  #define CDC_RX_IDLE_DETECT_CFG1		(0x0788)
> @@ -764,6 +811,8 @@ static SOC_ENUM_SINGLE_DECL(rx_int0_dem_inp_enum, CDC_RX_RX0_RX_PATH_CFG1, 0,
>  			    rx_int_dem_inp_mux_text);
>  static SOC_ENUM_SINGLE_DECL(rx_int1_dem_inp_enum, CDC_RX_RX1_RX_PATH_CFG1, 0,
>  			    rx_int_dem_inp_mux_text);
> +static SOC_ENUM_SINGLE_DECL(rx_2_5_int1_dem_inp_enum, CDC_2_5_RX_RX1_RX_PATH_CFG1, 0,
> +			    rx_int_dem_inp_mux_text);
>  
>  static SOC_ENUM_SINGLE_DECL(rx_macro_rx0_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
>  static SOC_ENUM_SINGLE_DECL(rx_macro_rx1_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
> @@ -1083,6 +1132,52 @@ static const struct reg_default rx_defaults[] = {
>  	{ CDC_RX_DSD1_CFG2, 0x96 },
>  };
>  
> +static const struct reg_default rx_2_5_defaults[] = {
> +	{ CDC_2_5_RX_RX1_RX_PATH_CTL, 0x04 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_CFG0, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_CFG1, 0x64 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_CFG2, 0x8F },
> +	{ CDC_2_5_RX_RX1_RX_PATH_CFG3, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_VOL_CTL, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_MIX_CTL, 0x04 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_MIX_CFG, 0x7E },
> +	{ CDC_2_5_RX_RX1_RX_VOL_MIX_CTL, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_SEC1, 0x08 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_SEC2, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_SEC3, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_SEC4, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_SEC7, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0, 0x08 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_CTL, 0x08 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3, 0x00 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4, 0x55 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5, 0x55 },
> +	{ CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6, 0x55 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_CTL, 0x04 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_CFG0, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_CFG1, 0x64 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_CFG2, 0x8F },
> +	{ CDC_2_5_RX_RX2_RX_PATH_CFG3, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_VOL_CTL, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_MIX_CTL, 0x04 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_MIX_CFG, 0x7E },
> +	{ CDC_2_5_RX_RX2_RX_VOL_MIX_CTL, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC0, 0x04 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC1, 0x08 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC2, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC3, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC4, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC5, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC6, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_SEC7, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0, 0x08 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1, 0x00 },
> +	{ CDC_2_5_RX_RX2_RX_PATH_DSM_CTL, 0x00 },
> +};
> +
>  static const struct reg_default rx_pre_2_5_defaults[] = {
>  	{ CDC_RX_RX1_RX_PATH_CTL, 0x04 },
>  	{ CDC_RX_RX1_RX_PATH_CFG0, 0x00 },
> @@ -1236,8 +1331,62 @@ static bool rx_pre_2_5_is_rw_register(struct device *dev, unsigned int reg)
>  	return false;
>  }
>  
> +static bool rx_2_5_is_rw_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case CDC_2_5_RX_RX1_RX_PATH_CTL:
> +	case CDC_2_5_RX_RX1_RX_PATH_CFG0:
> +	case CDC_2_5_RX_RX1_RX_PATH_CFG1:
> +	case CDC_2_5_RX_RX1_RX_PATH_CFG2:
> +	case CDC_2_5_RX_RX1_RX_PATH_CFG3:
> +	case CDC_2_5_RX_RX1_RX_VOL_CTL:
> +	case CDC_2_5_RX_RX1_RX_PATH_MIX_CTL:
> +	case CDC_2_5_RX_RX1_RX_PATH_MIX_CFG:
> +	case CDC_2_5_RX_RX1_RX_VOL_MIX_CTL:
> +	case CDC_2_5_RX_RX1_RX_PATH_SEC1:
> +	case CDC_2_5_RX_RX1_RX_PATH_SEC2:
> +	case CDC_2_5_RX_RX1_RX_PATH_SEC3:
> +	case CDC_2_5_RX_RX1_RX_PATH_SEC4:
> +	case CDC_2_5_RX_RX1_RX_PATH_SEC7:
> +	case CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0:
> +	case CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_CTL:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5:
> +	case CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6:
> +	case CDC_2_5_RX_RX2_RX_PATH_CTL:
> +	case CDC_2_5_RX_RX2_RX_PATH_CFG0:
> +	case CDC_2_5_RX_RX2_RX_PATH_CFG1:
> +	case CDC_2_5_RX_RX2_RX_PATH_CFG2:
> +	case CDC_2_5_RX_RX2_RX_PATH_CFG3:
> +	case CDC_2_5_RX_RX2_RX_VOL_CTL:
> +	case CDC_2_5_RX_RX2_RX_PATH_MIX_CTL:
> +	case CDC_2_5_RX_RX2_RX_PATH_MIX_CFG:
> +	case CDC_2_5_RX_RX2_RX_VOL_MIX_CTL:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC0:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC1:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC2:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC3:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC4:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC5:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC6:
> +	case CDC_2_5_RX_RX2_RX_PATH_SEC7:
> +	case CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0:
> +	case CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1:
> +	case CDC_2_5_RX_RX2_RX_PATH_DSM_CTL:
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>  {
> +	struct rx_macro *rx = dev_get_drvdata(dev);
> +
>  	switch (reg) {
>  	case CDC_RX_TOP_TOP_CFG0:
>  	case CDC_RX_TOP_SWR_CTRL:
> @@ -1453,6 +1602,9 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>  		return true;
>  	}
>  
> +	if (rx->codec_version >= LPASS_CODEC_VERSION_2_5)
> +		return rx_2_5_is_rw_register(dev, reg);
> +
>  	return rx_pre_2_5_is_rw_register(dev, reg);
>  }
>  
> @@ -1551,6 +1703,10 @@ static const struct snd_kcontrol_new rx_int1_dem_inp_mux =
>  		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_int1_dem_inp_enum,
>  		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
>  
> +static const struct snd_kcontrol_new rx_2_5_int1_dem_inp_mux =
> +		SOC_DAPM_ENUM_EXT("rx_int1_dem_inp", rx_2_5_int1_dem_inp_enum,
> +		  snd_soc_dapm_get_enum_double, rx_macro_int_dem_inp_mux_put);
> +
>  static int rx_macro_set_prim_interpolator_rate(struct snd_soc_dai *dai,
>  					       int rate_reg_val, u32 sample_rate)
>  {
> @@ -2835,6 +2991,18 @@ static const struct snd_kcontrol_new rx_macro_def_snd_controls[] = {
>  			  -84, 40, digital_gain),
>  };
>  
> +static const struct snd_kcontrol_new rx_macro_2_5_snd_controls[] = {
> +
> +	SOC_SINGLE_S8_TLV("RX_RX1 Digital Volume", CDC_2_5_RX_RX1_RX_VOL_CTL,
> +			  -84, 40, digital_gain),
> +	SOC_SINGLE_S8_TLV("RX_RX2 Digital Volume", CDC_2_5_RX_RX2_RX_VOL_CTL,
> +			  -84, 40, digital_gain),
> +	SOC_SINGLE_S8_TLV("RX_RX1 Mix Digital Volume", CDC_2_5_RX_RX1_RX_VOL_MIX_CTL,
> +			  -84, 40, digital_gain),
> +	SOC_SINGLE_S8_TLV("RX_RX2 Mix Digital Volume", CDC_2_5_RX_RX2_RX_VOL_MIX_CTL,
> +			  -84, 40, digital_gain),
> +};
> +
>  static const struct snd_kcontrol_new rx_macro_snd_controls[] = {
>  	SOC_SINGLE_S8_TLV("RX_RX0 Digital Volume", CDC_RX_RX0_RX_VOL_CTL,
>  			  -84, 40, digital_gain),
> @@ -2956,6 +3124,12 @@ static int rx_macro_enable_echo(struct snd_soc_dapm_widget *w,
>  
>  	return 0;
>  }
> +
> +static const struct snd_soc_dapm_widget rx_macro_2_5_dapm_widgets[] = {
> +	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
> +			 &rx_2_5_int1_dem_inp_mux),
> +};
> +
>  static const struct snd_soc_dapm_widget rx_macro_def_dapm_widgets[] = {
>  	SND_SOC_DAPM_MUX("RX INT1 DEM MUX", SND_SOC_NOPM, 0, 0,
>  			 &rx_int1_dem_inp_mux),
> @@ -3454,10 +3628,17 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>  				      CDC_RX_DC_COEFF_SEL_MASK,
>  				      CDC_RX_DC_COEFF_SEL_TWO);
>  
> -	controls = rx_macro_def_snd_controls;
> -	num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
> -	widgets = rx_macro_def_dapm_widgets;
> -	num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
> +	if (rx->codec_version >= LPASS_CODEC_VERSION_2_5) {
> +		controls = rx_macro_2_5_snd_controls;
> +		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
> +		widgets = rx_macro_2_5_dapm_widgets;
> +		num_widgets = ARRAY_SIZE(rx_macro_2_5_dapm_widgets);
> +	} else {
> +		controls = rx_macro_def_snd_controls;
> +		num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
> +		widgets = rx_macro_def_dapm_widgets;
> +		num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
> +	}
>  
>  	rx->component = component;
>  
> @@ -3609,15 +3790,28 @@ static int rx_macro_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  	rx->codec_version = lpass_macro_get_codec_version();
> -
> -	rx->rxn_reg_stride = 0x80;
> -	def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
> -	reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> -	if (!reg_defaults)
> -		return -ENOMEM;
> -	memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> -	memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> -			rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
> +	switch (rx->codec_version) {
> +	case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:

I don't like that the next 2.9 version will end up in a default bucket.
It might be better to have an explicit list of versions instead and then
return -EINVAL in the default case.

> +		rx->rxn_reg_stride = 0xc0;
> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> +		if (!reg_defaults)
> +			return -ENOMEM;
> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> +				rx_2_5_defaults, sizeof(rx_2_5_defaults));
> +		break;
> +	default:
> +		rx->rxn_reg_stride = 0x80;
> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> +		if (!reg_defaults)
> +			return -ENOMEM;
> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> +				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
> +		break;
> +	}
>  
>  	rx_regmap_config.reg_defaults = reg_defaults;
>  	rx_regmap_config.num_reg_defaults = def_count;
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

