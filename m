Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA5D2AD5EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 13:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730061AbgKJMMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 07:12:34 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:34074 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730021AbgKJMMe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 07:12:34 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 25063803086A;
        Tue, 10 Nov 2020 12:12:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7_7GLs-UjHzI; Tue, 10 Nov 2020 15:12:31 +0300 (MSK)
Date:   Tue, 10 Nov 2020 15:12:30 +0300
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Jun Li <lijun.kernel@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 29/29] arm64: dts: qcom: Harmonize DWC USB3 DT nodes name
Message-ID: <20201110121230.vnyg33dbfggkonmm@mobilestation>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-30-Sergey.Semin@baikalelectronics.ru>
 <CAKgpwJWWg+fimuQOCcw=L0HZSwLYXNNCAV4ifzzG-HXfkFmazw@mail.gmail.com>
 <20201103232347.GD65067@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201103232347.GD65067@builder.lan>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Jun and Bjorn.

On Tue, Nov 03, 2020 at 05:23:47PM -0600, Bjorn Andersson wrote:
> On Mon 02 Nov 01:34 CST 2020, Jun Li wrote:
> 
> > Serge Semin <Sergey.Semin@baikalelectronics.ru> ???2020???10???20????????? ??????8:04?????????
> > >
> > > In accordance with the DWC USB3 bindings the corresponding node
> > > name is suppose to comply with the Generic USB HCD DT schema, which
> > > requires the USB nodes to have the name acceptable by the regexp:
> > > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > > named.
> > 

> > This need a counterpart driver change:
> > drivers/usb/dwc3/dwc3-qcom.c
> > dwc3_np = of_get_child_by_name(np, "dwc3");
> > 
> 
> Thanks for catching this Jun. The code certainly needs to be updated to
> look for the new child node, while falling back to the old name, before
> I can merge this change.

Thanks for looking into this. I'll add a patch, which fixes that into
the next series, but with no tested status guarantee, since I haven't
got a corresponding hardware.

-Sergey

> 
> Regards,
> Bjorn
