Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B545B6397CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 19:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbiKZS7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Nov 2022 13:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiKZS7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Nov 2022 13:59:21 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 478631A3AD
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 10:59:18 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id s8so11522205lfc.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 10:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dPNvqf/nW/Gl7aRq2n+ie1oFu43zgJVOTcJXhFlCP4=;
        b=gfd+al0NKAYkhHejNHt4tGjHFPyPvShABp+kCQ8jvDoBkxmXgKqaDieUr7U+ch9jip
         L2GMwi07CTqA/XKFWt1Qwv8ytUFeXFi0I6zXw706W+i4koDxfL6cOiC96BWW8fc5uB3M
         pEGdoLnSDYR1BXmpjYlkneXn9gFnVjrSZD8ypSeZcgTTzhU+oa/yZl2wnQ/eKhrAGFxD
         dnbmzhQsfWwf0f0a1044K32Jtkq+5aFqcxiY4l/BA5W7BETRw5PIW7QCw6K9tlRjXf9c
         KhZ30ntZCS1uTx/t0QVznNDaV9Oq5Zw8wIA6nmhD2egkWZkOQdBipGmxaaptELUGJt83
         WIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dPNvqf/nW/Gl7aRq2n+ie1oFu43zgJVOTcJXhFlCP4=;
        b=nWghDUIxe49eO5C9ByByu5gh+BOANT2DiFJZEklsO0XBLHbAnQJ1znvQIZtaKQ2i2n
         i2leeW4/60gK8zb3pcD012W1BmwlnwWVGacL0wixRDjeSq6FJlMj6bA5YXcPKnmAyrjh
         6xf0hHl9OwG71QITGESTuwvQEaczpYhtWlww6KAFNBeHvUpR5OVqpmrWnvYk7n77cLnE
         sGtoHj/U7G65YoxZgKqLUCw10ArQHsP2kwAcpvzRk8AVVbvYKbABrfr/3M4EL+MG0svY
         tXbhOx7ocPdlzuU7MYuQfYcLW8eb/krcjdy5lTSR2lS1QMiT4NQHK/HCcwLUyT+/W1ZD
         d/ZA==
X-Gm-Message-State: ANoB5pnxTuYcR4T1VZEAiSYvEX3FzFiiE1bYmEcDTbJDcdLRO4b6oZX4
        t/D3lhq4adRR3wVsub3Miyn/QfFaVwltEA==
X-Google-Smtp-Source: AA0mqf7dtJSa1X6rpHx8sJKrn3MVILRRe3MDDJBNhKwyPFRmZtKaAjIvKABpV4rjdL+t4mvK2Nl6AA==
X-Received: by 2002:a05:6512:2242:b0:4b4:b6b2:aad with SMTP id i2-20020a056512224200b004b4b6b20aadmr8607501lfu.543.1669489156645;
        Sat, 26 Nov 2022 10:59:16 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
        by smtp.gmail.com with ESMTPSA id bi26-20020a0565120e9a00b004b4b0a68f67sm1004708lfb.185.2022.11.26.10.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 10:59:16 -0800 (PST)
Message-ID: <b3143072-6af0-de26-402c-5cf93918145a@linaro.org>
Date:   Sat, 26 Nov 2022 20:59:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 11/18] arm64: dts: qcom: msm8916: Add compat
 qcom,msm8916-dsi-ctrl
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
        dianders@chromium.org, david@ixit.cz,
        krzysztof.kozlowski+dt@linaro.org, swboyd@chromium.org,
        konrad.dybcio@somainline.org, agross@kernel.org,
        andersson@kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-12-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-12-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> Add silicon specific compatible qcom,msm8916-dsi-ctrl to the
> mdss-dsi-ctrl block. This allows us to differentiate the specific bindings
> for msm8916 against the yaml documentation.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8916.dtsi | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

