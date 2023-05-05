Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE8B6F7B4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 05:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjEEDB7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 23:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjEEDBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 23:01:37 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA0011DBE
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 20:01:36 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f1763ee8f8so8560155e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 20:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683255695; x=1685847695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Vh5nu20+MD5X9yYNEYbXyZz1T7VjOMfRm23RF3b1OQ=;
        b=SQ0e5lugbTeZesf7elBKK+YsYSAIJO4FV30ezru85s49JLiZELwxC1iTJmfb0xnhU1
         vVjNJ/AziFn7dRta+JENJ6aGcfdxsnF187+2DgCD/m6QiXK0a0x5UOTQNcK+6PXvGJdR
         RctVIyH1fjegs10r2VoH5679Bj2cSmtzTdACSElFZ15x1v1sLa+apGXhiGL/wSNwBAPm
         wfCiuMKh6knFsfprn6LmdUl3/Flw9dh3ukKG5DoArYjEEaQHXkFhDo3KaJIgsmOUhjF1
         uowmAbPLXcRIJhZxmNhE0brSgXwqa+Xl0rsP6vzP46H1Q1L8Mm++HdOMXOsDW8JcqYkw
         9mAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683255695; x=1685847695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Vh5nu20+MD5X9yYNEYbXyZz1T7VjOMfRm23RF3b1OQ=;
        b=DUIXh9AsJNlA9EY8RPc0Sr3LNmTGkHvY5s/Ggxe6Q3iOVdCYabGuo/zoS3R5MA+BkE
         cWa97iefHBfQOZpr/hZRy2E7ksPrCck/QFQeGgL5NYs2Yin5BrTnRL7Gk1QCuT4m6fzY
         bNuKDlrf+W+wQ4gyg8K1qU8icmWZRCOTFwbwfGGktFEcIvBsUdIUYEDTtIaqMUXrcBAr
         Foji71cO95Gme4f68C5VScH1kcXLQQkooCFvWAujYTYioLOh28F3N1JFvGaTfWPcFRPR
         eunQvla18xoc5Qi0L9WEhyvLOjau/AUO0HCg31mjyRb0OFODAd072Fi8PAJyvo2YyUgG
         ipXw==
X-Gm-Message-State: AC+VfDy0GdYVg/95FtnSObMKMvwa8JDEIPTBzxSc6hQN29ry8SQ7qquO
        BZ4SuPEB7zat1yY8H313H3zo6g==
X-Google-Smtp-Source: ACHHUZ4sevlq4fwHwQ3kLtEuoc8UWIaRN6Atw5yvIWi/ru79E8Q8YHU1R9l8OvSy+a1+WyZpdud6NA==
X-Received: by 2002:a05:600c:ca:b0:3f2:5840:5f7d with SMTP id u10-20020a05600c00ca00b003f258405f7dmr917520wmm.17.1683255695555;
        Thu, 04 May 2023 20:01:35 -0700 (PDT)
Received: from [192.168.0.15] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id 18-20020a05600c229200b003f17a00c214sm6429983wmf.16.2023.05.04.20.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 20:01:35 -0700 (PDT)
Message-ID: <bf8efab3-73db-4fb2-850f-6d0df7512768@linaro.org>
Date:   Fri, 5 May 2023 04:01:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 12/18] remoteproc: qcom_q6v5_wcss: Convert to platform
 remove callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
 <20230504194453.1150368-13-u.kleine-koenig@pengutronix.de>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230504194453.1150368-13-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 04/05/2023 20:44, Uwe Kleine-König wrote:
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

Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index ba24d745b2d6..b437044aa126 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -1074,7 +1074,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int q6v5_wcss_remove(struct platform_device *pdev)
> +static void q6v5_wcss_remove(struct platform_device *pdev)
>  {
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct q6v5_wcss *wcss = rproc->priv;
> @@ -1082,8 +1082,6 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
>  	qcom_q6v5_deinit(&wcss->q6v5);
>  	rproc_del(rproc);
>  	rproc_free(rproc);
> -
> -	return 0;
>  }
>  
>  static const struct wcss_data wcss_ipq8074_res_init = {
> @@ -1117,7 +1115,7 @@ MODULE_DEVICE_TABLE(of, q6v5_wcss_of_match);
>  
>  static struct platform_driver q6v5_wcss_driver = {
>  	.probe = q6v5_wcss_probe,
> -	.remove = q6v5_wcss_remove,
> +	.remove_new = q6v5_wcss_remove,
>  	.driver = {
>  		.name = "qcom-q6v5-wcss-pil",
>  		.of_match_table = q6v5_wcss_of_match,

-- 
Kind Regards,
Caleb (they/them)
