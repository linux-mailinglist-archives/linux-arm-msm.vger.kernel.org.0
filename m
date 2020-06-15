Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F9C1FA470
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 01:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgFOXhJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jun 2020 19:37:09 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:23258 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726867AbgFOXhH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jun 2020 19:37:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592264226; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2DtTXOmQcCDu/XLc8Y9feTA+UARZggV+DWpANCHY8bY=;
 b=D6j+VkgRO6Zw3P42rsuM8K8QwuZlUpAihA2niwq/vD5ZP/jgiDSTlD/Fp6Bmi/pYdZQ+jvh+
 RYztHw1Bvz8zNGqMCkr/w5tm/cVyvO/dbnjerCPRzMPCd+X2KFREKL3ZY+oHPnek4QWaTHdn
 P/Ooj+SKd4E1ezYF4li5OnPsNf0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5ee806153a8a8b20b85e3ef0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Jun 2020 23:36:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 390BCC43391; Mon, 15 Jun 2020 23:36:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: tanmay)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 650E9C433CA;
        Mon, 15 Jun 2020 23:36:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 15 Jun 2020 16:36:52 -0700
From:   tanmay@codeaurora.org
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        DTML <devicetree@vger.kernel.org>, aravindh@codeaurora.org,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [Freedreno] [PATCH v6 0/5] Add support for DisplayPort driver on
In-Reply-To: <CAOCk7NrX9Lk6GQKXcFMd1CHHu7CjVg7hUAwt1LyNFdVHHGPO-g@mail.gmail.com>
References: <20200612015030.16072-1-tanmay@codeaurora.org>
 <159200440578.62212.5195358467251573190@swboyd.mtv.corp.google.com>
 <1eda01da33b620ddee5162be3326853f@codeaurora.org>
 <CAOCk7NrX9Lk6GQKXcFMd1CHHu7CjVg7hUAwt1LyNFdVHHGPO-g@mail.gmail.com>
Message-ID: <fa12d16e7aeda5971b2a65ac5414f18c@codeaurora.org>
X-Sender: tanmay@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-15 16:04, Jeffrey Hugo wrote:
> On Mon, Jun 15, 2020 at 4:51 PM <tanmay@codeaurora.org> wrote:
>> 
>> On 2020-06-12 16:26, Stephen Boyd wrote:
>> 
>> Thanks for reviews Stephen.
>> 
>> > Quoting Tanmay Shah (2020-06-11 18:50:25)
>> >> These patches add support for Display-Port driver on SnapDragon
>> >> hardware. It adds
>> >> DP driver and DP PLL driver files along with the needed device-tree
>> >> bindings.
>> >>
>> >> The block diagram of DP driver is shown below:
>> >>
>> >>
>> >>                  +-------------+
>> >>                  |DRM FRAMEWORK|
>> >>                  +------+------+
>> >>                         |
>> >>                    +----v----+
>> >>                    | DP DRM  |
>> >>                    +----+----+
>> >>                         |
>> >>                    +----v----+
>> >>      +------------+|   DP    +----------++------+
>> >>      +        +---+| DISPLAY |+---+      |      |
>> >>      |        +    +-+-----+-+    |      |      |
>> >>      |        |      |     |      |      |      |
>> >>      |        |      |     |      |      |      |
>> >>      |        |      |     |      |      |      |
>> >>      v        v      v     v      v      v      v
>> >>  +------+ +------+ +---+ +----+ +----+ +---+ +-----+
>> >>  |  DP  | |  DP  | |DP | | DP | | DP | |DP | | DP  |
>> >>  |PARSER| | HPD  | |AUX| |LINK| |CTRL| |PHY| |POWER|
>> >>  +--+---+ +---+--+ +---+ +----+ +--+-+ +-+-+ +-----+
>> >>     |                              |     |
>> >>  +--v---+                         +v-----v+
>> >>  |DEVICE|                         |  DP   |
>> >>  | TREE |                         |CATALOG|
>> >>  +------+                         +---+---+
>> >>                                       |
>> >>                                   +---v----+
>> >>                                   |CTRL/PHY|
>> >>                                   |   HW   |
>> >>                                   +--------+
>> >>
>> >
>> > I've never seen a block diagram for a driver before...
>> >
>> It is here for v5. https://patchwork.freedesktop.org/series/74312/
> 
> I think Stephen is nitpicking your wording, and you seem to not be
> understanding his comment.  I'm sorry if I am mistaken.
> 
> The "DP driver" would seem to refer to the linux software driver you
> are proposing patches for, however this diagram looks like a hardware
> diagram of the various hardware blocks that the Linux driver code (the
> "DP driver") is expected to interact with.  I believe you should
> re-word "The block diagram of DP driver is shown below:" to be more
> specific of what you are describing with your figure.  IE your words
> say this is a block diagram of the software, when it looks like it is
> a block diagram of the hardware.

Thanks for reviews.

I am not sure what Stephen meant, but this diagram was available before.

Just for clarification this is not hardware diagram at all.
This is modeling of DP driver for msm.
Each box name above except "DRM framework", is file name in driver i.e. 
software module.
Each line and arrow shows how modules interact with each other.

For example, "DP PARSER" Box is pointing towards "DEVICE TREE" Box, that 
means
dp_parser.c file contains functions which are parsing device tree 
properties and so on...
