Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAFBD2C6824
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Nov 2020 15:49:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730920AbgK0Oro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Nov 2020 09:47:44 -0500
Received: from z5.mailgun.us ([104.130.96.5]:31195 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730916AbgK0Orn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Nov 2020 09:47:43 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606488463; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=HUJXvp284SgEwZROfQs9oj7GiVOC/2yMIUq8pK3JA5U=; b=EekN9MMhe1XylyED16a7HTPA2g+9KcsgfyVflkmfHxH3+QhFxreUmllaxMBPEHgibHY0Uw3V
 Mtb9ggGun4MTuzCP8M5ydG+M6JAQNAnf/dI0Z5gQAN+cCXRDW3b+rror6w0bthzm8t1NyXCB
 cW2/OI2Qqru8Rj7xpzBnlMMj4BY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fc1118c7f0cfa6a16f331c1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 27 Nov 2020 14:47:40
 GMT
Sender: mdalam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C3C3BC43464; Fri, 27 Nov 2020 14:47:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mdalam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CEDF3C433C6;
        Fri, 27 Nov 2020 14:47:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 27 Nov 2020 20:17:38 +0530
From:   mdalam@codeaurora.org
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Md Sadre Alam <mdalam@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH 2/5] mtd: rawnand: qcom: Add initial support for qspi nand
Message-ID: <885854a4765c302d86b0d482c2c45abc@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-29 14:37, Boris Brezillon wrote:
> Hello,
> 
> On Sat, 10 Oct 2020 11:01:39 +0530
> Md Sadre Alam <mdalam@codeaurora.org> wrote:
> 
>> This change will add initial support for qspi (serial nand).
>> 
>> QPIC Version v.2.0 onwards supports serial nand as well so this
>> change will initialize all required register to enable qspi (serial
>> nand).
>> 
>> This change is supporting very basic functionality of qspi nand flash.
>> 
>> 1. Reset device (Reset QSPI NAND device).
>> 
>> 2. Device detection (Read id QSPI NAND device).
> 
> Unfortunately, that's not going to work in the long term. You're
> basically hacking the raw NAND framework to make SPI NANDs fit. I do
> understand the rationale behind this decision (re-using the code for
> ECC and probably other things), but that's not going to work. So I'd
> recommend doing the following instead:
> 
> 1/ implement a SPI-mem controller driver
> 2/ implement an ECC engine driver so the ECC logic can be shared
>    between the SPI controller and raw NAND controller drivers
> 3/ convert the raw NAND driver to the exec_op() interface (none of
>    this hack would have been possible if the driver was using the new
>    API)

Sorry for late reply. I think I mixup the serial nand support and 
QPIC_V2.0 support.
Only patches [2/5] mtd: rawnand: qcom: Add initial support for qspi nand
and [5/5] mtd: rawnand: qcom: Add support for serial training. are for 
serial
nand. Other patches [3/5] mtd: rawnand: qcom: Read QPIC version &
[4/5] mtd: rawnand: qcom: Enable support for erase,read & write for 
serial nand.
are to support QPIC_V2.0. In QPIC_V2.0 onwards some additional registers 
and features
got added. QPIC_NAND_READ_LOCATION_LAST_CW_n register got added to read 
last code word.
Page scope read & multi page read feature got added to read single and 
multiple
pages. QPIC_NAND_AUTO_STATUS_EN register got added to read status in 
page scope read
& multi page read etc.

I will take out QPIC_V2.0 support patches and will push it separately.
For serial nand support few lines of codes are there around 50 lines
to initalize QPIC serial block and serial training code. So can I put 
this
this as a separate file inside drivers/mtd/nand/raw/qpic_serial_nand.c. 
Would it be ok ?
Because there is no dedicated spi controller for serial nand. QPIC 
controller having
one serial interface block to deal with serial nand device.

> 
> Regards,
> 
> Boris
