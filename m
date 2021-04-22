Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6AF368310
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 17:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237663AbhDVPLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Apr 2021 11:11:03 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18346 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237747AbhDVPLC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Apr 2021 11:11:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619104227; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vDB0vKCMD4UXSX/CvhsInRXbDbGVtPaaZh08hxixUcE=;
 b=cw0VyKxunMq5tOyfdGb2JZj0SJ67kPrYULYoEYiuKUSHA/eM85YMlKh4DsdZvcZXKy/7HxcZ
 iSrB1S7J4tRpVQceu+qOwx8xQWbvFjmd2x74Lnm+UMJjWHA+y18zB7Ag6fr2ltCIjejqRXEY
 LEXjTbXe+36T/Fv7jfQYCNuSEHc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 608191d5a817abd39a2a4766 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 22 Apr 2021 15:10:13
 GMT
Sender: rojay=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9CFA5C43217; Thu, 22 Apr 2021 15:10:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rojay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CAF9BC433D3;
        Thu, 22 Apr 2021 15:10:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 22 Apr 2021 20:40:11 +0530
From:   rojay@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH] arm64: dts: sc7280: Add qspi, qupv3_0 and qupv3_1 nodes
In-Reply-To: <CAD=FV=VuGPvUY8edN+PEuZS_pO+=3WHeJ-4J5tHDAPRnXJs0QA@mail.gmail.com>
References: <20210311033957.8978-1-rojay@codeaurora.org>
 <CAD=FV=VuGPvUY8edN+PEuZS_pO+=3WHeJ-4J5tHDAPRnXJs0QA@mail.gmail.com>
Message-ID: <c395cc77aed847dfaa59b0c2eadce6bf@codeaurora.org>
X-Sender: rojay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 2021-03-12 03:24, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 10, 2021 at 7:41 PM Roja Rani Yarubandi
> <rojay@codeaurora.org> wrote:
>> 
>> +&qspi_cs0 {
>> +       pinconf {
>> +               pins = "gpio15";
>> +               bias-disable;
>> +       };
> 
> The "pinconf" / "pinmux" subnode shouldn't be used for new SoCs. See:
> 
> http://lore.kernel.org/r/CAD=FV=UY_AFRrAY0tef5jP698LEng6oN652LcX3B4nG=aWh0gA@mail.gmail.com
> 
> ...same feedback for this whole patch.
> 

Ok, will do the changes.

>> +                       qup_spi0_default: qup-spi0-default {
>> +                               pinmux {
>> +                                       pins = "gpio0", "gpio1",
>> +                                              "gpio2", "gpio3";
>> +                                       function = "qup00";
>> +                               };
>> +                       };
> 
> Please split these SPI nodes as per the thread above, like:
> 
> tlmm: pinctrl@... {
>   qup_spi0_data_clk: qup-spi0-data-clk {
>     pins = "gpio0", "gpio1", "gpio2";
>     function = "qup0";
>   };
> 
>   qup_spi0_cs: qup-spi0-cs {
>     pins = "gpio3";
>     function = "qup0";
>   };
> 
>   qup_spi0_cs_gpio: qup-spi0-cs-gpio {
>     pins = "gpio3";
>     function = "gpio";
>   };
> };
> 
> 
>> +                       qup_uart0_default: qup-uart0-default {
>> +                               pinmux {
>> +                                       pins = "gpio0", "gpio1",
>> +                                              "gpio2", "gpio3";
>> +                                       function = "qup00";
>> +                               };
>> +                       };
> 
> I suspect things would actually be cleaner if we broke the uart lines
> up since the boards tend to have to adjust pulls differently for each
> line. With the new "no pinconf / pinmux" world it's pretty clean. It's
> obviously up to Bjorn, but if it were me I'd request this in the SoC
> file:
> 
> qup_uart0_cts: qup-uart0-cts {
>   pins = "...";
>   function = "qup00";
> };
> 
> qup_uart0_rts: qup-uart0-rts {
>   pins = "...";
>   function = "qup00";
> };
> 
> qup_uart0_rx: qup-uart0-rx {
>   pins = "...";
>   function = "qup00";
> };
> 
> qup_uart0_tx: qup-uart0-tx {
>   pins = "...";
>   function = "qup00";
> };
> 
> ...and now when the board file wants to adjust the pulls they can just
> reference each one:
> 
> /*
>  * Comments about why the UART0 pulls make sense.
>  * Blah blah blah.
>  */
> 
> &qup_uart0_cts {
>   bias-pull-down;
> };
> 
> &qup_uart0_rts {
>   drive-strength = <2>;
>   bias-disable;
> };
> 
> &qup_uart0_rx {
>   bias-pull-up;
> };
> 
> &qup_uart0_tx {
>   drive-strength = <2>;
>   bias-disable;
> };
> 
> 
>> +               qspi: spi@88dc000 {
> 
> I believe the qspi node is sorted incorrectly. When I apply this to
> the top of the Qualcomm tree it shows up after the "apps_smmu:
> iommu@15000000" node. However:
> 
> 0x088dc000 < 0x15000000
> 
> ...which means it should be _before_.
> 

Sure, will move before apps_smmu

Thanks,
Roja
> -Doug
