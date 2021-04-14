Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB63C35F8A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 18:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352574AbhDNQGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 12:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351355AbhDNQGw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 12:06:52 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61DCBC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 09:06:31 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id gv2so836423qvb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 09:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uZIynOl5S9PWv+18lOmfNH2BL9+Oyq9vFWeC4p/w5Qw=;
        b=OEdO0XHopW8xPb0NU074ksvfzMlibiJTmTeEa6P9neR+J1F3ysRqNz5DEUvyc+R+nx
         DU1sauOTDTuTcbsbBSsdlHCMCvIQ/HsUEBSChQFuMXrj4r3AoczWQrlRsKlw6W1w6bly
         zrmNyhIXzeqScD5pyY3L6fwwgpiL87+YxR3nI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uZIynOl5S9PWv+18lOmfNH2BL9+Oyq9vFWeC4p/w5Qw=;
        b=e9b69BYzcGiNoln+PwzdHH0Y/S6AzbYznMeE/zEDTiZua1cjSafHWkG5G8jl4nkveW
         O+JVqqZixRWXEJ7gIMGElSm+DF2Yp7LrX3RLZqHnqLPzX0fKxq7EV8OrVQ1Ist6okqZ3
         CbNxN4HGcPW1wLIRwuwopRVV3YkymFqi1jUbGYOy7gNjGuOlcbFVYp1wOZ7ttsUuf5ke
         UtsSMRBY7voEt133nRmDxlzwINbt96ACfjwJTIgdyhjDWzPvUPitg8if2Eg+78rVUzn+
         372g13bmDiW0l9rXC/cUOIZYv7q2xjAmEbWPcfHdoj46t7Z/9D+5gvpmBTx4saePCWKy
         +yow==
X-Gm-Message-State: AOAM531EcSC9XBHpO8PDFE/nVybg4h6J5HYY8WEhHFZsUhhNdB99RiOg
        TNjc8Z4WMvGYfiM55jrTQH+AdvhBe9e8+g==
X-Google-Smtp-Source: ABdhPJzk7Dcl7c4v7Put6pl39n7H1QwIWmCMmqD0cUfr+3THX5aF3L67X2umWYNmmjUAMC8gs8a3Zg==
X-Received: by 2002:a05:6214:ace:: with SMTP id g14mr12505986qvi.43.1618416390459;
        Wed, 14 Apr 2021 09:06:30 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id m17sm12469884qkh.82.2021.04.14.09.06.28
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 09:06:28 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id v3so20367540ybi.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 09:06:28 -0700 (PDT)
X-Received: by 2002:a25:6088:: with SMTP id u130mr54612485ybb.257.1618416388154;
 Wed, 14 Apr 2021 09:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210315103836.1.I9a97120319d43b42353aeac4d348624d60687df7@changeid>
In-Reply-To: <20210315103836.1.I9a97120319d43b42353aeac4d348624d60687df7@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Apr 2021 09:06:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U7KTaK+058+WTOjiZ5Pze30GLPXUS6SCDi_uuxhBX3Ow@mail.gmail.com>
Message-ID: <CAD=FV=U7KTaK+058+WTOjiZ5Pze30GLPXUS6SCDi_uuxhBX3Ow@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Fix sc7180-qmp-usb3-dp-phy reg sizes
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn,

On Mon, Mar 15, 2021 at 10:39 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> As per Dmitry Baryshkov [1]:
> a) The 2nd "reg" should be 0x3c because "Offset 0x38 is
>    USB3_DP_COM_REVISION_ID3 (not used by the current driver though)."
> b) The 3rd "reg" "is a serdes region and qmp_v3_dp_serdes_tbl contains
>    registers 0x148 and 0x154."
>
> I think because the 3rd "reg" is a serdes region we should just use
> the same size as the 1st "reg"?
>
> [1] https://lore.kernel.org/r/ee5695bb-a603-0dd5-7a7f-695e919b1af1@linaro.org
>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Vara Reddy <varar@codeaurora.org>
> Cc: Tanmay Shah <tanmay@codeaurora.org>
> Cc: Rob Clark <robdclark@chromium.org>
> Fixes: 58fd7ae621e7 ("arm64: dts: qcom: sc7180: Update dts for DP phy inside QMP phy")
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Another wayward patch that got lost. Could you add it to your 5.14
queue? It's not very urgent but it'd be nice to clean it up
eventually.

-Doug
