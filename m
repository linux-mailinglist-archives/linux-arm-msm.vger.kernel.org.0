Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3A034A7A62
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 22:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiBBV0j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 16:26:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiBBV0j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 16:26:39 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 473EFC061714
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Feb 2022 13:26:39 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id z18so497441ilp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Feb 2022 13:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o2/UoLjZiFXhay6ZdHILc8GiD9j1bhUbIT2EuWPLH8I=;
        b=FfAaTdVcfqAbX85RPfFV6HhR5h9+bXVbMraOahfnDr8UOhhCYSX4SEvQ55Wxuabmm7
         FhOfpBElQNYy6enchn8R3Q/efh9z0sddllHKf8duiau/uvjtonae4vMRqaM+Fvd54PTg
         u9vyqApXHmUX4M50H9N7bNPdmRJEjGXy5EfWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o2/UoLjZiFXhay6ZdHILc8GiD9j1bhUbIT2EuWPLH8I=;
        b=kfBLvWQaT8gc/hYMs/Q/ONNfLiBC8hb02f9srNIQ75G1LPHsBVLLrlN6Z2UWuMhyus
         ugh78TA99WWVYn12Q0bP77Sgo256DHfzz59C9QpwGu6ibxGI26vPo4TsYOMKMcCaXTGX
         PKVkZ5qlrQW30F3rCE7I2xf/fjTDyhcjGS7HsiZx3JKtwY2BruoRkk5CfVLoiPhPU2rW
         D0Xq8kDa1ohtbelOdWrzXoLuWsILhMkDCdbNWL9nVAyXZv7oz3QltNWC24fbqqTZCUcR
         hvRFVy9CzitJPCIqWrSJv18ngNtiK1/JDk2OBQmFHaIBEbwpyXH16eK9WzhRc9gEUA4m
         Z3qw==
X-Gm-Message-State: AOAM5316zunTwNc9lqmaU0AWHZpyOn8H8l3/Zz0h9fSh7PuNzf+rk3rD
        RzpKhlmJaNq+hhySQn3ztKTCg23c6adr0Q==
X-Google-Smtp-Source: ABdhPJxMhLiP2Ybb9vRZJKNoQSqqEupdfZXSF7giJh6NZBSFKKxjM8b274mmn5N6DO+3LjE14DW3Og==
X-Received: by 2002:a05:6e02:20ce:: with SMTP id 14mr19588554ilq.261.1643837198542;
        Wed, 02 Feb 2022 13:26:38 -0800 (PST)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com. [209.85.166.171])
        by smtp.gmail.com with ESMTPSA id i22sm21437751ila.85.2022.02.02.13.26.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 13:26:36 -0800 (PST)
Received: by mail-il1-f171.google.com with SMTP id y17so504893ilm.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Feb 2022 13:26:36 -0800 (PST)
X-Received: by 2002:a92:cd84:: with SMTP id r4mr18778065ilb.180.1643837196261;
 Wed, 02 Feb 2022 13:26:36 -0800 (PST)
MIME-Version: 1.0
References: <1643048114-2996-1-git-send-email-quic_sbillaka@quicinc.com>
 <1643048114-2996-2-git-send-email-quic_sbillaka@quicinc.com> <CAD=FV=WjnDCh6dLV8pxgYepMDtf5oMSTb9v+Z8dwyMARL7TYaQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WjnDCh6dLV8pxgYepMDtf5oMSTb9v+Z8dwyMARL7TYaQ@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 2 Feb 2022 13:26:24 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X_y3duGCN09sKOR0uZLft5x7OcLcBbbtT9EHi-4EGV6g@mail.gmail.com>
Message-ID: <CAD=FV=X_y3duGCN09sKOR0uZLft5x7OcLcBbbtT9EHi-4EGV6g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ARM64: dts: qcom: enable eDP panel support for sc7280
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, quic_kalyant@quicinc.com,
        quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com,
        quic_mkrishn@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 24, 2022 at 11:04 AM Doug Anderson <dianders@chromium.org> wrote:
>
> > +&mdss_edp {
> > +       status = "okay";
> > +
> > +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> > +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> > +
> > +       ports {
> > +               port@1 {
> > +                       reg = <1>;
> > +                       edp_out: endpoint {
> > +                               remote-endpoint = <&edp_panel_in>;
> > +                       };
> > +               };
> > +       };
>
> I think part of the above should be in sc7280.dtsi. Basically in
> sc7820.dtsi I think you should have:
>
> ports {
>   #address-cells = <1>;
>   #size-cells = <0>;
>   port@0 {
>     reg = <0>;
>     edp_in: endpoint {
>       remote-endpoint = <&dpu_intf5_out>;
>     };
>   };
>   port@1 {
>     reg = <1>;
>     edp_out: endpoint {
>     };
>   };
> };
>
> ...and then the crd dts file just needs:
>
> &edp_out {
>   remote-endpoint = <&edp_panel_in>;
> };
>
> Right?

I've attempted to do the sc7280 part of this in:

https://lore.kernel.org/r/20220202132301.v3.7.Ic84bb69c45be2fccf50e3bd17b845fe20eec624c@changeid

Assuming folks think that's good then you should probably base your
next version atop that.

-Doug
