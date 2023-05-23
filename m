Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 528D570D796
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 10:35:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235813AbjEWIf3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 04:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236163AbjEWIeC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 04:34:02 -0400
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C90EE52
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 01:32:30 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4f3a611b3ddso5580340e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 01:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684830688; x=1687422688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aqoLnPSfzNBEJLzNJAPohzVk9qbOTTKvfqApSvbpZ+c=;
        b=ELy+Lp+OvEhcap5C0YrUMC1dMKfxBvdVuOJFeYxBcIYZBR+8ScE4WnTd21oY5McKlP
         1QdyGlR4Hxw+sdMXaL4IcbKIgS4RT4yWZDHkhxKLrSwVjkx9kSsitjC/e1g3MgjqJgd0
         Kn+Lrn77TkmOlvWiIZ2wpKIazbIxqCdFc8n0SUKOvA+SdNkbzSfJqrEtKXtj1rMyB+eG
         asr48JKDGCvPPZOnXUE/hiP8EregYHs+mfhz0qNEfV63YLpFvg6QI6rvK8OGXdfsVTqy
         sum6j6GzqE8JeRiM/NBQeJDIaWRUmN771jtV+YCD/V0nX9PNtxZXvojMeVVd9xl7We8i
         beKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684830688; x=1687422688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aqoLnPSfzNBEJLzNJAPohzVk9qbOTTKvfqApSvbpZ+c=;
        b=cKp/wBIXqI7psRjlcWmFVLqMULR1UVYTREpkpeD/BcJfk5W/xaXmz/1E0rajpGOPhh
         dC/MKFDxWP6d/j0+CdfXWgnfK+BmDrkdFmE3EW8jBIIGdT/IZq4i6pzfb9UyJBy0WHP0
         56xtFqGK4XdsgKkIS2JjkbcAyBgw/0PcJJ1Z0mlse737Y93mXpzuUEpHxWYWvmtPeFTF
         CAxLgSQN68xL/pk5/QaUlt7khvhlvxYgTGP1cGYvLqQivJAUOeGNEONF0kvjeqbbLxd8
         EJ75e4PWn4SEmZZcxGjjj9Howbb3NxKSQU7U96HOEwSzTu55zwGpqLvUxtMdLoY+GeeH
         3SoQ==
X-Gm-Message-State: AC+VfDxh7m6shNBhTYblmchWAyKgkw9k/u+u3dPBC+lZJXs/xI5/3H9m
        ROSn0DjBCJakgD3PBonp1hSE+A==
X-Google-Smtp-Source: ACHHUZ7JyrwZTrtDlI3Rdt3V59245cL6RCr1E3O4A6gzrvtZmmfKgGhM1zhi1+TwYl6PjHb0U6btSA==
X-Received: by 2002:a05:6512:24e:b0:4eb:e8e:4139 with SMTP id b14-20020a056512024e00b004eb0e8e4139mr4888297lfo.2.1684830688603;
        Tue, 23 May 2023 01:31:28 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id h26-20020a19701a000000b004ece331c830sm1259533lfc.206.2023.05.23.01.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 01:31:28 -0700 (PDT)
Message-ID: <2f03fa9a-1b4b-d208-f399-a31ab8c5b4cc@linaro.org>
Date:   Tue, 23 May 2023 10:31:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] interconnect: qcom: rpm: allocate enough data in probe()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <a0f6184c-c2b5-4e8d-9b8a-867ae83f3094@kili.mountain>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <a0f6184c-c2b5-4e8d-9b8a-867ae83f3094@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.05.2023 10:11, Dan Carpenter wrote:
> This was allocating "sizeof(qp->intf_clks)" which is the size of a
> pointer instead of "sizeof(*qp->intf_clks)" which is the size of the
> struct (8 bytes vs 16 bytes on a 64bit system).
> 
> Fixes: 2e2113c8a64f ("interconnect: qcom: rpm: Handle interface clocks")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Whoops. Guess I was just really really lucky that nothing blew up for me.

Thanks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
> index f4627c4a1bdd..7a21a03a0382 100644
> --- a/drivers/interconnect/qcom/icc-rpm.c
> +++ b/drivers/interconnect/qcom/icc-rpm.c
> @@ -436,7 +436,7 @@ int qnoc_probe(struct platform_device *pdev)
>  	if (!qp)
>  		return -ENOMEM;
>  
> -	qp->intf_clks = devm_kzalloc(dev, sizeof(qp->intf_clks), GFP_KERNEL);
> +	qp->intf_clks = devm_kzalloc(dev, sizeof(*qp->intf_clks), GFP_KERNEL);
>  	if (!qp->intf_clks)
>  		return -ENOMEM;
>  
