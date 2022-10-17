Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8AF600795
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Oct 2022 09:21:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbiJQHVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 03:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbiJQHVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 03:21:04 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C705A3CC
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 00:20:57 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id a10so17017107wrm.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Oct 2022 00:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHmVhCl0HtIsCNUv1vhNNpI4KWXeC+TR+yxWNqfso50=;
        b=dRF1C+tMcrUm0A7kVrnb6ZkonA7wm6736FZD98+wKRpEEEu2vIcgnV2dx5krCflau6
         gZaaQ0XMlwflOg3qUsZUQqQksF4oyZm9ldo8yBazsf3lxN6kaDfLzFZdaLpUdtPV2aHg
         k/MUnr0wIlRILW8mqFT5gMLezng6rWYnSmYsaeqLfaeyufIvkmBER3Tv1G90iiDTgm+Y
         m1DVpA6bjXE83huVmS2Bgej30aODA70l+up3E6QRkqG0kQceBCAeAgBd4qer+tf/f0Al
         9EHSplCuvO2kREFIwPcw5VKvabC7J2FDargpWgkzjHYLJZ1R+75B3aLf1QsCop85A4aJ
         0pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHmVhCl0HtIsCNUv1vhNNpI4KWXeC+TR+yxWNqfso50=;
        b=w74V8oxz7l4+Q1NM2S0aH29fcA5M51swHiFBXsK6CA80l6mWcagPboN1MK+dnFZJKv
         z6uW0kAyoDyi0FtNSXp9V0h15vYLVg5tS+5ZB2t3VVTsjC3rNklr84k1XSS6t9WGcnBD
         u2WsVlgYVAmPtyi8gimUukn7jfDyxb1yhEvw4pxISqc7+lu4Fv5mj/UWjYwjebPeCwpl
         625A7Q7F/yYUkvYWO951FLZvt9QZkBqJA5qe1EH98a22LWZuMWuSBEr58gfSDUizo2Iy
         ae9CgpsCPYMpjAnfjFChaflRyPa9AAQARVIWzxbLDjWauaH11wen0PzKICXW5LyCjHxT
         sJHw==
X-Gm-Message-State: ACrzQf1SJ8ChxCsk/g4lqZQvH0vQqFZVo4yNGl9h59oBoZ0ykQGHF0La
        r1G+5CN2BFoni2roOMGh2mv4WQ==
X-Google-Smtp-Source: AMsMyM5hnWJzG38N6N1rkatI/oqF7gOK3q/thTVZsPX1xK3F8THWoC5Imf6vPDIncvhWjXnRFocn1w==
X-Received: by 2002:adf:e7c9:0:b0:22e:3524:9b4b with SMTP id e9-20020adfe7c9000000b0022e35249b4bmr5030706wrn.520.1665991255501;
        Mon, 17 Oct 2022 00:20:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ea6:24ea:3fe7:64b9? ([2a05:6e02:1041:c10:ea6:24ea:3fe7:64b9])
        by smtp.googlemail.com with ESMTPSA id o39-20020a05600c512700b003b4ff30e566sm26519975wms.3.2022.10.17.00.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 00:20:55 -0700 (PDT)
Message-ID: <9f859ba2-3f72-6f6f-7a5f-dae3a8b38c5e@linaro.org>
Date:   Mon, 17 Oct 2022 09:20:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/5] dt-bindings: thermal: tsens: Add sm8450 compatible
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221016090035.565350-1-luca@z3ntu.xyz>
 <20221016090035.565350-5-luca@z3ntu.xyz>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221016090035.565350-5-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/10/2022 11:00, Luca Weiss wrote:
> Document the tsens-v2 compatible for sm8450 SoC.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
