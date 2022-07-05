Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01048566429
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 09:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiGEHbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 03:31:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbiGEHbo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 03:31:44 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C6B12D06
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 00:31:43 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id q82so3504372pgq.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jul 2022 00:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/vepQl1vtemGKmutRdXSKWgV8bQAVH9vge5clbomKgo=;
        b=L1qnrz27rkhQz4LHaw+WohXWeRTJ+FO92rTugSr1MelYv7j87eg3/A7ZCaYg2XxX+d
         zADRmzioXyqJ0QjPAbip43nNTnDmn/HTpK22EkosVd0GyggreKuIsjhtbypah0qiTXq5
         6FoSsHQELRIY++2dBUqI0vutljIhHaj0HZCz08tQobbCgkXduvpzqovba++poXfRVj7Z
         kwtR39yD0mGEoRe4zOU4xF5DIMdd9DZFiJ4JSyZdyCol12T8koKE+Ff8UIEujkiWuceb
         ozz4urXKWXQZ+1p93ka/EEPSDvkfDyVv2vH5+Sjl0ntiURZntRzkR4RhnCScx0MeaJUM
         x9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/vepQl1vtemGKmutRdXSKWgV8bQAVH9vge5clbomKgo=;
        b=nMe8rctSnhma60MhJy9FSYHOwg4IaMAMF+LDILhAYtSG7ET6cx5BNXAz87zcmKLJGR
         2mhOpS+/DEune6V6Cq36VmBk0o7D2l6wbjt4ROppowd4v5FoPa25zcCnmmGN1krKwFte
         p1yXZNrGeZnP/D7DKdAVr4v213BXxSezwEIr/5Ozx9xCjl1SwNxDi/3P8fg5aYlziDXf
         QydepRaCd2iboFPkw3PEQXctX1kOyPhRmXfXgzW6p0Ilc+v5cT093jI4aBBX+mbShVzZ
         o1I2eYTK4fbTDt4unJ5F4Cjvi6mO3I+T+Bcs4cyx/8sF0rF1kZQDhNl3n2/DLJMag9Rr
         z4+Q==
X-Gm-Message-State: AJIora/1m9tNc9aTvN7ywLOmTpAGhgI1In25NlRfeHYQPj3kNFwpUsAH
        X1+ZwGcdaxfT/Y6B+g/MsAHGjg==
X-Google-Smtp-Source: AGRyM1tC2c9uRpOwR3NAGPMCSuyJ244ylPjM7RPK2YJ+20t2d5S8Uik+vb0hyJEhpBe+cbXXTZF08w==
X-Received: by 2002:a63:d94a:0:b0:412:6986:326e with SMTP id e10-20020a63d94a000000b004126986326emr3932902pgj.56.1657006302881;
        Tue, 05 Jul 2022 00:31:42 -0700 (PDT)
Received: from leoy-ThinkPad-X240s ([154.3.32.171])
        by smtp.gmail.com with ESMTPSA id w18-20020a627b12000000b00527e026591esm12669211pfc.150.2022.07.05.00.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 00:31:42 -0700 (PDT)
Date:   Tue, 5 Jul 2022 15:31:38 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: msm8939: Use icc_sync_state
Message-ID: <20220705073138.GA180752@leoy-ThinkPad-X240s>
References: <20220416012634.479617-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220416012634.479617-1-leo.yan@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Georgi, Bjorn,

On Sat, Apr 16, 2022 at 09:26:34AM +0800, Leo Yan wrote:
> It's fashion to use the icc_sync_state callback to notify the framework
> when all consumers are probed, so that the bandwidth request doesn't
> need to stay on maximum value.
> 
> Do the same thing for msm8939 driver.

Ping for this patch.  This patch is needed for enabling ICC driver on
msm8939, I verified it based on Bryan O'Donoghue's DT binding patches.

Please see the branch which contains complete patches:
https://git.linaro.org/people/leo.yan/linux.git/log/?h=v5.19-rc4%2bicc_sleep_clock_v2

Thanks,
Leo

> Signed-off-by: Leo Yan <leo.yan@linaro.org>
> ---
>  drivers/interconnect/qcom/msm8939.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/interconnect/qcom/msm8939.c b/drivers/interconnect/qcom/msm8939.c
> index f9c2d7d3100d..ca5f611d33b0 100644
> --- a/drivers/interconnect/qcom/msm8939.c
> +++ b/drivers/interconnect/qcom/msm8939.c
> @@ -1423,6 +1423,7 @@ static struct platform_driver msm8939_noc_driver = {
>  	.driver = {
>  		.name = "qnoc-msm8939",
>  		.of_match_table = msm8939_noc_of_match,
> +		.sync_state = icc_sync_state,
>  	},
>  };
>  module_platform_driver(msm8939_noc_driver);
> -- 
> 2.25.1
> 
