Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 732A6CEB44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 19:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbfJGR5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 13:57:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:54182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728954AbfJGR5n (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 13:57:43 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 76C2B206C0;
        Mon,  7 Oct 2019 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570471062;
        bh=4Slkk8FYa1nq0uUPEJ/Ga/4PSME/l45UeoRN71xPurU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aGAtPiJ0XUJysZXyBYDXVj9W8HsbOcy7a6RoABUEaPIsboCzlCAmW8Cxq+vbUfSlu
         SdZolAghlb0Q56At+nbu0WjOoEkerOcJFerEjhmuiRRsGBXwUs1ERrvFNQMaISjZg7
         oxYPySFp4GNfD4V9IlbELMngikbWfFzy6YGp3LuE=
Received: by mail-qt1-f170.google.com with SMTP id u40so20458233qth.11;
        Mon, 07 Oct 2019 10:57:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVfxfMPPCOPHMW9N5S4E5WVUD1jZwGvWcBuZIXmJMJMTbmYIAC8
        Z1HAgGAiEGSf/Kdy76zZQNlANob5eUWByWVq+A==
X-Google-Smtp-Source: APXvYqyx0/vroFKh+gGIFFU2QP1qSo3MpBR0Klz9I9ftnNKkdHNH+5jvTnL3wvDYMYseeiI4YtsA91QWvRtU1xEn4IM=
X-Received: by 2002:ac8:444f:: with SMTP id m15mr31503108qtn.110.1570471061666;
 Mon, 07 Oct 2019 10:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190724044906.12007-1-vkoul@kernel.org> <20190724044906.12007-2-vkoul@kernel.org>
 <CANcMJZBWsfwWmHbGCG+KG4n1kpmytw_8O4uA8HEVv8ysBxiQgw@mail.gmail.com>
In-Reply-To: <CANcMJZBWsfwWmHbGCG+KG4n1kpmytw_8O4uA8HEVv8ysBxiQgw@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 7 Oct 2019 12:57:30 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJpAqdFQKQLjh0szD2HY23bkFSg2fioDi2VxYvZcs6wsQ@mail.gmail.com>
Message-ID: <CAL_JsqJpAqdFQKQLjh0szD2HY23bkFSg2fioDi2VxYvZcs6wsQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: sdm845: Add unit name to soc node
To:     John Stultz <john.stultz@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 7, 2019 at 12:44 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Tue, Jul 23, 2019 at 9:51 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > We get a warning about missing unit name for soc node, so add it.
> >
> > arch/arm64/boot/dts/qcom/sdm845.dtsi:623.11-2814.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
> >
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 601cfb078bd5..e81f4a6d08ce 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -620,7 +620,7 @@
> >                 method = "smc";
> >         };
> >
> > -       soc: soc {
> > +       soc: soc@0 {
> >                 #address-cells = <2>;
> >                 #size-cells = <2>;
> >                 ranges = <0 0 0 0 0x10 0>;
>
> So Amit Pundir noted that this patch is causing 5.4-rc to no longer
> boot on db845 w/ AOSP, due to it changing the userland sysfs paths
> from "/devices/platform/soc/1a00000.mdss" to
> "/devices/platform/soc@0/1a00000.mdss"
>
> Is there a better solution here that might not break userspace?

Other than doing the right thing of not relying on
/sys/devices/platform/* paths, implement per target/file DTC_FLAGS
similar to CFLAGS. There is another want for this in order to enable
dtc symbols for overlays on a per board basis.


Rob
