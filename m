Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9CBE57A898
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 22:52:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240246AbiGSUwk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 16:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237788AbiGSUwb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 16:52:31 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47CF474CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:52:30 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id z22so13316458lfu.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 13:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Ho1u9oc1apc82F45Rk9oxun953BzeyPs1KX47hNllAI=;
        b=kMqqrL9JmL46yF6vvzkb6mZxFbj79pluny/lypH5z4MCS7+BX/TzZUUukMm4C0lb8Q
         Bdtw0CDN3xAOOVCNoSLR4RAPyF2hIjFsrUuHvg3jrPbU5/JEUEcUXrQ525Yl8gJ6TRYC
         NMEUG2DKs+K7xldhKKRt+IYtZi9TXCb839mZuWJxQ583Hlj9cphocZuSQEnvrxyRYh6y
         /3Q+pmAAyVZfYeJcLCjTsKrVA3V6kDrcSML76HPPq8yq13GRl8bG7yZqLuGggIWDDsqf
         GHfep0RiP11ydodmMsQKicsYFIN0qqhAIHcuoub8oys5Dgz54sk2O7BhkW6K1W68e2gy
         Gxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ho1u9oc1apc82F45Rk9oxun953BzeyPs1KX47hNllAI=;
        b=2qotnfUGOGfSSrLuq1K7wBg0dhAPit87Fr2m8Ydl13HnSB3Don0qdcuUaRM9oHv24b
         ITFDKdR0oJDl/IzU7d8gQzg84UaBfCQ86SHG02pv5Xd6X6mGi0AvC4ZnqP8eqKJc8NXd
         WTIXQ1ZMIUjA96ApQhJ1knjOe8MmeqH2rG6kGCg4Z8moo+wKO11bl9rzB5TYgYtPFvA3
         i7WKWVl3KxdKqc1RbKHFEvr178k7QvcToSWD8P6dzEcPwfNaZKdQSe2vEHopufi6nOaK
         jn0CtBoVs3RuKttYsrJ21rsVopE9m+7KxChgR7Sd17/E4OllIlIQjVmfJBdNfLibgLbi
         hqsA==
X-Gm-Message-State: AJIora82LjaOW1M9084Fit6Hmj8QGvpkTdud7VJBr+wvf2foYgFBje/X
        fDzV8eW+eSDd1XdSvMZ48lc9pw==
X-Google-Smtp-Source: AGRyM1uHBdLqv9xfynVEESfNHGsY84N+vmJ7Np/W4Vb8HenavrduZnQQC7IhqClIQvuuCXS9EBNC8w==
X-Received: by 2002:ac2:4e12:0:b0:489:ddbe:83c5 with SMTP id e18-20020ac24e12000000b00489ddbe83c5mr19543003lfr.371.1658263948809;
        Tue, 19 Jul 2022 13:52:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w8-20020a05651234c800b00489dedf1dcfsm3375566lfr.289.2022.07.19.13.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 13:52:28 -0700 (PDT)
Message-ID: <bdfdc102-7d42-dc36-5b54-664aa7392efa@linaro.org>
Date:   Tue, 19 Jul 2022 23:52:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: qrb5165-rb5: Fix 'dtbs_check' error
 for led nodes
Content-Language: en-GB
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org,
        linux-leds@vger.kernel.org, pavel@ucw.cz, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
References: <20220719205058.1004942-1-bhupesh.sharma@linaro.org>
 <20220719205058.1004942-3-bhupesh.sharma@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220719205058.1004942-3-bhupesh.sharma@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/07/2022 23:50, Bhupesh Sharma wrote:
> make dtbs_check currently reports the following errors
> with qrb5165-rb5 led nodes:
> 
> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb:
>   leds: 'bt', 'user4', 'wlan' do not match any of the regexes:
>    '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> 
> Fix the same.
> 
> Also while at it, fix a blank line issue in the led
> node.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
