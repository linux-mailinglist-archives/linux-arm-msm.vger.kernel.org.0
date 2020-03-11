Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34B911814B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 10:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgCKJY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 05:24:27 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42209 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726097AbgCKJY1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 05:24:27 -0400
Received: by mail-lj1-f193.google.com with SMTP id q19so1456590ljp.9;
        Wed, 11 Mar 2020 02:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oTEgx+0q+wWx+G15t9Th6GjnGh/fBTDFvpJM0EhSSqg=;
        b=fwxu2w7MMtm/x0hf3Cffk7yAO5eCmJidEVDf7cUyikp7L+Of/ZryD6H873cV9fR4lx
         a0UWKNzkamTKmkOTh+xfwNH6iP50GbpJwDhVww3NWe8aS9HGQbHgQpKJFGIJJdZH8Osc
         9cauMHySd8mtWNKj8k6Q3gb3i/DFIdl2NhF4anpTiNRF/ZljOcYib50hWk9Wi813R+KL
         TajokvhN+1M/4Xok3Serw40kRx0E/0lwBUOUBccNYKasvLcvUynJXF74bFCT6aOkumsS
         kp/1eHP40hus1keHPX71IrUYM5CXifL6m6yPVEYwqmSXDktAW9OIYLbdxyrgOzLZnzf1
         aKaA==
X-Gm-Message-State: ANhLgQ096Y2DDBdIwrOQs7fWcRW5Y3hNZB2gGWJzF6aDFMReezeEkD/e
        HEcPrgmb1LINnU7+6049OZ8=
X-Google-Smtp-Source: ADFU+vvQvYAE4SLupfEd5gDlFgHDl8iVN8OI49a+BbJLpOrASXqS8Bxt0ncyKf6hhI+pJzBAPHKQdQ==
X-Received: by 2002:a2e:801a:: with SMTP id j26mr1519598ljg.249.1583918665226;
        Wed, 11 Mar 2020 02:24:25 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id t3sm14614706lfp.81.2020.03.11.02.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 02:24:24 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jBxb2-0004UZ-7N; Wed, 11 Mar 2020 10:24:12 +0100
Date:   Wed, 11 Mar 2020 10:24:12 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Rocky Liao <rjliao@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org
Subject: Re: [PATCH v1] Bluetooth: hci_qca: Replace devm_gpiod_get() with
 devm_gpiod_get_optional()
Message-ID: <20200311092412.GH14211@localhost>
References: <20200304131645.22057-1-rjliao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200304131645.22057-1-rjliao@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 04, 2020 at 09:16:45PM +0800, Rocky Liao wrote:
> This patch replaces devm_gpiod_get() with devm_gpiod_get_optional() to get
> bt_en and replaces devm_clk_get() with devm_clk_get_optional() to get
> susclk. It also uses NULL check to determine whether the resource is
> available or not.
> 
> Fixes: 8a208b24d770 ("Bluetooth: hci_qca: Make bt_en and susclk not mandatory for QCA Rome")
> Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
> ---
>  drivers/bluetooth/hci_qca.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

> @@ -1901,15 +1901,15 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  		}
>  	} else {
>  		qcadev->btsoc_type = QCA_ROME;
> -		qcadev->bt_en = devm_gpiod_get(&serdev->dev, "enable",
> +		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
>  					       GPIOD_OUT_LOW);
> -		if (IS_ERR(qcadev->bt_en)) {
> +		if (!qcadev->bt_en) {
>  			dev_warn(&serdev->dev, "failed to acquire enable gpio\n");

Shouldn't this be dev_dbg() if the gpio is indeed optional?

>  			power_ctrl_enabled = false;
>  		}
>  
> -		qcadev->susclk = devm_clk_get(&serdev->dev, NULL);
> -		if (IS_ERR(qcadev->susclk)) {
> +		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
> +		if (!qcadev->susclk) {
>  			dev_warn(&serdev->dev, "failed to acquire clk\n");

Same here.

>  		} else {
>  			err = clk_set_rate(qcadev->susclk, SUSCLK_RATE_32KHZ);
> @@ -1924,7 +1924,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>  		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
>  		if (err) {
>  			BT_ERR("Rome serdev registration failed");
> -			if (!IS_ERR(qcadev->susclk))
> +			if (qcadev->susclk)
>  				clk_disable_unprepare(qcadev->susclk);

The clock framework allows you to pass in NULL precisely to be able to
handle optional resources without sprinkling conditionals all over (the
gpio subsystem does not however).

Applies to clk_set_rate() etc. above as well.

>  			return err;
>  		}
> @@ -1945,7 +1945,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
>  
>  	if (qca_is_wcn399x(qcadev->btsoc_type))
>  		qca_power_shutdown(&qcadev->serdev_hu);
> -	else if (!IS_ERR(qcadev->susclk))
> +	else if (qcadev->susclk)
>  		clk_disable_unprepare(qcadev->susclk);

Same here.

>  	hci_uart_unregister_device(&qcadev->serdev_hu);

Johan
