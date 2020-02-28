Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 862BB17335C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 09:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbgB1Izc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 03:55:32 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:42398 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgB1Izc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 03:55:32 -0500
Received: by mail-ua1-f66.google.com with SMTP id p2so695286uao.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2020 00:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yG3mf6LB9a/9xK+auG2ENhJV3nByoLN3L6ABYDFphIE=;
        b=cYfmVt6G2PkgbuStmNktcBKViFfntND+jPOtOsqUXukLVEBRGX4y1OUq+glYisQEDf
         sXKxSiTKnmkLeM+yBhuUBoA3/fqRn08UAE7ESPLPlx0LuLvIbP2DYluC5ksh539ydIpl
         WRBNSpsEJU96iOGSbtD/ZtYNLvZ6mWnP5iRl2GUXKoL47Ju6blYAx4snrQJc5hmAcwjn
         N687kT6PtdGloHVsu4UruYooQAfp4T9e1/BNg7K4ALDDWCVedUjFiRsCXE4wcWexzKS5
         lwP91z0KhiopN2re9zUX6bTQy5emckn1llNCG2yFSn/SDsYQQIz0W35bHdhApWTUmtxQ
         tDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yG3mf6LB9a/9xK+auG2ENhJV3nByoLN3L6ABYDFphIE=;
        b=Em/pBz9FMj5HPrv4du4xoKEfjDu9YfadvqRtbxv0fxftTK1OE5lv3U1YYtW4sGKdg6
         VT0kEdgUGh0ByXIIk+ynsasirn071LQDcvpY0wWCgriqE/65TC/RrFDDuNGEOVHJCJWr
         Jhfhx/7RhuGJvRcSrOxpL9Hv36RryUdtgbO4sK/exhzzM9dsVNNGlh/1KknGCK5IJfen
         i9ohORvzpr2QYff3mPPKW4JMyA9f1fkJyK6voILpV38Khd6YpMjz6myoIFyLDBU8ikeX
         9PB9HtrSB56D4n5SVgEZlyUt28q//5Lvff+xSrTan/Gt4wQ4kpNH33QajVS8RGssjSvE
         eqfQ==
X-Gm-Message-State: ANhLgQ3UBMUhs4moNaz3jwvpQ0/Nqd2DuDBC6kPZxJERRPvacDaIXmCc
        NUqHqkshumqWCUBf1JnvsLnVYQEGBiySgx0JASdxMg==
X-Google-Smtp-Source: ADFU+vsLztMWpfaKINtTsKF68z+sMLM4PaaIv6oFTVvgFaKU7aareFJM7t6ZDu97PwZJduqdizT78uxAIc6c2M5WIBk=
X-Received: by 2002:ab0:2758:: with SMTP id c24mr501689uap.94.1582880129628;
 Fri, 28 Feb 2020 00:55:29 -0800 (PST)
MIME-Version: 1.0
References: <1582646384-1458-1-git-send-email-okukatla@codeaurora.org>
 <1582646384-1458-4-git-send-email-okukatla@codeaurora.org> <20200227171226.GJ24720@google.com>
In-Reply-To: <20200227171226.GJ24720@google.com>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Fri, 28 Feb 2020 14:25:18 +0530
Message-ID: <CAHLCerPMmEQCTU1+K6p01o+PJ1BAf2244Dze2gVLjLQ+cUxpAQ@mail.gmail.com>
Subject: Re: [V4, 3/3] arm64: dts: sc7180: Add interconnect provider DT nodes
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Odelu Kukatla <okukatla@codeaurora.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        daidavid1@codeaurora.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        evgreen@google.com, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Lina Iyer <ilina@codeaurora.org>, seansw@qti.qualcomm.com,
        Alex Elder <elder@linaro.org>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 27, 2020 at 10:42 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Tue, Feb 25, 2020 at 09:29:44PM +0530, Odelu Kukatla wrote:
> > Add the DT nodes for the network-on-chip interconnect buses found
> > on sc7180-based platforms.
> >
> > Signed-off-by: Odelu Kukatla <okukatla@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 95 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index cc5a94f..3e28f34 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>
> v2 had:
>
> +#include <dt-bindings/interconnect/qcom,sc7180.h>
>
> I think we still want that, otherwise some patch that adds an
> interconnect configuration for SC7180 needs to add it (see also
> https://patchwork.kernel.org/patch/11386485/#23187545)

Thanks Matthias. That fixed the build.
