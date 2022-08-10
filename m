Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE68E58F355
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Aug 2022 21:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233168AbiHJTvN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Aug 2022 15:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233155AbiHJTvM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Aug 2022 15:51:12 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11E458C004
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 12:51:11 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id q6-20020a05683033c600b0061d2f64df5dso11280594ott.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Aug 2022 12:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=wufSRqh/QVijGNaq/aAL4S6kr3FJOGsDXoMinL9NFkQ=;
        b=LXS7pfWVJyH5+9g4Izlsrw3QCK89LKUhaAHp5PyyAybFmK+2tcHA6rw4Qhm3UpQHLg
         dNr+xBXZVwW5tdJ5LNEpA5dFjcQ6aiuAnYIFqZBfm4KTzmx0X6M67UWHgAO5DKnCt5ct
         zX9KsxzwDqU/wIREG0lFidsRNh1UAjHYzHpF5rwWmfHA6Awz7PYTk4QslNbpBuvC3SQ9
         PU4vqDIE30AI9OomcvRsYk/JJITDIv3oSAQnGzoUMQNzJaGh1Oexs8iWx7v6uzbOxOf8
         Q4i+9pyUxUq4kNWQcloP+g98YZTZsjqLc4FhPQOGcIk/zlClbgYXupz5AGUvpY45sQGp
         5qLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=wufSRqh/QVijGNaq/aAL4S6kr3FJOGsDXoMinL9NFkQ=;
        b=y2v5o84AZhNZt3xBkM/KvHmEu9byFyHx29fEF8wP6609aZFj5iyLu2Iqtj6ktrBc7p
         e26QeQ73GhYvsShrKVq73VntzGxRa0E+ju6Gn/si8b4iLpnegN7BHG7Q5iv/Hfpp7hSd
         /vP3U4BXskYG/o1YmZpBsJVItN8a1plHbsEuk0TVSq91EziH1b2k6JE1l7WhuDW+lopD
         dsir0e10x6As6gFyhQt6MP5p5nMPkXLlOU/dvpcQ1BO7T9Gaezo0dNHAlgFv1sBUq/gd
         JZZRj4038GaJCdHQ9v5OZoKLxqe8sPLKsOZCWBAU3Yuw5dCckPjsgWJilMtW5j6OMmbA
         VcTA==
X-Gm-Message-State: ACgBeo0jtrMCH+5dhEPDL23HFW4tVEaWub87uBJsiYEKQGUgcbrU0DOw
        vnbmUKo4okDOPfI9JDsgg55Pgw==
X-Google-Smtp-Source: AA6agR6PRtN3JeugTc37Fb3rdblC9rYxMYOE9wdMFW9tBCBxJ51atqOVkmRgev2zizv/QACpsCOqjw==
X-Received: by 2002:a9d:53c8:0:b0:61e:ddc0:bfae with SMTP id i8-20020a9d53c8000000b0061eddc0bfaemr10427715oth.266.1660161070280;
        Wed, 10 Aug 2022 12:51:10 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bk12-20020a056830368c00b00636e6dea5e5sm819363otb.23.2022.08.10.12.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 12:51:09 -0700 (PDT)
Date:   Wed, 10 Aug 2022 12:53:45 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rudraksha Gupta <guptarud@gmail.com>
Cc:     agross@kernel.org, david@ixit.cz, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [PATCH v2 1/2] ARM: msm8960: Rename cxo_board to cxo-board and
 add alias
Message-ID: <YvQMyQLohqcc8Fug@ripper>
References: <20220808234723.5184-2-guptarud@gmail.com>
 <20220809000300.6384-1-guptarud@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809000300.6384-1-guptarud@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 08 Aug 17:02 PDT 2022, Rudraksha Gupta wrote:

> This patch renames cxo_board to be up to date with the current naming
> style. It also adds an alias.
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
> v2:
>  - Group the correct changes together
> 
>  arch/arm/boot/dts/qcom-msm8960.dtsi | 2 +-
>  drivers/clk/qcom/gcc-msm8960.c      | 2 +-

Clock and dts patches goes through two different paths towards mainline,
so they should be separated.

>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
> index 0e099aa7c889..2ed969785b78 100644
> --- a/arch/arm/boot/dts/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
> @@ -58,7 +58,7 @@ cpu-pmu {
>  	};
>  
>  	clocks {
> -		cxo_board {
> +		cxo_board: cxo-board {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <19200000>;
> diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
> index 051745ef99c8..56ce05a846dd 100644
> --- a/drivers/clk/qcom/gcc-msm8960.c
> +++ b/drivers/clk/qcom/gcc-msm8960.c
> @@ -3624,7 +3624,7 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
>  	if (!match)
>  		return -EINVAL;
>  
> -	ret = qcom_cc_register_board_clk(dev, "cxo_board", "cxo", 19200000);
> +	ret = qcom_cc_register_board_clk(dev, "cxo-board", "cxo", 19200000);

This breaks compatibility with existing DTB files.

What you probably want is to make sure that any clocks with parent name
of "cxo", should have a .fw_name = "cxo", then you can make a
phandle-based reference in DT and these global names doesn't matter (and
in the end we can remove this board_clk from the driver).

Regards,
Bjorn

>  	if (ret)
>  		return ret;
>  
> -- 
> 2.25.1
> 
