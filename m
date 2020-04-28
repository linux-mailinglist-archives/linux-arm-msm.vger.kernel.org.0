Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5571BBD7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 14:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgD1MXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 08:23:23 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:19379 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726762AbgD1MXX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 08:23:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588076603; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ur5ZOryjha/YHWLiOVj8eFSzWKndQ45R+vkiliUrPiY=;
 b=A9au67gC0G/IzgSh41k1O0nWOj899Wji2FtqMR0NszdE5Pb+m598Nd2P8Uw6ibuf5kuqBWxC
 IRnNb4gaKdehEziTUMHi1p1pgM+zqNDj5re04sqo8NhKcjQz+4RCFXAFhBQKJSjRxyxAWHPq
 p7ixWfQCkVE6se4zrsQjBYp7mUo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea82035.7feb23e3bed8-smtp-out-n02;
 Tue, 28 Apr 2020 12:23:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A4BC4C433BA; Tue, 28 Apr 2020 12:23:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F6D1C433D2;
        Tue, 28 Apr 2020 12:23:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Apr 2020 17:53:17 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>, mike.leach@linaro.org
Cc:     mathieu.poirier@linaro.org, swboyd@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] coresight: dynamic-replicator: Fix handling of multiple
 connections
In-Reply-To: <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com>
References: <20200426143725.18116-1-saiprakash.ranjan@codeaurora.org>
 <cf5852e9-c3c1-3d31-46f0-0370719947ab@arm.com>
 <CAJ9a7VgF3-Hdc7KSw9gVBeXSDHNguhqVhp60oK2XhCtr3DhDqg@mail.gmail.com>
 <84918e7d-c933-3fa1-a61e-0615d4b3cf2c@arm.com>
Message-ID: <668ea1283a6dd6b34e701972f6f71034@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-27 19:23, Suzuki K Poulose wrote:
> On 04/27/2020 10:45 AM, Mike Leach wrote:
[...]
>>> 
>>> This is not sufficient. You must prevent another session trying to
>>> enable the other port of the replicator as this could silently fail
>>> the "on-going" session. Not ideal. Fail the attempt to enable a port
>>> if the other port is active. You could track this in software and
>>> fail early.
>>> 
>>> Suzuki
>> 
>> While I have no issue in principle with not enabling a path to a sink
>> that is not in use - indeed in some cases attaching to unused sinks
>> can cause back-pressure that slows throughput (cf TPIU) - I am
>> concerned that this modification is masking an underlying issue with
>> the platform in question.
>> 
>> Should we decide to enable the diversion of different IDs to different
>> sinks or allow different sessions go to different sinks, then this has
>> potential to fail on the SC7180 SoC - and it will be difficult in
>> future to associate a problem with this discussion.
> 
> Mike,
> 
> I think thats a good point.
> Sai, please could we narrow down this to the real problem and may be
> work around it for the "device" ? Do we know which sink is causing the
> back pressure ? We could then push the "work around" to the replicator
> it is connected to.
> 
> Suzuki

Hi Suzuki, Mike,

To add some more to the information provided earlier, 
swao_replicator(6b06000) and etf are
in AOSS (Always-On-SubSystem) group. Also TPIU(connected to 
qdss_replicator) and EUD(connected
to swao_replicator) sinks are unused.

Please ignore the id filter values provided earlier.
Here are ID filter values after boot and before enabling replicator. As 
per
these idfilter values, we should not try to enable replicator if its 
already
enabled (in this case for swao_replicator) right?

localhost ~ # cat 
/sys/bus/amba/devices/6b06000.replicator/replicator1/mgmt/idfilter0
0x0
localhost ~ # cat 
/sys/bus/amba/devices/6b06000.replicator/replicator1/mgmt/idfilter1
0x0

localhost ~ # cat 
/sys/bus/amba/devices/6046000.replicator/replicator0/mgmt/idfilter0
0xff
localhost ~ # cat 
/sys/bus/amba/devices/6046000.replicator/replicator0/mgmt/idfilter1
0xff

I think the unused sink EUD(also in AOSS group) probably is causing the 
backpressure here.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
