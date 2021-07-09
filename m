Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 875453C1CE6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 02:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbhGIA67 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 20:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhGIA66 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 20:58:58 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDF3DC061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 17:56:14 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id w127so10146390oig.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 17:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=xH3DG3G4r5p9q8V7df0cUTAWnPcNLJfwZNKDWmC9XZ4=;
        b=WW2KIFSpYS45rQ1HgUSJPP0fBCbTpG59d4MCm0F05Sz0gzPrpDcSn+xUENac2npEqO
         G48ZYewIkdwBRh3mOyYP+fQWK0jth43LKJJwLU0hhF9fNOc012T2XD/xORrZk7ja6NR3
         jcJYpgtgYZ4Od12rLWWMSvzZXW5SePPE7xMOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=xH3DG3G4r5p9q8V7df0cUTAWnPcNLJfwZNKDWmC9XZ4=;
        b=nTLWQKMscFi6fQPanSKgL2ytlx3p8PqARsXEgnCY6xKFRgVRqmwQQmyToWtSiuImv+
         +6XlkUKAXINvYqc+dnpy2b+2DPKeYuTy5EyjV+5wzOgzoYrtIHOK+Gkn91/zHn9xsm9A
         4/YN9X5S9EZUJgskxP4xRgKVdchyh1qWvJXmW0Jg74p1MRcZDNwho4/nKjJgTMctcTYh
         s3UKTM3uAHgU+71nESqsJlXOrCrQ90+dWjs3Z6PoJQr6WeUg+NvyKrM34KaZ8K05y+WU
         TRGK3lnaq7NoNbYT0FOZFQjNhDeCYb5+zYmzMMEpoCWf2LpIo14PN1M3+PT7quQ/cTVn
         NLAA==
X-Gm-Message-State: AOAM532+tTVFGqsTNs5DQe7pFYxyllz0ZU/QD5yIkyZ/KwVQ2lWODrsT
        rkMWFwgUJ62BgsoYnsG0zKsRFmzbJTaJICyTHN7kCQ==
X-Google-Smtp-Source: ABdhPJzxjyqVATWH3w+MMo3kXqpJVZaUvx6HdgTHiREi5pmsl9YOTMUnRd+WQ/UXNNiSuf9EAjAvqJVe5LhJBIFx7l4=
X-Received: by 2002:aca:3012:: with SMTP id w18mr5941111oiw.125.1625792174060;
 Thu, 08 Jul 2021 17:56:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 9 Jul 2021 00:56:13 +0000
MIME-Version: 1.0
In-Reply-To: <2ad7a00924b5065bf61c47e8b6d24339@codeaurora.org>
References: <20210604135439.19119-1-rojay@codeaurora.org> <20210604135439.19119-2-rojay@codeaurora.org>
 <YLxHTDxVcSvVxsd5@builder.lan> <98befc79fc039496b0c12d7983319c92@codeaurora.org>
 <2ad7a00924b5065bf61c47e8b6d24339@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 9 Jul 2021 00:56:13 +0000
Message-ID: <CAE-0n51NfHSwRQvG0HnTcHBkv=Huy-CXEwJCxLG03MN3dSe5kA@mail.gmail.com>
Subject: Re: [PATCH V3 1/3] arm64: dts: sc7280: Add QSPI node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, rojay@codeaurora.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting rojay@codeaurora.org (2021-07-06 02:19:27)
> On 2021-06-08 13:37, rojay@codeaurora.org wrote:
> > On 2021-06-06 09:25, Bjorn Andersson wrote:
> >> On Fri 04 Jun 08:54 CDT 2021, Roja Rani Yarubandi wrote:
> >>
> >>> Add QSPI DT node for SC7280 SoC.
> >>>
> >>> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> >>> ---
> >>> Changes in V3:
> >>>  - Broken the huge V2 patch into 3 smaller patches.
> >>>    1. QSPI DT nodes
> >>>    2. QUP wrapper_0 DT nodes
> >>>    3. QUP wrapper_1 DT nodes
> >>>
> >>> Changes in V2:
> >>>  - As per Doug's comments removed pinmux/pinconf subnodes.
> >>>  - As per Doug's comments split of SPI, UART nodes has been done.
> >>>  - Moved QSPI node before aps_smmu as per the order.
> >>>
> >>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 29 ++++++++++++
> >>>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 61
> >>> +++++++++++++++++++++++++
> >>>  2 files changed, 90 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> >>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> >>> index 3900cfc09562..d0edffc15736 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> >>> @@ -268,6 +268,22 @@ pmr735b_die_temp {
> >>>             };
> >>>  };
> >>>
> >>> +&qspi {
> >>> +   status = "okay";
> >>> +   pinctrl-names = "default";
> >>> +   pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
> >>> +
> >>> +   flash@0 {
> >>> +           compatible = "jedec,spi-nor";
> >>> +           reg = <0>;
> >>> +
> >>> +           /* TODO: Increase frequency after testing */
> >>> +           spi-max-frequency = <25000000>;
> >>> +           spi-tx-bus-width = <2>;
> >>> +           spi-rx-bus-width = <2>;
> >>> +   };
> >>> +};
> >>> +
> >>>  &qupv3_id_0 {
> >>>     status = "okay";
> >>>  };
> >>> @@ -278,6 +294,19 @@ &uart5 {
> >>>
> >>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
> >>>
> >>> +&qspi_cs0 {
> >>> +   bias-disable;
> >>> +};
> >>> +
> >>> +&qspi_clk {
> >>> +   bias-disable;
> >>> +};
> >>> +
> >>> +&qspi_data01 {
> >>> +   /* High-Z when no transfers; nice to park the lines */
> >>> +   bias-pull-up;
> >>> +};
> >>> +
> >>>  &qup_uart5_default {
> >>>     tx {
> >>>             pins = "gpio46";
> >>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>> index 6c9d5eb93f93..3047ab802cd2 100644
> >>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >>> @@ -1061,6 +1061,42 @@ apss_merge_funnel_in: endpoint {
> >>>                     };
> >>>             };
> >>>
> >>> +           qspi_opp_table: qspi-opp-table {
> >>
> >> This node doesn't represents anything on the mmio bus, so it shouldn't
> >> live in in /soc. Can't you move it into &qspi?
> >>
> >> Regards,
> >> Bjorn
> >>
> >
> > Sure, will move it into qspi node.
> >
> > Thanks,
> > Roja
> >
>
> Hi Bjorn,
>
> Moving "qspi_opp_table" inside &qspi node causing this warning:
> arch/arm64/boot/dts/qcom/sc7280.dtsi:1055.35-1072.6: Warning
> (spi_bus_reg): /soc@0/spi@88dc000/qspi-opp-table: missing or empty reg
> property

If DT folks are OK I think we should hard-code 'opp-table' as not a
device for spi to populate on the spi bus and relax the warning in the
devicetree compiler (see [1] for more details). Technically, nodes that
are bus controllers assume all child nodes are devices on that bus.  In
this case, we want to stick the opp table as a child of the spi node so
that it can be called 'opp-table' and not be a node in the root of DT.

>
> Shall I keep the qspi-opp-table out of &qspi node?
>

If you do, please move it to / instead of putting it under /soc as it
doesn't have an address or a reg property.

[1] https://github.com/dgibson/dtc/blob/69595a167f06c4482ce784e30df1ac9b16ceb5b0/checks.c#L1844
