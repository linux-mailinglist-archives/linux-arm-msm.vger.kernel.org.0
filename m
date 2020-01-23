Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFFA1461B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 06:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgAWFzV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 00:55:21 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:48916 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgAWFzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 00:55:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579758920; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Ywr2uPULQcT2gqUj8lnkFICBX4BgZjpk8vhrSIPWpJI=;
 b=Vy0tfTpWd0rTv964Huk8QoD5EexcvZXCwm+LrjT7ddx5fEjoirQphpQgVcogSSKbUjnZS6ls
 bFUkdTCWa3TyovsLI5KWOeLKE3EdvyDWcv/qxfVmmGpauGL28SMAEouc+a4PrIR/Fq34yvMx
 4QnlxSUrjoEgqnjJzFoXpPnSWH8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e293546.7fed13c1d148-smtp-out-n03;
 Thu, 23 Jan 2020 05:55:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2FA3BC43383; Thu, 23 Jan 2020 05:55:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 55E2FC433CB;
        Thu, 23 Jan 2020 05:55:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 23 Jan 2020 11:25:16 +0530
From:   kgunda@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        lee.jones@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        rnayak@codeaurora.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH V2] mfd: qcom-spmi-pmic: Add support for pm6150 and
 pm6150l
In-Reply-To: <20200121193446.GU89495@google.com>
References: <1572931309-16250-1-git-send-email-kgunda@codeaurora.org>
 <5dc1cb4c.1c69fb81.af253.0b8a@mx.google.com>
 <c4cee81775c6d82024ca05250290f603@codeaurora.org>
 <5dc2f71e.1c69fb81.8912a.f2c0@mx.google.com>
 <20200121193446.GU89495@google.com>
Message-ID: <f058d5eed0d412739070e4a24753a853@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias,
Sorry for the delay...

Yes. I submit the V3 shortly.

Just to note that this is a good to have patch and not critical.
We are using a "qcom,spmi-pmic" compatible in the device tree files, so 
using the pm6150/pm6150l is not a mandatory.

Thanks,
Kiran

On 2020-01-22 01:04, Matthias Kaehlcke wrote:
> Hi Kiran,
> 
> What is the status of this patch? It has outstanding comments and I
> couldn't find a later version. Do you plan to post a v3 in the near
> future?
> 
> Thanks
> 
> Matthias
> 
> On Wed, Nov 06, 2019 at 08:38:53AM -0800, Stephen Boyd wrote:
>> Quoting kgunda@codeaurora.org (2019-11-05 22:43:59)
>> > On 2019-11-06 00:49, Stephen Boyd wrote:
>> > > Quoting Kiran Gunda (2019-11-04 21:21:49)
>> > >> Add the compatibles and PMIC ids for pm6150 and pm6150l PMICs
>> > >> found on SC7180 based platforms.
>> > >>
>> > >> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
>> > >> ---
>> > >>  - Changes from V1:
>> > >>    Sorted the macros and compatibles.
>> > >
>> > > I don't see anything sorted though.
>> > >
>> > Sorry .. I might have misunderstood your comment. Let me know if my
>> > understanding is correct.
>> >
>> > >>>> And compatible here.
>> > >>> And on macro name here.
>> >
>> > This means you want to sort all the existing compatible and macros in
>> > alpha numeric order ?
>> 
>> Sorry I also got confused on what the driver is doing. I replied on 
>> the
>> original patch with what is preferred.
>> 
