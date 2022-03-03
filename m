Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2952F4CB894
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 09:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbiCCIUe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 03:20:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiCCIUd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 03:20:33 -0500
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A48F1171843
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 00:19:48 -0800 (PST)
Received: by mail-qt1-x835.google.com with SMTP id bt3so4000491qtb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 00:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eBbghWmyN77JF7RUpoIN9lkaA23tcjbHORN7ZoYwWzA=;
        b=O33UcScGamI/CbJS2qdYJFMnkoGyvajYHAEDnA1q32GaQGdYlOFF7E/Wu4I2A6awOB
         8kHS3FMUK2LE41rzxdVjPjRD9UKIjJgcB730BEVO9EFbgrwPgXVRpI2j0WITQtJrjn4v
         cVeafQ/DY+JzVcs8qekyK+4EZn/xF0kAVhJNY0eX56zgfPsIpB3vQ92roJgu8daAvomr
         fL6PV8jZKzTYn+t2bn9N/tWswi4bxc71DF6zMvRz50BOSDS/whVmIdG4MoA4nBKNmwEI
         ENNeJnXecQxETQlmR0yjeMH6vWpP18HnOa30Jt3D8T1DHzWE5IQIAuA4+FGcjHqlBSxf
         zAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eBbghWmyN77JF7RUpoIN9lkaA23tcjbHORN7ZoYwWzA=;
        b=rLU+SsuPEz5QqgzvqyCVz+tGyk82uZuhHyHMGuXsew0LlI4sUCJSrqlFWD8F/UzMJI
         eEhrWUWNyIjfHwccoDbL48NHUp7/6GEbSY9BkttcvNiuZxBpeMgrP8QV/WKy+cJqxjaW
         gwTcdO7u1TAuXdWnTggD5Er+T5NXD4TmtoeoxuNmq1EfCea2T42TQWYdv8obLCXNRVds
         rhdENBfty5QF9P8f8EIncwl2mfd6cgFiiOgM9XS2XuEz6JaYEmGaRlUs6Kj4OBO6Ybqq
         QqOzsYlxYm9WsIiS8z2KX+Nu8Qp2nISwFxWGdEYgFPy7fx+Wxz8+r4jCHW7vSXrA5rhT
         q4MQ==
X-Gm-Message-State: AOAM5315suE/WK++0yhCKRv4R0R1PUlaZ7/bB3C8dqL+tVXi+dMNNRrE
        MX1sYBxPSzA6xao0n7i0G8Rf+sRmjlt+cgggDJAyXA==
X-Google-Smtp-Source: ABdhPJzwybpbRKv/JsGwbbxWqXiPUR4uibbx0YjX5VRLF4ZSmc8ArqQjtlAMg4s/pfikPz32DA/3T3dwuz1Doz+bPUQ=
X-Received: by 2002:ac8:5713:0:b0:2de:4e16:5b25 with SMTP id
 19-20020ac85713000000b002de4e165b25mr26214309qtw.682.1646295587875; Thu, 03
 Mar 2022 00:19:47 -0800 (PST)
MIME-Version: 1.0
References: <1646294904-4753-1-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646294904-4753-1-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 3 Mar 2022 11:19:36 +0300
Message-ID: <CAA8EJppbk+yCmVgRbUNBn+BO09xDZe93RXK_cUxbX9HZM9ZXmw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Update mdp clk to max supported value to support
 higher refresh rates
To:     Vinod Polimera <quic_vpolimer@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 3 Mar 2022 at 11:08, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> *** BLURB HERE ***

Description, dependencies, etc?

>
> Vinod Polimera (3):
>   arm64/dts/qcom/sc7280: remove assigned-clock-rate property for mdp clk
>   arm64/dts/qcom/sc7180: remove assigned-clock-rate property for mdp clk
>   arm64/dts/qcom/sdm845: remove assigned-clock-rate property for mdp clk

sm8250.dtsi is missing

>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++-------
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 ++-------
>  3 files changed, 6 insertions(+), 21 deletions(-)
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
