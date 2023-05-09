Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40A996FC1EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 10:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234621AbjEIIqy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 04:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbjEIIqx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 04:46:53 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A14B3AA3
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 01:46:49 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4eff4ea8e39so6271590e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 01:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683622007; x=1686214007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FNIn5EP6t5R/UnpBXuKp3M/Vz53/idnROOcwbXocaQc=;
        b=T7c+m284tkR9yUJXwwYhkWSLt3KWzB8jWuocyvqyC2V0veQAwTLiafmH+LiENlHMDi
         84nETK9tXtTyaL3V3SPdwbILnXqDcX6avPX5LkELAWl83vJv7gXfZV5+Uxeib5+auAyr
         y/EzYeJgdX+4WaomUk342d+RwAS25Get7lENpZBmY+t6+fZYSf8/NchJSUC4KFlr7+Od
         T0WEmMh6uXZptkdciYSHSbGvLIEBzp3LyebrLOsKlIPE6L30EUl1cULqEdSS2hB3cROj
         2J4s63fFRQ/s4FwwxPTv946nHQeUvuB9X1L0akG/xVLV+IIwQT1AwAYVfl88sm86jaTE
         CWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683622007; x=1686214007;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNIn5EP6t5R/UnpBXuKp3M/Vz53/idnROOcwbXocaQc=;
        b=Rp4ksVBMiqDqlwoEdjTfFisuE+NrwkM+0/1K7tXUfmVYxfHBkqNZXPV4SXKK4qq3Z9
         zuEWLRtgEsFBcD+vYb7mqqWAAYNDbgxUch2YSWp+ecicRw0QwgfQjrkzimOBpTpmvQLR
         oE21XepaFWFJN2cQbQFDKq7fxIRDQ0RYZBvIgQumzOzDRc1SuvBlPyBMqEfiyovz6VQQ
         NWKAWqjE5xz/8dq0T1MudifswsWrzgfSDLtDItcSu/6SS/RXfyazw8vNdJ59BzyRKih8
         EyDR3E1p+r2mnMAoHo+wD3tnm9f2SF3KxTTUqsXNCjcg0ZegVD/Akroj0xYKW0oMAbNy
         ZHYQ==
X-Gm-Message-State: AC+VfDw1dmVPkXJeScJCfkXxSl97BFb88lOWn/CpZGd+Cf6LT2wVDo9/
        lNxX9bWN1XjhmWZgVLn4f+pxj0U6gvOiwaoWLxA=
X-Google-Smtp-Source: ACHHUZ4YRknsn2fbLmJE39/vEGApXqcfDl6B2endnYKAuuFb0Zr2zQB0wqqxkwOmDPXvvk3nSnCLYg==
X-Received: by 2002:ac2:4d02:0:b0:4ef:f64b:65b5 with SMTP id r2-20020ac24d02000000b004eff64b65b5mr588082lfi.62.1683622007776;
        Tue, 09 May 2023 01:46:47 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id o14-20020a05651238ae00b004f250513215sm265845lft.198.2023.05.09.01.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 01:46:47 -0700 (PDT)
Message-ID: <26b05108-a7d9-09e8-bae3-65489fde5d64@linaro.org>
Date:   Tue, 9 May 2023 10:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 56/89] i2c: qcom-geni: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-57-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230508205306.1474415-57-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.05.2023 22:52, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/i2c/busses/i2c-qcom-geni.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 83909b02a03e..b670a67c4fdd 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -936,14 +936,13 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int geni_i2c_remove(struct platform_device *pdev)
> +static void geni_i2c_remove(struct platform_device *pdev)
>  {
>  	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
>  
>  	i2c_del_adapter(&gi2c->adap);
>  	release_gpi_dma(gi2c);
>  	pm_runtime_disable(gi2c->se.dev);
> -	return 0;
>  }
>  
>  static void geni_i2c_shutdown(struct platform_device *pdev)
> @@ -1041,7 +1040,7 @@ MODULE_DEVICE_TABLE(of, geni_i2c_dt_match);
>  
>  static struct platform_driver geni_i2c_driver = {
>  	.probe  = geni_i2c_probe,
> -	.remove = geni_i2c_remove,
> +	.remove_new = geni_i2c_remove,
>  	.shutdown = geni_i2c_shutdown,
>  	.driver = {
>  		.name = "geni_i2c",
