Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F91FF8EBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 12:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfKLLkL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 06:40:11 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33919 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbfKLLkL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 06:40:11 -0500
Received: by mail-wr1-f66.google.com with SMTP id e6so18212835wrw.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2019 03:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SLuhtJEUY90bkqc19DKt+xd8yq8xw26lU1HTC8t+5Ww=;
        b=v2f/kpHAG3P+dAelw27PbhnuN6PPubaQHKMkdlBuTKEATOxTzOE7QC7sKigDqDWOp9
         /PomLsUcwsoNHkQ/+GUWD7yAHlQPDRoQ5D8eyMkFySsjDD4VISYFgaN77lqF9YUphhhu
         Qz4lXcfjVX3e0gFkFiC1WAIBeq8/XOvMzJn3L3NnYO4ui/VDr7tTu6LpqiYfQTCCmKk0
         L8SfAkihIdipXkrVlomuho9sj64bXeQ/WhJBZyJ2kYfy2gjKCLqU/IIWSoudQCjf3dX+
         vUqg/veoDt7yVZpKAndlUgDs4sAkWdwoRdojufDpxpacK2UUDW2HtLqPGzhkWiVtldG8
         d73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SLuhtJEUY90bkqc19DKt+xd8yq8xw26lU1HTC8t+5Ww=;
        b=IDm9OD+kTIEfkICaehPTFMpAoLJUCSJV3WwNRXtVb59x/oGJnp5cRY/YdksEkPbuD/
         A2EstupVl527pC7bQ0vFjUopYOl2Y6tU4+gfxza2x5dMK1mbd+/CYC+8FmO9WwSK4Xqd
         hMkpCGssnvTnKeYyagmK3vw2sSJiucQ6Xl3E/60pmEaWynRNTI2b6fdKy8IbK5tYRWr0
         kfF44qK21Ytw5aurtJ2+Qz4xKOb9Nd88NWzFQ4m/WyGTU3GLqpSP/74zTsqEQnmD/fvC
         8ftXuggyelq8kG7208KUPO4lFSHpfGkf4+IuyedSWr7VqtdtYvmwcaJ1tVUhp5IzUD5t
         LXyA==
X-Gm-Message-State: APjAAAUCEmJUrtppa/T2VZ1KL2G9T5OX9fedwcgakEIqa7hmAnX90TXz
        R8rN2OAhjOsjdI+YnAQCewfHUw==
X-Google-Smtp-Source: APXvYqwt3tNaS/uT92o7K3rM2wGyefBrcWVvOCdsSmuV5mHmF/CHpgdD2v2b3xmUuttwQkFy9ND83A==
X-Received: by 2002:adf:f744:: with SMTP id z4mr16993048wrp.205.1573558808635;
        Tue, 12 Nov 2019 03:40:08 -0800 (PST)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id v81sm3331292wmg.4.2019.11.12.03.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 03:40:07 -0800 (PST)
Date:   Tue, 12 Nov 2019 11:40:06 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] backlight: qcom-wled: fix spelling mistake
 "trigged" -> "triggered"
Message-ID: <20191112114006.wxjsrcmhrjyeai6e@holly.lan>
References: <20191112093025.98638-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112093025.98638-1-colin.king@canonical.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 12, 2019 at 09:30:25AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

> ---
>  drivers/video/backlight/qcom-wled.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 33b6007c5e55..d46052d8ff41 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -322,7 +322,7 @@ static irqreturn_t wled_short_irq_handler(int irq, void *_wled)
>  		wled->short_count = 1;
>  
>  	if (wled->short_count > WLED_SHORT_CNT_MAX) {
> -		dev_err(wled->dev, "Short trigged %d times, disabling WLED forever!\n",
> +		dev_err(wled->dev, "Short triggered %d times, disabling WLED forever!\n",
>  			wled->short_count);
>  		wled->disabled_by_short = true;
>  		goto unlock_mutex;
> -- 
> 2.20.1
> 
