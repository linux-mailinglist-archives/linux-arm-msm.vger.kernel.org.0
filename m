Return-Path: <linux-arm-msm+bounces-38229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EC69D117C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 14:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD89AB2370A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 13:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B716619D07E;
	Mon, 18 Nov 2024 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+PRR6P6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBD91991B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731935419; cv=none; b=Si9BRz/n91MYzrx6CtGrWNefCH8Vgs2b7ai24DZHM6Llt1rQtOxY7ZNxyPGjm4Cn0EcqWx3ZnhZKwhXfIdRS37oJJK+YsNIffaD/jZ+AXnjYUz8RR/+yOF0miPykS5ltcn3XkPazJoPrdrPGuN18wSVBzQ6vMnhfoszNEz9UY60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731935419; c=relaxed/simple;
	bh=Qo3j9K87oklHHttMGW7FxuFJ5OAHNu0KyF5/pme2whI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPeBH5+vrl9cMFtOEjc8n8EVLIn7Syqtx+bko5hF3CDshqRGYPQMZbiyV5kVyhSfvrBCw5OZ2gQzmlAnn2ErKrbgRUQZHvafSdPtpYAI/RdNMIhzFyAOS+/bYsTZZa65RHbVxh0NMqSHGF9pdrY7PeXm4J0LsY81DEE6SSqhLLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+PRR6P6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539e8607c2aso4301956e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 05:10:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731935415; x=1732540215; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7MgID1rDBH0q2g66wNaYzuYle0Mjw6YJwKmhz7O5g2U=;
        b=T+PRR6P6krZcprQwWVW9sBhWjtsWLzB22fYpopRtXCygX3tjByPwysgGA/efjagD0F
         dugHa6j6xmmeqIRqToFT92rX56DrZYomRDIS55wTbUF0aKa4abR0eFYZMQa5gjwHDAlT
         2kOPCteR0v31joZS43w76JUL/gLcPMpGVoKncEZVD9McZTv84UrFvQyAPfXRPZuDsJ6J
         lYOxHqEM+HxFBZDrrnWvfPBYqjhkVIlIAY8tyUpDkrA09XCF7/HC1PPEy8Zui5uvpfES
         jz398Y8sX/NdyvKNKhzeQM1qPzS5NXv19pQf4q9ReIWp/WAa/hwK3I5rS2f7nSxgZBdp
         ockA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731935415; x=1732540215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MgID1rDBH0q2g66wNaYzuYle0Mjw6YJwKmhz7O5g2U=;
        b=TOv1/i3hz8aMl4TGnhA1DMlJXVTQle6K/I5u1emq1y3xlCFLtmgvv0tHtn0sWfxclY
         U1zNGHYHgG1knmNN2kkqJ9q++DlE/tOMmO1WC0xD/hD05X9cHmgQ/wZn5dhKoIiKXpc8
         HJl7ZTuUGO9BHNkENHSNzu+SYvLSfMI2eJOUydZBR5BrgxsyqKj+YvyUVZl1Ct4W9r+v
         NoCNwwvUgiCJOTnNLVqK85cqbWRHpL78KRO4glG5MkiOmjqK6inFzZyKs1dM0kMRaaLG
         j1FmG24DfIUkYJ+gafLuXJcGgQS8kryfX9BFEugw8t5U9luGSidQ7aOk6BYDdpHddZDW
         FYYg==
X-Forwarded-Encrypted: i=1; AJvYcCWksrXc7zuodrt9cNGErAdPSxlf5oJU41amWsbjUcPhY+K3/7l4GMA1YJIIACe8JAq5hnCeYVyqc+ZynG6b@vger.kernel.org
X-Gm-Message-State: AOJu0Yy77V8yE41h7i2RM7NrCXyAyxsKY6kcqIXVHFkM+UC66dn4g9mf
	FDbMxtppBmg8DzdrnyOzr+c44R3vUndBt8WggUXMWOTi8RnxlFMf5/psLkKVb8+TZOSNGmnkH/2
	G
