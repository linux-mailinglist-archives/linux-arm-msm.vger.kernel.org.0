Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C081D707D69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 May 2023 11:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230328AbjERJ5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 05:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbjERJ5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 05:57:33 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2EB9E4E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 02:57:31 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2af1822b710so4423221fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684403850; x=1686995850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ii3IQNZBUSQL/0xcT98KiKH1C3SWxauYsCsVnRYuILo=;
        b=qyu0OzkxQib109sezttk43W2IzgKzmuHFxr4Pc8tRGrVcwLEuESTrcVHO6BfVHsKrI
         mCTxYYwbur77+IhaHsgof6Sm1ZNrslHg0g3pW8uu/7MAgdWdJJaQexiFqRXEHexNEOSr
         3t3Oab0zZPVFe39m828uI7X8ad7XQIKc3sXjhf81SeNUrQo7iizN+pOLnpPK+cCPp6wJ
         7uEp2RUfW4YGwy4sHRgHLd66aWyoM7Tw3vp9BoT43aK0RSo8mFRvxbIwCqZOBjDiUg6S
         QqJn28FTAyE34GTdluc4dOv+1DbK9mwv7TFHP0pjZdSx1aYBHfP5wNH27Byc441isHVs
         MszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684403850; x=1686995850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ii3IQNZBUSQL/0xcT98KiKH1C3SWxauYsCsVnRYuILo=;
        b=If+uvh/aTCSkrbSifrYNGHvtEItDr+CqTUVaZetp6vB3Pbmluul4EoU1/nz3tcdyMZ
         RAKvQZcG8r+S3x22Sp52vKvpUto/kLXe4Z/OelzLgIlNfz/91jzn+Qzzt7eg2XajcDH1
         rs2uisZ98uM4LBwVIg1JSBd1mNtGZERlL1GMhnsGRQ8T9HA6wCKppVGel0xrpHhYFg5G
         /L6e4a9Zrn34zeU4G07bi27n62CZwoi/ihyzS0Us0K8LunA5QDdlzuS7g4YuKGQaBoJw
         hBootK6ugv6QySVjfY7TyLKBNx8QmzG5HgTtzykbNyigiuTm3PTa8i3a9bcMl6urN1Ao
         eNjg==
X-Gm-Message-State: AC+VfDwbH+B3F5gPWacPQD9KI3NO6dLYIYumvyDlh1/C+uJSxy9I4u0Z
        OxBnrXQDEYUls/Kc9QMP7a1/SQ==
X-Google-Smtp-Source: ACHHUZ6lAXc5axy45y4oOclger4bxsHe0MjFQOcI6f3Jvbs7gyaI1VKtcUSA1Y5ypSsDTj2vXsEmnQ==
X-Received: by 2002:a2e:2c17:0:b0:2ad:b674:a7a3 with SMTP id s23-20020a2e2c17000000b002adb674a7a3mr8717864ljs.31.1684403850053;
        Thu, 18 May 2023 02:57:30 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id c16-20020a2e9490000000b002a93e0605ebsm216785ljh.8.2023.05.18.02.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 02:57:29 -0700 (PDT)
Message-ID: <22143b03-fa5e-627e-05b1-44034779ba01@linaro.org>
Date:   Thu, 18 May 2023 11:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 20/97] usb: dwc3-qcom: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@pengutronix.de
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
 <20230517230239.187727-21-u.kleine-koenig@pengutronix.de>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230517230239.187727-21-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18.05.2023 01:01, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart from
> emitting a warning) and this typically results in resource leaks. To improve
> here there is a quest to make the remove callback return void. In the first
> step of this quest all drivers are converted to .remove_new() which already
> returns void. Eventually after all drivers are converted, .remove_new() is
> renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/usb/dwc3/dwc3-qcom.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 959fc925ca7c..167f851c8e59 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -938,7 +938,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int dwc3_qcom_remove(struct platform_device *pdev)
> +static void dwc3_qcom_remove(struct platform_device *pdev)
>  {
>  	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
>  	struct device *dev = &pdev->dev;
> @@ -958,8 +958,6 @@ static int dwc3_qcom_remove(struct platform_device *pdev)
>  
>  	pm_runtime_allow(dev);
>  	pm_runtime_disable(dev);
> -
> -	return 0;
>  }
>  
>  static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
> @@ -1052,7 +1050,7 @@ MODULE_DEVICE_TABLE(acpi, dwc3_qcom_acpi_match);
>  
>  static struct platform_driver dwc3_qcom_driver = {
>  	.probe		= dwc3_qcom_probe,
> -	.remove		= dwc3_qcom_remove,
> +	.remove_new	= dwc3_qcom_remove,
>  	.driver		= {
>  		.name	= "dwc3-qcom",
>  		.pm	= &dwc3_qcom_dev_pm_ops,
