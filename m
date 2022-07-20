Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2C5957B1FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jul 2022 09:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234461AbiGTHqH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jul 2022 03:46:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231868AbiGTHqG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jul 2022 03:46:06 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9842621E3C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 00:46:02 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a9so28860026lfk.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jul 2022 00:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rfGDHhDs5ltYb1owMNF2GUKMS5QyT/J8E7KfFnt6Mf8=;
        b=V4vsHS/o630j4/gQSW3XfMxK05Ep0HV8ei0GXoVSgofjWvx6TGwqL1Bz7ZjY1YiAR2
         JO/UmVuMcM7jG92Jc9HIVZlgQ5Yw6DZnftBru1kChg+si9hsUTP89EmCusOb/3u9A2Q4
         t/xBSPTwUYZSO79XPxOx1dQwyucxlNfKrc3gY1Ya4gmON8yM8YwcWKiZhj9fY7a/JKSS
         M8xQrtiqMUs5+0ql1nbYaAEhjYKaUaqi/1wOUEUvO6bib+9dMnwzxBmiqdUbOdYnYTPN
         TbnEfc8j/7yubbbZJ3MxLGhTaj+N9nTyovCH10vKa3GRYwsfL7hcXp4FnQ4cLHO5gwpm
         1Buw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rfGDHhDs5ltYb1owMNF2GUKMS5QyT/J8E7KfFnt6Mf8=;
        b=DuiVOGTtkX3yP3kIGNqrjtt0b5sLBk3ZL97uLwu29vbbzZe6x/znR2GUCDY/dpnyyQ
         GYzBkm+S2BoCAdfVt9w20F/Uqu7Lx9yxx9ZyTIENETNWagCB5bkQl3klMD6eoxCvAh1q
         v4+gcOjDtVn2BLgFfU5JLCnVAb8Y6cbUkKpAyqYO0hfJUEwOXMOVX6bJIrrhSIQv7DX+
         BfbmkMaRNDvfTS0Iy1MwAK8ER6Ww+2QpQf+0gwQDEE9zYRGKy/cLgTpOybkilQqwiuYy
         sfQ/LS0wXaTBVqmIWRx5PIoHIWRYEMoFxQ8BincpD9Zun4+79zLROWbt42N/mhRyG7cf
         1MSQ==
X-Gm-Message-State: AJIora/yBjOR9KEi/kJva3RciwNvQWERM/VSuqWFnKPAdi4mZ0jEpZMr
        qvLgL5oIo1fy/Xn9/m14b8/QAA==
X-Google-Smtp-Source: AGRyM1u2aO7CWLkX60vxePHAaWUtKrw6+FMjM2skH7yJRzFpB+5zsYqQV1YO9RRHE3QVpUJ2KC2hcw==
X-Received: by 2002:a05:6512:3d8d:b0:489:de37:74c0 with SMTP id k13-20020a0565123d8d00b00489de3774c0mr18715450lfv.527.1658303160979;
        Wed, 20 Jul 2022 00:46:00 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id v11-20020a05651203ab00b0047f9ef4cb92sm3637518lfp.297.2022.07.20.00.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 00:46:00 -0700 (PDT)
Message-ID: <50336396-0929-4ba0-ac2a-a9a748a76218@linaro.org>
Date:   Wed, 20 Jul 2022 09:45:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: qcom: Add SKU6 for
 sc7180-trogdor-pazquel-lte-parade
Content-Language: en-US
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220720073604.1.I249596c011ff05da5a95d72fc321e115ef859803@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220720073604.1.I249596c011ff05da5a95d72fc321e115ef859803@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/07/2022 09:37, Yunlong Jia wrote:
> SKU6 is LTE(w/o eSIM)+WIFI+Parade
> 
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> ---

Didn't you send a v1 already to which I responded? You need to properly
version your patches and address all comments, not just some.


Best regards,
Krzysztof
