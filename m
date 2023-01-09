Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4C43662208
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 10:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbjAIJsy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 04:48:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbjAIJri (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 04:47:38 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAABE13F14
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 01:47:09 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m8-20020a05600c3b0800b003d96f801c48so8542856wms.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 01:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKZOdRVhSJo3yaxrUarQJx4FQlBCZQiZZVkJFevOxtM=;
        b=ey8mA2Qpdik4m8Fl6j+lkcKYW2b48xTqXYdkAwGAM559ANUSIAbk+CVADLNpZIutzj
         fRPdSiW0RKPwMnzzxPZxhPZwyfL+9FMEMqlzlJePYi40/HtT4ovai/k6zWPZ7AwQuo3u
         zZrkhB1o5mJy/IpuRHWNlJ59pLvExgxPMy9bmqAPQC8bv3vqjd/y0f2UiZs1w7idKbHk
         V2pRmgwv7FzK2Ep0dfdvi7s/If0kI4L8/+WouRcLZO1Nfk4On4fhycVqnpEkbVbL4qWX
         V40rSXpgfkKGIqccZwqzs5iK03pz1ROfihyrqE4rSWX1f6eTHRvlK+zV9ORg+mnixl2t
         UTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKZOdRVhSJo3yaxrUarQJx4FQlBCZQiZZVkJFevOxtM=;
        b=pEjf8uh3KQaif+m36GnNRGx/44dO1UQRAY5z0YPTEtd4xicbgTaoMSxFFvOtq40/BZ
         ThEsfwxWq3SBY5Es5if2EBr/Wq5L8TAD2/3m0cnutZ0z0WwejrrKW85EkfwW/gYcqYb4
         y20MHL9KGmWsqwGn/XCbLXp2ORRJNHFsO3cj1kdlrj+aCUy7XJsUzBsP5D939Q2daxbK
         EzA/jtogKWAB4R7s7z+u5xTcMUFsGnJYJMqN55lb6FAVD6JZfgAzydIF2xLGELcDSwrY
         KrBRMZZH4l0TO1aLy/OuIMx12HH11vd8VN/LaD3NR++m+uB6kz7b53PluLLDDsVC9OAu
         WUYg==
X-Gm-Message-State: AFqh2kpWlWwlliVtzj82VdO7+g8gKm6ly1G4QLgaMrkiS51xY+TJFV/i
        dEeRRP+7MoyiQlRZ8kzrroeJPt7nvWz5njO5
X-Google-Smtp-Source: AMrXdXuW5epZtV+HpY5xI25+04xlHHlJnY6+V4z4ksJEU4Swz5Wc6Gy1UxaqAFE3mLDJ3ppkOtIoOg==
X-Received: by 2002:a7b:c39a:0:b0:3d2:640:c4e5 with SMTP id s26-20020a7bc39a000000b003d20640c4e5mr44159365wmj.8.1673257628549;
        Mon, 09 Jan 2023 01:47:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c350800b003d990372dd5sm16749798wmq.20.2023.01.09.01.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 01:47:08 -0800 (PST)
Message-ID: <c2363f3a-1eb1-5e12-1616-b201dc05bdf3@linaro.org>
Date:   Mon, 9 Jan 2023 10:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/7] dt-bindings: display/msm: document MDSS on SM8550
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
 <20230103-topic-sm8550-upstream-mdss-dsi-v2-3-87f1c16d7635@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v2-3-87f1c16d7635@linaro.org>
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

On 09/01/2023 10:26, Neil Armstrong wrote:
> Document the MDSS hardware found on the Qualcomm SM8550 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8550-mdss.yaml     | 331 +++++++++++++++++++++
>  1 file changed, 331 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

