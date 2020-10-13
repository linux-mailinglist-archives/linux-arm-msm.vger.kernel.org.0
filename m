Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0B128D252
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 18:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgJMQfQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 12:35:16 -0400
Received: from foss.arm.com ([217.140.110.172]:34138 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727320AbgJMQfQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 12:35:16 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D92E931B;
        Tue, 13 Oct 2020 09:35:15 -0700 (PDT)
Received: from [10.57.50.28] (unknown [10.57.50.28])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B9FA3F66B;
        Tue, 13 Oct 2020 09:35:13 -0700 (PDT)
Subject: Re: [PATCH 1/2] coresight: tmc-etf: Fix NULL ptr dereference in
 tmc_enable_etf_sink_perf()
To:     saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org,
        mike.leach@linaro.org
Cc:     coresight@lists.linaro.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, denik@google.com,
        leo.yan@linaro.org, peterz@infradead.org
References: <cover.1602074787.git.saiprakash.ranjan@codeaurora.org>
 <d7a2dd53d88360b12e5a14933cb931198760dd63.1602074787.git.saiprakash.ranjan@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <5bbb2d35-3e56-56d7-4722-bf34c5efa2fb@arm.com>
Date:   Tue, 13 Oct 2020 17:35:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <d7a2dd53d88360b12e5a14933cb931198760dd63.1602074787.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/07/2020 02:00 PM, Sai Prakash Ranjan wrote:
> There was a report of NULL pointer dereference in ETF enable
> path for perf CS mode with PID monitoring. It is almost 100%
> reproducible when the process to monitor is something very
> active such as chrome and with ETF as the sink and not ETR.
> Currently in a bid to find the pid, the owner is dereferenced
> via task_pid_nr() call in tmc_enable_etf_sink_perf() and with
> owner being NULL, we get a NULL pointer dereference.
> 
> Looking at the ETR and other places in the kernel, ETF and the
> ETB are the only places trying to dereference the task(owner)
> in tmc_enable_etf_sink_perf() which is also called from the
> sched_in path as in the call trace. Owner(task) is NULL even
> in the case of ETR in tmc_enable_etr_sink_perf(), but since we
> cache the PID in alloc_buffer() callback and it is done as part
> of etm_setup_aux() when allocating buffer for ETR sink, we never
> dereference this NULL pointer and we are safe. So lets do the

The patch is necessary to fix some of the issues. But I feel it is
not complete. Why is it safe earlier and not later ? I believe we are
simply reducing the chances of hitting the issue, by doing this earlier than
later. I would say we better fix all instances to make sure that the
event->owner is valid. (e.g, I can see that the for kernel events
event->owner == -1 ?)

struct task_struct *tsk = READ_ONCE(event->owner);

if (!tsk || is_kernel_event(event))
    /* skip ? */

Suzuki

