Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCA21D9525
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 13:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgESLUy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 07:20:54 -0400
Received: from h4.fbrelay.privateemail.com ([131.153.2.45]:48531 "EHLO
        h4.fbrelay.privateemail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726157AbgESLUy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 07:20:54 -0400
Received: from MTA-06-4.privateemail.com (mta-06.privateemail.com [68.65.122.16])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id B10E281395;
        Tue, 19 May 2020 07:20:53 -0400 (EDT)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
        by MTA-06.privateemail.com (Postfix) with ESMTP id 949ED6003F;
        Tue, 19 May 2020 07:20:51 -0400 (EDT)
Received: from casper (unknown [10.20.151.219])
        by MTA-06.privateemail.com (Postfix) with ESMTPA id 1453F6004D;
        Tue, 19 May 2020 11:20:50 +0000 (UTC)
Date:   Tue, 19 May 2020 04:20:50 -0700
From:   Eli Riggs <eli@rje.li>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add initial support for Xiaomi
 Redmi Note 8T
Message-ID: <20200519042050.7efd4b0c@casper>
In-Reply-To: <20200519061114.GC2165@builder.lan>
References: <20200517115410.3374-1-eli@rje.li>
 <20200517115410.3374-3-eli@rje.li>
 <20200519061114.GC2165@builder.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 18 May 2020 23:11:14 -0700
Bjorn Andersson <bjorn.andersson@linaro.org> wrote:

> On Sun 17 May 04:54 PDT 2020, Eli Riggs wrote:
> 
> > Adds initial device tree for Xiaomi Redmi Note 8T, codename
> > xiaomi-willow. It uses the sm6125 SoC. Currently only boots into
> > initrd shell over UART. Requires appended DTB with qcom,board-id =
> > <0x22 0x0> and qcom,msm-id = <0x18a 0x10000> to actually boot.
> > 
> 
> If I read this correctly you need to supply board-id and msm-id in
> order to be able to get this booting?
> 
> Even though we don't like them, I would prefer if you just add them in
> the dts file, in this patch.

Yes, AFAICT the bootloader iterates over the appended DTBs and will
only boot if it finds one with those matching properties.

> > dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
> > dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb diff --git
> > a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
> > b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts new file mode
> > 100644 index 0000000000000..444b32ccb9d48 --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> 
> Please make this GPL/BSD dual license.
> 
> Apart from these few remarks your patches looks good, looking forward
> to see more of this platform!
> 
> Regards,
> Bjorn

OK, thanks!
