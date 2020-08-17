Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032FB246831
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 16:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgHQOOC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 10:14:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:48970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728465AbgHQOOB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 10:14:01 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A87720729;
        Mon, 17 Aug 2020 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597673640;
        bh=8O7qw6BCN+efbgg/RYA0raLJkFhZsKOGJVtGubbB164=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Yi5vjPkHVvumnFVZRdbd4wh9eM7MLT0ZFpBuBiRacd99mxSSAX0ols3pxA1vIYlxk
         qeJz3aoOprLanOD9VTnQfgXE+lYayxbkZVMA/N4kAG7nxUJ99bVrFdsaSucpNxyOYc
         Hm1r/p+32ZIbGHr74T4/4+16NVgSz2AvDCMcZeQ0=
Received: by mail-oi1-f178.google.com with SMTP id j7so14889947oij.9;
        Mon, 17 Aug 2020 07:14:00 -0700 (PDT)
X-Gm-Message-State: AOAM532VyIl6B/HnSWTyZx2DYNE9fzD6k6cwNJs9QGP6MK2Uda6R/wLH
        ReODdXceUswTrSwgya85JGODeEWpyoWdajOuTQ==
X-Google-Smtp-Source: ABdhPJzDyEB62OFCS0ZR6kCDWJDbaeab8pSiIIncA5711i8IP18JmASq9esmDP4wsdj5hEzDb6mZAZhkabYpBOIhyJs=
X-Received: by 2002:aca:c3d8:: with SMTP id t207mr9793498oif.152.1597673639819;
 Mon, 17 Aug 2020 07:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597247164.git.mchehab+huawei@kernel.org>
 <da65a508d01aa2092999d0ce7e9c061ccfd24036.1597247164.git.mchehab+huawei@kernel.org>
 <20200814201708.GA2665752@bogus> <20200815115536.6519a7f5@coco.lan>
In-Reply-To: <20200815115536.6519a7f5@coco.lan>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 17 Aug 2020 08:13:47 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+AsbJxsyjVt_YC=9ToqQC_0XPLymLkKnmpc0uuS-1eSQ@mail.gmail.com>
Message-ID: <CAL_Jsq+AsbJxsyjVt_YC=9ToqQC_0XPLymLkKnmpc0uuS-1eSQ@mail.gmail.com>
Subject: Re: [PATCH 43/44] dt: document HiSilicon SPMI controller and
 mfd/regulator properties
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     mauro.chehab@huawei.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Linuxarm <linuxarm@huawei.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Aug 15, 2020 at 3:55 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Hi Rob,
>
> Em Fri, 14 Aug 2020 14:17:08 -0600
> Rob Herring <robh@kernel.org> escreveu:
>
> > On Wed, 12 Aug 2020 17:56:53 +0200, Mauro Carvalho Chehab wrote:
> > > Add documentation for the properties needed by the HiSilicon
> > > 6421v600 driver, and by the SPMI controller used to access
> > > the chipset.
> > >
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 182 ++++++++++++++++++
> > >  .../spmi/hisilicon,hisi-spmi-controller.yaml  |  54 ++++++
> > >  2 files changed, 236 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
> > >
> >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.example.dt.yaml: example-0: spmi@fff24000:reg:0: [0, 4294066176, 0, 4096] is too long
>
> I was unable to find any way to solve this one. What's the proper
> way to set the length of the root reg on some example?

The default is 1 address and size cell. Either adjust 'reg' for that
or you can define a bus node:

bus {
  #address-cells = <2>;
  #size-cells = <2>;

  spmi@123 {
    ...
  };
};

My preference is doing the former.

Rob
