Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5AFA568E65
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 17:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234430AbiGFPyM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 11:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbiGFPx6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 11:53:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F8F418381
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 08:53:30 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id e12so26646167lfr.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=X7T59me0wj8EL8IWcKYPdBXPVV7Xe/PyIIDPA9tAhFM=;
        b=dl4RsWOOioDPEEZSV8Q6d1C3NeXb2s6TuE2AtCTvg1n2n6/6YwKz2nxQSaM9tjfRx4
         hayZOC68rIk7ugJTK1DzmSsW6EQJqgtKirrG4qYdZ/XKCjidBQAJt8OVMxX0hOko2Yjw
         QOEQhj6uQKEJBMR6hkkKGUzYR0dRjysM309Gm6zgtiGXVtHLdPrIsQMf1rJrtyulksaX
         0hPPbXPYnYCMQqlEtgabfJUdZGrLNLHxfgTzJFo73d+jRerPsesaK7CXHqsLf83WLseU
         V4VFhxLkQLh5PtSecTxnpY/eHIKb6ZbTuDhAbWf+/BEG8Z+Wx9yCavzKM1Y149j2SZHd
         mfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=X7T59me0wj8EL8IWcKYPdBXPVV7Xe/PyIIDPA9tAhFM=;
        b=GyEe8W6kXRRDRh/VkCRrcT4e+JzjSS8Ag9BXjJcRk64QkH3cqoKnaDIrS3QN3nJBMs
         WQdrURvf0mihlWn8uHBJWD2ef6A0a1oM9L/GjAEfD3ocy/6/7t9VtMmYv7Dj65eQHAKp
         BpR3xjpnGJ/i3Qse+/OAXUTOLImiTPmZKQj9hTr/JF35PJFjjkR9f2YMZ2615mnWtMKs
         Y8YIWYkRIl3gRCRCPu5tVcEsIY3yuWj4qEOMcBFVJSxgrpVazDqz37ILl8nTtV239I1M
         IJjegrdvD4kfHxp01aol+CQ+szaNIMgxGLawC6UkOXAD81zQJ0+oTirocgv2GWZ99J3r
         JjhQ==
X-Gm-Message-State: AJIora/mXhPoeV9Q/xJo3etGfXQR7NVC3JkQI6H8jEjA1oIL6vKK4GfE
        pmMXVG3mqAVxuuCOAu8pY6adt6YR8nbgENzp
X-Google-Smtp-Source: AGRyM1v3k7cZraOuJLcFdr4BGuOWAHZA/5OiHqQ5QQb46JslGgrl4Cflu5asFPXT2Tam6Cs/eLAhpw==
X-Received: by 2002:a05:6512:2210:b0:484:f174:bd51 with SMTP id h16-20020a056512221000b00484f174bd51mr4617778lfu.482.1657122808976;
        Wed, 06 Jul 2022 08:53:28 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id cf6-20020a056512280600b0048724eb8cffsm211734lfb.255.2022.07.06.08.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 08:53:28 -0700 (PDT)
Message-ID: <c23149f3-9070-8727-e30a-4a7a82794082@linaro.org>
Date:   Wed, 6 Jul 2022 17:53:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] dt-bindings: display/msm/mdp4: require 4 IOMMUs
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
References: <20220706145222.1565238-1-dmitry.baryshkov@linaro.org>
 <20220706145222.1565238-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220706145222.1565238-5-dmitry.baryshkov@linaro.org>
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

On 06/07/2022 16:52, Dmitry Baryshkov wrote:
> APQ8064, the only supported mdp4 platform, uses 4 IOMMUs for the MDP4
> device. Update schema accordingly. When we have other MDP4 platforms,
> this spec can be updated accordingly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
