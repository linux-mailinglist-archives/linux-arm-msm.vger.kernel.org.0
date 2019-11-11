Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA43EF6E7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2019 07:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbfKKGPY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 01:15:24 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:46948 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfKKGPX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 01:15:23 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DA72B60A0B; Mon, 11 Nov 2019 06:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573452922;
        bh=BLOQ+eCIjJN4buelWfgp8BiWzMoO2U42JmFRdn7Sa84=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=msIK6Hjb9gtJcWpFPvjysAhT4tjstVf72U2uJlG4K7fD6tyt8uBSbCXawWGFm2ZX4
         wGccKh5GrVZmpGLvkgaSbrz0CYNj0ONGNG5aebMdRI8bD62eou2sULvXCsMcY7vCCx
         BvxdHfvjwCOWljfm/YF4XYSEwFKh35mTc9FBg4Q0=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 38B5F6092D;
        Mon, 11 Nov 2019 06:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573452922;
        bh=BLOQ+eCIjJN4buelWfgp8BiWzMoO2U42JmFRdn7Sa84=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=msIK6Hjb9gtJcWpFPvjysAhT4tjstVf72U2uJlG4K7fD6tyt8uBSbCXawWGFm2ZX4
         wGccKh5GrVZmpGLvkgaSbrz0CYNj0ONGNG5aebMdRI8bD62eou2sULvXCsMcY7vCCx
         BvxdHfvjwCOWljfm/YF4XYSEwFKh35mTc9FBg4Q0=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 11 Nov 2019 11:45:22 +0530
From:   kgunda@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rnayak@codeaurora.org
Subject: Re: [PATCH V2] mfd: qcom-spmi-pmic: Add support for pm6150 and
 pm6150l
In-Reply-To: <5dc2f71e.1c69fb81.8912a.f2c0@mx.google.com>
References: <1572931309-16250-1-git-send-email-kgunda@codeaurora.org>
 <5dc1cb4c.1c69fb81.af253.0b8a@mx.google.com>
 <c4cee81775c6d82024ca05250290f603@codeaurora.org>
 <5dc2f71e.1c69fb81.8912a.f2c0@mx.google.com>
Message-ID: <1d3436e220ea17ca9d99000922fcb809@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-06 22:08, Stephen Boyd wrote:
> Quoting kgunda@codeaurora.org (2019-11-05 22:43:59)
>> On 2019-11-06 00:49, Stephen Boyd wrote:
>> > Quoting Kiran Gunda (2019-11-04 21:21:49)
>> >> Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
>> >> found on SC7180 based platforms.
>> >>
>> >> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> >> ---
>> >>  - Changes from V1:
>> >>    Sorted the macros and compatibles.
>> >
>> > I don't see anything sorted though.
>> >
>> Sorry .. I might have misunderstood your comment. Let me know if my
>> understanding is correct.
>> 
>> >>>> And compatible here.
>> >>> And on macro name here.
>> 
>> This means you want to sort all the existing compatible and macros in
>> alpha numeric order ?
> 
> Sorry I also got confused on what the driver is doing. I replied on the
> original patch with what is preferred.
Ok.. I just replied to that.
