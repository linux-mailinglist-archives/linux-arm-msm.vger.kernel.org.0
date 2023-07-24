Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDD275F3B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 12:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbjGXKoW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 06:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjGXKoV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 06:44:21 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4203E6
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 03:44:18 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fa48b5dc2eso6178185e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690195457; x=1690800257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BBI9kM5NnGdYn3nIC1ZBkTtviA4H3pLeU5dB7m6uf+g=;
        b=JnPWYhSC4MPaMfPt85IQQAx/UOfIv4PMdpx1qNFUd6csIjn9rgeV0BX7HQhbyyLkT2
         GWsIdxMw3EQwA570Mkclmm8rD9dzHMZZ87zT5UtLFr49J2XcI4okl4cYK9SFNkGahPsg
         G0gLDzJBKlGaZu2lLEucdE3JUVG2DxLq2hu9v680oR5Hy2SUB5jHgxumvAZw7WROR89A
         HpmE/QhE6wW0QHC3D9Km1l8/7Xv3lOvEYmuN8sN+qwUAc78f3iPIruzkcI57MOyB9X/O
         WVQCwVOvu39vd6Lx5b6wtMJviasBmCVyroiEhjwfCXtsfimi0x0FiP+hmdg4ORYFA/oM
         N6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690195457; x=1690800257;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BBI9kM5NnGdYn3nIC1ZBkTtviA4H3pLeU5dB7m6uf+g=;
        b=h+46JFHzaD2O5XFgGrQ5W7jeHVl6KhLZTE3au9/9bzOUh2xTRF8EPOArROuK+ElhBN
         33xAkqTrcWZ+x5eUcxmUw0ABi/KQBuymUUlt8z+dBXLKagEAPXfoEGURVV+49hEQ9nQp
         sFHxOjdWsHmSrIT4YXb1IViHq72EJ+5UvAjFKfwJ6eUTZaT4p+zCG/BPGEpOHROHJuq0
         NHoBIZPzKT3To+dwUFTHG236+tp+ogDnTxPw9QCK5Ad/WZH+4llYky9LkK/JbdcMV3++
         KLzpjK2cly+fuz8zcxJ+wII3a0tHzUxfGmqKFjKwIiF81ATpHnIauaiJ38jWc1jhdsgW
         7ZxA==
X-Gm-Message-State: ABy/qLb4kky2lg5YVGB3FqoCcGi1J+cSozc2BI3h4o6fINQ3aLqprIsy
        nKTc+wtusPe24AIo+3MyUdDMMw==
X-Google-Smtp-Source: APBJJlGH0BFLTMfOfJFp6DXr/KIrJISsrZB2/U65xfegxRJbSLfokCGQZDPk/t0kXSJZC9iYEG/n0A==
X-Received: by 2002:a19:ca5a:0:b0:4fd:d862:72a6 with SMTP id h26-20020a19ca5a000000b004fdd86272a6mr4558720lfj.53.1690195457091;
        Mon, 24 Jul 2023 03:44:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r8-20020a19ac48000000b004fdf4053786sm780255lfc.240.2023.07.24.03.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 03:44:16 -0700 (PDT)
Message-ID: <f3aaee16-edfd-6b2e-6c47-de48ec572609@linaro.org>
Date:   Mon, 24 Jul 2023 13:44:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable DP support
Content-Language: en-GB
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <yjr3i54z4ddifn7y6ls65h65su54xtuzx3gvibw6ld4x27fd7x@ganmrdp4vzx7>
 <0075783f-9166-89aa-a9f9-068494e468e3@linaro.org>
 <vo7boshin545hx27ov3rrkhbglkf42f7yl5r5geltqyqw3lmol@icdicnqvrvrx>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <vo7boshin545hx27ov3rrkhbglkf42f7yl5r5geltqyqw3lmol@icdicnqvrvrx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/07/2023 05:49, Bjorn Andersson wrote:
> On Tue, Jul 18, 2023 at 09:09:41AM +0300, Dmitry Baryshkov wrote:
>> On 18/07/2023 07:37, Bjorn Andersson wrote:
>>> On Sun, Jul 09, 2023 at 07:19:21AM +0300, Dmitry Baryshkov wrote:
>>>> Implement DisplayPort support for the Qualcomm RB5 platform.
>>>>
>>>> Note: while testing this, I had link training issues with several
>>>> dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
>>>> or VGA connectors) work perfectly.
>>>>
>>>> Dependencies: [1]
>>>> Soft-dependencies: [2], [3]
>>>>
>>>> [1] https://lore.kernel.org/linux-arm-msm/20230515133643.3621656-1-bryan.odonoghue@linaro.org/
>>>
>>> I'm not able to find a version of this series ready to be merged, can
>>> you please help me find it?
>>
>> This = Bryan's? I have posted some (small) feedback regarding v8. You also
>> had issues with orientation switching bindings, etc. So there should be v9.
>>
> 
> Right, Bryan's series. You linked to v8 which has requests for changes,
> and I can't find v9. Am I just bad at searching?
> 

I think v9 has never been sent.

-- 
With best wishes
Dmitry

