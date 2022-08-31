Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13FDE5A7DC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 14:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbiHaMqR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 08:46:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiHaMqQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 08:46:16 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6827DF46
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 05:46:14 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id z23so11637197ljk.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=+CLgjZxE8tHjYWhVPhfdVFtaMLWoPZmYPr9BiNUoMTc=;
        b=j6+YWVG2F03XvhtGqLhDnHSfCs0oJO1Hv3UxC5lBz005WCdhBbEDMrIcWxMEJyCI4V
         Tib4dXq2B9JybqXVxjzEIalJFVYQN1S/t5UZen2lb+NpmVvZn25APIWlL2o9dAs2hoxq
         TLQ8qUntBZwXhfFzoDKXg7V6gwzMmFM3iX+/JQJ87OCiIT4MldPbyuPv3ue7zHokLC7o
         31wxykyplR+Rnb3QPnb6W5oEa9GgiDkHRL9c3a1DSyQRA7ThQTQQda5PCqChrPpldLjz
         l7uxk/5QWUCCrBQrQGICKM43stixR2K1YoKfSc8Rjs56bS/DYgZn7Dh3jx3eJ+8VYKFT
         h57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=+CLgjZxE8tHjYWhVPhfdVFtaMLWoPZmYPr9BiNUoMTc=;
        b=hkbW/QKv2rV3EJCr7+wgt4F1Fp9PWWBt+9C+wUBHWj+/CBeM7tcQWmfWMXbdCiJ9Pe
         YCaS9XCjDzsCkanVSg8E8fSwqXRFKocJI+VBtnwiur6QlEo2O4S8C8cPbxixkopUBaHN
         8+MxHDY2a9LNjAlSRgQL/Kv61v2F3PBIwDf2ix1AuwE5Gye2GQfQ0b0lrqIyJbbJBH44
         TNrWiseZx2jv79wVQkHHAnhn91Hr3Nc+XiCPH1gMA/udtj/ra4nXv3PwEjGGAW/HoYrm
         HjTFpu54dPHlT1uErlNH3B7HlW7oM4vsDu1r4fbDx7URVFZM42WXcfwU17IjXTpma5ul
         ACLQ==
X-Gm-Message-State: ACgBeo3xWvX+2+LBd3jAE+4uF1eTOxS06Ip12Ti9VuQuW1XlxUkor11p
        9Ybsx9Ugqv8ZvKwdGLV8MzvsTA==
X-Google-Smtp-Source: AA6agR7qz93FvfBLU2m/px9PwOONGwi5VS+Fdh3rFNaW1+Us8K62n3SZ0jsus7AID61+yTHOgIxfMQ==
X-Received: by 2002:a05:651c:1a1e:b0:25f:e7bd:6a4e with SMTP id by30-20020a05651c1a1e00b0025fe7bd6a4emr9181877ljb.362.1661949972793;
        Wed, 31 Aug 2022 05:46:12 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id c17-20020a05651200d100b00492ea54beeasm693118lfp.306.2022.08.31.05.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 05:46:12 -0700 (PDT)
Message-ID: <b6475fa6-fd3f-55cd-1b4a-b3e871cced40@linaro.org>
Date:   Wed, 31 Aug 2022 15:46:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Document additional skus
 for sc7180 pazquel360
Content-Language: en-US
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220831104220.v2.1.I11899dbd0476ffc83aaca07f8ca9b204ecd9a84c@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220831104220.v2.1.I11899dbd0476ffc83aaca07f8ca9b204ecd9a84c@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/08/2022 13:43, Yunlong Jia wrote:
> pazquel360 is an extension project based on pazquel.
> We create 3 sku on pazquel360:
>    sku 20 for LTE with physical SIM _and_ eSIM and WiFi
>    sku 21 for WiFi only
>    sku 22 for LTE with only a physical SIM
>  Both sku20 and sku22 are LTE SKUs.
>  One has the eSIM stuffed and one doesn't.
>  There is a single shared device tree for the two.
> 
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> ---
> 
> (no changes since v1)

So this is like fifth version of v2? I asked you to read the docs...

Please version your patches and do not send different patches with same
versions.

Best regards,
Krzysztof
