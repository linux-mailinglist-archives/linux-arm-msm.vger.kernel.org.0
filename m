Return-Path: <linux-arm-msm+bounces-52252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3594A6CB6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Mar 2025 17:18:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91E2E16BF08
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Mar 2025 16:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91A7C231A51;
	Sat, 22 Mar 2025 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ooXs3H3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949E82309A8
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Mar 2025 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742660316; cv=none; b=L5MwLEXNTxMS6FK8Sl2eCZsEzmhWwudMpmUbOZq1ymptvSgXJbTvnwmBKbyVlb4AxE10hQBq6DYxrDANsLZB5r5VEEfa165ha5Z7UQMVsudzqnOzGCr4nUX2BWWRBECcrDaQHoHJ1oEqrj3oCeUMEseVsjNZdB3HSg9dUnotB80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742660316; c=relaxed/simple;
	bh=EhSc4gMtJQ8VkenQ8q7Z4o6Gq8b7xOdff+lboxzPoxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tiw1YkJkuIZyV+/TJQ5wYUreFWFM38AzBFURqW1Ctiv8C0gFeQ2BwtUCxBQGW7YlRrgFhGNS1qiu7UxAz4TjW/GBp7oSrDBLagn6UbXqOlrNcYnRkbwkQLiRDnnJ8UzvucoCmsMtHUvLQCL06uANabD9fAmgkLIxISvlUv+czxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ooXs3H3A; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390cf7458f5so2227352f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Mar 2025 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742660313; x=1743265113; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQg7akAtbWC+F80WejdnIt/45y4xXX2jqP1rGiQwyO4=;
        b=ooXs3H3AhCsiuyXIipjwFaBOAB6wacnrQhLHJLhO3ypFwA2NiaXliJoNqlWUuRo5R4
         SLILP+vUKmOUkM6JlTPgUj0mGLXq2SZzgMrSmhJoi8j55q23Kavntc8zxiGaM1iURFFf
         ps/FCEzFddE6bJBnHdF1ler91EQrkZvIrYOMuGcJMjk5A9Bbwjj+/VjkTJVO9SGMoum2
         tNiKtXpxjBPWffJBhzhKeoLVWqwJtXGWOqSQjyw/rYYEAe/yQpeSSn64j7Q4wBRbs8P+
         ZdLhS2iRLM8cFjaNFCydfFB8dvWWl4jwL+FOsVaHwefnzHfVi//E92oJTQqundgyu6BH
         TR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742660313; x=1743265113;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XQg7akAtbWC+F80WejdnIt/45y4xXX2jqP1rGiQwyO4=;
        b=fzOFPDTgO8zJtF4r3mLUsejM3YogVbZCcFmjLAcnqsUeFwLq4ACbppptvJpwj4wGkW
         WV76RK10TE8fqXHrE853obtGHFeMfVDlzYY1QT/4Gp1zMqb/qZ4YwPbqULy8yiu9NzSx
         cbVjI4YS4lb0HXJ1qRKsFYFCBgPAMs5oj4EjtNCqy9gJj0txafyzIwSexIsE4hWOtNH5
         qOm2wDS0geOEFORWjY0xFIFVlkt69KhlYy3Yi/9C20kXjdryvwXPDy9Q7xCF+2RPQEcF
         Cwg0zRqZ6HjrENQneovkHTANY0J2YIPErS0/YxfcDJrlXRpPTfyF0yq2hbYJqI2hOCkj
         RgHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvHY0/AdMQzlBi8Nv8ObjqrXCSIVYlsXR4/Na5M78DIwnK22XR2157bTD6f+L6jcbtMEBHqlyCbjJzdKiQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx8BIND7M01/iazgqXM1KNVcWfZ7UF6VGO9e3F7FXFa74bNIsv
	tyx4avGeidNK5YrOwlz9WEwAt0MseGVigpTlMADYgT86J8bmsHGLzBwK5+VzSm46Ip5cuYgxIL1
	2qjeHmvls2N138Bbl0RaIPSXxAf2Nj65T5bPIEw==
