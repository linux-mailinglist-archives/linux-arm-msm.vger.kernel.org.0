Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457E055AE74
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 05:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbiFZDP3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 23:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233803AbiFZDP2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 23:15:28 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CF314D07
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 20:15:28 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id q18-20020a9d7c92000000b00616b27cda7cso3308211otn.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 20:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UWRD4ENWtn5ui6pfwtEeuNnOz2iL1WpSTSdsixo8RUQ=;
        b=LCRMf3EKPxIGyTga2x3aPXrHklKkTT1I7BlW5EH57kbPNONDB7KE59M2MbJDW29jMi
         TVF5cNpztxZkUWDiZBtGFIofOVKW9GYK2FnzFZwqXzEe7l6EJkrmZcJB6oJ6YS2wQMqv
         KztZEhlFOXedyYAhU3Yxi1NR1WWE9VMZ+AE1TPnZ832S8QY1azenxu71/LTKRhzdW89A
         NpHByOydKURJaZMIJ20HQJ5W5ixLWbiL+mg+3oqZGt1wn+24XNy4YrZSZZRgahRa437N
         fpe5HKv3axZEVz5YEjGOor043xtmvIm32AjyeJqYiF2JNRPkNIyrFVt3JR0vwgQ+ctSt
         2Vxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UWRD4ENWtn5ui6pfwtEeuNnOz2iL1WpSTSdsixo8RUQ=;
        b=Q2YK2c6f1E/M+3vvj8vXHkmX2pxbtcIPUrJbW06YBfMvfkGdE+fJ4Ptw3RjmlUwON1
         zQ9RsUpdsCm+4826OtqtE156Z7+tkFPKNlcPKKqERlcDhFNivdws7QzKNVt9zgiEsJUq
         rWphRlvZMQWn9DfuSgkn7Kts3S10XhsCg0sKS1TaArvtX4uF0bNQ9OB4xmyxQDNktAEm
         H9wkM2TENSgBRUyurY3j1p5CglvTs9Vh6ORTUyt24tZUrXqjLjz5pw/MGuo5X1k2xOs9
         RPdZjsE07f8fc9EYpjP4ekMnxq+ATKMX7VynNFB+3f1A3ZSwATinUJXaLfy8f2s9G8g3
         HkQw==
X-Gm-Message-State: AJIora+WbTnQHwVm4MTMOivON4UHlfALxYt9AoTYWLaImer8l5dGjN/U
        J12+TE2scfILQBYicU3J0P8M1WuFaqyLyA==
X-Google-Smtp-Source: AGRyM1tVMj9xCYuRsElDUSFAdPLWSQ1vtd/KZ8lqmTxXRlUGbURyFl/fbvePcjdpZG/QeCS3+isg5A==
X-Received: by 2002:a05:6830:40a8:b0:616:ac1a:8d3f with SMTP id x40-20020a05683040a800b00616ac1a8d3fmr3118224ott.384.1656213327375;
        Sat, 25 Jun 2022 20:15:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id m14-20020a05683023ae00b00616958279dcsm3980799ots.79.2022.06.25.20.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 20:15:26 -0700 (PDT)
Date:   Sat, 25 Jun 2022 22:15:25 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Parikshit Pareek <quic_ppareek@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Prasanna Kumar <quic_kprasan@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] soc: qcom: Fix the id of SA8540P SoC
Message-ID: <YrfPTRDFvwQSIMaO@builder.lan>
References: <20220513175849.4335-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513175849.4335-1-quic_ppareek@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 13 May 12:58 CDT 2022, Parikshit Pareek wrote:

> Change the id of SA8540P to its correct value, i.e., 461.
> 
> Fixes: 76ee15ae1b13 ("soc: qcom: socinfo: Add some more PMICs and SoCs")
> Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
> Reviewed-by: Eric Chanudet <echanude@redhat.com>
> Tested-by: Eric Chanudet <echanude@redhat.com>
> ---
>  drivers/soc/qcom/socinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index cee579a267a6..c37d7724c7d0 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -328,7 +328,7 @@ static const struct soc_id soc_id[] = {
>  	{ 455, "QRB5165" },
>  	{ 457, "SM8450" },
>  	{ 459, "SM7225" },
> -	{ 460, "SA8540P" },
> +	{ 461, "SA8540P" },

I don't have any objections to this addition.

But I have a board with soc_id of 460, so can you please correct the
entry for that instead of removing it?

Thanks,
Bjorn

>  	{ 480, "SM8450" },
>  	{ 482, "SM8450" },
>  	{ 487, "SC7280" },
> -- 
> 2.17.1
> 
