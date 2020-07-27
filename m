Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85BC122E914
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jul 2020 11:35:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgG0JfE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 05:35:04 -0400
Received: from foss.arm.com ([217.140.110.172]:40564 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbgG0JfE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 05:35:04 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ED69D6E;
        Mon, 27 Jul 2020 02:35:04 -0700 (PDT)
Received: from [10.37.8.154] (unknown [10.37.8.154])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8CCF83F718;
        Mon, 27 Jul 2020 02:35:02 -0700 (PDT)
Subject: Re: [PATCH] coresight: etm4x: Fix etm4_count race using atomic
 variable
To:     saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org,
        mike.leach@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org
References: <20200727060728.15027-1-saiprakash.ranjan@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <c98f0c27-7f0c-cf99-d52b-8a8b1e197ace@arm.com>
Date:   Mon, 27 Jul 2020 10:39:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200727060728.15027-1-saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/27/2020 07:07 AM, Sai Prakash Ranjan wrote:
> etm4_count keeps track of number of ETMv4 registered and on some
> systems, a race is observed on etm4_count variable which can
> lead to multiple calls to cpuhp_setup_state_nocalls_cpuslocked().
> This function internally calls cpuhp_store_callbacks() which
> prevents multiple registrations of callbacks for a given state
> and due to this race, it returns -EBUSY leading to ETM probe
> failures like below.
> 
>   coresight-etm4x: probe of 7040000.etm failed with error -16
> 
> This race can easily be triggered with async probe by setting
> probe type as PROBE_PREFER_ASYNCHRONOUS and with ETM power
> management property "arm,coresight-loses-context-with-cpu".
> 
> Prevent this race by converting etm4_count variable to atomic.
> 
> Fixes: 9b6a3f3633a5 ("coresight: etmv4: Fix CPU power management setup in probe() function")
> Fixes: 58eb457be028 ("hwtracing/coresight-etm4x: Convert to hotplug state machine")
> Suggested-by: Mike Leach <mike.leach@linaro.org>
> (Mike: Rootcause and context for commit message)
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Please could we leave the hotplug notifier installed with the driver
init and don't worry about this at all ? We bail out early in the
notifier anyways, if the CPU is not registered with its ETM.

Cheers
Suzuki
