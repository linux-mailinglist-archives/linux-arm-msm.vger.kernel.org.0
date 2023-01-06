Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2BA66600DC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 14:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232856AbjAFNAt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 08:00:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234813AbjAFNA3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 08:00:29 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1105B755C0
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 05:00:28 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id p1-20020a05600c1d8100b003d8c9b191e0so1006219wms.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 05:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hcacv4C/Ndszi4c1+3X/NkZcmh9g/VIcIhHnZLgTk1Q=;
        b=H8ZkhKg4v9pqQIecZAeTk4koXrftJoxsfl5esAx5D7npdLgbGNxMOG2wdykHgUZIOj
         5iC4XUt5ZRa+K8t2jpNFmRNL0WyFhCy9/3rNyuJ/RqfU9fopv0jDs4dXWJgIZT+HTVT4
         k736CEhXjNQ6jQmclCvNjv7aRHAqpSBx1mBqZPtN6vL7ya3ndb61d78XUg+3Jv8hYIPU
         QdSxa4cP1+JIn1qnSG8f2Ie5+5HeGG5fqJ2G5tW+vizRiBSybvxbAIZkx5U8qItZVV+j
         dzPf4DlyelQ7XLqsp97tztvMZs/KxahpHHC2qN0agvJ2Nnn+wd721Bd97LE5Hh5gKrG2
         B8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hcacv4C/Ndszi4c1+3X/NkZcmh9g/VIcIhHnZLgTk1Q=;
        b=EWUE89Mn/jN7ejhfdwBH2KpaE3gzvVNEx/7KHyxa8rpb0/CbCIwcFuVEQS+W+zCGfe
         uk4mN21KQS6k4x127pZqcoj24BWBBsIPXEY7TnrCvUS4uA3Fh/Rv41VcX9xs1eTkJiBr
         NmijE2hHnX/62CnV+y1x7MPSL8o7laQFYiDVuid3+N6+Xpzb0da79+riCh0QYdS59pXF
         1iOg7FApXfvVF0hW3Ea8CRWRIvrPgmUGGViPUU4nf4t2YtfEN3swliQuqQH5veGtZJkr
         i0VMwY0F+9LclzcudiMGJWLrkcmAN+VJeJ38OoEGDjWnfzIKKdfWYuHDAKmhnQiJdq3m
         uX+A==
X-Gm-Message-State: AFqh2koYC+UkglocqjfP3TMP2ES86vweLfjzRhIl6TiAK8HjT2cSi3yT
        PZBz4vZNZFmC+Lbiqxt9MyFgyQ==
X-Google-Smtp-Source: AMrXdXsUlGHYvYlldam47AoNC0W35ATwpNwr+TFul48LTnk/dNvyQBHUj9gg0w+z8wWmktTDFwOirw==
X-Received: by 2002:a05:600c:3485:b0:3d1:ee6c:f897 with SMTP id a5-20020a05600c348500b003d1ee6cf897mr39273405wmq.3.1673010026593;
        Fri, 06 Jan 2023 05:00:26 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c4f8700b003c6bd12ac27sm1957714wmq.37.2023.01.06.05.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 05:00:26 -0800 (PST)
Message-ID: <2dc8f878-f89a-4773-1cc9-3ca7c620f32c@linaro.org>
Date:   Fri, 6 Jan 2023 14:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: msm8226: Add General Purpose
 clocks
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230106114403.275865-1-matti.lehtimaki@gmail.com>
 <20230106114403.275865-2-matti.lehtimaki@gmail.com>
 <b866e6e1-da10-9152-8bda-966015998877@linaro.org>
 <2a6748b5-df3b-b3a7-f17a-664aab030b48@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2a6748b5-df3b-b3a7-f17a-664aab030b48@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/01/2023 13:41, Matti Lehtimäki wrote:
> On 6.1.2023 14.32, Krzysztof Kozlowski wrote:
>> On 06/01/2023 12:44, Matti Lehtimäki wrote:
>>> +                blsp_uart3, blsp_uart4, blsp_uart5, cam_mclk0,
>>> cam_mclk1, +                gp0_clk, gp1_clk, sdc3, wlan ]
>>
>> Driver does not support them (and there is no driver change, unless
>> you cc-ed people selectively...).
> 
> The driver changes are in patch number 2 of the series, I used
> git send-mail with a cc script, which uses get_maintainer.pl to
> get the needed addresses for each patch, to send the patches. It
> probably didn't send every patch to everyone and would need some
> improvement.

Ah, ok, such method is recommended for big patchsets. In regular cases
please Cc everyone for all patches. I am using this one:

https://pastebin.com/HAjuht68

Best regards,
Krzysztof

