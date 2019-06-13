Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47BAE43D4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388916AbfFMPkj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:40:39 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43502 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731896AbfFMPki (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:40:38 -0400
Received: by mail-io1-f65.google.com with SMTP id k20so17897275ios.10;
        Thu, 13 Jun 2019 08:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EpD3K83Ka5TSMWScDEZ67LqOf1a52nrRlcufyYeUVis=;
        b=EVF5KCfM/tbCC1NUruLaLM1ywMuSdGBvkXeBgYZziTY1Fu5IOQMwl/YEykfdfHE94/
         5QhSSfT+HerbBUvPTaklNNwaQiMW+RuP7nsBtwx6ndRZ49HI2xa3wRNse4N0EmE2nDBI
         UX6PTk+0Q7GMEQEus7rSCJlyx0RNLhLVbQmeSjNxGHAV/nPkKTFjfSXdEZSWFpsLz1rR
         sqsSSNlCuZJHrJgYuGY6frS0JLBfNE+8ovsVuaYwIrZ13IgkCHNO8QtYKqPrpuVbuMnO
         aaIPzzirKfJhUOr14DzULqNhzdkbtHrJGN7BRdvcKnYNI+8v3Jj53itJ6+hz/xeG9d1j
         gDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EpD3K83Ka5TSMWScDEZ67LqOf1a52nrRlcufyYeUVis=;
        b=DLGJbvwKwEMVmt1/sOKgzUxBHN7IlMxYlfuWgexP28NQ9Z9+/8dp1OGWdrwvXEglTz
         mXa/kmQVT8B9lKtA32fFc6elkXJFl32yzQMqapBR6+rKlzCVBEute3YGAykqXXQThMlf
         I0sdPyhtC9BnkCbp3cUmd+r330h30HOjE2dKg/Awdh+Eq2yTnOsKbgJ8+AiMsaQFqhwL
         xnqTYV/kqxdgVOAHkxm+FNZgHMi4pASxlZuaHtPGZTekrMdjry3eMal9bGi8DCoIumSp
         uicys03mVTJzwMp5Xd/YirY1W3l+LGnVFIHWzfmyN6LGXQFzk9lVy7CHCH6DQ2VlTsub
         lQRA==
X-Gm-Message-State: APjAAAWRiBNtBTWJKnIbP3YHB8AKzfl2pTr9dSbTaP0hSYsychN0moT7
        3Hcz++AKm3jSaRiqX9SASgc2SRbdR2Y59raFvZs=
X-Google-Smtp-Source: APXvYqwZXBIAJdOqwZSdv8NDfcAq1aYocY317Ws60K3D4JLeybC++4tQpNDF9GWJlvOplwYy9A08l89/Eo+aDNa+N+E=
X-Received: by 2002:a02:b10b:: with SMTP id r11mr55931310jah.140.1560440437577;
 Thu, 13 Jun 2019 08:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
 <20190613142416.8985-1-jeffrey.l.hugo@gmail.com> <20190613153633.GF6792@builder>
In-Reply-To: <20190613153633.GF6792@builder>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 13 Jun 2019 09:40:27 -0600
Message-ID: <CAOCk7NrGgDNEczP5mqirUzwoE+wKF-D5nYvJXfa-e3eFni62iw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] dt-bindings: qcom_spmi: Document pms405 support
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
        Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 13, 2019 at 9:36 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 13 Jun 07:24 PDT 2019, Jeffrey Hugo wrote:
>
> > From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
> >
> > The PMS405 supports 5 SMPS and 13 LDO regulators.
> >
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > ---
> >  .../regulator/qcom,spmi-regulator.txt         | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> > index ba94bc2d407a..19cffb239094 100644
> > --- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> > +++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.txt
> > @@ -10,6 +10,7 @@ Qualcomm SPMI Regulators
> >                       "qcom,pm8941-regulators"
> >                       "qcom,pm8994-regulators"
> >                       "qcom,pmi8994-regulators"
> > +                     "qcom,pms405-regulators"
> >
> >  - interrupts:
> >       Usage: optional
> > @@ -111,6 +112,29 @@ Qualcomm SPMI Regulators
> >       Definition: Reference to regulator supplying the input pin, as
> >                   described in the data sheet.
> >
> > +- vdd_s1-supply:
> > +- vdd_s2-supply:
> > +- vdd_s3-supply:
> > +- vdd_s4-supply:
> > +- vdd_s5-supply:
> > +- vdd_l1-supply:
> > +- vdd_l2-supply:
> > +- vdd_l3-supply:
> > +- vdd_l4-supply:
> > +- vdd_l5-supply:
> > +- vdd_l6-supply:
> > +- vdd_l7-supply:
> > +- vdd_l8-supply:
> > +- vdd_l9-supply:
> > +- vdd_l10-supply:
> > +- vdd_l11-supply:
> > +- vdd_l12-supply:
> > +- vdd_l13-supply:
>
> No, the supply pins are as follows:
>
> - vdd_l1_l2-supply:
> - vdd_l3_l8-supply:
> - vdd_l4-supply:
> - vdd_l5_l6-supply:
> - vdd_l10_l11_l12_l13-supply:
> - vdd_l7-supply:
> - vdd_l9-supply:
> - vdd_s1-supply:
> - vdd_s2-supply:
> - vdd_s3-supply:
> - vdd_s4-supply:
> - vdd_s5-supply:

Sure, will update.

>
>
> Regards,
> Bjorn
>
> > +     Usage: optional (pms405 only)
> > +     Value type: <phandle>
> > +     Definition: Reference to regulator supplying the input pin, as
> > +                 described in the data sheet.
> > +
> >  - qcom,saw-reg:
> >       Usage: optional
> >       Value type: <phandle>
> > --
> > 2.17.1
> >
