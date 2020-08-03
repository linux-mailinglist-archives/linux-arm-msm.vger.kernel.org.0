Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0909023B07D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 00:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgHCWve (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 18:51:34 -0400
Received: from foss.arm.com ([217.140.110.172]:35160 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728213AbgHCWvd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 18:51:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5476330E;
        Mon,  3 Aug 2020 15:51:33 -0700 (PDT)
Received: from [10.37.12.82] (unknown [10.37.12.82])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C09063F71F;
        Mon,  3 Aug 2020 15:51:31 -0700 (PDT)
Subject: Re: [PATCHv3] coresight: etm4x: Fix etm4_count race by moving cpuhp
 callbacks to init
To:     saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org,
        mike.leach@linaro.org, swboyd@chromium.org
Cc:     coresight@lists.linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200729051310.18436-1-saiprakash.ranjan@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <46cc76c0-3ed7-9877-6cec-0f9ad6226cef@arm.com>
Date:   Mon, 3 Aug 2020 23:56:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200729051310.18436-1-saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/29/2020 06:13 AM, Sai Prakash Ranjan wrote:
> etm4_count keeps track of number of ETMv4 registered and on some systems,
> a race is observed on etm4_count variable which can lead to multiple calls
> to cpuhp_setup_state_nocalls_cpuslocked(). This function internally calls
> cpuhp_store_callbacks() which prevents multiple registrations of callbacks
> for a given state and due to this race, it returns -EBUSY leading to ETM
> probe failures like below.
> 
>   coresight-etm4x: probe of 7040000.etm failed with error -16
> 
> This race can easily be triggered with async probe by setting probe type
> as PROBE_PREFER_ASYNCHRONOUS and with ETM power management property
> "arm,coresight-loses-context-with-cpu".
> 
> Prevent this race by moving cpuhp callbacks to etm driver init since the
> cpuhp callbacks doesn't have to depend on the etm4_count and can be once
> setup during driver init. Similarly we move cpu_pm notifier registration
> to driver init and completely remove etm4_count usage. Also now we can
> use non cpuslocked version of cpuhp callbacks with this movement.
> 
> Fixes: 9b6a3f3633a5 ("coresight: etmv4: Fix CPU power management setup in probe() function")
> Fixes: 58eb457be028 ("hwtracing/coresight-etm4x: Convert to hotplug state machine")
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
