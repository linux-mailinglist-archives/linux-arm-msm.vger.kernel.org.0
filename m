Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 581494C9163
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Mar 2022 18:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236468AbiCARWU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Mar 2022 12:22:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236472AbiCARWT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Mar 2022 12:22:19 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E164B24F16
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Mar 2022 09:21:37 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id kt27so3798961ejb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 09:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4kKl8QGooJd4blFxXWK5FL64wYyB/9eBiL1aDG5cnC0=;
        b=NqTQCDYuexrHCqcYN7yvD/vWOHnaDLIia6bWQYHUYOxhWU+2MBAr1DuF9IxxVWG9NL
         4jk0G1dPP/rlDhCuRgrHzmPRTrAlRVIOMzIAnl2X8fogbZf3su4YMFi6ImkUUtRjCRQN
         4m/umqkWZpXsYVobFC0jDrwgo09g8qIg5Lm5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4kKl8QGooJd4blFxXWK5FL64wYyB/9eBiL1aDG5cnC0=;
        b=geDBLKm10BK3NRDf2Nr21mJL1eQbId900YzjsLGz+yNQQqzC0CaRVWHsXVbyVMkfQh
         9GOVy4JuWh49LahQB3RU4MAxN/ssF1saMwzI7mgusNJvurweczVb1AmON/yd1GWimny7
         v2IxVKMucwio4xUZ1p9UM+t9QctO9nY8Ti+ZuTFbxl86OvhulMMjKfb9Jyw1IB/e4EJg
         x/UfOZX2ptxutzfPdph6/Z45PndxXxKmfpdwvvisxoAVmvlqJDrDeaFE7rcOBrCXKRFq
         g+YAmZrq3zj3WeabGN9897vLo4do/rH5hLCvd0vhOBmVFt6meoPwt3F+FhLRfU/Oklxq
         pbeQ==
X-Gm-Message-State: AOAM530jP03Jc2eKXPjJSIH7701W3UAWVQC64YYzwubQXFrSE/5BoYsR
        JIBSZtI2hrJXe5xAQmJkRLwzRA8EuxYwF/i/
X-Google-Smtp-Source: ABdhPJzRq3XL8nH0xd5Vjlm5okpN51SfRelLUN4fUor3N0Xv6ECEsSbA/KxmfPAymn/veSk6RemRJA==
X-Received: by 2002:a17:906:4c4f:b0:6ce:412:1368 with SMTP id d15-20020a1709064c4f00b006ce04121368mr19572480ejw.496.1646155296193;
        Tue, 01 Mar 2022 09:21:36 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id g21-20020a056402115500b00413c824e422sm2159555edw.72.2022.03.01.09.21.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 09:21:34 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id e10so4053339wro.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Mar 2022 09:21:34 -0800 (PST)
X-Received: by 2002:a5d:64ea:0:b0:1ea:8148:6b97 with SMTP id
 g10-20020a5d64ea000000b001ea81486b97mr19720919wri.679.1646155293603; Tue, 01
 Mar 2022 09:21:33 -0800 (PST)
MIME-Version: 1.0
References: <1645509309-16142-1-git-send-email-quic_c_skakit@quicinc.com> <1645509309-16142-3-git-send-email-quic_c_skakit@quicinc.com>
In-Reply-To: <1645509309-16142-3-git-send-email-quic_c_skakit@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 1 Mar 2022 09:21:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xj377iCjfXz-MA31y7+=nMMH8bsP4ZC13ao0BOCfNd4A@mail.gmail.com>
Message-ID: <CAD=FV=Xj377iCjfXz-MA31y7+=nMMH8bsP4ZC13ao0BOCfNd4A@mail.gmail.com>
Subject: Re: [PATCH V4 2/4] leds: Add pm8350c support to Qualcomm LPG driver
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-leds@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Feb 21, 2022 at 9:55 PM Satya Priya <quic_c_skakit@quicinc.com> wrote:
>
> Add pm8350c compatible and lpg_data to the driver.
>
> Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes in V2:
>  - Added const for lpg_channel_data[] struct.
>
> Changes in V3:
>  - Correct the num_channels and add respective base addresses.
>
> Changes in V4:
>  - Remove .pwm_9bit_mask, add .triled_base and .triled_mask.
>
>  drivers/leds/rgb/leds-qcom-lpg.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Tested-by: Douglas Anderson <dianders@chromium.org>

I'm very interested in knowing if there's anything blocking this patch
(and the one from Bjorn that it depends on) from landing. Thanks! :-)

-Doug
