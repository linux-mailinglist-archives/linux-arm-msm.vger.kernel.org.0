Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42DB332EC26
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 14:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbhCENaw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 08:30:52 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:25899 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230372AbhCENaZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 08:30:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614951023; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iAyZKUXQ4XNfheJxhIWXSYGGrXEh7QxL1JenzRX2afY=;
 b=HvrfLAjEIlWBmhRey87wMnqPnle9oyMnsytl22yS5GpYf7mYyak9wDONeW4S+q/gdqJKDgsG
 HnoyfxJw27rny613uCavhSUIWypw2hgypWkwlrIXSmLbFnDBr7Ll6IgTDh0Wr0SQzktJ2z4P
 LllBCvU86mS63Gf/m72B8xM1nSw=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60423266f7ec0ea57c969d67 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 13:30:14
 GMT
Sender: mkrishn=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E8F4BC43461; Fri,  5 Mar 2021 13:30:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: mkrishn)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3895BC433C6;
        Fri,  5 Mar 2021 13:30:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 05 Mar 2021 19:00:13 +0530
From:   mkrishn@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, kalyan_t@codeaurora.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        vinod.koul@linaro.org, rnayak@codeaurora.org,
        dianders@chromium.org, sibis@codeaurora.org, khsieh@codeaurora.org
Subject: Re: [PATCH v12 1/4] dt-bindings: msm: disp: add yaml schemas for DPU
 bindings
In-Reply-To: <161492718630.1478170.1460276218009944071@swboyd.mtv.corp.google.com>
References: <1613127000-3015-1-git-send-email-mkrishn@codeaurora.org>
 <161436872955.1254594.2765257503019122275@swboyd.mtv.corp.google.com>
 <5a94b8c4ccb73afdf99bf901ce86acde@codeaurora.org>
 <161492718630.1478170.1460276218009944071@swboyd.mtv.corp.google.com>
Message-ID: <d769213612ccbde20c19100c7550387c@codeaurora.org>
X-Sender: mkrishn@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-05 12:23, Stephen Boyd wrote:
> Quoting mkrishn@codeaurora.org (2021-03-04 04:36:05)
>> On 2021-02-27 01:15, Stephen Boyd wrote:
>> > Quoting Krishna Manikandan (2021-02-12 02:49:57)
>> >> +
>> >> +    soc {
>> >> +      #address-cells = <2>;
>> >> +      #size-cells = <2>;
>> >
>> > I think we can drop the soc node from the examples.
>> Hi Stephen,
>> 
>> In latest dt schema, there is a rule that we have to specify the 
>> address
>> and size cells or else it will take default value of 1 for both. If we
>> use these default values, dt binding check will throw error as display
>> uses 2 address cells and 2 size cells. That's why soc node was added 
>> to
>> specify the values for mdss node.
>> 
> 
> Do you need to use both cells in the example? Presumably the second 
> cell
> is all zero, so it's useless. The example doesn't have to have both
> cells in the reg property, that can be fixed up when writing the DT for
> a particular SoC.

Sure Stephen. I will make the changes in the next patchset.
Thanks,
Krishna
