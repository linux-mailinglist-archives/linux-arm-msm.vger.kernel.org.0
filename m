Return-Path: <linux-arm-msm+bounces-48775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D558A3E915
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 01:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ABC03B049F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 00:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD6D1CAAC;
	Fri, 21 Feb 2025 00:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MGcShLFY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD7E23A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 00:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740096645; cv=none; b=NbgOJ8y8mC7eDPw2y9rncCFFM/AW9YSxOrnYHM7fmnMu5ZA2MvPpGUWJlbEUJxLGW3yO3+vS8zrAvM+QCxSQZOCO0VWcBll5b3IDDk86bj8fYMqoPkiKY427iSDieWAyNYYT1pIJCfgZ3uKx/+b8/Ur4wizwFUscw1xotLzp44c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740096645; c=relaxed/simple;
	bh=AlWULx0RPrZBQOGn9zHPeIPoIWwcVdQFNlvQhqFkQVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcGOa1qQNk8G2CMbObblOuH031dT2hv4oxDvkLavP4JftgrOnBdj/0M+AEA5V/5f37lSLf03+aHdO0O+KkACn4O35AFW4XRbQxnJWBPgxDgsY44yQVs3VLSwx+DJClYWY/kZSeDCKJbSk4xY3Sy6Mue3/WPIOcTCVVG/UphH8T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MGcShLFY; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3061513d353so15988041fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740096640; x=1740701440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JuSgjifBq+hplcp/bZFuyA747UHV9QqBROPG69+V/oA=;
        b=MGcShLFYbsqU+t0KWAQ4jwFekJvTKHvnLysUY2oRcYvG0JB0v9e9yIit3Lassi/adB
         BuTyGCkbhup7ZADQCtjd8S6ATtfCnpvHkmaI8oseozL1hrleARLDrnCuTQ/3fQ14xijg
         4ykBCkZ0UO3gA9m6hn71tnTX1qeut9s4RC+uHMr/HL0hddU+/JwDt1s0x5BpwD5+KtVq
         0599JtgGcRHmxXmsIe/1ug9Y+zk268IuYxCsRtXVAtIAjP1oQzhZF8y4MAEjM8717ECX
         CsICvaeWXhB36HvpsKAcvl/Po3PVDdHdHsIQ/06XCbl/aWBZLhooRIHD5UOjhTBYR+Xs
         PUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740096640; x=1740701440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuSgjifBq+hplcp/bZFuyA747UHV9QqBROPG69+V/oA=;
        b=NvVvk1QpDvhyE5RPmJeIzk18WjrXEO6q4z5knaGwdD5HpwWwVFOcbsOR5O3nSJNooc
         c5uL4RmVz6xQkUun3tFPH6iMoiXZUapQc0RPKVY15DvvzTNKwceY6DueDdboMRNPdr5I
         bGEXIuAO0/EhWUsgJjeg0qO7/iOwsnN1YlTd1TDcXxAnHLacmdqjfkaZqUySO9fGfJYs
         uygnxZxY4MPzeg6BKfymXq/NgrvRMdsJp4OeYS7uqGCWoCGyygUTbZAmgscrV5vdsG0q
         h7f7NEmH/5eyAQQe3/SABNhUAZTSp5ialjE0115jFnBNzztRYmN/KblESV4L/QFlvGKs
         UYUg==
X-Forwarded-Encrypted: i=1; AJvYcCW0jFTZP5j9L7Ibnhn751zo5aHZB+097/mhthVjkhPjYUCYkgHgWWilk6yFs7wAbco6ypMTmNKmFpCL0Qq+@vger.kernel.org
X-Gm-Message-State: AOJu0YzO567SMgzC7rx6CnG0dTUlQBg7lqscg++/I5YCXwLP5dwFj/8o
	OuWgHPFz3I9s9WD7x2d33/qouyL8RJPu9rqwS6oO+4lGxN+8vn229QIsgyXSq88=
X-Gm-Gg: ASbGncskkht3GSBG/sI48g0ZFnBk0fovxtDMjG5MOZMaGoc5yKzs9DhWalSPzHeKubO
	5sejq9uqtJD79A9lwoKmbQ97t1weFWQSqZZtrXImSTT7cVkG3T1tRq47c6P0UWRNPZ5AhhjeTqh
	15X8y+y7LIK9dJZEUkm84YyX4AK/XSOXxmi4l4icA2B8tAxbBDqeJVFnxk9WAUa04B/L3WRO7Sr
	u8IyPf86bmTIYjBy6XrGwLC09+xfsh7oDBimBRPh09qBdgNpm2WpBL/l+RpZ89wmCSprLnN5hxX
	LgpmOYhXGG+MFUpxh3cf3H0XzD0Nv7DqJnHlmCU/6milVvEKIq2kw2het00L+1fk6znWBcs=
X-Google-Smtp-Source: AGHT+IEwcNk7nZ+S8pgGD3YVt/VQAdNHGFFnbKNtHgYR59pFMVBtJOK7O5RSRGR4iFKOzpTzL751yg==
X-Received: by 2002:a2e:7807:0:b0:308:df1e:24c4 with SMTP id 38308e7fff4ca-30a5b20d7eemr1462491fa.29.1740096639554;
        Thu, 20 Feb 2025 16:10:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a266e4968sm17747741fa.77.2025.02.20.16.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 16:10:38 -0800 (PST)
