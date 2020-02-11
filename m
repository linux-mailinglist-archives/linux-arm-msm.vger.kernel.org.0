Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24AEF159BCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 22:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgBKV5n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 16:57:43 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:43278 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727029AbgBKV5m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 16:57:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581458262; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jWU1cgqaUBb34RjRYJOYQVzFk/Z6wfMiJoxum7QsqVU=;
 b=gSXEVrGyFCVoUuDJ3IaOSi2sq7N3XQ39+d/ffmRKbpjCM3o0fQoqIRQg3Ws1Ieo9j7LJDI4D
 D9nalF/Ud1F9zCQB38i+SRbnNF/0l3SmQ5hrNGhSyKLN1lRof1rcJ5wu2L5SxUGGLggu/BKp
 gTQr8qbZbPb8r6P80FaJ75E8m6c=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e43234e.7fd09eb3ae30-smtp-out-n03;
 Tue, 11 Feb 2020 21:57:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D0813C447A2; Tue, 11 Feb 2020 21:57:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 28EA1C43383;
        Tue, 11 Feb 2020 21:57:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 12 Feb 2020 03:27:32 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree-owner@vger.kernel.org
Subject: Re: [PATCHv2 2/2] dt-bindings: watchdog: Add compatible for QCS404,
 SC7180, SDM845, SM8150
In-Reply-To: <CAL_JsqKeytW=k5efjcfcuK6vbGggdO9nVdwq7YGNtMpzPQHWMg@mail.gmail.com>
References: <cover.1580570160.git.saiprakash.ranjan@codeaurora.org>
 <ff71077aa09c489b2b072c6f5605dccb96f60051.1580570160.git.saiprakash.ranjan@codeaurora.org>
 <20200206183808.GA5019@bogus>
 <f26464226f74dffe2db0583b9482a489@codeaurora.org>
 <CAL_JsqKeytW=k5efjcfcuK6vbGggdO9nVdwq7YGNtMpzPQHWMg@mail.gmail.com>
Message-ID: <a48fc9fd93826b63777bad71d9b2d7c4@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-11 23:54, Rob Herring wrote:
> On Fri, Feb 7, 2020 at 12:10 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi Rob,
>> 
>> On 2020-02-07 00:08, Rob Herring wrote:
>> > On Sat, Feb 01, 2020 at 08:59:49PM +0530, Sai Prakash Ranjan wrote:
>> >> Add missing compatible for watchdog timer on QCS404,
>> >> SC7180, SDM845 and SM8150 SoCs.
>> >
>> > That's not what the commit does. You are changing what's valid.
>> >
>> > One string was valid, now 2 are required.
>> >
>> 
>> Does this look good?
> 
> No. First of all, what's the base for the diff? It's not what you
> originally had nor incremental on top of this patch.
> 

It was an incremental on top of this patch.

> Second, a value of 'qcom,kpss-timer' or 'qcom,kpss-wdt' or
> 'qcom,scss-timer' will fail validation because 2 clauses of 'oneOf'
> will be true.
> 

I will just remove oneOf and add the missing compatibles to the enum.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
