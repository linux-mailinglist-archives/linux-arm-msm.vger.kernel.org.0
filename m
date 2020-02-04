Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF68151C77
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 15:44:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgBDOo1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 09:44:27 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:42600 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727258AbgBDOo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 09:44:27 -0500
Received: by mail-il1-f196.google.com with SMTP id x2so16046234ila.9;
        Tue, 04 Feb 2020 06:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pBPgZrCmoCK+adPpBYU1UgcBrMjDVFByBZS7ldjpSQg=;
        b=E4Xyb8LiS6clI+5dqopwS6OxlDQ+b2NTz73F0W4FBbpOs3EEVtrxId487UD5r2m8PL
         HI1VKjnvEvRLgZHOARQnfMSd/8EYJBGf4HCw7TL3k5RWfK7MXwYBuwxzq5oPF2t+Rlj9
         cUlguf56kwFgdu16U9HCo7Ywnsgeo7Xa2Q1TAIEEfAB1KOl0uPL6ce+TmnvfJ75C01BO
         RchsaGygoM1zofuLrx75cI9PGtpn83vxqyx0smAb8D/AtI1SrGB5Pqmu2TmrDqxnnizT
         dI4bdSBfpQFHNjxcIIqJ3ELyp8k9XQolPw6DnXnPyk1BG6S3YqzNa0SvghlBrEvh2FXT
         sJEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pBPgZrCmoCK+adPpBYU1UgcBrMjDVFByBZS7ldjpSQg=;
        b=AYMbwMH/Q1DIJy0ycjinSs7YJKKru+fceutNU3pNlIdXfVG7Aa75Hw1igVxEtYMjGC
         ih0Csee6t2eVn6voFXYqZ/AMoiGUM6mWz6IOH00INlHuewMwMNSN0BLiBbZ+UTAEMa3W
         qGQhXFSqa73OhS1TH6V6kwq1/+cWM5Lk6YoODA79fWvpya40pybmSF+toQgCFcJ6cp1C
         KWSMhS+6gcBWpp1i3YL6E1iBfJTYRkoTWxxYmsGBVHc5fl2WVNdzPkY3YXyO+diLYPCr
         lbLUPc8mLSR0I1OO7p6Vr4hfuQBTDKYnLcZTtJmJvPpE772+NXs+HCV0wGGoXhbD+oyR
         4i5A==
X-Gm-Message-State: APjAAAXeHiZwKdYYYg3C4NuEaTn2h92+wdT3DzB988zWZVCv97QZU3tv
        ymCyk6otkg0dkSiemRWtv0uHWEXFi8zmB5/WP5Y=
X-Google-Smtp-Source: APXvYqwK9TpjhX0h1rx34qAMHunSgEc+MuYa+gdNBn5BAmQldz1Y+KTnEKcwvvlYqWn8uE+Twe4govU8jiD5qoDHMWo=
X-Received: by 2002:a92:5e8b:: with SMTP id f11mr27598714ilg.178.1580827466019;
 Tue, 04 Feb 2020 06:44:26 -0800 (PST)
MIME-Version: 1.0
References: <1580825737-27189-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1580825737-27189-1-git-send-email-harigovi@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Tue, 4 Feb 2020 07:44:14 -0700
Message-ID: <CAOCk7NoAY7QaoBufG=JOR54PocdtrMsxUh9HmdWEwQ4zSG5MDg@mail.gmail.com>
Subject: Re: [Freedreno] [v1] dt-bindings: msm:disp: update dsi and dpu bindings
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, nganji@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 4, 2020 at 7:15 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Updating bindings of dsi and dpu by adding and removing certain
> properties.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v1:
>         - Adding "ahb" clock as a required property.
>         - Adding "bus", "rot", "lut" as optional properties for sc7180 device.
>         - Removing properties from dsi bindings that are unused.
>         - Removing power-domain property since DSI is the child node of MDSS
>           and it will inherit supply from its parent.
>
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 7 +++++++
>  Documentation/devicetree/bindings/display/msm/dsi.txt | 5 -----
>  2 files changed, 7 insertions(+), 5 deletions(-)
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> index af95586..61d659a 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> @@ -8,13 +8,10 @@ Required properties:
>  - reg-names: The names of register regions. The following regions are required:
>    * "dsi_ctrl"
>  - interrupts: The interrupt signal from the DSI block.
> -- power-domains: Should be <&mmcc MDSS_GDSC>.
>  - clocks: Phandles to device clocks.
>  - clock-names: the following clocks are required:
> -  * "mdp_core"
>    * "iface"
>    * "bus"
> -  * "core_mmss"

Why do you think these are unused?  I see them used in the driver, and
as far as I can tell these get routed to the hardware, therefore they
should be described in DT.

>    * "byte"
>    * "pixel"
>    * "core"
> @@ -156,7 +153,6 @@ Example:
>                         "core",
>                         "core_mmss",
>                         "iface",
> -                       "mdp_core",
>                         "pixel";
>                 clocks =
>                         <&mmcc MDSS_AXI_CLK>,
> @@ -164,7 +160,6 @@ Example:
>                         <&mmcc MDSS_ESC0_CLK>,
>                         <&mmcc MMSS_MISC_AHB_CLK>,
>                         <&mmcc MDSS_AHB_CLK>,
> -                       <&mmcc MDSS_MDP_CLK>,
>                         <&mmcc MDSS_PCLK0_CLK>;
>
>                 assigned-clocks =
> --
> 2.7.4
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
