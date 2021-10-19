Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD05843364A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 14:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbhJSMtX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 08:49:23 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:54732 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhJSMtW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 08:49:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634647630; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/t2zwX7o7apvnAvjKrNCpcaUDtarMlWQusLB8pvZMkk=; b=H4wBoN/X9SIj6/vbq95OI96CO9srs3cS+1r/d2aidacV1y0Rn2ykve0974OlhjFVmxsjPePd
 cmCF9PR2m5L+5JksTc/3DlRVT5PTH8jr3wE4oWEiagevdtTxqErFAGG/raQH0iBbtl8/gEtz
 fd5ZF3Q3SMJ7cDA9Y1QoP9QLmkE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 616ebe4c308e0dd330f1008f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 12:47:07
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44260C43618; Tue, 19 Oct 2021 12:47:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.231.137] (unknown [106.213.197.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E3456C43460;
        Tue, 19 Oct 2021 12:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E3456C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Subject: Re: [PATCH v12 2/5] soc: qcom: Add Sleep stats driver
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
References: <1634107104-22197-1-git-send-email-mkshah@codeaurora.org>
 <1634107104-22197-3-git-send-email-mkshah@codeaurora.org>
 <20211015135809.GB7231@dragon>
 <0802823a-4be2-6d55-b259-5084a809c7bb@codeaurora.org>
 <20211019094720.GD7231@dragon>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <38c6bc38-8d5b-a65d-1a26-eb9f268c7644@codeaurora.org>
Date:   Tue, 19 Oct 2021 18:16:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211019094720.GD7231@dragon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Shawn,

On 10/19/2021 3:17 PM, Shawn Guo wrote:
> On Mon, Oct 18, 2021 at 07:45:30PM +0530, Maulik Shah wrote:
>>>> +static void qcom_create_soc_sleep_stat_files(struct dentry *root, void __iomem *reg,
>>>> +					     struct stats_data *d,
>>>> +					     const struct stats_config *config)
>>>> +{
>>>> +	char stat_type[sizeof(u32) + 1] = {0};
>>>> +	size_t stats_offset = config->stats_offset;
>>>> +	u32 offset = 0, type;
>>>> +	int i, j;
>>>> +
>>>> +	/*
>>>> +	 * On RPM targets, stats offset location is dynamic and changes from target
>>>> +	 * to target and sometimes from build to build for same target.
>>>> +	 *
>>>> +	 * In such cases the dynamic address is present at 0x14 offset from base
>>>> +	 * address in devicetree. The last 16bits indicates the stats_offset.
>>>> +	 */
>>>> +	if (config->dynamic_offset) {
>>>> +		stats_offset = readl(reg + RPM_DYNAMIC_ADDR);
>>>> +		stats_offset &= RPM_DYNAMIC_ADDR_MASK;
>>>> +	}
>>>> +
>>>> +	for (i = 0; i < config->num_records; i++) {
>>>> +		d[i].base = reg + offset + stats_offset;
>>>> +
>>>> +		/*
>>>> +		 * Read the low power mode name and create debugfs file for it.
>>>> +		 * The names read could be of below,
>>>> +		 * (may change depending on low power mode supported).
>>>> +		 * For rpmh-sleep-stats: "aosd", "cxsd" and "ddr".
>>>> +		 * For rpm-sleep-stats: "vmin" and "vlow".
>>>
>>> It reports 'vmin' and 'xosd' on MSM8939, 'vmin' and 'vlow' on SDM660.
>>> I know that 'vmin' is VDD Minimization mode, and 'xosd' is XO Shutdown
>>> mode.  But I'm not sure about 'vlow' mode.  Could you share some
>>> information regarding what this low power mode is, and how it differs
>>> from 'vmin' and 'xosd'?
>>
>> vlow and xosd are same.
>> vmin is xosd plus voltage minimization of chip, memory rails.
> 
> Thanks much for the info, Maulik!
> 
> I'm running your driver on qcm2290 and trying to reach vlow mode.
> 
> # cat /sys/kernel/debug/qcom_sleep_stats/vlow
> Count: 0
> Last Entered At: 0
> Last Exited At: 0
> Accumulated Duration: 0
> Client Votes: 0x81
> # echo mem > /sys/power/state
> [  551.446603] PM: suspend entry (s2idle)
> [  551.450948] Filesystems sync: 0.000 seconds
> [  551.462828] Freezing user space processes ... (elapsed 0.002 seconds) done.
> [  551.472276] OOM killer disabled.
> [  551.475556] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [  551.484461] printk: Suspending console(s) (use no_console_suspend to debug)
> [  551.561280] OOM killer enabled.
> [  551.564461] Restarting tasks ... done.
> [  551.569652] PM: suspend exit
> # cat /sys/kernel/debug/qcom_sleep_stats/vlow
> Count: 0
> Last Entered At: 0
> Last Exited At: 0
> Accumulated Duration: 0
> Client Votes: 0x818081
> 
> The count doesn't increases along with suspend/resume cycle at the
> moment.  But as you can see, 'Client Votes' field changes.  If possible,
> could you shed some light on what this means?

The count will increase only when all the subsystems (APSS/Modem,etc) 
are in power down mode and finally RPM decides to turn off xo clock.

> 
> As the comparison, I'm also running the downstream 'rpm_master_stats'
> driver in the same kernel, and the 'xo_count' field of APSS does
> increase along with suspend/resume cycle.  May I ask some advices what
> I'm possibly missing and thus getting different result between 'vlow'
> and 'rpm_master_stats' report?

The vlow is a SoC level state whereas the rpm master stats indicate
individual subsystem state. Since you are running suspend-resume the 
APSS is going to sleep so you see xo_count incremented for it but for 
MPSS i see it does not increase (modem is not entering to low power 
mode). similarly for ADSP/CDSP it does not increment. if all of these 
subsystems goes to power down and then there is sufficient sleep time 
for the SoC then you may see vlow/vmin incrementing.

Hope this clarifies.

Thanks,
Maulik

> 
> # cat /sys/kernel/debug/rpm_master_stats
> APSS
>          shutdown_req:0x37EA3CC74
>          wakeup_ind:0x0
>          bringup_req:0x37F041958
>          bringup_ack:0x37F042D54
>          xo_last_entered_at:0x286FF36AC
>          xo_last_exited_at:0x28AF94178
>          xo_accumulated_duration:0x3EDD55B
>          last_sleep_transition_duration:0x122f
>          last_wake_transition_duration:0x11f8
>          xo_count:0x1
>          wakeup_reason:0x0
>          numshutdowns:0x641
>          active_cores:0x1
>                  core0
> MPSS
>          shutdown_req:0x0
>          wakeup_ind:0x0
>          bringup_req:0x0
>          bringup_ack:0x0
>          xo_last_entered_at:0x0
>          xo_last_exited_at:0x0
>          xo_accumulated_duration:0x0
>          last_sleep_transition_duration:0x0
>          last_wake_transition_duration:0x0
>          xo_count:0x0
>          wakeup_reason:0x0
>          numshutdowns:0x0
>          active_cores:0x1
>                  core0
> ADSP
>          shutdown_req:0x0
>          wakeup_ind:0x0
>          bringup_req:0x0
>          bringup_ack:0x0
>          xo_last_entered_at:0x0
>          xo_last_exited_at:0x0
>          xo_accumulated_duration:0x0
>          last_sleep_transition_duration:0x0
>          last_wake_transition_duration:0x0
>          xo_count:0x0
>          wakeup_reason:0x0
>          numshutdowns:0x0
>          active_cores:0x1
>                  core0
> CDSP
>          shutdown_req:0x0
>          wakeup_ind:0x0
>          bringup_req:0x0
>          bringup_ack:0x0
>          xo_last_entered_at:0x0
>          xo_last_exited_at:0x0
>          xo_accumulated_duration:0x0
>          last_sleep_transition_duration:0x0
>          last_wake_transition_duration:0x0
>          xo_count:0x0
>          wakeup_reason:0x0
>          numshutdowns:0x0
>          active_cores:0x0
> TZ
>          shutdown_req:0x0
>          wakeup_ind:0x0
>          bringup_req:0x0
>          bringup_ack:0x0
>          xo_last_entered_at:0x0
>          xo_last_exited_at:0x0
>          xo_accumulated_duration:0x0
>          last_sleep_transition_duration:0x0
>          last_wake_transition_duration:0x0
>          xo_count:0x0
>          wakeup_reason:0x0
>          numshutdowns:0x0
>          active_cores:0x0
> 
> Any comment or suggestion would be much appreciated!
> 
> Shawn
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member of Code Aurora Forum, hosted by The Linux Foundation
