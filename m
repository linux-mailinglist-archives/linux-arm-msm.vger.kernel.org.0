Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 166DE75132E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 00:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbjGLWF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 18:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjGLWFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 18:05:24 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E83FC0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:05:23 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b72161c6e9so16603581fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689199521; x=1689804321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IGnoejHJpmmAQXtyei84p3PqvM4LyL/Zj9/Bp1HQGk=;
        b=nSD1kvERFovNn1kT4bbHHTmbsphj27nYbGwJl5B42HnL/ZdSXJvFjBULLgqy4Uh801
         teO4HFmJygX9+PaR7h8YZuWs8GEF6Xke1LKdvZfzrNZ8WHbU/CCDU+XRnr2h+mbaiati
         i7xI2CQNVBGmOsTzmASIplGvjgxDyjsZh62PlPv+cq6QEZSdjqkUaETFaVQcvB4IwEDy
         oHTAqSlwHC8o8T8n1uBFofKVcLFuItG6nviMs4iDRRT4R9gNAj9K0TUqTZvvGygYZ4wA
         uquf2rnVavjLs/zGa49HoQma+kYS0dZuaI7fS4e9JjLSIFxM2nS5KHyXtvSQQ/HeKWIB
         33jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689199521; x=1689804321;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IGnoejHJpmmAQXtyei84p3PqvM4LyL/Zj9/Bp1HQGk=;
        b=edMtK9CDwaqhtwlG4gOdUyzQQEeIAVXA+I0n8ekEzEWpyNSa2v9Kqn47HZTy+/TXQ5
         cmZVcws2UD1G0uEk+7wXcXee2hrC3LkxfQRwBMSlZbNw0vhhylputGsqkalnYaoJ79rR
         ayquMQxp6ecfzWSc6svrsF6xckDgku+Xq7cPNgEPS3Ip22dHB7jsEkm/wQ9Ihb3fiO6l
         5mgalpw6e2Je3/Nnh96LAayz5WJG/FlkzIrH2Ux0oiBjcfwF1TEauNcTZO3Y0AyD1vNs
         jexLyZPRdMOIL/LTQxE2rVuCWMdCKMSAuTVEQw55ZyBCompr+KhABCRIdMTDWFON/mIN
         0tVA==
X-Gm-Message-State: ABy/qLY5Zzgty2c3iI93A/ueiXoKHHjEM7T1daMngIPAxmhyLsQ3gSE9
        YzzPK6jBpq6OooIJ2NvRbLrDSA==
X-Google-Smtp-Source: APBJJlHYiTYghZ8lRE0BlmpMRWpmX7B6Hk6Acw5gNjaSSY+PfA0RFMceJZLm/WVODd2nENY/KAlzlA==
X-Received: by 2002:a05:6512:110e:b0:4fb:7f45:bcb6 with SMTP id l14-20020a056512110e00b004fb7f45bcb6mr1223425lfg.16.1689199521563;
        Wed, 12 Jul 2023 15:05:21 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r12-20020a19ac4c000000b004f87893ce21sm869646lfc.3.2023.07.12.15.05.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 15:05:21 -0700 (PDT)
Message-ID: <b4a5291e-6925-829f-a690-7384786fbd88@linaro.org>
Date:   Thu, 13 Jul 2023 01:05:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/8] drm/msm/mdss: correct UBWC programming for SM8550
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
 <20230712121145.1994830-3-dmitry.baryshkov@linaro.org>
 <9744c1a3-1e13-0c73-9add-4651c0401f8a@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9744c1a3-1e13-0c73-9add-4651c0401f8a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/07/2023 01:02, Abhinav Kumar wrote:
> 
> 
> On 7/12/2023 5:11 AM, Dmitry Baryshkov wrote:
>> The SM8550 platform employs newer UBWC decoder, which requires slightly
>> different programming.
>>
>> Fixes: a2f33995c19d ("drm/msm: mdss: add support for SM8550")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Do we also need another fixes tag
> 
> Fixes: d68db6069a8e ("drm/msm/mdss: convert UBWC setup to use match data")

No. We do not need to fix the conversion. Only the sm8550 setup.

> 
> Also, this was previously part of 
> https://patchwork.freedesktop.org/series/118074/ .
> 
> In this one its after the bindings change.
> 
> For easier picking into -fixes, will you be moving this ahead of the 
> bindings change and OR do you want to keep this part of the old series 
> as it seems better suited there.
> 
> I think even if I pick this for -fixes, rest of this series can be 
> rebased without issues. But let me know what you would prefer.


I had rejects with the original series (and 0 reviews), so it was easier 
to push that as a part of this series too.

I'm fine with you pulling either of the patches into -fixes.

-- 
With best wishes
Dmitry

