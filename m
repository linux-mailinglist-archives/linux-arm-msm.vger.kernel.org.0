Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9895A4FA980
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Apr 2022 18:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242599AbiDIQb3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Apr 2022 12:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232243AbiDIQb1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Apr 2022 12:31:27 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2B819B0AF
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Apr 2022 09:29:20 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b15so13335449edn.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Apr 2022 09:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=013KQyZoC1kiZK8acrvQDTsvOmSOuQ5IBcDI4parlh4=;
        b=yRLY31N37VK2cj40RKzRn4+6jDccfmifkjJE0UtauU4xkiKlwJatKyqvpuf9zcyk99
         1HxMksrcfB3cF0MZ/9jQazdY+jqCsLCOGJw+X6rTvWrZveibmeqQuLja+LFPoMZHJchL
         dNqjc4m/hmCCjTeS5PCVAYThu/vRzu9iOFOWoojX+bZoay1vK2wnaPE77qL2ML0W996L
         dfxWcptyWqo7jrhuTrl9/n+Kq7N3G6efYjeZ6N8bYrI+qVnUonDQPl81jSnDgRlPsl3i
         YGSXAEmXdgZoq+Cq2MYipbejX8LZbtU+tNRWgLrUWJPciF1xtwiclBJKiLo5qpenLRDw
         HgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=013KQyZoC1kiZK8acrvQDTsvOmSOuQ5IBcDI4parlh4=;
        b=HvTTylgkWq4HusrjaElNTwTPwTeV0Y8G8W4zMz8hwayoHUiN/N+98OQjnRoLOox5p4
         NkSxRYrxMkVmU8Ydwcelff08jia0m/210QV5yvH9ETmWlOUrZ67e7gSpX7XvV9KNccJQ
         Cvf+GxyVhnA0bnr57ekXCIc7N4LhQKTlfx0273jXpuODmRoneZs823lFg1B5Uw8z8odc
         uRjSNygZ+C342xsEgZK12RibWynvInpH1JS+V8ts9Nk6NN8UOIaFS950be2JTHqiTyRZ
         VF2U+sJHDclztQLBcUCcbPNGqkkT44tH/v3HF+b+02tXBxx34bLePS3EOAlMazK/4iAp
         n6eg==
X-Gm-Message-State: AOAM530c7+SaSuNHx7HXw8aXcjhb+nOXcA3ibhcwGk0ychuaN+L/OhaU
        ie1C8nmVm32bhVaTPLc5tVeVHw==
X-Google-Smtp-Source: ABdhPJzQFbm5lCSBjckKBhmk/0GHd3D233fa4uyGyQrZQ8dNln3xQBzO5NCowNNtBZahuYgMrlTpkw==
X-Received: by 2002:a05:6402:2554:b0:41d:79:945f with SMTP id l20-20020a056402255400b0041d0079945fmr15417239edb.120.1649521758824;
        Sat, 09 Apr 2022 09:29:18 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id f26-20020a170906825a00b006e7efc52be8sm6865768ejx.166.2022.04.09.09.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 09:29:18 -0700 (PDT)
Message-ID: <c63f7e1c-b40f-474b-507f-86d214048a5b@linaro.org>
Date:   Sat, 9 Apr 2022 18:29:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display: msm: Add optional resets
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220408210253.581337-1-bjorn.andersson@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408210253.581337-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/04/2022 23:02, Bjorn Andersson wrote:
> Add an optional reference to the MDSS_CORE reset, which when specified
> can be used by the implementation to reset the hardware blocks.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - None
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
