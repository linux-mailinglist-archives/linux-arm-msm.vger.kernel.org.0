Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24B240BDC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 04:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233717AbhIOCZF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 22:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232312AbhIOCZF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 22:25:05 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A337C061762
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 19:23:47 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id bd1so2153961oib.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 19:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZSOMRM/4vS8hdTIr2nFrDzrRQaaDCVXD3i6BnhZi0bU=;
        b=mMNn6wUl9j40Z5Gxxpp4NJMPs1F0XS9e9G2oaS6Bn5Nsc/lah81b9U3gBap3Mn3c+G
         OAGjEjM+979b8T+Yryw+Z7q6y9WpcbiDsnDSNgLalMascAswdZzVBD/l74YhMpD7lua/
         9oW9NW3peuHgGDnlg3YgxLr1i+jqAgyGLNmrVJB3R7TGGZgird7OmxOd6p7grHX7pIPP
         486GXguUsxo+miFY0iDPT7iIPsLnmayqybKIQvfHIXicD1mApuyIX0ttaK9NkDGRLunO
         9Ab55U2DsEjxTeo8ALaIOiKzIhOLsjVr0EEKkZt/4d6Q/rRmLaI/GyuNVJGunA0B0Num
         NxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZSOMRM/4vS8hdTIr2nFrDzrRQaaDCVXD3i6BnhZi0bU=;
        b=pWsZ5em2ukNuz0MZHIZNuOI7hmCcdjAhSdeAe8T95eeyH+3rLpP3MzUX2QZJvl2A6M
         NY6KgwlPw+9EwUN+Irc2GkgLyCnlgsAlgZV3YEHJKV7wKLNFCTI+FxVE2Pb/+zVpGWCS
         IFBy5wN+tT8Df7isXuMGWi/LOXEzgpb4dwE25pBULqYnYBvlXQpxkbqY0Yn2ojpewZ4W
         iPYVInpR5yVJtfye2dFZQeTwIdyW3h7kQyjz5FB3J1AHkZcRM+88sIelcevn7ytCkl8/
         XEWpdu7IYP3BtDir+gSLxcz+VTKnoQKQFyNfOZwPQMpvRRUt6hWGFbLOuM4FPj/1VsTP
         E/gQ==
X-Gm-Message-State: AOAM533EkwCq+2A1+EtmHBLJkRhHtfaHwsrz96DjTJI+6IDYJ4E7+GG2
        AOCzZcXhnq+ORF7UCRw5VwQ+gQ==
X-Google-Smtp-Source: ABdhPJy5VuTl2HScSYvWhRx3n2XIj91ZwpF0pc1yM5u4Vp4q8OfNhe0yB/j+knDBuUbs3X6DmGICxw==
X-Received: by 2002:a05:6808:81:: with SMTP id s1mr3638815oic.130.1631672626538;
        Tue, 14 Sep 2021 19:23:46 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l13sm3062159otr.26.2021.09.14.19.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 19:23:46 -0700 (PDT)
Date:   Tue, 14 Sep 2021 19:24:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Prasad Malisetty <pmaliset@codeaurora.org>, agross@kernel.org,
        bhelgaas@google.com, lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v7 3/4] arm64: dts: qcom: sc7280: Add PCIe nodes for IDP
 board
Message-ID: <YUFZZWQ3t9EH/Z55@ripper>
References: <1631643550-29960-1-git-send-email-pmaliset@codeaurora.org>
 <1631643550-29960-4-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n52p+5rabienYNG_OQfiaLLCgaRj9vfeKR6s3-bCdzHDQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n52p+5rabienYNG_OQfiaLLCgaRj9vfeKR6s3-bCdzHDQA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 14 Sep 18:13 PDT 2021, Stephen Boyd wrote:

> Quoting Prasad Malisetty (2021-09-14 11:19:09)
> > Enable PCIe controller and PHY for sc7280 IDP board.
> > Add specific NVMe GPIO entries for SKU1 and SKU2 support.
> >
> > Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  9 +++++++++
> >  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 32 ++++++++++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/sc7280-idp2.dts |  9 +++++++++
> >  3 files changed, 50 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > index 64fc22a..2cc6b0a 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > @@ -61,6 +61,15 @@
> >         modem-init;
> >  };
> >
> > +&pcie1_default_state {
> > +       nvme-n {
> > +               pins = "gpio19";
> > +               function = "gpio";
> > +
> > +               bias-pull-up;
> > +       };
> 
> I don't think the style is to have a single container node anymore.
> Instead, each pin gets a different node and then pinctrl-0 has a list of
> phandles to the different nodes. qcom maintainers may have more input
> here.
> 

Having a container that defines the state and each part thereof is
preferred (see other PCIe users or how we typically define the Bluetooth
UART). But is "nvme_n" really part of the "PCI state" or is this related
to the NVME device instead?

> Also, this should really go into a different section than here. I
> thought the style was to have a 'board specific' pinctrl section.
> 

Yes, pushing pinctrl states to the bottom is preferred and rather than
amending the existing state I think this goes in a state of its own and
the pinctrl-N amended to include this new state as well.

Regards,
Bjorn

> > +};
> > +
> >  &pmk8350_vadc {
> >         pmr735a_die_temp {
> >                 reg = <PMR735A_ADC7_DIE_TEMP>;
