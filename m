Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267C73F8259
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 08:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238082AbhHZGTz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 02:19:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:34746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237805AbhHZGTz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 02:19:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B8B660FD7;
        Thu, 26 Aug 2021 06:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629958742;
        bh=WCh4hrPWiyzW5GUAbAw9ca2lugUY0Q5onqNdif7DbvI=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=utQvu0FB9xKhWHiX4IBoIXIrfm29z3odnicgseeyeD/lRmeZfvSodmdPpdO9FMh8/
         18Uj44VQk5MJiPavgYaJBW/nB/igGdu3qKAwYBjHAclV5j6n8UGuTW5VL9z59Tnvev
         ccq4uhe68tv6kSeKIe833pcTqx2tt/VYa7iYaHhJOd8rpA6q52Q4CvMMwgq+vgGysr
         1OG/suJ2m8VlU9FUmt/ZXVFmajkRYjQ3r9lHeiqpVHYe0QXkqohP4j7stSWmKCKzD7
         D17gMft7eySD/hH7uhUKDudh9K0ry1H0hXsBGFGuJIfWSwwUZx44vvGKdf+0qXhBeR
         xHoUmWyfGh6Vw==
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen> <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen> <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org>
 <ce5f12dd-ddc1-6a9c-3dfb-aa44ea166828@linaro.org>
 <YSZned9v1+ajzVx0@ripper>
 <90d17c95-1cf3-89aa-94ad-920e4781f866@linaro.org>
 <YSaizDpqNRZcBGIc@ripper>
User-agent: mu4e 1.6.4; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd
 to dwc3-qcom
Date:   Thu, 26 Aug 2021 09:15:59 +0300
In-reply-to: <YSaizDpqNRZcBGIc@ripper>
Message-ID: <87ilzsafu5.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hi,

Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> On Wed 25 Aug 10:59 PDT 2021, Bryan O'Donoghue wrote:
>
>> On 25/08/2021 16:53, Bjorn Andersson wrote:
>> > But in the case of Type-C altmode several of our boards have either an
>> > external gpio-based SBU-pin-swapper or some redriver on I2C with this
>> > functionality, so we need a way to tell both the PHY and this external
>> > contraption about the orientation.
>> 
>> Its a very similar problem to orientation switch
>> 
>> As an example
>> 
>> - redriver may need to fix up signal integrity for
>>   lane switching
>> 
>> - PHY needs to toggle lanes from one IP block to another
>> 
>
> Right, conceptually the problem is similar, but IMHO there's a big
> difference in that the redriver and PHY are two physically separate
> entities - on different buses. The dwc3 glue and core represent the same
> piece of hardware.

no they don't. The glue is a real piece of HW that adapts the "generic"
synopsys IP to a given SoC. OMAP, for example, was adapting Synopsys'
proprietary interface to the Sonics interconnect, while some others may
adapt it to AXI or PCI or whatever.

They are different HW blocks, the glue (in many cases) has its own IRQ,
its own address space, its own register file, and so on. Granted, the
glue also serves as an access port from CPU to the synopsys core, but
that's handled by `ranges' DT property.

-- 
balbi
