Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB88D5E8AC9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 11:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbiIXJ3s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 05:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233435AbiIXJ3r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 05:29:47 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FCEFAED
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:29:45 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id j24so2451457lja.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 02:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=DZGAIB6lOdSfIICauQbfT5Gio7LJSO7BYlR0b7U8DS8=;
        b=pNvfAYYPA0xFYXDIi5y4/92pkWfgTeRTqoJ+Nce4yxlfZbl5qnT8BcKAwvo8ZUMMQa
         Tsgsd1dU4t6pIJ04hWvXqPPi3frAY6pxcRUIEJAnws3MS2tiqAylhibn51MicUYjfTBK
         //Q21qbi38NHXgeZX4DaQEgNlNfgHpE7Jdqq6Ub0I5dVUNUismaSRIrc1uiK63dHOyfL
         K0je9eCCGpMWZMgKU8fC8LsaM+JmhjzVRX/dt+UtMyFQDRAsoj0REM+1WlDosfC0DtDe
         IsX7WrqEnmi6TTVg+f4x7VZdewwNqN2QUIAH/QKxjWisVIhw/Gn7dzFBXpucMiSw+aRd
         ii2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DZGAIB6lOdSfIICauQbfT5Gio7LJSO7BYlR0b7U8DS8=;
        b=b8I3OWaOcB1O8IdQkIAOuI14/3KvUpQmxf53UbWGujyW0Uk+eU01/K1nKxrhjzHVUg
         uLbjflqCNE10BOjdJdyemDpY8I+OIzjIErmYZ/YiLbm//zJnRoXCGckC3agmAuZXVUr4
         isqspjvoz7fisscL/sp4ixfl0Xrj4IFybuz/aKefjspFG3BT/UbR2a16fXuv+PqeKHge
         CQ4KIVnzxXSPaBySRgu+qw9pSWTR4sgKMDlwWYdXuGfmj5QRvhE6LH+Ma5DmbUh5mSTU
         jUqXX7WM+bc5v+ONVym200cxeesMmipP0McrVKIvrtaEg8X7Ryd/EYz84LoiDpTZ+Kez
         wahQ==
X-Gm-Message-State: ACrzQf1n+Jq5HRjWnBa7/KEUKUjIpQloELciB6WiiWy9RNA7BA9J0v76
        Gag8DJNgE0sRe4USvxCn5uxiYA==
X-Google-Smtp-Source: AMsMyM5SWQN3EwIq8in2Z15Fx8LgxNJnzmtrpYJprInmv+ZrHJMt6KkxewCGTsrGVOf/otXbQLbwUw==
X-Received: by 2002:a2e:a5cb:0:b0:26c:4311:91cf with SMTP id n11-20020a2ea5cb000000b0026c431191cfmr4168268ljp.491.1664011784324;
        Sat, 24 Sep 2022 02:29:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o9-20020a05651205c900b004979ec19387sm1826256lfo.305.2022.09.24.02.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Sep 2022 02:29:43 -0700 (PDT)
Message-ID: <5ea1e309-6ea8-f6c1-dc53-471d858ff60d@linaro.org>
Date:   Sat, 24 Sep 2022 11:29:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
 <fd91077b-e4ff-0187-8424-0b83b96588ef@linaro.org>
 <361ad59f-288f-beae-25c7-7acd42c2db94@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <361ad59f-288f-beae-25c7-7acd42c2db94@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/09/2022 11:20, Dmitry Baryshkov wrote:
> On 24/09/2022 12:11, Krzysztof Kozlowski wrote:
>> On 24/09/2022 11:00, Dmitry Baryshkov wrote:
>>> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
>>> them with generic phy@ names.
>>>
>>> Dmitry Baryshkov (9):
>>>    ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
>>
>> dsi-phy is similar to other generic names (usb-phy, ethernet-phy) [1] so
>> it could stay. Is there particular need for this, like coming from DT
>> schema?
> 
> No, there is no requirement from the DT schema. However:
> 1) The resent qcom DT files already use just phy@ for most of PHY nodes
> 2) The recommended list mentions usb-phy/ethernet-phy, but not 
> <anything>-phy, so I'd think that those two are mostly for backwards 
> compatibility.
> 3) I liked the example of sc7280 which switched all MDSS PHYs to just 
> phy@ (this includes DSI PHY, eDP PHY and, by extension, the HDMI PHY).

Good explanation. If there is going to be resent/submit, please add it
to cover letter. :)

Best regards,
Krzysztof

