Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F01F454D05E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 19:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356371AbiFORuU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 13:50:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346681AbiFORuT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 13:50:19 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF01653C6A
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 10:50:18 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id y6so6445367pfr.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1jMu+lGlLUwxIWSFxtxOqoxXa/O8y+ZJH6Jya8QmVS4=;
        b=i9YjTi5IhhH6B1eVTcD7vZp7dzPi7c05gv6//PZkCoCOEIvpGuYvj3dEghm9izJvC2
         8OUWFh2YvuBTdcjTU372xEWxRV1lUYPQRcXz7SxgYhN+Ab1txjF7N3MRHK3Lh45OjTSL
         Ase4zsKsalkoKI4I9LHqh9NuddjJSdL/HSR1GdOBTcmILZPrSYoqf45z2INpMZ5ZIdwh
         zr8ZK/Nz1w06bwVKiH7sR9I2YBfmO/BCf6mJ7fpFJC12BwKVkRGmpUBYwWac/qSjd+lo
         WNCfJFIN339BbeVXAngEtr2RGmA5EM0UIYG+lR0iO8WMBILzOElXhZBOd23GfmSBvHDG
         M4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1jMu+lGlLUwxIWSFxtxOqoxXa/O8y+ZJH6Jya8QmVS4=;
        b=kTuYj8kd2qjp4SWVlkXVh+Mm90kI3iNBbkieC7JGn9mzz4fZrPSGMOdKDfRRz1L95j
         xc2kan8bxTpnyG0ndzoFKDjvOTeQ50OBzSKfsKaJtbcnmG/niiIanp7Ba6pOe0Vam3YX
         cCkL3zheM7qAR8pBaW0V8Cs4TQPlrzeqDEhnpTmAh/z2Np6GhptgLeJ4w3RiartQhGTX
         umwzgb6BPZGOY0WOCuITHja24YqkmbRT0SPIQoNIbE1w/EdABHdWSnavMMK08+xpEjMm
         15wupuvXkupteTTTQW3JmY4y1yV/QxjBaJZ0FgkqmGz4F7YKFqTpM5f7UFkDrqULNnS5
         VZ6A==
X-Gm-Message-State: AJIora9AQRIgrRiohOZuPMtaKTxU60UEbtgvEpULf4sKhuZy5dLHScyx
        HJlxQuLAS9Zxafg/tJGbs2s2Hg==
X-Google-Smtp-Source: AGRyM1tgx5wd//aRy3L6R0T8NZ35VS+4Jjjtdj74hI5yzt3PaMKVofPzTq+GGVbzPuXw0Vby1azuDw==
X-Received: by 2002:a65:6b8a:0:b0:3db:7dc5:fec2 with SMTP id d10-20020a656b8a000000b003db7dc5fec2mr788601pgw.223.1655315418377;
        Wed, 15 Jun 2022 10:50:18 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id br8-20020a056a00440800b00518a473265csm10034338pfb.217.2022.06.15.10.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 10:50:17 -0700 (PDT)
Message-ID: <717ad899-31ad-5e70-b299-ffb8ca287071@linaro.org>
Date:   Wed, 15 Jun 2022 10:50:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: add pcm reset for ipq806x lcc
Content-Language: en-US
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220615163408.30154-1-ansuelsmth@gmail.com>
 <a92fe431-a995-4c7f-b90b-8e80298bc71a@linaro.org>
 <62aa1b41.1c69fb81.95632.5b71@mx.google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <62aa1b41.1c69fb81.95632.5b71@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/06/2022 09:53, Ansuel Smith wrote:
> On Wed, Jun 15, 2022 at 10:43:10AM -0700, Krzysztof Kozlowski wrote:
>> On 15/06/2022 09:34, Christian 'Ansuel' Marangi wrote:
>>> Add pcm reset define for ipq806x lcc.
>>>
>>> Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>
>> To prevent any confusion about identities (we have strict rules about
>> these), I need to ask - who uses this email address?
>>
>> https://lore.kernel.org/all/?q=ansuelsmth%40gmail.com
>>
>> Best regards,
>> Krzysztof
> 
> Same person. Started using extended name, wanted to do this change from
> a long time but all the patch were already pushed so I couldn't change
> it since they were already proposed and on the various mailing list.

Previously "Ansuel Smith" was used entirely, without any parts of this
name. Here 'Ansuel' appears in quotes, which usually is used for nicknames.

Is "Ansuel Smith" your real name or a nickname? What do you mean by
"extended name"?


Best regards,
Krzysztof
