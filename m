Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80126490C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 21:56:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiLJUz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 15:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiLJUz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 15:55:58 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C32165B7
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:55:57 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id e141so9483994ybh.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 12:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SZeQyqNZ85QEZ2stK38vl0ToRIeR3UnTtNHAPHqdWe4=;
        b=B6rHZi+/smDbR7PCWbo4JBRvfuGTT/oKHGbl3EFU761uvZK64Z0588wauzzd18ks4v
         DWF5WkjZgXdFfm15qGQPcdVVEDwOMApv0uX84rMeDZSXzGVScmw/txf81H6XfMX0Euct
         LKbgn1CTTksq6fz04s9c2ZPErFpHnYOH4LCLCQz1cQCd0F97w1BgQQCYrKdTtqPyP8bn
         CunEuMQW+GMIvoDLXAyv6MaJOzIVTgBKDNlw+rxR6cD9fbl1g5qxM4V9rRqLZR8bXjJe
         lcDfUG5d1bCkxnfkk5bH4CB+EOLpDzdsXbbcAl1pW2cpcQuAJq9JdOI8avflMEfKMW6s
         bvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZeQyqNZ85QEZ2stK38vl0ToRIeR3UnTtNHAPHqdWe4=;
        b=X5htpIxK1yMLzZ/CThQGJjOBUtm5mrr3gE+wBEYNPg0zajtJTW6L3geWpXPyt5m/J8
         IMj7J9t+H9lzHdCLXqwbXmnj7qsJUnJXdomKFzoQ4qHc/G64GdqvmCuVlW0Nrd3+kZCy
         XintlmsKTjATOHS4IVjTBdQ1dyU1l52Jt/ABIUkgX61EubRO1c1LqPsEn5ZuU456bWKX
         lt3lkj9TFSO2vBuZs6i5CNMOtFydqOGW6FJRKnKKeWKMNnBBW02eO+41qBpGDkwr2iR0
         PMXPjW4JxkLwyMCvM2Tmc9GEaDEQhL5t8mxV2iGvNu8NjFjhYSXY+raAxUD/hI8A/ZMd
         uoaA==
X-Gm-Message-State: ANoB5pk6biz10BW4iJU1Ax5abd5Q6z2yvFL6t9vH3gGz894yLaX/bjLt
        C0DeOlfoP9eqp1zhUAXWyiyo7YEO9RhAdn0MNcz7rs1I7/V4Ow==
X-Google-Smtp-Source: AA0mqf6AI2wmmnOBHwdbGf7xvlRYk0y5l327R4/JmsoS71DS+nSRKOpsApqQBxFaFqz+DADuI+zv0o48RhECAA0Am+0=
X-Received: by 2002:a25:8c9:0:b0:6f8:9c91:4503 with SMTP id
 192-20020a2508c9000000b006f89c914503mr40983001ybi.15.1670705757148; Sat, 10
 Dec 2022 12:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20221210200353.418391-1-konrad.dybcio@linaro.org>
In-Reply-To: <20221210200353.418391-1-konrad.dybcio@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 10 Dec 2022 23:55:46 +0300
Message-ID: <CAA8EJpoZjdOURyFEeO2umPrZp4WO=dRvhYK_3JPviGVOBJCfiA@mail.gmail.com>
Subject: Re: [PATCH 0/5] MSM8996 eMMC boot fix
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        marijn.suijten@somainline.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 10 Dec 2022 at 23:04, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> In a very unfortunate turn of events, enabling interconnect on non-UFS
> devices (or more precisely devices-with-UFS-clocks-disabled-from-
> bootloader) crashes the device, as a memory read to an unlocked peripheral
> is attempted. This series tries to fix that with the least amount of
> casualties..

I worked around the icc issues by disabling sync_state. But your
change is definitely better. I'll have to check if there are any other
omissions in the driver.
Thanks for finding this!

>
> Konrad Dybcio (5):
>   dt-bindings: interconnect: Add UFS clocks to MSM8996 A2NoC
>   interconnect: qcom: msm8996: Provide UFS clocks to A2NoC
>   interconnect: qcom: msm8996: Fix regmap max_register values
>   interconnect: qcom: rpm: Use _optional func for provider clocks
>   arm64: dts: qcom: msm8996: Add additional A2NoC clocks
>
>  .../bindings/interconnect/qcom,rpm.yaml       | 24 ++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |  6 +++--
>  drivers/interconnect/qcom/icc-rpm.c           |  2 +-
>  drivers/interconnect/qcom/msm8996.c           | 19 +++++++++++----
>  4 files changed, 42 insertions(+), 9 deletions(-)
>
> --
> 2.38.1
>


-- 
With best wishes
Dmitry
