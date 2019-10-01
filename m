Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2CEC3F52
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 20:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730661AbfJASFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 14:05:33 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44428 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbfJASFd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 14:05:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 633A36119F; Tue,  1 Oct 2019 18:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569953132;
        bh=kh+Qvfp+Bv7MXpGjaYCIgO1OxAjGfyr1gezkgUNBZRA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=TBbLytlCWNIC7AHixNIcvge6LvSQH1v8jJUko2JcnQ5pBGH4OMLFS1yIm+UzbC7Io
         8EpPWHBYjMAchb5x4VZ+68+qKgirovCQZ9TVvckBNtqaYYIKNWHLhMffJ67yF2pmkV
         lkrGy/hsNIUB9G+00gBhJSXVOMD/6u96Avt43nRM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id EEBA86076C;
        Tue,  1 Oct 2019 18:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1569953131;
        bh=kh+Qvfp+Bv7MXpGjaYCIgO1OxAjGfyr1gezkgUNBZRA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BIv8NlU83WI675KZxJSjdebxayagKrHZlQvgxIT8ATxuQh3w/zLnh1/wrmbba+LwQ
         V0+qCkhYEDPSP+phz+JcbvMQInj4gIunYiLXPr63yaLBNKDRja/AQTx9KHhixjer/O
         +yt8sqgyzteoRnI7ngWXWyE37WTrwu0ZMBa+2X4k=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Oct 2019 11:05:30 -0700
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        lkml <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
In-Reply-To: <CAOCk7NodWtC__W3=AQfXcjF-W9Az_NNUN0r8w5WmqJMziCcvig@mail.gmail.com>
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
 <16212a577339204e901cf4eefa5e82f1@codeaurora.org>
 <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
 <fa5a35f0e993f2b604b60d5cead3cf28@codeaurora.org>
 <CAOCk7NodWtC__W3=AQfXcjF-W9Az_NNUN0r8w5WmqJMziCcvig@mail.gmail.com>
Message-ID: <5b8835905a704fb813714694a792df54@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-01 11:01, Jeffrey Hugo wrote:
> On Tue, Oct 1, 2019 at 11:52 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> 
>> Haan then likely it's the firmware issue.
>> We should probably disable coresight in soc dtsi and enable only for
>> MTP. For now you can add a status=disabled for all coresight nodes in
>> msm8998.dtsi and I will send the patch doing the same in a day or
>> two(sorry I am travelling currently).
> 
> This sounds sane to me (and is what I did while bisecting the issue).
> When you do create the patch, feel free to add the following tags as
> you see fit.
> 
> Reported-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Thanks Jeffrey, I will add them.
Hope Mathieu and Suzuki are OK with this.

Thanks,
Sai
