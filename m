Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B08E34FA53F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 07:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232519AbiDIFzh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Apr 2022 01:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbiDIFzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Apr 2022 01:55:36 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED16B3AA41;
        Fri,  8 Apr 2022 22:53:29 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id k23so21040826ejd.3;
        Fri, 08 Apr 2022 22:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=+4NMuImCyoCuFp6T7FFagPPjd4YgfqhKWKAbscvD19s=;
        b=SUuYPdleZLQc2Mg9Um9LGB+HubXYlguWetrsNDJxT2TRStgN4S5YTkuWv2uVzvifXl
         9CW0n+HUjngSWvQiO4FuttMh/eyGMwSdpV7wXMfwdrPCUJWD7iM4CHkmSOMZM9AWn2n+
         2Tr+I/8LAyPIYBvn3eEwAPjDVdKCf3Htj70/2ahQc8BEuhaN8hiil9Dq/YRFb/+nVQXM
         bClnJmA2+AqhuB7AWPLjoVXpYEI5fvo75gZ5+WvKfeLPiM6BFq6iw/7DL4lXZs93ZN7r
         29HG3qqHWayXG4N3IOLqDk61TBzcHxBG3ZRZLIMk0XCIRqlr9qzUD1zafAWK4R+EcAY6
         zMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=+4NMuImCyoCuFp6T7FFagPPjd4YgfqhKWKAbscvD19s=;
        b=305ilc7paZMuLJgN0jsZRxhv5KEzG8R+rgHghuaWTv8ylIMqgFCjmhvoO6ro+5pGNR
         Z+1tTnAHUNz6cwXpY0+jGRlQzZoEzJBtGns27b1N3knylSLa1J0nblE4MV6fNMRHQV67
         kJEkzV4G5tGeY9z5Rb6jTJ3ZMgW3bkCZ4ON/xAG204oOakEDWNERspUUv0Hv6HwzP8VO
         BIdbeni6kNewhC1FmnymPWRAks2BHATG8vaDgSzj2sj4LC63j4STY+jjBf63xNtGU3yA
         Ncd4x5GnoG+/OZNMMP4Qeot3obWgYJSLXLql0Vcn9jMItmQosrWO7OrmwvLqAgkVP/ry
         Mc4g==
X-Gm-Message-State: AOAM532vwyZzRWNUzT1TZxkgq+7/LoW5DsgFWEKOy0hTYVYdEEwQK62H
        T3T1wiMvbMQlZPcXx4cQQNCA4TYpYO8=
X-Google-Smtp-Source: ABdhPJxFt0R2wwZORfE212wpnbKsKcUf66uBPFMjto+NZAnpC7VhwvFpDCzRd3fpBHMb8RqPMzbiVw==
X-Received: by 2002:a17:907:8688:b0:6d2:c19:e1a0 with SMTP id qa8-20020a170907868800b006d20c19e1a0mr20707198ejc.249.1649483608397;
        Fri, 08 Apr 2022 22:53:28 -0700 (PDT)
Received: from pevik ([77.48.21.118])
        by smtp.gmail.com with ESMTPSA id r8-20020a170906350800b006e83027f295sm2572892eja.146.2022.04.08.22.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 22:53:27 -0700 (PDT)
Date:   Sat, 9 Apr 2022 07:53:06 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 1/1] arm64: dts: qcom: msm8994-huawei-angler: Add
 sdhc1 definition
Message-ID: <YlEfQoBaqPXrn0P9@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20220323204840.22832-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323204840.22832-1-petr.vorel@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn, Andy,

gently ping. Any change you queue this for v5.19?

Kind regards,
Petr

> Angler does not have SD card, thus sdhc2 kept disabled.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> NOTE: requires Konrad's fix
> https://lore.kernel.org/linux-arm-msm/YjuE+cgGXCLihPIa@pevik/T/#t

> changes v4->v5:
> * remove workaround (fixed by Konrad's fix)

>  arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

> diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> index 0e3dd48f0dbf..6e43e4339f55 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2015, Huawei Inc. All rights reserved.
>   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
> + * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
>   */

>  /dts-v1/;
> @@ -41,3 +41,8 @@ serial@f991e000 {
>  &tlmm {
>  	gpio-reserved-ranges = <85 4>;
>  };
> +
> +&sdhc1 {
> +	status = "okay";
> +	mmc-hs400-1_8v;
> +};
