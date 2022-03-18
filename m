Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 063724DD1CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Mar 2022 01:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231126AbiCRAOm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 20:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbiCRAOl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 20:14:41 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753C919BE4F
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:13:23 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id w12so11645029lfr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d1Z8nI+f/X46wuhlEeKlYiI7DuyLSgelQdOIPC94sVc=;
        b=dq9FFRkofEvY/IQ16q22b9/GAC3XOlX/hWO2uBaym9wfsa21t2RqyXXsmcT4+ouP96
         sP5cckwa32YJttSDlHHjJtcORahNzuY8gpmwhPkulTeNBPqbWSAOutMIuIyMEvN2fd/q
         cw6DsfvWgKS9sZLyHWDTyO4TD4lLr/+JK5JXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d1Z8nI+f/X46wuhlEeKlYiI7DuyLSgelQdOIPC94sVc=;
        b=aBxsA2x8kMGnlSJvIj5we5ihd6BR3k3skvwXxmTOtkbwWvRFprzpPwecp5xLPOjtW8
         RSA/NW0hJjUXbJQYJ1hgIuQEW30bdMVv3FxfRApO9cHeJ5jUZhQRq6Z8V/uwNW5jyEun
         twu8bYr/zOeKSmdeMP5s1wMnzdA7TH4+TfrI5QjX5B9AYdud97vV6K/660ohvNZI7/YL
         BP5QqAzPmKAJAU7JrP63+109p05QHaJr/CcfnYtA8IG1KUGIHXerQ8SlUt6Kj/r/MbEh
         e8VOktlw2twmhKUYtzsas3CojpYieNz5XiEBM+2cdU3Hd5+UFYQg7xmv13UMtxaVOXpG
         nwew==
X-Gm-Message-State: AOAM531Jxgg5OqGmI9UmkASfzYg/bsuW1eA+Oh+/YgTnAR9AymINAS9G
        tnlBm7R/Q274vr45q0nc83hTprK3/Z02TYUEkJQ=
X-Google-Smtp-Source: ABdhPJwwvh/hgpOOqyxSerQYeqlUTIazLX3wzis5FVnURt3nvWauqFCZyWmIrDBdrfIWpXp8YyQl+g==
X-Received: by 2002:a17:907:1c8c:b0:6d8:795b:b458 with SMTP id nb12-20020a1709071c8c00b006d8795bb458mr6569543ejc.706.1647562390734;
        Thu, 17 Mar 2022 17:13:10 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id ec21-20020a170906b6d500b006d170a3444csm2968287ejb.164.2022.03.17.17.13.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 17:13:09 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id r10so9665434wrp.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 17:13:09 -0700 (PDT)
X-Received: by 2002:a5d:53c6:0:b0:203:ee27:12ff with SMTP id
 a6-20020a5d53c6000000b00203ee2712ffmr3723782wrw.422.1647562388738; Thu, 17
 Mar 2022 17:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com> <1647269217-14064-6-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-6-git-send-email-quic_vpolimer@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 17 Mar 2022 17:12:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U6VfmGMYk6PeJa6y6P1-FsbKVjzD4tVGxnqMdEVY9n8Q@mail.gmail.com>
Message-ID: <CAD=FV=U6VfmGMYk6PeJa6y6P1-FsbKVjzD4tVGxnqMdEVY9n8Q@mail.gmail.com>
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: sm8250: remove
 assigned-clock-rate property for mdp clk
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> This patch is dependent on below patch
> https://patchwork.kernel.org/patch/12774067/
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Similar comments to patch #2 about the commit message, but otherwise:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