X-Gm-Gg: ASbGncuyGJf+tdO1e99KUcqGh4+btCFMcci+Fdm7yOIgXXtWD+to5dMtrwoxBa3Obau
	PciCaFBlPL64x6f0fHD3XrNTR5F4+/QgYwsWCT1CmdEih5C7BOxtEgiqX9jve/Owf1m8jRSAFsQ
	GZJe+iKcSoegGZzGM7hn7LuA9+dp21EKSLPk6/ceZy57yHcYV0PVxT7xMDh+Q=
X-Google-Smtp-Source: AGHT+IG/dP5kfjpo9N6hZ95W4x5TZDS77CcIFlzLNp1DQjbAjfhRKFsF02WSvZgsoXhLBeGn8IYRmz0UhAyj7EU/6/s=
X-Received: by 2002:a5d:64af:0:b0:391:2c0c:1247 with SMTP id
 ffacd0b85a97d-3997f8f8c14mr7295628f8f.1.1742660312674; Sat, 22 Mar 2025
 09:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250322144736.472777-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250322144736.472777-1-andriy.shevchenko@linux.intel.com>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sat, 22 Mar 2025 16:18:22 +0000
X-Gm-Features: AQ5f1JpS0ZHpf8trIuKoL__I_GBotdRkSDBFtV3W0xRYYiAh7VkraP9v-DaXLwI
Message-ID: <CACr-zFCF_b0_3NSLFvtgfpAbsSwUOYv5fS==PPbn9zXPBS0NHw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: qcom-geni: Use generic definitions for bus frequencies
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, Viken Dadhaniya <quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Sat, 22 Mar 2025 at 14:59, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Since we have generic definitions for bus frequencies, let's use them.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks good to me.

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 515a784c951c..ccea575fb783 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -71,7 +71,6 @@ enum geni_i2c_err_code {
>                                                                         << 5)
>
>  #define I2C_AUTO_SUSPEND_DELAY 250
> -#define KHZ(freq)              (1000 * freq)
>  #define PACKING_BYTES_PW       4
>
>  #define ABORT_TIMEOUT          HZ
> @@ -148,18 +147,18 @@ struct geni_i2c_clk_fld {
>   * source_clock = 19.2 MHz
>   */
>  static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
> -       {KHZ(100), 7, 10, 12, 26},
> -       {KHZ(400), 2,  5, 11, 22},
> -       {KHZ(1000), 1, 2,  8, 18},
> -       {},
> +       { I2C_MAX_STANDARD_MODE_FREQ, 7, 10, 12, 26 },
> +       { I2C_MAX_FAST_MODE_FREQ, 2,  5, 11, 22 },
> +       { I2C_MAX_FAST_MODE_PLUS_FREQ, 1, 2,  8, 18 },
> +       {}
>  };
>
>  /* source_clock = 32 MHz */
>  static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
> -       {KHZ(100), 8, 14, 18, 40},
> -       {KHZ(400), 4,  3, 11, 20},
> -       {KHZ(1000), 2, 3,  6, 15},
> -       {},
> +       { I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 40 },
> +       { I2C_MAX_FAST_MODE_FREQ, 4,  3, 11, 20 },
> +       { I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3,  6, 15 },
> +       {}
>  };
>
>  static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
> @@ -812,7 +811,7 @@ static int geni_i2c_probe(struct platform_device *pdev)
>                                        &gi2c->clk_freq_out);
>         if (ret) {
>                 dev_info(dev, "Bus frequency not specified, default to 100kHz.\n");
> -               gi2c->clk_freq_out = KHZ(100);
> +               gi2c->clk_freq_out = I2C_MAX_STANDARD_MODE_FREQ;
>         }
>
>         if (has_acpi_companion(dev))
> --
> 2.47.2
>
>

