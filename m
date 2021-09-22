Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADED414C7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 16:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236272AbhIVO4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 10:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236157AbhIVO4R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 10:56:17 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D1BC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 07:54:47 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id b10so3702193ioq.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aGsfFQms67z3DWxhubYarnuQaxcgC0ufqpReCHjs4NQ=;
        b=f3cCT6Ps7OWQR4FksT7+sX2KnBzte6EDv1u0bacbishSaTg4G7PmjictF5dnda5XBx
         qbLRZHkDb1N/rg6aVEa/pKo5vGEvCxu4ZOq1R/vDB7bkUzklxzbjXfExzWYvegBZTue0
         1C9MWVM+ExwkfFSyBu7TjLi3B6vUlebH7hv2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aGsfFQms67z3DWxhubYarnuQaxcgC0ufqpReCHjs4NQ=;
        b=XP7cpiU8tYtjSCBEreVAV3+dmRTzZAbI8AVH+9Ixpp6FhKsStsPBkc+wtgeedmUjdD
         Scjr69g5rQq0M1cm7xBOHNggFr19xPFILn39hFtiTX8xI/JV5kvMSsHVjKRz6VQEP6fK
         BIP3tSmJSOxgnVA9ek0DkA/UBWDTW8BHsBTwhyWsk/+mfjrTJlLm7iEZ1Xoj5b4M7ACu
         YbtPobpTw9Uv3XVzIvNSDXVcg0UxRJgdjoM/3m21vpcA++FtaC6ehc1dRy/PhFO9UtWF
         fuzIw8l978HfS7oTmryPE+iKfLvWGYMn/iPikpvWv0WS6CLhYe60648sxfZrIXRqFi2F
         D7sw==
X-Gm-Message-State: AOAM533pTr1h0i3qcaae+q7LpJBIHKQelRcNMB6j6oJybVqfxnKioekM
        WalE4FLOWrfNgv6JYlT1DSK5kMmB9sityg==
X-Google-Smtp-Source: ABdhPJwaIZiohWnwfLdtBZI1kn4oZLjA7D2dvbU4idUve5iHFJ5mpdp2PwCBeJYWW+iGns5Imb+gGg==
X-Received: by 2002:a5d:9256:: with SMTP id e22mr38900iol.152.1632322486226;
        Wed, 22 Sep 2021 07:54:46 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id c1sm1117274iot.44.2021.09.22.07.54.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 07:54:45 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id v16so3046189ilg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 07:54:44 -0700 (PDT)
X-Received: by 2002:a92:da0c:: with SMTP id z12mr75412ilm.120.1632322484455;
 Wed, 22 Sep 2021 07:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <21d14dd0bfa945ee617ed4b86b4495ee@codeaurora.org>
In-Reply-To: <21d14dd0bfa945ee617ed4b86b4495ee@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Sep 2021 07:54:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X=PUeahdf_bbTyCAZSeZ-ahRwZVvH-Oh=3wQmRxbt2CQ@mail.gmail.com>
Message-ID: <CAD=FV=X=PUeahdf_bbTyCAZSeZ-ahRwZVvH-Oh=3wQmRxbt2CQ@mail.gmail.com>
Subject: Re: [PATCH V9 4/8] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Sep 22, 2021 at 5:31 AM <rajpat@codeaurora.org> wrote:
>
> >> +                       spi0: spi@980000 {
> >> +                               compatible = "qcom,geni-spi";
> >> +                               reg = <0 0x00980000 0 0x4000>;
> >> +                               clocks = <&gcc
> >> GCC_QUPV3_WRAP0_S0_CLK>;
> >> +                               clock-names = "se";
> >> +                               pinctrl-names = "default";
> >> +                               pinctrl-0 = <&qup_spi0_data_clk>,
> >> <&qup_spi0_cs>, <&qup_spi0_cs_gpio>;
> >
> > This should only have qup_spi0_data_clk and qup_spi0_cs, not
> > qup_spi0_cs_gpio. Both qup controlled and gpio controlled options are
> > provided in case a board wants to use the qup version of chipselect,
> > but
> > having them both used by default leads to conflicts and confusion. This
> > same comment applies to all spi pinctrl properties in this file. Please
> > keep the cs_gpio variants though so that boards can use them if they
> > want. They will be unused, but that's OK.
>
> Okay. Shall we remove only "<&qup_spiN_cs_gpio>" in each SPI node?

Right. So for this one:

pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;

-Doug
