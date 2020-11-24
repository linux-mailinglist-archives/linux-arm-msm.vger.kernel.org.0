Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC5AB2C1DB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 06:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729221AbgKXFrD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 00:47:03 -0500
Received: from guitar.tcltek.co.il ([192.115.133.116]:39273 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729217AbgKXFrD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 00:47:03 -0500
X-Greylist: delayed 521 seconds by postgrey-1.27 at vger.kernel.org; Tue, 24 Nov 2020 00:47:02 EST
Received: from tarshish (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id 4BAD64400C6;
        Tue, 24 Nov 2020 07:38:16 +0200 (IST)
References: <20201124052701.GF8403@vkoul-mobl>
User-agent: mu4e 1.4.13; emacs 27.1
From:   Baruch Siach <baruch@tkos.co.il>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: Reusing DTS from arm64 to arm
In-reply-to: <20201124052701.GF8403@vkoul-mobl>
Date:   Tue, 24 Nov 2020 07:38:15 +0200
Message-ID: <87lferwbzs.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

On Tue, Nov 24 2020, Vinod Koul wrote:
> We have Qualcomm arm platform which uses PMIC PM8150B. This PMIC was
> also used in SM8150 board and is already upstream [1] but in arm64.
>
> So, what is the guidance to share DTS files between 32 and 64 variants?
> Does a solution already exist which I may not be aware of..?

You might want to take a look at Raspberry Pi. For example:

arch/arm64/boot/dts/broadcom/bcm2837-rpi-3-b.dts:
// SPDX-License-Identifier: GPL-2.0
#include "arm/bcm2837-rpi-3-b.dts"

baruch

> I can think of following options for this, in case we dont have a
> solution:
>
> 1. Hack up arm include paths to also include arm64 path so that we can
> share DTS
>
> 2. Use relative path of arm64 directory and include that (seems not
> great to look at)
>
> 3. Copy the file (simplest but least preferred)
>
> Or is there a better idea to solve this...?
>
> [1]: arch/arm64/boot/dts/qcom/pm8150b.dtsi
>
> Thanks


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
