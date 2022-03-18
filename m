Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C31204DD1CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 01:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbiCRANe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 20:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiCRANd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 20:13:33 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7B714147B
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:12:14 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id r13so13999853ejd.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GlfqT3gCisJBMTAg9owO2Ux8q0knKebgrHQt0YZbpxI=;
        b=nBDhznL6GSZim3PdexrPGQqpwQ4fFBAapWTmPPNrAt0uN427dmLC1mJrI8HXE1C1kx
         upaggKMpoTVkewUUN8f4G2ccK2tUnREtzjnOO9fkjvE2aXhO73VuvMgL2JxHG1mUNou7
         E4BgOMO9zLLV6AZpoxwm0FAG5//90kHjahP1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GlfqT3gCisJBMTAg9owO2Ux8q0knKebgrHQt0YZbpxI=;
        b=7iwYK1AJmSvfzCqoxD1kIFkwxy/4/LuNadlFa8HZojfXVvt+nHvlJL+o7sdAtmt61b
         PRrlkvlhdWqWPBikfvvxotb8D11X+xQEdNTewY0uoMaf2F6qind2/VOpbKO3fXlJjVP1
         cdM3/LdQYvcbFvdYwszgXgPMR4nNbdA28wnK9g+bPxAE5sOIHK6RpkuBqBq1Hc0S1Qkh
         FN2MQkcZ3J/j9bk4A5ZJ7uBDf3xtvDo6dZ5NFpWSv5GYeTlheRABhrrhGUjDSwRx0Yzo
         SHk0E3bdLF3lYn1w8lZwv9nu87ReLBrU/A6OWXxo6SVhh9XeO0h8K0YkXZNeTyh/dlVJ
         IouQ==
X-Gm-Message-State: AOAM532wHn3IqmU268mAJw1awCBzyM2F7+iW01PI7Jk+BSj0uiLVfKi4
        MSKdzuRqmUb8A91r2zSkhDvhWZl9LbXXsqUbB2I=
X-Google-Smtp-Source: ABdhPJxznTX9+YEqYBTgJa5vqmzaWY2jT3EZM2ToPWbPfBhqmagRPX3VmEX3/iCO6lw2TiihHyqq9g==
X-Received: by 2002:a17:906:5006:b0:6ce:3762:c72e with SMTP id s6-20020a170906500600b006ce3762c72emr6778548ejj.30.1647562332797;
        Thu, 17 Mar 2022 17:12:12 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id eg28-20020a056402289c00b00418e989edf3sm3186003edb.87.2022.03.17.17.12.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 17:12:12 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id b19so9609523wrh.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:12:12 -0700 (PDT)
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr6191933wrs.301.1647562331786; Thu, 17
 Mar 2022 17:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com> <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Mar 2022 17:11:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4SWtyz4fFEmvKD_N-2ioS4R65UDZRU7utQm=0CSzp=g@mail.gmail.com>
Message-ID: <CAD=FV=V4SWtyz4fFEmvKD_N-2ioS4R65UDZRU7utQm=0CSzp=g@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        quic_kalyant <quic_kalyant@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Mar 14, 2022 at 7:47 AM Vinod Polimera
<quic_vpolimer@quicinc.com> wrote:
>
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.
>
> Fixes: 25fdd5933("drm/msm: Add SDM845 DPU support")

The "Fixes:" format is a little wrong. Should have more digits and a
space before the parenthesis. AKA:

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

This looks good to me now other than the bad Fixes tag. I presume
you'll want to spin with the extra verbosity in the CL description
that Stephen asked for, though.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
