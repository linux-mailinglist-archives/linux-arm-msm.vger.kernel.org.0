Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBB636F7B4E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 May 2023 05:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjEEDCA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 May 2023 23:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229819AbjEEDBx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 May 2023 23:01:53 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD8AAD0F
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 May 2023 20:01:51 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-2f55ffdbaedso808113f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 May 2023 20:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683255710; x=1685847710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AHPTHg5fIDEBQm7ArxjTHXo5HSRnnkoFDHt/kzSgHeQ=;
        b=wHHeSzCAw6qjg85Yp6RhBlh6KbNlWI3YjIkGQt26V4lYANmtc09MNA/nRSoZ6U829B
         q6AFljmCY1yfxkvYeHBZeUWjjoKzPhyTfGSqK9v0Y8Wk+uM22V7Umnp79fVq/IHgyjdt
         MvGzkNGECwFK2nfkn9t8vGKV1kzQ7OTOAWOL3COwfZVqGabYq2bjcJklTlqssFvZmNlx
         A6HhaHZmrEkWI6fY2EMl2jydapVoaLxXi2NmOgDcOGumwV3oOiLzIQY5jrVZBhTO+TLP
         VKZn2eKg/hq6CkPq/kThWZ2jZfjMHHbhzR9KUao6ER8H9XstcHy2zZFanigR7ly13IRo
         /qoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683255710; x=1685847710;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AHPTHg5fIDEBQm7ArxjTHXo5HSRnnkoFDHt/kzSgHeQ=;
        b=Azqtofk52k2Qc78AgWdpAznFV6HwIWfJQJJ1/t0NhG+vVkzCJ3BE3mNLiPwnQz5DnM
         EE0lLtPPKpC3InbMzfnxnlTJ2zd3lr6rCUgHfied6c+JhjBKUR97qrtgkZ5gbm/F0sqt
         lMgclfrKXTpKy383QAyrUhNSWX6/sJG2tg6bBU94EJA/nZBdRRahodSnfKKKxYeAC16Z
         7hQjCsfcStwI07q5yidUPlP0wX2sEw1irBY3W8ESLfaFo8cRjztJMpVWE/oWeLgRmjO2
         wFLxXPoFtV7xDyPccMliQledz77W3NV9A22DjH9jhfAApcHP1e6jOHFNsIEgx2pN/oB9
         roqw==
X-Gm-Message-State: AC+VfDwKLlOEluyw17DBjVWLFJC+Kc/oEADm4aU0Rnd7HQGS8vA9c+jb
        glfp6Km2vWKEi1CTfZCp/T0cnQ==
X-Google-Smtp-Source: ACHHUZ6TnhZcjIMGg1ltiDjfxQZ1z+f+dniHdQYmaIFRtLMLaxaXt0w5F8bEpMd5vZqLiwmSM2WuQA==
X-Received: by 2002:adf:fe10:0:b0:2d5:39d:514f with SMTP id n16-20020adffe10000000b002d5039d514fmr105334wrr.65.1683255709960;
        Thu, 04 May 2023 20:01:49 -0700 (PDT)
Received: from [192.168.0.15] (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id d7-20020a5d5387000000b0030779596469sm833839wrv.68.2023.05.04.20.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 20:01:49 -0700 (PDT)
Message-ID: <cc8aefbf-1cdd-8d8b-d162-f91cba80f431@linaro.org>
Date:   Fri, 5 May 2023 04:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 13/18] remoteproc: qcom_wcnss: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        kernel@pengutronix.de
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
 <20230504194453.1150368-14-u.kleine-koenig@pengutronix.de>
From:   Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20230504194453.1150368-14-u.kleine-koenig@pengutronix.de>
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
>  drivers/remoteproc/qcom_wcnss.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index 0fc317265064..1ed0647bc962 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -666,7 +666,7 @@ static int wcnss_probe(struct platform_device *pdev)
>  	return ret;
>  }
>  
> -static int wcnss_remove(struct platform_device *pdev)
> +static void wcnss_remove(struct platform_device *pdev)
>  {
>  	struct qcom_wcnss *wcnss = platform_get_drvdata(pdev);
>  
> @@ -678,8 +678,6 @@ static int wcnss_remove(struct platform_device *pdev)
>  	qcom_remove_smd_subdev(wcnss->rproc, &wcnss->smd_subdev);
>  	wcnss_release_pds(wcnss);
>  	rproc_free(wcnss->rproc);
> -
> -	return 0;
>  }
>  
>  static const struct of_device_id wcnss_of_match[] = {
> @@ -693,7 +691,7 @@ MODULE_DEVICE_TABLE(of, wcnss_of_match);
>  
>  static struct platform_driver wcnss_driver = {
>  	.probe = wcnss_probe,
> -	.remove = wcnss_remove,
> +	.remove_new = wcnss_remove,
>  	.driver = {
>  		.name = "qcom-wcnss-pil",
>  		.of_match_table = wcnss_of_match,

-- 
Kind Regards,
Caleb (they/them)
