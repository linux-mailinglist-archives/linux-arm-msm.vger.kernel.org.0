Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE705700EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 13:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiGKLnF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 07:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiGKLmr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 07:42:47 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE46B7DA
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 04:37:18 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bf9so8154895lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 04:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dRCit7PDdPHjZBOwp4u9jORbpMarXZ1yRwqNnSgrgDo=;
        b=ZMw7KZQ3z67YtPsjQBn2Ndo6Quz211hdWH+61kRV6pTN8Jb1Wjr0yQuQkRDk4S8Tsa
         y6gkScoDmAu0WaLA6/lxe1dKYtywgB4mxbh5oDwYWASvma5bsJpi2pg7LIFco+Ek2tbM
         9yXtNRhGeIVPsCE/WuiqPyCjWlvXxciMaX4f5FzFIUJ+a7qV5oc3h9pK9EppSLVQPtD1
         gQHrJRis95eq0DYSilPMkb3/K0xM3FWU1+Lv5Hl6co6uxDD8E5okWczRwpwzYYDEPbzn
         /21+P6KDY5OAQvFK0N4escrzif6ZMIs1gNXpLw889qpP6YtQXvUT1OdLvuBhv3to4V/I
         7uzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dRCit7PDdPHjZBOwp4u9jORbpMarXZ1yRwqNnSgrgDo=;
        b=k5ciW6WzrrQTYRxkxTq+Ia7GcegL245rhhSJbflTGI1FvPw3KPk8MeeELnz4C48RxS
         7JAOnhkiho9HApSliWQ7U0NmAVCsbfi3rtTH1uk6Tga/eVtl/RngOi2KOsKzffIO4ZL+
         WpSI2WVAra0pEFcXtxK2Ng2AKCP5oIR3oWYymQrnepMYS2yhA2DO8D1Ml8OrFMu/vCKr
         SwXRGAoajrZVd/2ZxkM87b3ExReq5aBu1ihGVgtxaHzW1FN7EvRYdXS64R/OQyq3EnOt
         GP5ydfVjkhhQn/g3+PJDL6vIUhsEfyXvlAWE11yWfQd4/QTsJm8xfTTqBW1Cdhjr0fyM
         wUGw==
X-Gm-Message-State: AJIora/IQd3hj+qHg5Z2AluC5FnwYC6WE5naPElAAnYzHhiOd6pABQ/m
        WfOHAG6I3vuuzHWtLdlgrZDEwA==
X-Google-Smtp-Source: AGRyM1u/zuOZEHQSioAp2lToRg2hUW+1+7Vg4tCi+2Nk5KkWA+Awxx0SdA1o6LpLrslnO04WuATicg==
X-Received: by 2002:a05:6512:1111:b0:481:22b1:8db9 with SMTP id l17-20020a056512111100b0048122b18db9mr11247160lfg.333.1657539436440;
        Mon, 11 Jul 2022 04:37:16 -0700 (PDT)
Received: from [10.0.0.8] (fwa5cab-55.bb.online.no. [88.92.171.55])
        by smtp.gmail.com with ESMTPSA id e10-20020a05651236ca00b00489d7fec4f5sm937284lfs.122.2022.07.11.04.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 04:37:15 -0700 (PDT)
Message-ID: <677d6387-6225-29c2-3190-8f443222019f@linaro.org>
Date:   Mon, 11 Jul 2022 13:37:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 04/11] dt-bindings: display/msm: split qcom, mdss
 bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220710090040.35193-5-dmitry.baryshkov@linaro.org>
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

On 10/07/2022 11:00, Dmitry Baryshkov wrote:

Thank you for your patch. There is something to discuss/improve.

> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - power-domains
> +  - clocks
> +  - clock-names
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +patternProperties:
> +  "^mdp@(0|[1-9a-f][0-9a-f]*)$":

You used some unusual pattern. It's just "[0-9a-f]+" - the device
schema's job is not to validate patterns in unit addresses.

Another question - why do you allow "@0" alone?

> +    type: object
> +    # TODO: add reference once the mdp5 is converted
> +
> +  "^dsi@(0|[1-9a-f][0-9a-f]*)$":
> +    $ref: dsi-controller-main.yaml#


Best regards,
Krzysztof
