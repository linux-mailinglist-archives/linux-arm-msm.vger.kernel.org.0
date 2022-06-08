Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9371C543092
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 14:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239767AbiFHMix (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 08:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239398AbiFHMiQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 08:38:16 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3CA2CDB25
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 05:38:15 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id h23so30125289ejj.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jun 2022 05:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aEGXQECe4H9Yr1drGqc8tKF4uy6G/ckZC8sU26gHtJg=;
        b=b0/e4QaChXD6ECkdPGCyuGyJUawjE5WGDcCNngEWwicQcNjDBbxo96ujUWEmtKrU2G
         ZMV1/fftHeM20VSZ1GnA3cO3UI2z2DsvrBZNPz7+jiUrFVPZIBy0sgoNg5p0Pfy1zMZF
         YNPucSatWgbT1iWYyD9lZJ1QDWLyJbfaTO/sOfHHfuGk6h60/vmfjohGEYeGC7QA6Ijl
         sMHq3Sn0Kc6zK80Gnb/dC/bhil/qMHH5H6HB6ULVl1KM9OQgbQSpzqcyx6JC0Ie/CTlr
         vOsO7I/mJ97tFrhOLU/JqhZnShBHwZR5U33m/zhkDAyJ/AmCyI1K/R4Fp11qMP6Sc0TM
         rxQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aEGXQECe4H9Yr1drGqc8tKF4uy6G/ckZC8sU26gHtJg=;
        b=UffpktWzjIQUH9/k8WuZGq9EnKTjz2xcDa8PZZGuNAf9699zROCqmDZhsuBcifa0sO
         oaiY+UbnpO9Wc+DGCyOkdOaclW8oCuJPB3+2ixaUITz0laq3LvlTIlPUHJWQdTIYhSs7
         6/RF3UyzrT9TFGu6Z0fzpkArxYctoxE0LLReorJldB7aEwg7LnloJlZNzWWOGDvsjEe4
         3Vv4aqLpZb0F1AR8VF4654LDCgqPoXCPLc5dmtpP9uvErvS8MRP9V9q77FWZnjglI/zZ
         7U7BNzI8mId971zqanIO0fFWdl/Ds5oC3q/5u9rZXCw8fHTPePeDhkm1tmapalOvUoP3
         U62w==
X-Gm-Message-State: AOAM5316kVjL+ElhxuZ7EQuImvUqwYTrYdKV4E6JWqMEyxynznKAiFCz
        lmAqzrPGWjSNbTJA82r7cksTrQ==
X-Google-Smtp-Source: ABdhPJw2db8NS2pKzLZNRjdCIdLmNenvGRa27Y2xy0C/8AXs/h3fBZJZTn7uOXirBYfkc7BesWdcBA==
X-Received: by 2002:a17:906:414f:b0:711:ce99:69ec with SMTP id l15-20020a170906414f00b00711ce9969ecmr14718867ejk.724.1654691894016;
        Wed, 08 Jun 2022 05:38:14 -0700 (PDT)
Received: from [192.168.0.192] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id t20-20020a1709066bd400b006fea3702e56sm9102856ejs.79.2022.06.08.05.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 05:38:13 -0700 (PDT)
Message-ID: <1fa92614-d08f-162a-da3a-28fa9388d314@linaro.org>
Date:   Wed, 8 Jun 2022 14:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 03/12] dt-bindings: display/msm: hdmi: mark
 hdmi-mux-supply as deprecated
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-4-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220608120723.2987843-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/06/2022 14:07, Dmitry Baryshkov wrote:
> hdmi-mux-supply is not used by the SoC's HDMI block, it is thought to
> power up the external logic. Thus it should not be a part of HDMI
> bindings, but it should be declared at some other device in the DT (like
> HDMI mux, bridge, etc). Mark it as deprecated.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
