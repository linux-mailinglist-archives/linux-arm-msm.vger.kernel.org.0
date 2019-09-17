Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1FBB520F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 17:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730025AbfIQPzc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 11:55:32 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:42064 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730023AbfIQPzb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 11:55:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5591E615AD; Tue, 17 Sep 2019 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568735730;
        bh=tD+ponUYuh16Yv1ORieO99BuPOjcSPBEMm+I+qnOooc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HlnPepDcmzwd/1CnBnqvXuWLyvKSCcw4SdttkouSvNbm9XnbqoMk4LrZkx/+5RhHC
         nICRdTayzYT69pgBhOpYfAS5uQpAvfQJrb82Pb2YPUu7i5I7BzO2fcGCUCij9sALjs
         iQ5K7Z62rz1YrZwhGmJ0R5zSmJIKk46maV8MDT50=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 5D1D06133A;
        Tue, 17 Sep 2019 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568735727;
        bh=tD+ponUYuh16Yv1ORieO99BuPOjcSPBEMm+I+qnOooc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=A+Vs1aCjPmcZL52V+7eCFuLTPuZDY4tNDLTB3NkSPL8/1Zui0EKh0DO+wJ3zWADN4
         kBpWd2jsntFJot+mX9wmHFcOMkiQkvXFq7oRWIXawqPXayVCj3CEcGr/Jay6J9b0qy
         nrf5yiWQW3OwjECTBWlMT5ugg2XDIo/+116md3yE=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Sep 2019 21:25:27 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Raul Rangel <rrangel@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [RFC] clk: Remove cached cores in parent map during unregister
In-Reply-To: <20190917153419.GA258455@google.com>
References: <20190723051446.20013-1-bjorn.andersson@linaro.org>
 <20190729224652.17291206E0@mail.kernel.org>
 <20190821181009.00D6322D6D@mail.kernel.org>
 <20190826212415.ABD3521848@mail.kernel.org>
 <20190917153419.GA258455@google.com>
Message-ID: <da08fdaeaadd9b7b818f1b72535df94f@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-09-17 21:04, Raul Rangel wrote:
> On Mon, Aug 26, 2019 at 02:24:14PM -0700, Stephen Boyd wrote:
>> >
>> > ---8<---
>> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> > index c0990703ce54..f42a803fb11a 100644
>> > --- a/drivers/clk/clk.c
>> > +++ b/drivers/clk/clk.c
>> > @@ -3737,6 +3737,37 @@ static const struct clk_ops clk_nodrv_ops = {
>> >         .set_parent     = clk_nodrv_set_parent,
>> >  };
>> >
>> > +static void clk_core_evict_parent_cache_subtree(struct clk_core *root,
>> > +                                               struct clk_core *target)
>> > +{
>> > +       int i;
>> > +       struct clk_core *child;
>> > +
>> > +       if (!root)
>> > +               return;
>> 
>> I don't think we need this part. Child is always a valid pointer.
>> 
> 
> Bjorn or Saiprakash
> Are there any plans to send out Stephen's proposed patch?
> 

Stephen has already sent out an updated patch for this here:

https://lore.kernel.org/lkml/20190828181959.204401-1-sboyd@kernel.org/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation



