Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0168A6621FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 10:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234242AbjAIJrK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 04:47:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjAIJqN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 04:46:13 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE1815701
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 01:45:14 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so8555224wmb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 01:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lLhH0B+uL7u8FwbJcnA84uIuHyq/9Ih7+fgHG/d+w/g=;
        b=U/h+91bn+r91+v1YTW1nvU4AvAAw8s6Tk2cgo4doYUseV/Bpu0rMpft+Vd9LPM0gxz
         5ohKV0lwD8VU3mmrlDRbttFGt47lR55lUefIlsgAxmIy/NigXmj1CIvn9C1LKYlMlW/C
         TYv3fERgIl3xTwlbQ7vsBaUo0CJGtENI9dO5SDFVQL1+zWVxSpz7ffyOEiC0kmfEgjKL
         pSr4f23TMg0SyxkZ+ZxkISWFKNv/HC4Hf7dPQi0gi2DM6an9hE9XLyCHsrAnx+EhoAmv
         25MNiWxPhnLAKDCH+7hgOqOnoToUXta71Ewav8+oV+s8pzy10kQ7KO9Xq9tzlz08xuak
         0KQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLhH0B+uL7u8FwbJcnA84uIuHyq/9Ih7+fgHG/d+w/g=;
        b=x3Unst8EL8ys/6A1ZEq6LLRguSkweXsrUkK51qWpYhcXlvr3efjn+264hwepjTzTUe
         slfUx9dHXwOn2kCNzLOmO9zyH1YhV+z4nDP5/Dbp7L+PrgmfXUi9Gi9QAHYQs8yZrDa0
         vXdqJoxZPWU4MzwdnE8sspAShoTFu701n9t9DX2V0IEbPHCtl43HbBMTexkNwDHTwKy2
         r5bSzevZkEU/httpLvQrlI1Y/KDZorjHNaFlpBA9DvuInLHZ9BGKZvopjImASvSzfpta
         TJ84KaGo4auXO2c+ZNq/NdkqO2TCzbWMM+OF24GNa4Tfk8vzOEUigEDINSCfFowewBlS
         +N8w==
X-Gm-Message-State: AFqh2ko4vWI6azo5fwP/B4ztdhwY4+O/j9Y7ifiaoipvS5qCYjeD5Qjf
        n9BwywMb0P7jRZT/kRrp3wfeSw==
X-Google-Smtp-Source: AMrXdXsNwwIJlURsNnzcw8mgN/L8ukGjkVQPEV1pXW7YTj9pGd9SrJeJnJMo3fMmM8r37up3DG8GMg==
X-Received: by 2002:a05:600c:687:b0:3cf:e7c8:494 with SMTP id a7-20020a05600c068700b003cfe7c80494mr45806546wmn.29.1673257512932;
        Mon, 09 Jan 2023 01:45:12 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c444800b003c21ba7d7d6sm11313513wmn.44.2023.01.09.01.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 01:45:12 -0800 (PST)
Message-ID: <e706b0b9-6b2f-7b0d-fdd1-e66bd3d6c736@linaro.org>
Date:   Mon, 9 Jan 2023 10:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/7] dt-bindings: display/msm: document the SM8550 DSI
 PHY
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v2-1-87f1c16d7635@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v2-1-87f1c16d7635@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/01/2023 10:26, Neil Armstrong wrote:
> Document the SM8550 DSI PHY which is very close from the 7nm
> and 5nm DSI PHYs found in earlier platforms.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

