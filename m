Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A36265D7F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 12:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgIKKOm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 06:14:42 -0400
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10]:57446
        "EHLO a27-10.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725888AbgIKKOj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 06:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599819279;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
        bh=ZG38KW7Q8h6I6ub1kZvYjpSGKWWslx5w8FqBo4yAbT4=;
        b=jB9cLUPSHzRC1AbUCZfAsCTxouAg/FfjWi9IVmaW83fpYulhAZIqqClrXDkLhpOl
        xWiXXQG00L2Eew0/rIJTs6CqYQIUSpANCN0wfziDNDGE2bW5zlJ2khcvlnnzGbuD7JD
        UXBmxRcC6XexG+sBxETyK7QAZahPrWXBO3FvW2ds=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599819279;
        h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:Feedback-ID;
        bh=ZG38KW7Q8h6I6ub1kZvYjpSGKWWslx5w8FqBo4yAbT4=;
        b=F4XsXr6K5llPCuHsM+p1s4CICY0eZpJ1yChNtAQuml/LSWqAkHt1GSG0FMPoogvh
        zTL4UDOmgBeNgB3+iE6LFbRnlziziaSQb7/lV+O6o7IQALQoRUw6nqx6nY7kHmUxY3E
        vYBwXAZgd4f/KfE/b/H8ldC8waRUieJ0MK19R0Vs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 11 Sep 2020 10:14:39 +0000
From:   skakit@codeaurora.org
To:     Doug Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        msavaliy@qti.qualcomm.com
Subject: Re: [PATCH V5 1/4] arm64: dts: qcom: sc7180: Improve the pin config
 settings for CTS and TX
In-Reply-To: <CAD=FV=XYqiGk3QEPxVKCgnYA0FVrizyarSW52HPRGVyAUSugrQ@mail.gmail.com>
References: <1599742438-16811-1-git-send-email-skakit@codeaurora.org>
 <1599742438-16811-2-git-send-email-skakit@codeaurora.org>
 <CAD=FV=XYqiGk3QEPxVKCgnYA0FVrizyarSW52HPRGVyAUSugrQ@mail.gmail.com>
Message-ID: <010101747ca8ea89-168fbb95-b789-4294-81dc-82561c314bf4-000000@us-west-2.amazonses.com>
X-Sender: skakit@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-SES-Outgoing: 2020.09.11-54.240.27.10
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug,

On 2020-09-10 20:10, Doug Anderson wrote:
> Hi,
> 
> On Thu, Sep 10, 2020 at 5:55 AM satya priya <skakit@codeaurora.org> 
> wrote:
>> 
>> Remove output-high from CTS and TX as this is not really required. 
>> During
>> bringup to fix transfer failures this was added to match with console 
>> uart
>> settings. Probably some boot loader config was missing then. As it is
>> working fine now, remove it.
>> 
>> Signed-off-by: satya priya <skakit@codeaurora.org>
>> Reviewed-by: Akash Asthana <akashast@codeaurora.org>
>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>> Changes in V4:
>>  - This is newly added in V4 to separate the improvements in pin 
>> settings
>>    and wakeup related changes.
>> 
>> Changes in V5:
>>  - As per Doug's comment configured pull-down for CTS pin as earlier.
>> 
>>  arch/arm64/boot/dts/qcom/sc7180-idp.dts | 10 ++++------
>>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> Looks fine to me.  Slight nit that this only applies to the IDP board
> but ${SUBJECT} makes it sound as if this applies to all sc7180.  I
> wouldn't spin just for that, though.  If Bjorn agrees, he can always
> adjust the subject when applying.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks for reviewing the patches, i will correct this nit in my next 
version.

Thanks,
Satya Priya
