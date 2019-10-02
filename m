Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBF31C8CBD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 17:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726239AbfJBPVZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Oct 2019 11:21:25 -0400
Received: from ns.iliad.fr ([212.27.33.1]:34792 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726179AbfJBPVZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Oct 2019 11:21:25 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 2D6C120AEE;
        Wed,  2 Oct 2019 17:21:23 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 16ECB20723;
        Wed,  2 Oct 2019 17:21:23 +0200 (CEST)
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
 <16212a577339204e901cf4eefa5e82f1@codeaurora.org>
 <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
 <fa5a35f0e993f2b604b60d5cead3cf28@codeaurora.org>
 <CAOCk7NodWtC__W3=AQfXcjF-W9Az_NNUN0r8w5WmqJMziCcvig@mail.gmail.com>
 <5b8835905a704fb813714694a792df54@codeaurora.org>
 <CANLsYkxPOOorqcnPrbhZLzGV9Y7EGWUUyxvi-Cm5xxnzhx=Ecg@mail.gmail.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <585ee38c-39d1-47df-78b7-f4b670f17a25@free.fr>
Date:   Wed, 2 Oct 2019 17:21:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CANLsYkxPOOorqcnPrbhZLzGV9Y7EGWUUyxvi-Cm5xxnzhx=Ecg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Oct  2 17:21:23 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/10/2019 17:03, Mathieu Poirier wrote:

> The problem here is that a debug and production device are using the
> same device tree, i.e msm8998.dtsi.  Disabling coresight devices in
> the DTS file will allow the laptop to boot but completely disabled
> coresight blocks on the MTP board.  Leaving things as is breaks the
> laptop but allows coresight to be used on the MTP board.  One of three
> things can happen:
> 
> 1) Nothing gets done and production board can't boot without DTS modifications.
> 2) Disable tags are added to the DTS file and the debug board can't
> use coresight without modifications.
> 2) The handling of the debug power domain is done properly on the
> MSM8998 rather than relying on the bootloader to enable it.
> 3) The DTS file is split or reorganised to account for debug/production devices.

I believe 3) is already the de facto situation.

arch/arm64/boot/dts/qcom/msm8998.dtsi is the "base" config.
arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi for the MTP board.
arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi for the laptops.

> Which of the above ends up being the final solution is entirely up to
> David and Andy.

2498f8c1c668 ;-)

Regards.
