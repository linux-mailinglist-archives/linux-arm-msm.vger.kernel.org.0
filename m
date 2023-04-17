Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFC556E4FB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Apr 2023 19:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbjDQRyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Apr 2023 13:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjDQRyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Apr 2023 13:54:21 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FEF8AD0B
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 10:54:18 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a10so10708481ljr.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Apr 2023 10:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681754056; x=1684346056;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4+8olREfasjZv5QZc5V/pBOVr5naRMQNwCkcS8I+dA=;
        b=xWU5V7sLim6ioC/6Y+oJGgycGYAycQ5y8UhuBIc4sh3cg9EMDk8QRYHlF/jnbdPdsd
         32bDTpiDjIw0Egbeqk4eXTxNtEv3FtPbSHAkLGmSLadSJ2Elm0V1OOdfXXiGvQZIws5k
         KLSdVDp1B8h/UzI/xc+fQmAQvn0u3P4jRkJ9g0EP9cyK2JDwz7iHt9LNC845kDcVAv0r
         6xzLFeLqCNUoK8xhkDp+KCXFvvvuWnBiJ8097BQmVKCH8lDShMJRy+Ir0A4IzlafTh2d
         YrLSdE1XCyXcGIcGF5OZwh7kbYjlI7O9JYii9SIU3q8HAnKS7UiyecSVVTdalT4aX2sn
         k50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681754056; x=1684346056;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4+8olREfasjZv5QZc5V/pBOVr5naRMQNwCkcS8I+dA=;
        b=TX1w/j4LHUAoAP96FgKyhSkY+7xDP2oDdGD/BMja+8NALRMWZ/Hwlz9glKANSDzuvb
         y+M5Rt9jOM7JSpCFmw90oDjQ+K41cNijrbjv7Py9tZC2adlDHc+//cTbneT82TCXCimc
         pymlA4gFME8HXkWEuab7WnlTRlL9LuM2d2e5h+XMP8m7DAWxQWxX7vGW75qC7IwM/38Y
         4F7FMqlbdolNuW1Z7IaR1o3sRWZOBuEPdudssN7wSQeewP1IRz79UIVOqzbwf/bYllvN
         zQQelt8NW1hvBaFC0bLJ5IKFXftfwc4bNhQ5o288Nh8oMK7g9U2sEqfCuLiXJ0SyK+Di
         JQHw==
X-Gm-Message-State: AAQBX9f5u6h4QyReYzONKkmIxQ5EUjlKhu1t1XmIoDT475o5DoBkELIl
        b3Go5LOeeLWrfUYxAntZi794+Q==
X-Google-Smtp-Source: AKy350ZdGGOn1B6q+n7vcHcpU61x1OwUpebtzROn9z+Ltft2doHXj3wDzpWVq4DXIjV60SfmaBUrRg==
X-Received: by 2002:a2e:7c06:0:b0:2a7:a5f7:e9bc with SMTP id x6-20020a2e7c06000000b002a7a5f7e9bcmr3887227ljc.15.1681754056399;
        Mon, 17 Apr 2023 10:54:16 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id w19-20020a2e9bd3000000b002a8d915f30asm8799ljj.77.2023.04.17.10.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 10:54:16 -0700 (PDT)
Message-ID: <8b73a320-8c52-16bb-12c5-85e78dd48c04@linaro.org>
Date:   Mon, 17 Apr 2023 19:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sdm660: drop redundant F define
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230417174408.23722-1-ansuelsmth@gmail.com>
 <20230417174408.23722-2-ansuelsmth@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230417174408.23722-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.04.2023 19:44, Christian Marangi wrote:
> The same exact F frequency table entry is defined in clk-rcg.h
> Drop the redundant define to cleanup code.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-sdm660.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
> index db918c92a522..6afce8e42ede 100644
> --- a/drivers/clk/qcom/gcc-sdm660.c
> +++ b/drivers/clk/qcom/gcc-sdm660.c
> @@ -25,8 +25,6 @@
>  #include "reset.h"
>  #include "gdsc.h"
>  
> -#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
> -
>  enum {
>  	P_XO,
>  	P_SLEEP_CLK,
