Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E42BE23BD63
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 17:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728597AbgHDPmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 11:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgHDPmK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 11:42:10 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845D3C06174A;
        Tue,  4 Aug 2020 08:42:09 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id c2so24365495edx.8;
        Tue, 04 Aug 2020 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G7TWxU3RrpRjJxbp4gq/13lUnFREHVtoNcL++CjhnMk=;
        b=esM63yMeDOa9kxDHU3HwnQXBgFY03PDyLbgTuKbQKFYMkCuVWb4LLj/+fynZ6g6SBJ
         6eu0Gicqk0VlH6PeWt0sV+AYteVRl4mfmIxoOguGp0cCOHbbLI7xSAccIXgb6EixkACD
         9fhBu2QD3Z5pvLxUo/rc/O/fk6jY0JJSN0Tmno+fvKhMLmopa90JY9q9q2xtAQeZpkUk
         bIP0Brgdb4cfxmQkxLjEzeEwoMO/PvHY1MKs7BXSI4hOjvTg9laFrzrbZ+iB/EUmkR3E
         qSn52LEWtVIsBQwRQK6RcIEwUvt1SLZPp6wX93ZVXJkVKhb1vPqXBeiEpT6COLeMMVQL
         kBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G7TWxU3RrpRjJxbp4gq/13lUnFREHVtoNcL++CjhnMk=;
        b=Y8qV0Np+ZrEDMRDEIgk8340ajfQMhnBMwTakPyNzTX5DBKnxTexQX7+8EC42ivpJOu
         Slx8/SbBPy9J5Rv5tR1rYX1a4FPd5by+Ap6TlZ0JMi1BsLyfDhU1vKOX5ToXydEPAyV+
         aCQ5jlMbKJDwpvhcYPzP9RN6s4F7mk9VVSfUzETx6Wnd1Q2H1qXYsHrF3daivYB0rDkh
         PP+ztdSIU80JxN45d6lCtcxa5OyFmklyM/3C15mk3uU7Cyng86h09hfNyXO5OePe/sjM
         K+3L+ViG0/Q+gxHG+dIEsj27+ffU8HCz881CjuAIn8CiNyIrUdfUbNcodsaB6U8k3VSa
         LrOQ==
X-Gm-Message-State: AOAM530dcTuCAZejI6MAYxbIdTwsLklIy4GOr9I752GPfjFfj0bUva1S
        D0PCHDpXHcKKXBlgL+gX29Pm/+w7Ge17b58egCA=
X-Google-Smtp-Source: ABdhPJxiSFDp4mmG/vqyuuKnvkaR7c1gRfsVdMfHLNjvZeQBwYrQ/3kBZh7BWg2AVcLM3ET4vFJCzcHQa2eAHVvewk0=
X-Received: by 2002:a05:6402:1c10:: with SMTP id ck16mr20692925edb.151.1596555728124;
 Tue, 04 Aug 2020 08:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1594899334-19772-1-git-send-email-kalyan_t@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 4 Aug 2020 08:42:52 -0700
Message-ID: <CAF6AEGuNk+bhjULnng1pNKh1yoxcXEF8jHB-1jYJuYnBos64AQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: sc7180: add interconnect bindings for display
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        nganji@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 16, 2020 at 4:36 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
>
> From: Krishna Manikandan <mkrishn@codeaurora.org>
>
> This change adds the interconnect bindings to the
> MDSS node. This will establish Display to DDR path
> for bus bandwidth voting.
>
> Changes in v2:
>         - Change in commit message(Matthias Kaehlcke)
>
> Changes in v3:
>         - Updated commit message to include
>           reviewer's name in v2
>
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>

Reviewed-by: Rob Clark <robdclark@chromium.org>

> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 998f101..4f2c0d1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -1522,6 +1522,9 @@
>                         interrupt-controller;
>                         #interrupt-cells = <1>;
>
> +                       interconnects = <&mmss_noc MASTER_MDP0 &mc_virt SLAVE_EBI1>;
> +                       interconnect-names = "mdp0-mem";
> +
>                         iommus = <&apps_smmu 0x800 0x2>;
>
>                         #address-cells = <2>;
> --
> 1.9.1
>
