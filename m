Return-Path: <linux-arm-msm+bounces-25113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BF1925CE5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 13:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FF06B331CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 11:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BBA13A27E;
	Wed,  3 Jul 2024 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4C8QV16"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA4B17B4E0
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003843; cv=none; b=ZxhqxxWloJxIAZ+xw7P1q+qf37MB0oXUjkLVYmnSyH1G63Q9tBCwzWdZ0FIJJOyCKV113fN9KuYX7HMmhRd9o5SUzPi7NQ3XFe8X59ezInSD2SPo6HKnkoLgCViBzGhJ0dCFwvmVioabna7Z8jR7WpviLBtWoBXU4ZYtWZs3sd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003843; c=relaxed/simple;
	bh=97g5hVGvQ1qwpc2CPaPuBD9gaA9Pvxly1JlZf2rwD3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzHMnmdNphAZt4tZRnYko+GG1RXSWgToHJIrxCsv//BAHLKkMHiOKGBK+xWyEYpR9VfSxvOeMNad8Xwu66iqZLKdjRjr8axaVfmpcHmFtbt8gM+BR+EMp9U1M3G+am+zWxK/cEu8GjtZri5gm/Drb42DOEZFuJdUHltFNA19oh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F4C8QV16; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e829086f3so5721188e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720003840; x=1720608640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mAbweGD+BN+79RknZZB5w0QdvnNoIWN8iG0fgQ2u8ZA=;
        b=F4C8QV160Oz6Ca5n57eEGTogOSb210p84C3bvYKLKi81s7xhv0XKJw1KHMuiVaa12U
         sDauLBwUZNi137ILUZKwf5Z+MgUyO0LYkIsrYW5mbtYQZr2upiCLpZAOnUntWe598zju
         IQRtbViUFGOafI0n6W45pRjN4am2FCjiJeGoh/8g07GfMEiZIQZgHyL3/9SCQe/OTJ+V
         pBpoK0OdH/D0zxIUUEfOVZoJvVPZh3N/zQuFe3ZbI7JRaN0AGc2+icKMby2WIDwptVmn
         0dyLAMhuwABvvqnB6f3ktfB5YFMsf/IyAfGmpfLrppnIoNwiCtF6EBBBovg7gBBXL/hI
         JTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003840; x=1720608640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAbweGD+BN+79RknZZB5w0QdvnNoIWN8iG0fgQ2u8ZA=;
        b=pEhOAksdkEaAIws+Gk9+Twmny3fcGFTd10Q7vmo/yBdZV1GiLiEU0be/6F28KTcXgE
         oDzuj5G6awvi8iwb0nka1kqKKDQ0uUKVhe0EZjSutqywWTgPAhv0EIpufFw4ggK/LVJn
         WwJTZU8iZBT+DX3zDff0ISpfx7HGxStzKaXrj/tEKNQTp8zmPADiai3OahvRys634CW0
         ERE/psItURMpoYg9hk5K+LZGEMhHz07f8vagh6/kIpji6H4nwOhqO50qjeT5YZVL09MJ
         Mo3Vk0qHlePvrANShh/DFXxlf7+5gsICPekFt+6beFBAZL8iZB4DV25Z4PMavVTSCH3E
         dAXA==
X-Forwarded-Encrypted: i=1; AJvYcCXF7/NuCKtyGpBTHHb3X4oPYyZPszszMVRbG7GJnAC+nBJTI5fEFLh9xfxBnZWixTfqo5BU8h/uYbx3OxdfeOCpLpAU0RnooGwfANGpKw==
X-Gm-Message-State: AOJu0YxeorThHvXtmDULP/It4QMSmidYEc97XjT9fTlbGOnWFn7VkN+a
	kidrJFbGR8mIcgcBDskyZS5cZnHk3PJDnZjThhuI7/9HgOohqUWG7cPVPZPqiTU=
X-Google-Smtp-Source: AGHT+IHOOKL4YyNeD/zQtvaedknaKcTA38zEaMOgcwZsU9QXJ4gpOSNYzoc+NWDud4SlyJkddZjdUA==
X-Received: by 2002:a05:6512:39d3:b0:52e:7688:2817 with SMTP id 2adb3069b0e04-52e8266eaebmr6364231e87.17.1720003839232;
        Wed, 03 Jul 2024 03:50:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0b7fesm2128928e87.31.2024.07.03.03.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:50:38 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:50:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Simek <michal.simek@amd.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 08/10] clk: qcom: lpasscc-sc8280xp: Constify struct
 regmap_config
Message-ID: <wc5hbb77tc2dalf6feg23ptdxdd7cjhshkgnbeiknalqicu7gn@jghelw744yot>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
 <20240703-clk-const-regmap-v1-8-7d15a0671d6f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-clk-const-regmap-v1-8-7d15a0671d6f@gmail.com>

On Wed, Jul 03, 2024 at 11:50:21AM GMT, Javier Carrasco wrote:
> `lpass_audiocc_sc8280xp_regmap_config` and `lpasscc_sc8280x_regmap_config`
> are not modified and can be declared as const to move their data to a
> read-only section.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/clk/qcom/lpasscc-sc8280xp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

