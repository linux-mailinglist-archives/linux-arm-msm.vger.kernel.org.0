Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4282D37FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 05:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfJKDrU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 23:47:20 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:51188 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfJKDrU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 23:47:20 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 22B4260C5F; Fri, 11 Oct 2019 03:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570765639;
        bh=IcUPMuNTrltLQ0KBJgnpjTRfjOFERXvrHqQN6jYAs3A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IDbf2WAV37ipB5tDkif0qRsvGShPlfOJORwpNEyI/v6CtE11LpZLf8vWEz+n6BKC2
         XKHmRnY0NiHL6nKRw0gPyYkp+GsT/DVeYYeBSiaU/fCnzXoToSwzTj1NuKlVWFrXXR
         vKly/juTtuXygVM3tW6rSHFNtfk/YfENJxWN7V5A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.206.24.216] (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CAFB6076A;
        Fri, 11 Oct 2019 03:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570765638;
        bh=IcUPMuNTrltLQ0KBJgnpjTRfjOFERXvrHqQN6jYAs3A=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NEjcSWMvTNp0ox0avfVXB97p3vqDcUnSjU2F61fyfpF/us0zNuIaK/b9FnnWNw49v
         W8QxyisVWzE0cUZHo13zoXQbPMApzlfGy4bdeHV+VRmQLWS79xrrkgYieCahUaO3bI
         y+bh6cjzDjryCIy8a5emJHeVs/lcVxxqjMEaYZiE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0CAFB6076A
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH v1] clk: qcom: Skip halt checks on gcc_pcie_0_pipe_clk for
 8998
To:     Stephen Boyd <sboyd@kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Amit Nischal <anischal@codeaurora.org>
References: <a7e27415-02d9-bfe9-c0ea-59dc236a7f91@free.fr>
 <c1762201-a1fa-8ed1-24ff-f30916ee45dd@free.fr>
 <155389876377.20095.15037552865160559827@swboyd.mtv.corp.google.com>
 <eba920f5-f5a2-53d5-2227-529b5ea99d32@codeaurora.org>
 <20191010041551.6D7E0208C3@mail.kernel.org>
 <a8540fe3-9500-4998-ca25-a06269541383@codeaurora.org>
 <20191010194810.47D062067B@mail.kernel.org>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <df6cae85-f5f6-cd93-0dd3-17f0f28fe376@codeaurora.org>
Date:   Fri, 11 Oct 2019 09:17:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191010194810.47D062067B@mail.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/11/2019 1:18 AM, Stephen Boyd wrote:
> Quoting Manu Gautam (2019-10-10 00:33:32)
>> Hi,
>>
>> On 10/10/2019 9:45 AM, Stephen Boyd wrote:
>>> Quoting Manu Gautam (2019-10-09 01:31:09)
>> [snip]
>>>> I have followed this up with QMP PHY hardware designers and they have
>>>> confirmed that QMP PHY must have pipe clock enabled at the beginning
>>>> of initialization sequence i.e. before bringing it out of reset and starting it.
>>> Awesome, thanks for following up.
>>>
>>>> Otherwise there is possibility of incorrect locking of pipe_interface/
>>>> retime buffers in PHY.
>>>> Hence, for both USB and PCIe we have to continue to use HALT_SKIP flag.
>>> Does anything go wrong if we just leave these clks enabled forever out
>>> of boot? I'm inclined to rip the clks out and just slam the branch
>>> enable bit on all the time in gcc driver probe and return NULL to the
>>> callers of clk_get() for these clks. I don't see how this would be a
>>> problem because when the upstream phy is disabled this clk is disabled
>>> and so we aren't wasting power. It should also save us time and memory
>>> because now we don't have to call into the clk framework to turn it on
>>> and sequence that just right in the phy driver.
>> That might work, however on some platforms gcc_pipe_clk parent is changed to
>> XO and back to phy_pipe_clk across low power mode.
>> It requires PHY driver to use clk_set_parent().
>>
> Hm ok. Where is the call to clk_set_parent()? I don't see this in the
> kernel.
>
>  $ git grep clk_set_parent -- drivers/usb/phy drivers/phy | wc -l
>  0
>
> What platforms do this? Are they upstream?

They are some recent platforms and not on upstream yet.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

