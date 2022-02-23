Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 397674C0D0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 08:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234872AbiBWHKR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 02:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238566AbiBWHKR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 02:10:17 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E543C488
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 23:09:49 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 42259407CD
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Feb 2022 07:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645600182;
        bh=nimhNkIt7mdxahM9C8qO53ZAeN7FCRJYbKKsVkt4SHg=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=pWNgBR86IA0p/Davm1YfHEs71H25V07UDz7SAKnXauSQGFqQltoAgYo9Aiwc9eSc1
         hr8EKqOLsx3WrT/5d3ue+M8L9K/9XRrjl9LuRm7wBAVJduPGSjDd5VR9p6wJpCjmZp
         UY6WY0PFsbAOk/9WZf0Er6mfQGa09P05Ak8Z9TDcj2btsVZ9/Jv8Tui59rieH++Vmv
         +WHdshe4iNfle0iYtozepgMZV4Px2vYz+QLGGkj6M71Xq0SDdAlWpWEmol2EaVK7DI
         eBhx7D9LipuQ67eVGxAK/skaDl2e9Dz5CHHmwT9iM9Dmt9jq83IdrKjwUrPh9u6cSD
         PFNya+ZupS38Q==
Received: by mail-ej1-f72.google.com with SMTP id gn20-20020a1709070d1400b006cf1fcb4c8dso6721336ejc.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 23:09:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nimhNkIt7mdxahM9C8qO53ZAeN7FCRJYbKKsVkt4SHg=;
        b=uf2nZ9cl3/Esp5ISiVfOk+IKKP+IC49nKuC9VvB9bzXCusjJQwBTvp6TRCuBLD1Guo
         7oJiIJ9AbjTnZnqNspsrbtqs6qKTOWfClgf2JpkOqU5xRL8TcdiQYd9TUocAzig8ofBi
         shW4wzvu56Izp5ibOC5NkHGxu4sj6gWkRJao3GfP/5iM4z6FDo5qy3F0lGpgQacEzjU7
         xwyryfRMMP0DVAd30Pw5Yr4U3F0xdNih+tX3jxYgSMrfzQI3qu9uSsYoSC5AYZ2DvHSY
         usOpAc3uC19NsY1CidKsWlKCViKGmItRfg6lNEha5mj5/ApzWQWOks3GixAPPfI3RQq9
         D8JA==
X-Gm-Message-State: AOAM533z+S+RE8C1LwnNl9CP+MQNBq2OFusQlX/VnNyWIsOiIhqYKyWq
        IcL8EX4XqNCeR5TcWyKoDUyUfK3Zh1+fd15l9TpxNUCLZ4E0dE78ZNIk6j6nqATj9h1d9S3pshq
        J99GDvo2KIUBmzHCkCxq+CaAHMZ5ijmveqS++iZY5ggU=
X-Received: by 2002:aa7:dd9a:0:b0:410:b875:ab95 with SMTP id g26-20020aa7dd9a000000b00410b875ab95mr29494453edv.248.1645600181673;
        Tue, 22 Feb 2022 23:09:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzCfvOZRfs9gbRYzkE2QJAiHsybZmRR4vAzmtPrnH3egKFJYppepwp/EaGxvawIkcSpK6J/A==
X-Received: by 2002:aa7:dd9a:0:b0:410:b875:ab95 with SMTP id g26-20020aa7dd9a000000b00410b875ab95mr29494428edv.248.1645600181505;
        Tue, 22 Feb 2022 23:09:41 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id kw5sm7198688ejc.140.2022.02.22.23.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 23:09:40 -0800 (PST)
Message-ID: <18bdf4ae-c445-ad10-b344-324436cbe445@canonical.com>
Date:   Wed, 23 Feb 2022 08:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: (subset) [PATCH 0/4] mfd/pwm: dt-bindings: google, cros-ec:
 include generic pwm schema
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     linux-mediatek@lists.infradead.org,
        Douglas Anderson <dianders@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-pwm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        linux-arm-msm@vger.kernel.org, chrome-platform@lists.linux.dev,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <164557235424.1264579.14486504733557463529.b4-ty@sntech.de>
 <20220223062233.4m2xejozz4d47gmo@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220223062233.4m2xejozz4d47gmo@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/02/2022 07:22, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Feb 23, 2022 at 12:27:08AM +0100, Heiko Stuebner wrote:
>> On Mon, 14 Feb 2022 09:19:12 +0100, Krzysztof Kozlowski wrote:
>>> DTS patches are independent. Not tested, but I really hope no downstream kernel
>>> depends on pwm node naming... If it does, please change it to compatible. :)
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>> Krzysztof Kozlowski (4):
>>>   dt-bindings: pwm: google,cros-ec: include generic pwm schema
>>>   arm64: dts: mt8183: align Google CROS EC PWM node name with dtschema
>>>   arm64: dts: qcom: align Google CROS EC PWM node name with dtschema
>>>   arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema
>>>
>>> [...]
>>
>> Applied, thanks!
>>
>> [4/4] arm64: dts: rk3399: align Google CROS EC PWM node name with dtschema
>>       commit: 474a84be692d893f45a54b405dcbc137cbf77949
> 
> I expected that all patches in this series go in together via an ARM
> tree. Or are there expectations that this goes via PWM?

I would propose to pick individual patches by each maintainer. bindings
by PWM tree (Rob acked it) and DTS via each SoC tree.

Such approach gives flexibility, although `make dtbs_check` will spot
the new errors when run in PWM tree. Next will be fine, though.

Best regards,
Krzysztof
