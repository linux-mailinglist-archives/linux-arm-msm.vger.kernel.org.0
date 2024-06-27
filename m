Return-Path: <linux-arm-msm+bounces-24504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5E591AB96
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 17:39:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C86B1C23456
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA6761991A1;
	Thu, 27 Jun 2024 15:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XKf6u/Um"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285A71990BE
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719502751; cv=none; b=cxNRahyCPgTi2a39iHh0kIllwUNCtnDYcq26mEbljFw0ncTYDK3oNcZEbWmKxRjUxUSkV3ohOF+NhRqK6XL/dCRzkWK4nQC+HtJiqWBkQA7xucrlB8PhCiFtdU8NzlYguhhIrPd6Xpu2ZQMT1s0HfEtF2ePOh2EEp1mk35NU5+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719502751; c=relaxed/simple;
	bh=DAekPm9WUSabO1N0Fanj15qiAengfqdzXPC4rFMBSJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7/mJd2P0GZ/UPEtQ6aU1PpcNdn/70Er2IcqYQ6Eh2etmOWh7f1dAkYvqUpS33pXRbZcnmqSsq0OadwmQW4CqESs/yeTImJ2sXAwv8HXCPKllfmaatUOSQ+DyYO57/yIn7r7FsIwVh0F+cqE91AtA3NXSihl3y+GPPyCYRxEmM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKf6u/Um; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cdea1387eso5849710e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 08:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719502748; x=1720107548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eWNXGLL2Gm1RdbPIHxkoTg3h2G36zUXEzqhJRAemoV4=;
        b=XKf6u/UmmENFenRu5GbmhvNztCcaZR2hZuNGzIgZI4TH3wFgK5i9rTuqxQYFwHzJil
         gjmqUidbndcU4Zw2vjg0XqnONHAA6wQFd48PL9uTWDDPsyXGsGqNmIXgwyf66h1uw91e
         j2RjTNnZMBBCPpcA5P9r1Nd2OdNvd7Z5OgUspvd8gyoB8NSG7trzcvMMfyFAKgkqi40y
         YEqGEdLnBore7Q6TQnC9a5lEB6EX2D7HQvwSGPID1UGrY1uJNL3gONwyHOdL5ON1+cbP
         rqtVKVoGC7SDm3y0G0/CzzT8PloaPWmrCJEiSNyRK24vEzF/Q3X3yerOzL+ou7l0BdBr
         +HZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719502748; x=1720107548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWNXGLL2Gm1RdbPIHxkoTg3h2G36zUXEzqhJRAemoV4=;
        b=vpiU6H11iE5E1UKzFeIjbq4booLjQWBn+hWo1yXtR+D/TW2buy0tISCV5ZTrx9Y8i9
         fAkwaUv12Nu02uAVJVv12VK5mnIgp7tyrUAOBTmkG4gXFnaJTBnnVg3l1s1yC/X9X2ho
         GAZsACq53fr7oD8XCK9VBO7lzDsEgx69MHx9BKom9VVbBsGB/VhbRIPfLHlAagtvZKW4
         Y7EQ55tjr8SCcUf+bpQfAxNriuUPwMgb/WcAtcqnCYVMTsV/oyVzvIzZ0knV/lb85trO
         sG2hvd05t3UZejGTpHd6kelcCJlq18YIyuFJm76x/gt1bqIXbxEToL/aKuvXTLQgPJ7C
         I2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCU1x6Ug0w6RVPwk35SjTudV/cEZf+raHwOg73KpOk9nKHS+ILOsyQgDwmsawAvp3a63Pyj6I7cFehXPFaU4Bk/KWoV1EfG64E4djlyAfg==
X-Gm-Message-State: AOJu0YzBlprkXbGtgYbPbxHSqcasoItQ+Reh89zeeY3F3Xy2OwA1zZrJ
	1fYKhJVSybVzZ7HP+PJuh69RI+7jXkThg5WKI69+I5mce5RNY99l9SruZRKi7yk=
X-Google-Smtp-Source: AGHT+IFjjRiKI2kfI3Q40lKeSWkAul/C0e6nj4kqnbScxDo4sTHhLvoHXz/FY3xuW5kDV4YGXIvQvA==
X-Received: by 2002:ac2:4c86:0:b0:52c:deae:b8fa with SMTP id 2adb3069b0e04-52ce18321afmr9465994e87.3.1719502748252;
        Thu, 27 Jun 2024 08:39:08 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7131357esm242219e87.212.2024.06.27.08.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:39:07 -0700 (PDT)
Date: Thu, 27 Jun 2024 18:39:06 +0300
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
Subject: Re: [PATCH v2 4/6] ASoC: codecs: wsa884x: parse port-mapping
 information
Message-ID: <gyg34bmhtkhnl7ggbo6fwrr2w2seuf73o6qrkh25qvi3psi4wi@awnib2ilblf7>
References: <20240626-port-map-v2-0-6cc1c5608cdd@linaro.org>
 <20240626-port-map-v2-4-6cc1c5608cdd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626-port-map-v2-4-6cc1c5608cdd@linaro.org>

On Thu, Jun 27, 2024 at 03:44:41PM GMT, Srinivas Kandagatla wrote:
> Add support to parse static master port map information from device tree.
> This is required for correct port mapping between soundwire device and
> master ports.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/wsa884x.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
> index a9767ef0e39d..a6034547b4f3 100644
> --- a/sound/soc/codecs/wsa884x.c
> +++ b/sound/soc/codecs/wsa884x.c
> @@ -1887,6 +1887,14 @@ static int wsa884x_probe(struct sdw_slave *pdev,
>  	wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
>  	wsa884x->sconfig.type = SDW_STREAM_PDM;
>  
> +	/**
> +	 * Port map index starts with 0, however the data port for this codec
> +	 * are from index 1
> +	 */
> +	if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
> +					WSA884X_MAX_SWR_PORTS))
> +		dev_dbg(dev, "Static Port mapping not specified\n");
> +

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

