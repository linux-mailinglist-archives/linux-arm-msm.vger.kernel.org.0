Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A54E24A7E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Aug 2020 22:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgHSUsb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Aug 2020 16:48:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:48478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725997AbgHSUsb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Aug 2020 16:48:31 -0400
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5369620882;
        Wed, 19 Aug 2020 20:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597870110;
        bh=9crOgT52TmAOv1iK3vebtz9/E7bREo+oWG1jo5jSTC0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RJinGCDNEonutROqPVcTXjxyWIy0pJwLJgA4+IXY/N8rV6JrSWsQNmQ9BG37NaQVQ
         yZYtbZ9z+30TwdO9fIL0qjV8W6NUCQ/zI0Mc0MY8xUMSrzUvdTiFkkwOJ7qStFFiNc
         UPXXnHxVKxpC1lAQxTlywf6Kszetxu5S0N0b1quI=
Received: by mail-oo1-f47.google.com with SMTP id x6so5170732ooe.8;
        Wed, 19 Aug 2020 13:48:30 -0700 (PDT)
X-Gm-Message-State: AOAM533VL+mQUNtTY0cMt5YjwBeAPjAUR/XB/vSWSjOkNS8c0eS2utWG
        jhN7J3HbkDi41kO3ZpKV217xk71UHrakp+2khg==
X-Google-Smtp-Source: ABdhPJyoxJmqCuJOTAf6jiQAC3mHa6GCIbUJFjsYYtXGzK9E6h88/mOwV1doWau/GCnbacbCX7tw6e7oykbVWL9wZl0=
X-Received: by 2002:a4a:87c8:: with SMTP id c8mr19878371ooi.81.1597870109631;
 Wed, 19 Aug 2020 13:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597647359.git.mchehab+huawei@kernel.org>
 <2f88fed96d67b05fc033356fdbb7e3227955ab34.1597647359.git.mchehab+huawei@kernel.org>
 <20200817201211.GA1437827@bogus> <20200818111351.7e3fc780@coco.lan>
 <20200818170755.GA3603438@bogus> <20200819001821.651a7dcd@coco.lan>
In-Reply-To: <20200819001821.651a7dcd@coco.lan>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 19 Aug 2020 14:48:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJkPC3TN50mOQ=HyRNeQ7Snm9oCoU44mjXYXvctFx4QiA@mail.gmail.com>
Message-ID: <CAL_JsqJkPC3TN50mOQ=HyRNeQ7Snm9oCoU44mjXYXvctFx4QiA@mail.gmail.com>
Subject: Re: [PATCH v3 43/44] dt: document HiSilicon SPMI controller and
 mfd/regulator properties
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linuxarm <linuxarm@huawei.com>, mauro.chehab@huawei.com,
        Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 18, 2020 at 4:18 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Tue, 18 Aug 2020 11:07:55 -0600
> Rob Herring <robh@kernel.org> escreveu:
>
> > > > > +  spmi-channel:
> > > > > +    description: number of the SPMI channel where the PMIC is connected
> > > >
> > > > This looks like a common (to SPMI), but it's not something defined in
> > > > spmi.txt
> > >
> > > This one is not part of the SPMI core. It is stored inside a private
> > > structure inside at the HiSilicon spmi controller driver. It is stored
> > > there as ctrl_dev->channel, and it is used to calculate the register offset
> > > for readl():
> > >
> > >     offset  = SPMI_APB_SPMI_STATUS_BASE_ADDR;
> > >     offset += SPMI_CHANNEL_OFFSET * ctrl_dev->channel + SPMI_SLAVE_OFFSET * sid;
> > >     do {
> > >             status = readl(base + offset);
> > >     ...
> > >
> > > The SPMI bus is somewhat similar to I2C: it is a 2-wire serial bus
> > > with up to 16 devices connected to it.
> > >
> > > Now, most modern I2C chipsets provide multiple independent I2C
> > > channels, on different pins. Also, on some chipsets, certain
> > > GPIO pins can be used either as GPIO or as I2C.
> > >
> > > I strongly suspect that this is the case here: according with
> > > the Hikey 970 schematics:
> > >
> > >     https://www.96boards.org/documentation/consumer/hikey/hikey970/hardware-docs/files/hikey970-schematics.pdf
> > >
> > > The pins used by SPMI clock/data can also be used as GPIO.
> > >
> > > While I don't have access to the datasheets for Kirin 970 (or any other
> > > chipsets on this board), for me, it sounds that different GPIO pins
> > > are allowed to use SPMI. The "spmi-channel" property specifies
> > > what pins will be used for SPMI, among the ones that are
> > > compatible with MIPI SPMI specs.
> >
> > Based on this, I think it should be called 'hisilicon,spmi-channel' as
> > it is vendor specific.
>
> I'm fine with "hisilicon,spmi-channel".

Humm, QCom has a 'qcom,channel' property for SPMI. Seems like maybe it
should be a common thing.

Rob
