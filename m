Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C54CB810C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 20:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391369AbfISSya (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 14:54:30 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44228 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390745AbfISSya (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 14:54:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B2FB2613A3; Thu, 19 Sep 2019 18:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568919268;
        bh=1KRYCvKV5SHVIhtNgo8m4kr/fGiP20kR6gPIaf/0Otg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=AM2asdnTbcWjTDSKvPLLLdkQcBJUAV1JdLEthM9iH/DgEjywpq7Eoc/p1Vs2GM84p
         3erF2Xz3fyJi8C5FGvzAuneSUgQqSHMFDaTgN01JSu4qlLoqLdpm1oaHQt9Iow7aJ+
         3a+8c2Gm3LuPjiXItJKq2muU2J6yjFLAMEgzRnYs=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id A247360710;
        Thu, 19 Sep 2019 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568919267;
        bh=1KRYCvKV5SHVIhtNgo8m4kr/fGiP20kR6gPIaf/0Otg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=oIlx/h4PwXSHJ7h9cZjdPE5H+2CEisDoztsKvW4giVo1k2CxZRaSJqHxI83qP0qHg
         tkPBPtb/5nGxFi1rBt/YVoq22htrrltzlUQUhT7VuUEumoizV84coZMI2qfK3jo020
         CWuap7Ca2dLOyFzOGOwA0/CmDlurGT6qNtfukueQ=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 20 Sep 2019 00:24:27 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCHv6 3/3] iommu: arm-smmu-impl: Add sdm845 implementation
 hook
In-Reply-To: <a45e8fb6fe1a8cc914fedbfac65af009@codeaurora.org>
References: <cover.1568712606.git.saiprakash.ranjan@codeaurora.org>
 <1513424ecec891d19c1aa3c599ec67db7964b6b2.1568712606.git.saiprakash.ranjan@codeaurora.org>
 <20190919002501.GA20859@builder>
 <a45e8fb6fe1a8cc914fedbfac65af009@codeaurora.org>
Message-ID: <081fff2f5dacfa7b6f5df6364f088045@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-09-19 08:48, Sai Prakash Ranjan wrote:
> On 2019-09-19 05:55, Bjorn Andersson wrote:
>> In the transition to this new design we lost the ability to
>> enable/disable the safe toggle per board, which according to Vivek
>> would result in some issue with Cheza.
>> 
>> Can you confirm that this is okay? (Or introduce the DT property for
>> enabling the safe_toggle logic?)
>> 
> 
> Hmm, I don't remember Vivek telling about any issue on Cheza because
> of this logic.
> But I will test this on Cheza and let you know.
> 

I tested this on Cheza and no perf degradation nor any other issue is 
seen
atleast openly, although I see this below stack dump always with 
cant_sleep change added.

[    5.048860] BUG: assuming atomic context at 
/mnt/host/source/src/third_party/kernel/v5.3/drivers/firmware/qcom_scm-64.c:206
[    5.060303] in_atomic(): 0, irqs_disabled(): 0, pid: 1, name: 
swapper/0
[    5.067118] CPU: 4 PID: 1 Comm: swapper/0 Not tainted 5.3.0 #102
[    5.073299] Hardware name: Google Cheza (rev3+) (DT)
[    5.078416] Call trace:
[    5.080953]  dump_backtrace+0x0/0x16c
[    5.084727]  show_stack+0x20/0x2c
[    5.088156]  dump_stack+0x90/0xcc
[    5.091585]  __cant_sleep+0xb4/0xc4
[    5.095192]  __qcom_scm_qsmmu500_wait_safe_toggle+0x5c/0xa0
[    5.100929]  qcom_scm_qsmmu500_wait_safe_toggle+0x28/0x34
[    5.106491]  qcom_sdm845_smmu500_reset+0x24/0x50
[    5.111249]  arm_smmu_device_reset+0x1a4/0x25c
[    5.115827]  arm_smmu_device_probe+0x418/0x50c
[    5.120406]  platform_drv_probe+0x90/0xb0
[    5.124542]  really_probe+0x14c/0x3b8
[    5.128327]  driver_probe_device+0x70/0x140
[    5.132643]  device_driver_attach+0x4c/0x6c
[    5.136960]  __driver_attach+0xc8/0x150
[    5.140917]  bus_for_each_dev+0x84/0xcc
[    5.144873]  driver_attach+0x2c/0x38
[    5.148555]  bus_add_driver+0x108/0x1fc
[    5.152512]  driver_register+0x64/0xf8
[    5.156375]  __platform_driver_register+0x4c/0x58
[    5.161226]  arm_smmu_driver_init+0x1c/0x24
[    5.165545]  do_one_initcall+0x11c/0x2dc
[    5.169595]  do_initcall_level+0x14c/0x174
[    5.173822]  do_basic_setup+0x30/0x48
[    5.177595]  kernel_init_freeable+0xc4/0x144
[    5.181990]  kernel_init+0x14/0x100
[    5.185584]  ret_from_fork+0x10/0x18
