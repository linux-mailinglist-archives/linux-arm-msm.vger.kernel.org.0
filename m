Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D871ECFB6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 14:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725833AbgFCM0Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 08:26:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:18090 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725943AbgFCM0Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 08:26:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591187183; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KfYEbXwoX+aABDlZlOKRx/sTdh4324Te4XRf5exbMGw=;
 b=C0ILPLNJhSvX+1hvAyySJzBtX2yYUU5e0MIePEEYvecD/UFNXZcN8iVmLAW5pE8ax2i2SC9o
 iER7e3aWU0WMl/3N8H/6ikD84BNZB0j0D/S0Xk2J/v0+KP3OjvQB8sgnCibe/7QwtP3QC78P
 28lXjNwuLP6AMM0O3eM8odzxh4Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ed796ee46d39fc0a2106c20 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 03 Jun 2020 12:26:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 46C69C43391; Wed,  3 Jun 2020 12:26:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BD91BC433C6;
        Wed,  3 Jun 2020 12:26:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 03 Jun 2020 17:56:21 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
In-Reply-To: <6c1a4fbd-98cb-a49c-0ced-1318d5d5e7c8@arm.com>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15>
 <bf7e8ac2-51b2-d9cb-9c4f-c311297accac@arm.com>
 <1549935cf69ac3a006f32eb278821027@codeaurora.org>
 <6c1a4fbd-98cb-a49c-0ced-1318d5d5e7c8@arm.com>
Message-ID: <7fe5762b5cb8f87e988232922d06c55d@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2020-06-03 17:51, Robin Murphy wrote:
> On 2020-06-03 13:00, Sai Prakash Ranjan wrote:
>> Hi Robin, Mathieu
>> 
>> On 2020-06-03 17:07, Robin Murphy wrote:
>>> On 2020-06-01 22:28, Mathieu Poirier wrote:
>>>> That being said I'm sure that dependencies on an IOMMU isn't a 
>>>> problem confined
>>>> to coresight. I am adding Robin Murphy, who added this commit [1], 
>>>> to the thread
>>>> in the hope that he can provide guidance on the right way to do 
>>>> this.
>>> 
>>> Right, it's not specific to CoreSight, and it's not even specific to
>>> IOMMUs really. In short, blame kexec ;)
>>> 
>> 
>> Yes it is not specific to coresight, we are targeting this for all
>> consumers/clients of SMMU(atleast on SC7180 SoC). We have display 
>> throwing
>> NoC/interconnect errors[1] during reboot after SMMU is disabled.
>> This is also not specific to kexec either as you explained here [2] 
>> about
>> a case with display which is exacly what is happening in our system 
>> [1].
> 
> Sure, but those instances are begging the question of why the SMMU is
> disabled at reboot in the first place ;)
> 

That is what happens in SMMU shutdown callback right? It is the 
reboot/shutdown
flow.

    arm_smmu_device_shutdown()
     platform_drv_shutdown()
      device_shutdown()
       kernel_restart_prepare()
        kernel_restart()

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
