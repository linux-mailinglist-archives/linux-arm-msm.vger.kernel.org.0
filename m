Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCE866CA12E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 12:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233602AbjC0KWR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 06:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233600AbjC0KWK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 06:22:10 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7657D5FEE
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:22:08 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bi9so10672332lfb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679912526;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJlIsfoTYjsZ6GqEn0YXkCelW0/G1Ux6mbNEFEOUwXQ=;
        b=W9H4AzXgPK1GXam44qBCWJnDLzwiWFbKLQV+HEAdgmkgmkgTsOokQKUoOev1DAn4aM
         ohqy1ufIr4O25ITK+4KjaXSB/mKpUXVoqOr6QVHcefj/Lt6EPk/QADOVVkeQ0ttOOfCJ
         te6VQx693yAxbp0dJ5xkiaXEdvnMydXv1I98cjvJxrA/RqAaV4lhHfN5x7zsQhk++rtw
         YVVsX/uwwjmpYvxhl3EHO6a6YersmRncJ6kHsZsvg22+eKQ0fAJLPjqP2bNidSUc3Y/l
         OZAXy2+2IM6Cnz53HXewePIuEY6UABDJQWXtPA1V0wWnKa2eBNKQRR2Z/EmNP0aSe8iN
         rf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679912526;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJlIsfoTYjsZ6GqEn0YXkCelW0/G1Ux6mbNEFEOUwXQ=;
        b=fOEQK4m3URiK0uO3AbGHlV7ITF30Um5BsX/EsLtZUfOnUTddMVLU8UYe6fZ00yVLTd
         eAT4fHT/rjKxsKRioIraRKcwmew2GmJfbSW1xIan6HQbuEQCtltpONpIGEC825HOUOo/
         1c08BduiYAt0Ry59BBNnCdpB+TJbnSQGi8DGHbc9IhGCKmCXutwJI0b4SMF7XR6DHzq5
         MXXcYgHdjZvSgY50k6d/o4KMxA3CLaSM4PKH6htgWmYzD8kHEFKud3ZL1uKursflJZKx
         eF1DIvLaBz0bXAhZM9BGkAenGzw800CGDsijven6TMZrMqW4byCsKZqTJffGzURAI+uR
         yUag==
X-Gm-Message-State: AAQBX9fUB7ImQjFL7ShLDyGUk288iPcIvXbXy+yeqEhHSc9JSG+LxtJt
        RqYIjDzD34C6CvnYB3Amc3ffIg==
X-Google-Smtp-Source: AKy350Z0Jupm5iA4/JrEES0lolDFIVw5iJo2iljcqwNzZKMsNa1r/CwSrn8GiQyWJoMsAYMXooWM4Q==
X-Received: by 2002:a19:7404:0:b0:4e8:3fc7:9483 with SMTP id v4-20020a197404000000b004e83fc79483mr3419046lfe.23.1679912526443;
        Mon, 27 Mar 2023 03:22:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w3-20020ac24423000000b004e977970721sm4378102lfl.219.2023.03.27.03.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:22:06 -0700 (PDT)
Message-ID: <5cf3568e-e378-cf38-6350-21e787866cee@linaro.org>
Date:   Mon, 27 Mar 2023 13:22:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sc7180-trogdor-lazor: correct
 panel compatible
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230326155753.92007-1-krzysztof.kozlowski@linaro.org>
 <20230326155753.92007-8-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230326155753.92007-8-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/03/2023 18:57, Krzysztof Kozlowski wrote:
> innolux,n116bca-ea1 is not exactly compatible witg innolux,n116bge, as
> they have their own driver data.  Bindings do not allow fallback:
> 
>    sc7180-trogdor-lazor-limozeen-nots-r4.dtb: panel: compatible: ['innolux,n116bca-ea1', 'innolux,n116bge'] is too long
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dts     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

