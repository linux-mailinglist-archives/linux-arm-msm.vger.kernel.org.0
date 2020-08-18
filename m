Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2AF6248868
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 16:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgHRO57 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 10:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727811AbgHRO5y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 10:57:54 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94198C061343
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 07:57:53 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id p8so10237379vsm.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 07:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TV7ie8YQzzCwxQWHVrIBTQKXy/oaWTjxbImglzQ6zZQ=;
        b=hbGVRH3BGMrwNufK6iwkScF4wgv806ZBXZDcJCRIPddAOmGq1Fm5FWiW+VdokAM2/+
         +w/sFtvsijDh0eHR69yXym0B1iwEHzEHK8Az8EdNtFj0/mTzzi9Iw0FtnpbQ2F7eIIX8
         voFTbtK4Bux+4SL0ScZh+F4IRH5ehPrmv6wyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TV7ie8YQzzCwxQWHVrIBTQKXy/oaWTjxbImglzQ6zZQ=;
        b=gPwtCsHYok+nv/nrHCGe88yhM0p5knue8msvHFTqkfHXAONvjPws0XCkskU9/7xH/G
         3hD3L6awOzn/J6aMJv9hqshUCmgEsjM4u0SWVL/l81MJQGND40TdrvpY3kfvG9OhZy4N
         gqmsg3O0W5frgKwpyWqmwewnW4ZnEu6rcxQ0c2aowVX6EdY5oKiXRJxN4+JWaPYGOJOR
         krOZ0N2bKBnvgokswky4+iNQ74izo5lsox9JHD7MTIzl08x8griRRBxJvQN7DHWyo+7c
         CbUeE1IpoJ/ByeXA+T4QE0feZo9Sy/Zj8v2f6FNqTAzyFFQakcosD3W20CgezWZw+cxa
         vVgA==
X-Gm-Message-State: AOAM5322NPUes7h1mq6slICll4wB8PyyhRFXeQ1REGRATBDJ8Hrbt2ed
        U2Ur7JXqV5tsCkMkqrKOsL3Vx1kSAYIV7Q==
X-Google-Smtp-Source: ABdhPJz3TL/80a/rGGdSJSy7TlY+qJNx7FZSMsWlja/34tAWfxNmD9EVmZVspZLWsqhi7CGBEJ0L2Q==
X-Received: by 2002:a67:7d8b:: with SMTP id y133mr12438944vsc.87.1597762671128;
        Tue, 18 Aug 2020 07:57:51 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id o17sm1793300vsq.20.2020.08.18.07.57.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2020 07:57:50 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id k1so4374253vkb.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 07:57:50 -0700 (PDT)
X-Received: by 2002:a1f:a302:: with SMTP id m2mr12131702vke.28.1597762669752;
 Tue, 18 Aug 2020 07:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200818145514.16262-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200818145514.16262-1-saiprakash.ranjan@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 18 Aug 2020 07:57:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vzk=qkemLRU3gaZ1K4P-9=tMqB+HUoGCQL4Zxv6q8XFQ@mail.gmail.com>
Message-ID: <CAD=FV=Vzk=qkemLRU3gaZ1K4P-9=tMqB+HUoGCQL4Zxv6q8XFQ@mail.gmail.com>
Subject: Re: [PATCHv2] arm64: dts: qcom: sc7180: Fix the LLCC base register size
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


On Tue, Aug 18, 2020 at 7:55 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> There is one LLCC logical bank(LLCC0) on SC7180 SoC and the
> size of the LLCC0 base is 0x50000(320KB) not 2MB, so correct
> the size and fix copy paste mistake carried over from SDM845.
>
> Fixes: 7cee5c742899 ("arm64: dts: qcom: sc7180: Fix node order")
> Fixes: c831fa299996 ("arm64: dts: qcom: sc7180: Add Last level cache controller node")
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>
> Changes in v2:
>  * Edit commit msg to remove confusing references (Doug).
>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I can't validate against any datasheets, but it does what it says and
seems sane.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
