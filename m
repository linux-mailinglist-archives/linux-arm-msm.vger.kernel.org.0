Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 801801F1A8D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 16:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729553AbgFHOHv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 10:07:51 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:18051 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729744AbgFHOHu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 10:07:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591625270; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2lAq2rIQvCTa/HMObWUZHG77iDOvmKG/k0U9on+s/5c=;
 b=rrKet/Q227AueU46F8vw3V/Cx8hemq9TLIuXOguA9XoGqXHuSg7k6qJn4+1eV7JPW+lZ/NU8
 SUNCHzSWv9FGj/0G0rCHEOk7V1WlcTE8QM9Zu/omR1VaIM1my/6F3LegDJ+0X75ivCWch+3L
 dsZETmt49h5O4YnCXl6xqbcYsyE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ede4631ceb4684f60fcf630 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Jun 2020 14:07:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 99298C433AF; Mon,  8 Jun 2020 14:07:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 05A65C433C6;
        Mon,  8 Jun 2020 14:07:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 08 Jun 2020 19:37:43 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
In-Reply-To: <da1fdf765ea29cfe7a44145b17431721@codeaurora.org>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15>
 <6d759cc28628ea72767c1304883630eb@codeaurora.org>
 <CAJ9a7VhMbdqVBHxEXGYxFkgPnnQqNnDAz=wkHP3s7Ntw0iLmKA@mail.gmail.com>
 <f0357072de96970b641bbd0da98c1d61@codeaurora.org>
 <CAJ9a7Vj9STJw4jBxWU_9wHftj4Q7+k8o1nTc8tr21KjYi0RkpQ@mail.gmail.com>
 <4a09cd2e054836d85f2e024ca4435e91@codeaurora.org>
 <CAJ9a7VgCFeHNbY_9Gwvu6uT9MFBeY=_GCaN4N1dwmm+iNpfJOw@mail.gmail.com>
 <1a5a6a6d-b86d-df45-cf91-7081e70d88a3@arm.com>
 <20200603174426.GA23165@xps15>
 <da1fdf765ea29cfe7a44145b17431721@codeaurora.org>
Message-ID: <dfa6aa626f075f49d9ba1ae8ffa3d384@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu, Mike

On 2020-06-04 12:57, Sai Prakash Ranjan wrote:
> 

[...]

>> 
>> Robin has a point - user space is long gone at this time.  As such the 
>> first
>> question to ask is what kind of CS session was running at the time the 
>> system
>> was shutting down.  Was it a perf session of a sysfs session?
>> 
>> I'm guessing it was a sysfs session because user space has been blown 
>> away a
>> while back and part of that process should have killed all perf 
>> sessions.
> 
> I was enabling trace via sysfs.
> 
>> 
>> If I am correct then simply switching off the ETR HW in the shutdown() 
>> amba bus
>> callback should be fine - otherwise Mike's approach is mandatory.  
>> There is
>> also the exchange between Robin and Sai about removing the SMMU 
>> shutdown
>> callback, but that thread is still incomplete.
>> 
> 
> If Robin is hinting at removing SMMU shutdown callback, then I think 
> adding
> all these shutdown callbacks to all clients of SMMU can be avoided. Git 
> blaming
> the thing shows it was added to avoid some kexec memory corruption.
> 

I think I misread the cryptic hint from Robin and it is not right to 
remove
SMMU shutdown callback. For more details on why that was a bad idea and 
would
break kexec, please refer to [1].

As for the coresight, can I disable the ETR only in the tmc shutdown 
callback
or are we still concerned about the userspace coming into picture?

[1] https://lore.kernel.org/patchwork/patch/1253131/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
