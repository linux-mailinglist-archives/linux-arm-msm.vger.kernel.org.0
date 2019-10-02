Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1C00C8CF8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 17:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbfJBPeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Oct 2019 11:34:15 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:32903 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728793AbfJBPeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Oct 2019 11:34:14 -0400
Received: by mail-pg1-f194.google.com with SMTP id q1so4011337pgb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Oct 2019 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Yc7AJae82vGiMo6VX7YtpUank71fR6SU4LS/yFdgHl0=;
        b=NPjKGtjFKMoFUYpcaHfIABEex/qVmWGz+Nc50zDxVPtlIKOEgg86pthURNy2cfnsqV
         Djvc5svVKE1M7PebuBAVjTvTzC9w+d40MNPnWNCXHiQ8I/2iYPnDBInRPPIDlwIzjw3s
         Meb7OmYN7Xghe+iAqu0aB8LlBMbHfKSFk2bJXB/lxOGnWZEMP3pFgPrIQYx4TqY9d9AM
         rN3RnEQbqpGEpgMmy6PGQTCv5vG9AgFTbj4SzOjIzr5VsdJcJ3evil7LA1efa7Cp10kr
         3h5lfEFqd9HPzdUTWiV9MHVS1cXcscvRyV2/pJfrncMR/CQNUbwpMoy+LGBEVlPfLkS6
         0Juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Yc7AJae82vGiMo6VX7YtpUank71fR6SU4LS/yFdgHl0=;
        b=K+6dXyhcKTRLGrSMj19bZi5ik5IXvi3UjkcFYfcBM3oXlfHZwinJDnEgPD/Uvu8rHB
         96kB97RyrIFRpPrgLamdsKsXnWzHwGVe/4/CfXKde6r1cCRa096ogWKWygJOTqDn3lMd
         O6xub5Xab2bt74eXJva+47ULWC0/RcMCrzFH4Ovh26Lgewc+kufzf8mvQrSOX2ObkQdZ
         ciMd6duVw33Ea9bm/v/J90xrcHaDu/o6XvM+vqnERPfdccRDBCHL2JdL5dQ8ujuuByHW
         /qDJzcS38Z62Wf/zj9rdPE1MN4yxkTUXUkBNvOgJM0RvqkL+Xx1DQF8aT0IEyLwY3i88
         SzHw==
X-Gm-Message-State: APjAAAWJkzI4AXrSgiiQcOiEclA+3BzIY8wNGEJjF07DiMT7RLUhT35T
        LjQ1eAi8mzn6pRB01KKyZY+3hOLSkJk=
X-Google-Smtp-Source: APXvYqxaHKh32bgCIht0jGCQrMKBgsEyPuv9Y2ou6HMo231DkiBKto3ZNwc5MBfKqF8lTqE1nwkjBg==
X-Received: by 2002:aa7:8e52:: with SMTP id d18mr5425314pfr.44.1570030453604;
        Wed, 02 Oct 2019 08:34:13 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id g5sm20636662pgd.82.2019.10.02.08.34.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 08:34:12 -0700 (PDT)
Date:   Wed, 2 Oct 2019 09:34:10 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
Message-ID: <20191002153410.GA10598@xps15>
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
 <16212a577339204e901cf4eefa5e82f1@codeaurora.org>
 <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
 <fa5a35f0e993f2b604b60d5cead3cf28@codeaurora.org>
 <CAOCk7NodWtC__W3=AQfXcjF-W9Az_NNUN0r8w5WmqJMziCcvig@mail.gmail.com>
 <5b8835905a704fb813714694a792df54@codeaurora.org>
 <CANLsYkxPOOorqcnPrbhZLzGV9Y7EGWUUyxvi-Cm5xxnzhx=Ecg@mail.gmail.com>
 <585ee38c-39d1-47df-78b7-f4b670f17a25@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <585ee38c-39d1-47df-78b7-f4b670f17a25@free.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 02, 2019 at 05:21:23PM +0200, Marc Gonzalez wrote:
> On 02/10/2019 17:03, Mathieu Poirier wrote:
> 
> > The problem here is that a debug and production device are using the
> > same device tree, i.e msm8998.dtsi.  Disabling coresight devices in
> > the DTS file will allow the laptop to boot but completely disabled
> > coresight blocks on the MTP board.  Leaving things as is breaks the
> > laptop but allows coresight to be used on the MTP board.  One of three
> > things can happen:
> > 
> > 1) Nothing gets done and production board can't boot without DTS modifications.
> > 2) Disable tags are added to the DTS file and the debug board can't
> > use coresight without modifications.
> > 2) The handling of the debug power domain is done properly on the
> > MSM8998 rather than relying on the bootloader to enable it.
> > 3) The DTS file is split or reorganised to account for debug/production devices.
> 
> I believe 3) is already the de facto situation.
> 
> arch/arm64/boot/dts/qcom/msm8998.dtsi is the "base" config.
> arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi for the MTP board.
> arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi for the laptops.

"DTS file", i.e msm8998.dtsi

> 
> > Which of the above ends up being the final solution is entirely up to
> > David and Andy.
> 
> 2498f8c1c668 ;-)

Then it is even easier to make a decision.

> 
> Regards.
