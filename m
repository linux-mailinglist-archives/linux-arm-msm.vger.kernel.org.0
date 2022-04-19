Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C63E507055
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 16:28:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353282AbiDSObI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 10:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350775AbiDSObH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 10:31:07 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D3BE0CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 07:28:25 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id v4so21494614edl.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 07:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5snmPtDHGIGoFLwIYFGnYkPTgTDRFy3yrXSk8RuXhBw=;
        b=RyaK5z0senBGYKHrGTylo+K2ugRhGTPqMnF4qLnrgyVkDI+tdjmEz5eOzR0Y1AW6QU
         y1zPZmrNqRLvm0vTSqh+xmmubISocvwjC4qL1JKLlSIvglE/JhI/7doQ6ENEmXj3Clrj
         zYxT/lkQ+Dzv5Oo+hLcoDdnTp0p5Kfr/Kplng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5snmPtDHGIGoFLwIYFGnYkPTgTDRFy3yrXSk8RuXhBw=;
        b=DTxkXCi2DaMjnG39YPM+9yFSWJLP6mFQuwdW4AyOvcQOSMkLtJIZUe+qIHHY3kxuyC
         B1d/ADQxfMlGaoi2R0zsO0ka9in/Pn56E2nORH+xUULwW0xRLvoTmwuRTd6shb/IfLvx
         7KAW5NQr2Ny10uUV46qgodm0iDv/JdXrwwQJ/Ij/7uQ0Ts3qc7VtLn5ZHWw0ocFOyvi2
         VhE6i8NE5GEluhNkGXz52dJWmFIn7QCSnYlvgCvpjfj4JVm/tnSFNU1BlEAmVf4Nue0O
         BnO3ew8VZ3BYgeXOvfFS9Z6nXsIZmAEb+mIE7WyodPujdSS2OnLq8nL1no/0Nm9EYQln
         945Q==
X-Gm-Message-State: AOAM532OXsgifAw2X5fE5NkGXjAn9rNXWLWzrl5xU1ZVEVcDA7ikQVRG
        DzYUXjCY8g/W8yoj44mdvr5F6IFl+cCa2F75
X-Google-Smtp-Source: ABdhPJxeGInYR6jRIHTSoNBz828ky6zpxFkW2SLdV1euihA4SEpnVw6Lh7Pu9zya81CXVAxqHxFVZQ==
X-Received: by 2002:a05:6402:e85:b0:41d:121b:f436 with SMTP id h5-20020a0564020e8500b0041d121bf436mr17811625eda.121.1650378503731;
        Tue, 19 Apr 2022 07:28:23 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id k15-20020a50ce4f000000b00420119333c1sm8722479edj.62.2022.04.19.07.28.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 07:28:22 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id x3so10778237wmj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 07:28:22 -0700 (PDT)
X-Received: by 2002:a05:600c:210b:b0:38e:c62a:398b with SMTP id
 u11-20020a05600c210b00b0038ec62a398bmr20157535wml.118.1650378502020; Tue, 19
 Apr 2022 07:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <1650349697-13540-1-git-send-email-quic_vnivarth@quicinc.com> <1650349697-13540-2-git-send-email-quic_vnivarth@quicinc.com>
In-Reply-To: <1650349697-13540-2-git-send-email-quic_vnivarth@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 19 Apr 2022 07:28:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XYduCsrzKYRUR18y+OfJCrjdbDErSPEtz0bYF_VXbMPA@mail.gmail.com>
Message-ID: <CAD=FV=XYduCsrzKYRUR18y+OfJCrjdbDErSPEtz0bYF_VXbMPA@mail.gmail.com>
Subject: Re: [V4 1/2] arch: arm64: dts: qcom: sc7280-idp: Configure cts
 pinctrl to bias-bus-hold
To:     Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        quic_msavaliy@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Apr 18, 2022 at 11:28 PM Vijaya Krishna Nivarthi
<quic_vnivarth@quicinc.com> wrote:
>
> WLAN rail was leaking power during RBSC/sleep even after turning BT off.
> Change sleep pinctrl configuration to handle same.
>
> Signed-off-by: Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
> ---
> v4: modify subject of patch to indicate file it is applying to
> v3: apply same change to active state and other sc7280*.dts* as well
> v2: used bias-bus-hold as per review comments
> v1: intial patch used bias-disable for sleep pinctrl in sc7280-idp only
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

You should have carried my tag forward. In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
