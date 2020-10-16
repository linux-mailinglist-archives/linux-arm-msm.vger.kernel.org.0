Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339E6290627
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 15:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407369AbgJPNR5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 09:17:57 -0400
Received: from foss.arm.com ([217.140.110.172]:37216 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407363AbgJPNR5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 09:17:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79AEC1FB;
        Fri, 16 Oct 2020 06:17:56 -0700 (PDT)
Received: from [10.57.50.28] (unknown [10.57.50.28])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87CB73F71F;
        Fri, 16 Oct 2020 06:17:53 -0700 (PDT)
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
To:     Leo Yan <leo.yan@linaro.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Denis Nikitin <denik@chromium.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
 <CADDJ8CXS8gGuXL45vR6xiHwJhZNcUJPvHMVYSGR6LDETRPJFiQ@mail.gmail.com>
 <20201016072401.GC4646@leoy-ThinkPad-X240s>
 <f73ba98c345161f1835458182e6a0002@codeaurora.org>
 <20201016092450.GG4646@leoy-ThinkPad-X240s>
 <f6ee4156-664c-7bff-8e35-5cd1acdbaa84@arm.com>
 <20201016131407.GA31839@leoy-ThinkPad-X240s>
From:   Suzuki Poulose <suzuki.poulose@arm.com>
Message-ID: <16b3be3a-0d2d-0d0f-24a5-020480ed980c@arm.com>
Date:   Fri, 16 Oct 2020 14:17:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016131407.GA31839@leoy-ThinkPad-X240s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/16/20 2:14 PM, Leo Yan wrote:
> On Fri, Oct 16, 2020 at 12:38:47PM +0100, Suzuki Kuruppassery Poulose wrote:
> 
> [...]
> 
>>>> What happens to the sysfs mode of tracing? For that we would still
>>>> need a config right to exclude kernel mode tracing completely.
>>>
>>> IIUC, sysfs mode and perf mode both can apply the same approach, the
>>> guest OS runs a thread context for the host, so when a guest OS is
>>> switched in or out, the hypervisor can save/restore the context for
>>> the guest OS; thus every guest OS will have its dedicated context and
>>> trace data ideally.
>>
>> I don't think Guest Context is something we can support as mentioned
>> above, at least for systems without sysreg access for ETMs (and virtualizing
>> ETRs is a different story !)
> 
> Thanks for sharing thoughts, Suzuki.
> 
> I missed the device virtulisation.  Here should virtualize all devices
> (includes CoreSight ETM/funnel/ETR/ETF)?  Or only need to virtualize
> ETRs?

I wouldn't even think of virtualizing the components without sysreg
access. So let us not worry about it :-)

Cheers
Suzuki
