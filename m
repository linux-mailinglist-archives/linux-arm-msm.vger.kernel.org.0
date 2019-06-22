Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 753644F31E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2019 03:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbfFVBnE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 21:43:04 -0400
Received: from onstation.org ([52.200.56.107]:32872 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbfFVBnE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 21:43:04 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 3E58D3E9C9;
        Sat, 22 Jun 2019 01:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1561167783;
        bh=IzpR3342Zo9qt7/5FY4YZ3EhlrbdqIdBDC4xYGEgV/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L7yPW+eol25pVIHxkWQyPNS4TRH6ITU3pzqmxKec/mnVuMtC19eJTijdX55303oHj
         aoKQBSmVKw0/SXQkYhSaWobhcMwFTuEIufBrUlpplgcFjk+JBWL7HoSjXGNZ7vFQzK
         xcFCjvFcaK4RdaZCa837DJQ1UqkoeYmp9/+PlXa0=
Date:   Fri, 21 Jun 2019 21:43:02 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     linux-arm-msm@vger.kernel.org,
        ~martijnbraam/pmos-upstream@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: msm8974-FP2: add reboot-mode node
Message-ID: <20190622014302.GA20947@onstation.org>
References: <20190620225824.2845-1-luca@z3ntu.xyz>
 <20190621000122.GA13036@onstation.org>
 <4607058.UzJteFJyig@g550jk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4607058.UzJteFJyig@g550jk>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 21, 2019 at 09:25:17PM +0200, Luca Weiss wrote:
> On Freitag, 21. Juni 2019 02:01:22 CEST you wrote:
> > I think that it makes sense to put this snippet in qcom-msm8974.dtsi
> > with a status of disabled, and then enable it in
> > qcom-msm8974-fairphone-fp2.dts like so:
> > 
> > imem@fe805000 {
> > 	status = "ok";
> > };
> 
> Do you want me to put the whole node in the the dtsi file? Even though these 
> values are the same, there are also custom vendor-specified values for specific 
> phones.

mach-msm in the downstream hammerhead sources has those addresses:
https://github.com/AICP/kernel_lge_hammerhead/blob/n7.1/arch/arm/mach-msm/restart.c#L271
This lead me to think that it applies to other msm8974-based systems as
well.

I tried your device tree snippet on the Nexus 5 and it reboots the phone
for me.

/ # ./reboot-mode normal
[   85.088556] reboot: Restarting system with command 'normal'

The recovery and bootloader modes reboot the phone but into normal mode.
Oddly, the bootloader shows different power on reasons after the
"welcome to hammerhead bootloader" message.

normal = [10] Power on reason 20001
recovery = [10] Power on reason 1
bootloader = [10] Power on reason 20001

> On the Linux kernel side, it has bootloader (0x77665500), recovery 
> (0x77665502), rtc (0x77665503), oem-* (0x6f656d00 | somevalue), edl (some 
> other addresses), and the else statements writes the 0x77665501 value in my 
> patch.

The downstream hammerhead sources have the oem-*, and emergency download
modes (edl) listed as well.

I'm not sure on your other questions.

Brian