Date: Fri, 21 Feb 2025 02:10:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
Message-ID: <r73hnpusatba3hvyckv7jw3dcvffgvoxwawlcvvxhuol5rrrk7@ngo3fiv7va6e>
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
 <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
 <d4c4ecf0-9094-4341-8711-78a48e5d1344@linaro.org>
 <d444f1fb-42a0-48ef-83bc-d5aab9282b22@quicinc.com>
 <gzjyyl2kzv52zsewn5zf6ei65fymyi4pspvsmsjaqj5sklfxvc@bkg46saulni5>
 <fcc31cc7-67bd-4102-a53f-ebe66b4fd1a7@linaro.org>
 <3da96df2-1127-49bf-8114-282cc488c194@quicinc.com>
 <6b0684a0-a519-463f-b7be-176a4752a786@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b0684a0-a519-463f-b7be-176a4752a786@linaro.org>

On Thu, Feb 20, 2025 at 10:31:44PM +0000, Bryan O'Donoghue wrote:
> 
> Where we can zap the GDSCs the power-rails for the block should be always on
> because the initial PLL configuration we typically do in probe() would be
> negated as soon as the power rail for the block is switched off.
> 
> True.
> 
> In my opinion:
> 
> - We should only do the pd list addition in one place
>   Either that or push it into each driver.
> 
>   I don't favour doing it in each driver since it is boilerplate
>   code that we basically just end up copy/pasting again and again.
> 
> - We can start off by only including a configure_pll callback
>   for the 2-3 blocks where we know we have multiple rails
> 
> This here works well for me on x1e:
> 
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Date:   Tue Feb 18 19:46:55 2025 +0000
> 
>     clk: qcom: common: Add configure_plls callback prototype
> 
>     Add a configure_plls() callback so that we can stage
> qcom_cc_attach_pds()
>     before configuring PLLs and ensure that the power-domain rail list is
>     switched on prior to configuring PLLs.
> 
>     Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 9e3380fd71819..4aa00ad51c2f6 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -304,6 +304,12 @@ int qcom_cc_really_probe(struct device *dev,
>         if (ret < 0 && ret != -EEXIST)
>                 return ret;
> 
> +       if (desc->configure_plls) {
> +               ret = desc->configure_plls(dev, desc, regmap);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         reset = &cc->reset;
>         reset->rcdev.of_node = dev->of_node;
>         reset->rcdev.ops = &qcom_reset_ops;
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 7ace5d7f5836a..77002e39337d7 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -38,6 +38,9 @@ struct qcom_cc_desc {
>         const struct qcom_icc_hws_data *icc_hws;
>         size_t num_icc_hws;
>         unsigned int icc_first_node_id;
> +       int (*configure_plls)(struct device *dev,
> +                             const struct qcom_cc_desc *desc,
> +                             struct regmap *regmap);
>  };
> 
> +static int cam_cc_x1e80100_configure_plls(struct device *dev,
> +                                         const struct qcom_cc_desc *desc,
> +                                         struct regmap *regmap)
> +{
> +       int ret;
> +
> +       ret = devm_pm_runtime_enable(dev);
> +       if (ret)
> +               return ret;
> +
> +       ret = pm_runtime_resume_and_get(dev);
> +       if (ret)
> +               return ret;

I think, it's better to add desc->use_rpm. Then these two calls and
pm_runtime_put() can go to a generic code.

Or maybe we can enable RPM for all clock controllers?

> +
> +       clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap,
> &cam_cc_pll0_config);
> +       clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap,
> &cam_cc_pll1_config);
> +       clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap,
> &cam_cc_pll2_config);
> +       clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap,
> &cam_cc_pll3_config);
> +       clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap,
> &cam_cc_pll4_config);
> +       clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap,
> &cam_cc_pll6_config);
> +       clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap,
> &cam_cc_pll8_config);
> +
> +       /* Keep clocks always enabled */
> +       qcom_branch_set_clk_en(regmap, 0x13a9c); /* CAM_CC_GDSC_CLK */
> +       qcom_branch_set_clk_en(regmap, 0x13ab8); /* CAM_CC_SLEEP_CLK */
> +
> +       pm_runtime_put(dev);
> +
> +       return 0;
> +}
> +
>  static const struct qcom_cc_desc cam_cc_x1e80100_desc = {
>         .config = &cam_cc_x1e80100_regmap_config,
>         .clks = cam_cc_x1e80100_clocks,
> @@ -2434,6 +2465,7 @@ static const struct qcom_cc_desc cam_cc_x1e80100_desc
> = {
>         .num_resets = ARRAY_SIZE(cam_cc_x1e80100_resets),
>         .gdscs = cam_cc_x1e80100_gdscs,
>         .num_gdscs = ARRAY_SIZE(cam_cc_x1e80100_gdscs),
> +       .configure_plls = cam_cc_x1e80100_configure_plls,
>  };
> 
> This has the same effect as you were alluding to and in fact we could
> probably even move the pm_runtime_enable/resume_and_get and pm_runtime_put
> into really_probe().
> 
> It seems to me anyway we should try to push as much of this into core logic
> to be reused as possible.
> 
> ---
> bod

-- 
With best wishes
Dmitry

