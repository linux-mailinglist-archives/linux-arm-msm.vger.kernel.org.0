Return-Path: <linux-arm-msm+bounces-24468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 383FA91A7FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E696B288A02
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 13:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C463F1946B1;
	Thu, 27 Jun 2024 13:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jqqdAR5z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090841940AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 13:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495393; cv=none; b=NBv7qWDP1UqVyxC7yUHSEYJTAcIyqj9VCPy26hw0CFlreWgPkp4LPwSeUHGgX1bytDIONd5RcfOSdVrwQSck6RYlZcBw75CezVrcrmG068Q5CmhCENFRxi26+MGl4vAgsg1sXlZeL1jD6NiEt/hvc/l2hI6wa8Ca13niOQ2Dfik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495393; c=relaxed/simple;
	bh=jrJYPSTr+kFC6rNqtUiTcC2Ht6Y5ui2Su1TvOnzxGV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rnNdcgu1ArFR6C2kPWUCRWgVQvciTY7pUof72IWBACV8lj4KFJWVyUutBY6Czb46JZlNKM4EOEdvaWxr2oX4BUf+nqgZpfP1k6SYrfFxkcK6D0E6QjsZ59NrfAx4Utlsli0Wnejpal35DmeBS+uU4Q5mNRc+v5+EoLSyfXxsmZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jqqdAR5z; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cdbc20faeso7682724e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 06:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719495390; x=1720100190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1OXb7hatY4Mkr6yC8g71Li7XpW45pDJLNXcPT5PB5o=;
        b=jqqdAR5z1A30dqwKb86648/w88Fte3dd72x9JW7AACLuGKhhIEyzZPXr+wgcknwJVn
         SS4G2e49DzqoYSWChui25WwqYp6xQXUGKtDfsP2OuSHEZSVNyUoUWlyFW+NHC0shpHji
         fjsPnpfPIQBqGrF1FyRM21Fqw4neWGHZsxNmvfG4WjAtfHneFzFHC8Iypee85iMmSbwo
         vG89CwvCUlPtt1wTxa8152MCE5fxvF4N+FLnFSCbI0888rdskEjN6LYCeXweQUOxzger
         GdgkifOFXZGtVisAspAe7UjKZtBhCj/G4Rv/CZFVhllwJpyaqTGOY/XTKbRinoDMFqEz
         LJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495390; x=1720100190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1OXb7hatY4Mkr6yC8g71Li7XpW45pDJLNXcPT5PB5o=;
        b=UKe382Bjgimh+MNv8xkAWtiZvL6UkqHs7FGvblL+GnKGIkBia8D9Lz2gkD6htIz0rY
         ixob1pCSBS0MFMadMD8ELypRz3J9zRwxoWmyoJwH1FywRq0pW521EGj5ZyXArhPn4C+L
         fMkwPS5W/4jGHweNhrPsbqxRJDYqOTad3Wx0OUwDTGJlmboyyUx+NWdh2NLJRShX1uFB
         FdkinPmFQX3f6ZjorPQTuN8juirBo9Ix6Gl6DIjsq5fbUnqnl/QFcaO3NEvPbFz2F8eb
         BT8X7KgIIb2tPKIzNmNHRSdL3L8swrOz+ZJAJWWbkzTueNoIAslyagYorz5q55suyB8C
         2A9w==
X-Forwarded-Encrypted: i=1; AJvYcCUStj5SKbkpNi97fRaCEhJ6XuRveKVyYbWlAvbuMwoJB1pcs7zI5C7VclbDoNCYuyMHgl6XGgDYEu5OAc5qDeuTTS1qSi3MAk2J2/62NA==
X-Gm-Message-State: AOJu0YyVvJX6KDFHVJ8keR/suSwk+dQDQkaZ4AkrzKLjLmAOPHy3TATz
	0rVq8UhpCDLaF80xfSthgjX0/CkRnkyGvrUfy9GmpfNs78m+EKXQBMc6nyPX0JA=
X-Google-Smtp-Source: AGHT+IEntGnW3r885rD535krGu3gOxLvLpYzJ1lI50RGmo2x6rQxE9vDmBzx8zivqRScd/qzBnU23w==
X-Received: by 2002:a05:6512:2813:b0:52c:dfe6:70e2 with SMTP id 2adb3069b0e04-52ce185f9efmr10637532e87.47.1719495390235;
        Thu, 27 Jun 2024 06:36:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e76427d7dsm62272e87.156.2024.06.27.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:36:29 -0700 (PDT)
Date: Thu, 27 Jun 2024 16:36:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 2/6] ASoC: codecs: wsa883x: parse port-mapping information
Message-ID: <z7wmi55kimskgfcon2difo6agc5nwkssehao72w3mtq3u2ig4f@msmv2on6mw62>
References: <20240626-port-map-v1-0-bd8987d2b332@linaro.org>
 <20240626-port-map-v1-2-bd8987d2b332@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-port-map-v1-2-bd8987d2b332@linaro.org>

On Thu, Jun 27, 2024 at 12:55:18PM GMT, Srinivas Kandagatla wrote:
> Add support to parse static master port map information from device tree.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wsa883x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
> index a2e86ef7d18f..43156d39480f 100644
> --- a/sound/soc/codecs/wsa883x.c
> +++ b/sound/soc/codecs/wsa883x.c
> @@ -1399,6 +1399,14 @@ static int wsa883x_probe(struct sdw_slave *pdev,
>  	wsa883x->sconfig.direction = SDW_DATA_DIR_RX;
>  	wsa883x->sconfig.type = SDW_STREAM_PDM;
>  
> +	/**
> +	 * Port map index starts with 0, however the data port for this codec
> +	 * are from index 1
> +	 */
> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> +					WSA883X_MAX_SWR_PORTS))
> +		dev_info(dev, "Static Port mapping not specified\n");

dev_info looks strange. It should be either dev_warn or dev_dbg.

> +
>  	pdev->prop.sink_ports = GENMASK(WSA883X_MAX_SWR_PORTS, 0);
>  	pdev->prop.simple_clk_stop_capable = true;
>  	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

