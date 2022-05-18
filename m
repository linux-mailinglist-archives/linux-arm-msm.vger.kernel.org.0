Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 559C452C17B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 19:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240873AbiERRbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 13:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240874AbiERRbn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 13:31:43 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9AA56C09
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 10:31:41 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id i24so2775867pfa.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 10:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A7nZkxdMlNAebent6MVeqIF9QCrOvlXfT/nFFXjnb4U=;
        b=lAsGnOIMetgYtkKxz1F5DaAhhcMJ5NEsW3w/qmUaRW/URJyhrkwQ0iVXxlSaNLYnWF
         PAa0VOAi8NLKCZw6n/t+I004Gkb+0vryaNWGECdfOA7dJOK1abtWUwHNmF17RY1ZVDtX
         VnM5KklzCK751kmBv9BUlZUwVpGF+bkHYsmJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A7nZkxdMlNAebent6MVeqIF9QCrOvlXfT/nFFXjnb4U=;
        b=3MiHI0GWrKmrL0mZZiNxnEBBKXzPkBXmFE4ua1LJhyoqZOFTxauTDS0RbUVp+rTXiN
         At3dA7EeVCspeburlXbj0e17hQXwIt1q0ZldM4SgxpTJYBiCvlz4OhQd7Bvx0aZ6mkLt
         ud2syNIjaeDEsqPGdeKQh9y14TW9IiNZ1IXQ2q9/jxzVT55fKgpBReCHEMLsLJulhDcJ
         hiPETbit49PXiHB7fJUxdbwAoUsCUiQcZ7YD6cX4LnmECTDu7s471+hvdPzNQ6PICd84
         m91ydyq+s1V2fIsfPGAP8DGhPHlINuMEvLGGA7sI3Tfk7T5QEP8JaLvWygqR4MKZqebZ
         veOA==
X-Gm-Message-State: AOAM5320oKpTLsNBKiIx1rXVXsyQqRnDDldy3Wn95IkdMS2o7sXO9nAN
        kwz0p5Dz16ehomosNei0jyYrVA==
X-Google-Smtp-Source: ABdhPJw+gQrZdHM3wQLRgk3umwGTFFG++BT40NdPwBqQ77VJgi2mOe9c/8F3p2y3HMqxmgsPLUSGNQ==
X-Received: by 2002:a05:6a00:4515:b0:510:9ec3:e815 with SMTP id cw21-20020a056a00451500b005109ec3e815mr425834pfb.65.1652895101121;
        Wed, 18 May 2022 10:31:41 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:a14:3166:4b67:b688])
        by smtp.gmail.com with UTF8SMTPSA id 64-20020a621643000000b0050dc762819asm2231419pfw.116.2022.05.18.10.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 10:31:40 -0700 (PDT)
Date:   Wed, 18 May 2022 10:31:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Yongzhi Liu <lyz_cs@pku.edu.cn>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, jic23@kernel.org,
        lars@metafoo.de, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        fuyq@stu.pku.edu.cn
Subject: Re: [PATCH] iio: vadc: Fix potential dereference of NULL pointer
Message-ID: <YoUtezVzsPB8MAEO@google.com>
References: <1652856180-100582-1-git-send-email-lyz_cs@pku.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1652856180-100582-1-git-send-email-lyz_cs@pku.edu.cn>
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 17, 2022 at 11:43:00PM -0700, Yongzhi Liu wrote:
> The return value of vadc_get_channel() needs to be checked
> to avoid use of NULL pointer, which is followed by
> the caller 'vadc_do_conversion' of function 'vadc_configure'.
> Fix this by adding the null pointer check on prop
> in function 'vadc_configure'.
> 
> Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
> ---
>  drivers/iio/adc/qcom-spmi-vadc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iio/adc/qcom-spmi-vadc.c b/drivers/iio/adc/qcom-spmi-vadc.c
> index 34202ba..d99bd72 100644
> --- a/drivers/iio/adc/qcom-spmi-vadc.c
> +++ b/drivers/iio/adc/qcom-spmi-vadc.c
> @@ -210,6 +210,9 @@ static int vadc_configure(struct vadc_priv *vadc,
>  	u8 decimation, mode_ctrl;
>  	int ret;
>  
> +	if (!prop)
> +		return -ENODEV;
> +
>  	/* Mode selection */
>  	mode_ctrl = (VADC_OP_MODE_NORMAL << VADC_OP_MODE_SHIFT) |
>  		     VADC_ADC_TRIM_EN | VADC_AMUX_TRIM_EN;


Shouldn't the check be done in vadc_measure_ref_points() where 'prop' is
obtained, rather than deep down in the call chain? For example
vadc_do_conversion() would also dereference the NULL pointer unless one
of the prior function calls fails.
