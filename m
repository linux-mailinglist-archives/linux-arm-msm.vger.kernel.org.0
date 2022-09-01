Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC50A5A93C3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 12:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232494AbiIAKBQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 06:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbiIAKBP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 06:01:15 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A7113489C
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 03:01:12 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bq23so23664773lfb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 03:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=UqgiLV0VjUKBJcxnLyNLTyV9eN+dAh8A/iqAACf8+dA=;
        b=qPDLCIYOwEP0VD55mNFupQq6wIzbcFHFLZrCcDkTOwZfolZtzzlbTrHWZw0t5twFX5
         n9c09BxM7QSkWWhf/UiZWT487FfYr3P3XwJmwA85RkmDNZtjyzzQ8AiuutpZPQ6jAylS
         zunBK3n56GFzJqUxmPK1Jfcrr/edXsq7xeuynlO0EBCoC96oVfwIEOE+NaB+xJkG9dbI
         Dh5Lcf3ZSKgtuUINz57lr69alOiT14+7aLnSRn76hD5IQbDyAZZgPRCrL1lDPnkL0nRT
         wkxUZjmCkcFtOYpT1ivhU0nD5yGrMGaJd/hL5gY5WhUgfSzDdraY7mhrIoHFQOIjwgER
         wluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=UqgiLV0VjUKBJcxnLyNLTyV9eN+dAh8A/iqAACf8+dA=;
        b=2Ocml4iH1lULCA+p/rpaE1vn59zFLJr1EjyixLtmz1cHl8bbQXNNcrJt06PKlFb4Sv
         Lp6ldWrrdOtl1XLPsa55+e70buiiUWJ2Icw5HsCS3NZQhxzXnpqmk7/BrQrE43/O/Q7X
         rQ077iMa6Czi3UNaGYdm+WrgB3VUwQy/BYmco6yKSIMCQhlJIYbA8yLGNEfK1e6qJQYM
         AzQZzpB3M3u+HFWFni5416hXJu3vGCAUQddb4lpfoDZUs28F99RIe3ePBi0qgFewFg5V
         hLka4QT+brWrGSdzG7K6Fhs1+1LLTz2hxiCf4bkFg/Fk52jJdQ8jsPooGmCoOGGRjyAW
         dMtQ==
X-Gm-Message-State: ACgBeo2zAGI1LU4NWbKYB+Up5QnCDBrdA8VudZ6zMl6ZO8PgjdlVgtK7
        4zk79ynN+BYeRxHY+0EGbuPppQ==
X-Google-Smtp-Source: AA6agR6g+J6hbZWE8D79tqnXYT/J1Z+BYuCIbp6i4arwcPiX+TtniNK3fPjXn3edpb61J1WeKy8VoQ==
X-Received: by 2002:a19:5e01:0:b0:492:c03a:aa8e with SMTP id s1-20020a195e01000000b00492c03aaa8emr11392646lfb.139.1662026470851;
        Thu, 01 Sep 2022 03:01:10 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id f24-20020a2eb5b8000000b0025e5cd1620fsm1627599ljn.57.2022.09.01.03.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 03:01:10 -0700 (PDT)
Message-ID: <cae05f4d-57af-7923-58e5-c4bf06a8a3c8@linaro.org>
Date:   Thu, 1 Sep 2022 13:01:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sc7280: Add device tree for
 herobrine evoker
Content-Language: en-US
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     mka@chromium.org, dianders@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220901091253.93333-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220901170958.1.I7dd7a79c4cc5fe91c3feb004473feb3b34b7b2d8@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220901170958.1.I7dd7a79c4cc5fe91c3feb004473feb3b34b7b2d8@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/09/2022 12:12, Sheng-Liang Pan wrote:
> Add a basic device tree for the herobrine evoker board.
> 
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---

And this is third v1? At least this is what your subject is suggesting.
Patches should be properly versioned. Git format-patch helps in that,
but you can use any other tools if you wish.

I pointed you to documentation you must read before posting. You can
keep ignoring it, so we keep ignoring your patch.

That's a NAK :(

Best regards,
Krzysztof
