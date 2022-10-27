Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D29F60F7AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Oct 2022 14:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234241AbiJ0MnP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Oct 2022 08:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235182AbiJ0MnO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Oct 2022 08:43:14 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E11A8E47D
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:43:12 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id r12so2615956lfp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Oct 2022 05:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjus4Lr0mUJgIUezKjrW0GVyYQEzhhCvXjhUecntBY4=;
        b=aBnkL+Gocmi/zSZlxJoPrpTqFzaxt4RPjqGteTNMBjULBg0HQ80YWiJScZMc8/ZAmA
         N/1wckLU8mEmU/f++51N7+jIryV+kisI3lHsKEzOPYSWExce1pjoUYAyURvx1sSn8PJS
         TRBxx837VgQTzbULNsgU5VnrRHQF5CUo8e0gPX/eaZsx93bj+O1z9a7ozELkMpy6HW0z
         vmi1VaaE9NaOr0qdwApEObm7gg2ubkcMxhdDvG5RK5KEsLW+vXob0czrdnMEf4KWWG1p
         0oVtL1gntGc022FmYgnfBjeErgNAE4HdarBEWFqhC9fF/Hinx+2FUwIF9IMxGlxeuzmZ
         nUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjus4Lr0mUJgIUezKjrW0GVyYQEzhhCvXjhUecntBY4=;
        b=kOQrSrYu2Pif33nqyaWWys5uZ4ngq70rxaS4zlCcez9FbLfB54zpc1yBr1uoF1Uql5
         wwHkSiAtTNkjhh8K+8GlFrGb/58ut5CTUpIXR1+svpTrPrx2ycB0NdYc6ZfHce8F4hGc
         UDyoEvP5EGBB+QSLnPbR6QN9NGjsA8wMk5/+Y5MZ8Vo9em+wnMcvWuN8dP1Q/BKfpSSC
         ixKh7s4XNvfbCTmsivQV8EPosBfmjDJR8IdGNwvKvvXkKVYUaw0QkxX8ab5IHfPg5nfW
         D7J8Si9gS/IDkMeIZjZ+8Rp1BmJl+MsyKcsXH5jYahRJ43jRI/R8a/bPsSlzpeJIarix
         3+kg==
X-Gm-Message-State: ACrzQf2/vynXGg0f6D6HT4dh0F60FvLdLOjSZyPWt3aaj+03ZMMV/nyd
        31KtB0khgZ/Q53OOYnn1yeVYdA==
X-Google-Smtp-Source: AMsMyM50yf2JWdGhQGJTPH/iX4++QAjFltwPWNfb0to5tRN6b9WvutsNUTgmYquih5lM+wQAlU3tcg==
X-Received: by 2002:a05:6512:3503:b0:496:55d:a186 with SMTP id h3-20020a056512350300b00496055da186mr17549123lfs.340.1666874590962;
        Thu, 27 Oct 2022 05:43:10 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id x25-20020a19f619000000b0049ad2619becsm173970lfe.131.2022.10.27.05.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 05:43:10 -0700 (PDT)
Message-ID: <e6e410f4-5417-0ad8-7d99-2af75f97980e@linaro.org>
Date:   Thu, 27 Oct 2022 15:43:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 1/5] clk: qcom: dispcc-sm8250: Disable EDP_GTC for
 sm8350
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20221027123432.1818530-1-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221027123432.1818530-1-robert.foss@linaro.org>
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

On 27/10/2022 15:34, Robert Foss wrote:
> SM8350 does not have the EDP_GTC clock, so let's disable it
> for this SoC.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