X-Google-Smtp-Source: AGHT+IFp+UyivweqpjmdInjrNQsnahm8prNYSiTJ88LG9qmFM6mGU5RDHMsWJlSnsGNLGahvS/sWSA==
X-Received: by 2002:a05:6512:2389:b0:53b:1625:bcf8 with SMTP id 2adb3069b0e04-53dab2a71bcmr4913816e87.30.1731935415010;
        Mon, 18 Nov 2024 05:10:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53db3324b55sm685584e87.202.2024.11.18.05.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 05:10:13 -0800 (PST)
Date: Mon, 18 Nov 2024 15:10:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
Message-ID: <atg6yw64f4aojcbjyarljb57cejqk56g2qnddrloa3smmupm6d@fk3oyiycnuco>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>

On Mon, Nov 18, 2024 at 02:24:33AM +0000, Bryan O'Donoghue wrote:
> Introduce pm_runtime_get() and pm_runtime_put_sync() on the
> gdsc_toggle_logic().
> 
> This allows for the switching of the GDSC on/off to propagate to the parent
> clock controller and consequently for any list of power-domains powering
> that controller to be switched on/off.

What is the end result of this patch? Does it bring up a single PM
domain or all of them? Or should it be a part of the driver's PM
callbacks? If the CC has multiple parent PM domains, shouldn't we also
use some of them as GDSC's parents?

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/clk/qcom/gdsc.c | 26 ++++++++++++++++++--------
>  drivers/clk/qcom/gdsc.h |  2 ++
>  2 files changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..ff5df942147f87e0df24a70cf9ee53bb2df36e54 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/ktime.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset-controller.h>
> @@ -141,10 +142,14 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
>  {
>  	int ret;
>  
> -	if (status == GDSC_ON && sc->rsupply) {
> -		ret = regulator_enable(sc->rsupply);
> -		if (ret < 0)
> -			return ret;
> +	if (status == GDSC_ON) {
> +		if (sc->rsupply) {
> +			ret = regulator_enable(sc->rsupply);
> +			if (ret < 0)
> +				return ret;
> +		}
> +		if (pm_runtime_enabled(sc->dev))
> +			pm_runtime_resume_and_get(sc->dev);
>  	}
>  
>  	ret = gdsc_update_collapse_bit(sc, status == GDSC_OFF);
> @@ -177,10 +182,14 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
>  	ret = gdsc_poll_status(sc, status);
>  	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
>  
> -	if (!ret && status == GDSC_OFF && sc->rsupply) {
> -		ret = regulator_disable(sc->rsupply);
> -		if (ret < 0)
> -			return ret;
> +	if (!ret && status == GDSC_OFF) {
> +		if (pm_runtime_enabled(sc->dev))
> +			pm_runtime_put_sync(sc->dev);
> +		if (sc->rsupply) {
> +			ret = regulator_disable(sc->rsupply);
> +			if (ret < 0)
> +				return ret;
> +		}
>  	}
>  
>  	return ret;
> @@ -544,6 +553,7 @@ int gdsc_register(struct gdsc_desc *desc,
>  			continue;
>  		scs[i]->regmap = regmap;
>  		scs[i]->rcdev = rcdev;
> +		scs[i]->dev = dev;
>  		ret = gdsc_init(scs[i]);
>  		if (ret)
>  			return ret;
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 1e2779b823d1c8ca077c9b4cd0a0dbdf5f9457ef..71ca02c78c5d089cdf96deadc417982ad6079255 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -30,6 +30,7 @@ struct reset_controller_dev;
>   * @resets: ids of resets associated with this gdsc
>   * @reset_count: number of @resets
>   * @rcdev: reset controller
> + * @dev: device associated with this gdsc
>   */
>  struct gdsc {
>  	struct generic_pm_domain	pd;
> @@ -74,6 +75,7 @@ struct gdsc {
>  
>  	const char 			*supply;
>  	struct regulator		*rsupply;
> +	struct device			*dev;
>  };
>  
>  struct gdsc_desc {
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

