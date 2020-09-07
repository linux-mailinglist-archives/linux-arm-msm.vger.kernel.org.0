Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B5925F53A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 10:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgIGIas (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 04:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgIGIaq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 04:30:46 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2730C061573
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2020 01:30:44 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t10so14880050wrv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2020 01:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:subject:in-reply-to:date:message-id
         :mime-version;
        bh=nxwjXtCfzhbJphkRoaZPGRX8lSLuG3IRQbDMiVfMlTw=;
        b=hDYe3/X1Fp/nkA8cq5LKQEuabNxEiXDOUvZ6woI5zrDtV/o7pIJt3+dMMm+9HY2TUp
         cJLd1Ak+4UWRcYyvT80mTkYj6NBmFbmk6wB+qnPxWUc1KaSG9Qn2t56LtE+VGh2qiVzv
         9JuYo9Vx8HM3XBkFaq+ij9ZViBAHur8hlIbyrkyKrJ7qClw66Dqhb2jwIu0SC9QJzrdf
         gUGdUHALqoOY+mnDt2IsTPU1QvekYjKaGug1Vdp44Er/RQqCawCgaUylXU1NoaEZKpVP
         zru4e1SdyZCGOVqvjSWFeF95bi3nh2JfDYBl6ExDbqti5ZIjKFPpjuuV0LG1Bi9HubrM
         sD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:subject
         :in-reply-to:date:message-id:mime-version;
        bh=nxwjXtCfzhbJphkRoaZPGRX8lSLuG3IRQbDMiVfMlTw=;
        b=jnL4zL2Lhr9Q80++ZgNqQ6vzEFKdiBUiJ00SSIyVxugcUUWBg01McjEnDuSWuWVXey
         HCO54QZQnOtfkNXJMolWUW8dTQP09mPfebieYH0M5St3+gdGCox1V5TgYE9FJPYhc7PJ
         Q8pAHuRp+qp8vd7f4QLctyB5ocxehB0YNI5p3VHbthhWFe0rleqkOpx4NBxgk9swTlSY
         LcV4aIEvye+J2YxSr/lGexawgc8GUpSdGLAC3Dkf1xJtFfgfPFEP59RHgLsEmDujEZUr
         zgFA8vKtcAnuEeuR9jA4pVcSvopmyn5lMXrXJpqZ9rw1AcNEtPNCq1TIhsl/oUIjKAhn
         AeZg==
X-Gm-Message-State: AOAM533WZ1Dkpzilrk9EUNNcoBW1GSdy5R30O5kayzA4VPJy/q7P5Kon
        Ev+r4sBiubOVV4XM5Lf2yfo0lg==
X-Google-Smtp-Source: ABdhPJzSdXOEuAZoMyzc+6+YubqhNb8xreJ4au8coroTpf3gvY2rMuV8IzBk2Sy9KwE1J2Tz416CKA==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr20049982wrq.408.1599467443488;
        Mon, 07 Sep 2020 01:30:43 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q18sm27461214wre.78.2020.09.07.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 01:30:42 -0700 (PDT)
References: <20200902150348.14465-1-krzk@kernel.org> <20200902150348.14465-7-krzk@kernel.org>
User-agent: mu4e 1.3.3; emacs 26.3
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 07/10] clk: meson: Simplify with dev_err_probe()
In-reply-to: <20200902150348.14465-7-krzk@kernel.org>
Date:   Mon, 07 Sep 2020 10:30:42 +0200
Message-ID: <1jsgbuaszx.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed 02 Sep 2020 at 17:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> ---
>  drivers/clk/meson/axg-audio.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
> index 53715e36326c..dc22b0c45743 100644
> --- a/drivers/clk/meson/axg-audio.c
> +++ b/drivers/clk/meson/axg-audio.c
> @@ -1509,12 +1509,8 @@ static int devm_clk_get_enable(struct device *dev, char *id)
>  	int ret;
>  
>  	clk = devm_clk_get(dev, id);
> -	if (IS_ERR(clk)) {
> -		ret = PTR_ERR(clk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get %s", id);
> -		return ret;
> -	}
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get %s", id);
>  
>  	ret = clk_prepare_enable(clk);
>  	if (ret) {

