Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E575319AEFF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 17:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733117AbgDAPp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 11:45:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:60472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732889AbgDAPp6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 11:45:58 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12D1E20B1F;
        Wed,  1 Apr 2020 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585755957;
        bh=Ss9ZdTDOkMedWGrrhWeOI7Hi4L677Nmk0j4eRk1smPI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sP9gfIaSRugv6o9DO9ZFmAxLAFkBEaA/RHAEy5jx2b+vYcJMs5jdHVb6gPGqKsNVX
         tXgvnGniFyqivTQaZVYwkYi/ZPj8RxJjtkKRZ5dvjWpBcZofGjTKF0Urr5MwP6xh7R
         2Ds7kdYHEC927nwIN4MKJx6kxbDGtZ6z7gkP9kfw=
Received: by mail-qt1-f174.google.com with SMTP id i3so362710qtv.8;
        Wed, 01 Apr 2020 08:45:57 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0VhKIv20CWeTy/2bm60L+uxrfSu13cH9l3xpEuv55Mn/Jtv7QM
        /TgZjR3ZkN3WhbNCv9VSbfuSTzL3CthvlfRvzQ==
X-Google-Smtp-Source: ADFU+vu2TcmhrkQ3vHdIQJxoR1BX1Dgu/jUbMAzrf7+1PBw12+wOLynHGOuAxLN5XgkMazDn1FGHukH38UsQDdzp6Kc=
X-Received: by 2002:ac8:1b33:: with SMTP id y48mr11115534qtj.136.1585755956175;
 Wed, 01 Apr 2020 08:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200330164328.2944505-1-robert.marko@sartura.hr>
 <20200330164328.2944505-2-robert.marko@sartura.hr> <20200331163103.GA27585@bogus>
 <CA+HBbNEnH+0g0GK+xMGF48vJbLH3Ud2VY6yDOAxdgbRra3Y25A@mail.gmail.com>
In-Reply-To: <CA+HBbNEnH+0g0GK+xMGF48vJbLH3Ud2VY6yDOAxdgbRra3Y25A@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 1 Apr 2020 09:45:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL_V6Lf3-eGoL454Gtgyp7a4hBo_2SXyq1jWfqDoXdXsQ@mail.gmail.com>
Message-ID: <CAL_JsqL_V6Lf3-eGoL454Gtgyp7a4hBo_2SXyq1jWfqDoXdXsQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 31, 2020 at 10:39 AM Robert Marko <robert.marko@sartura.hr> wrote:
>
> On Tue, Mar 31, 2020 at 6:31 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, 30 Mar 2020 18:43:29 +0200, Robert Marko wrote:
> > > This patch adds the binding documentation for the HS/SS USB PHY found
> > > inside Qualcom Dakota SoCs.
> > >
> > > Signed-off-by: John Crispin <john@phrozen.org>
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > > ---
> > > Changes from v4 to v5:
> > > * Replace tabs with whitespaces
> > > * Add maintainer property
> > >
> > >  .../bindings/phy/qcom-usb-ipq4019-phy.yaml    | 48 +++++++++++++++++++
> > >  1 file changed, 48 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > Error: Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.example.dts:21.25-26 syntax error
> > FATAL ERROR: Unable to parse input tree
> > scripts/Makefile.lib:311: recipe for target 'Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.example.dt.yaml' failed
> > make[1]: *** [Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.example.dt.yaml] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > Makefile:1262: recipe for target 'dt_binding_check' failed
> > make: *** [dt_binding_check] Error 2
> >
> > See https://patchwork.ozlabs.org/patch/1264091
> >
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure dt-schema is up to date:
> >
> > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> >
> > Please check and re-submit.
> Hi Rob,
> I tested locally before submitting and it will pass.

Impossible. Your example has defines, but there are no include files listed.

Rob
