Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A55C1BAF88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 22:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgD0UcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 16:32:20 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:62031 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726678AbgD0UcU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 16:32:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588019539; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=kNapMrLPfWyqq3saA7ayYBf3t2HHIt3ns1o+JIh4q4U=; b=mqpKFqXZwCZTxPH8rN2siXt2MNOMba6KhGI+IpoSYxG6pfbp2U4Zqd2RWnX7QjDXWJpo502g
 MA5odlR1fBIrY+t8kOCFJI8nk3rCKROpa1GIgng9CHfivKDUaNxSRJQ2oANpxVB/IFj8zrrX
 VVxS6Yjp2ZzWWCOqOHLsTos4BPA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea7413d.7f0d1ef71030-smtp-out-n03;
 Mon, 27 Apr 2020 20:31:57 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BEBEFC4478F; Mon, 27 Apr 2020 20:31:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.78.22] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C2DA4C433D2;
        Mon, 27 Apr 2020 20:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C2DA4C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH] phy: qcom-snps: Add runtime suspend and resume handlers
To:     Vinod Koul <vkoul@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587662818-4461-1-git-send-email-wcheng@codeaurora.org>
 <20200427165919.GR56386@vkoul-mobl.Dlink>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <4ce39b01-ddf3-7a5b-9ac4-659ff4362fcd@codeaurora.org>
Date:   Mon, 27 Apr 2020 13:31:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427165919.GR56386@vkoul-mobl.Dlink>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/27/2020 9:59 AM, Vinod Koul wrote:
> On 23-04-20, 10:26, Wesley Cheng wrote:
> 
>> +static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	if (hsphy->suspended)
>> +		return 0;
>> +
>> +	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY, mode = %d \n", hsphy->mode);
>> +
>> +	if (hsphy->mode == PHY_MODE_USB_HOST) {
>> +		/* Enable auto-resume to meet remote wakeup timing */
>> +		qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
>> +										USB2_AUTO_RESUME, USB2_AUTO_RESUME);
>> +		usleep_range(500, 1000);
>> +		qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
>> +										0, USB2_AUTO_RESUME);
> 
> Kernel has a coding guideline where we try to "stick" to 80 char limit
> and is sometimes okay like debug logs. Above is not okay. Please fix it
> and run ./scripts/checkpatch.pl --strict on your patch and fix all
> errors. Warning and checks at your discretion using common sense. When
> in doubt do ask :)
> 

Hi Vinod,

Thanks for the input.  I do run the checkpatch script before sending
patches, and addressing the errors.  However, seems this was tagged as a
warning instead.  Will keep in mind to address as many warnings as I can
as well.

>> +	}
>> +
>> +	clk_disable_unprepare(hsphy->cfg_ahb_clk);
>> +	hsphy->suspended = true;
> 
> why do you need to track this?
> 

More for debug purposes in case the RPM state becomes out of sync with
the expected PHY state.  We've seen some situations during PM
suspend/resume testing where our RPM routines aren't executed, as PM
will disable RPM briefly.  It would be nice to be able to catch these
situations after collecting our crash dumps.

>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	int ret = 0;
> 
> superfluous init..
> 

Agreed.

>>  static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -251,6 +333,14 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>>  		return ret;
>>  	}
>>  
>> +	pm_runtime_set_active(dev);
>> +	pm_runtime_enable(dev);
> 
> would it not make sense to enable this after pjy in initialized?
> 

Not sure we want to put this in the phy_init() callback, as we can't
guarantee how the driver registering the PHY will use it. It'll put the
requirement of having to call phy_exit() for every phy_init() sequence,
in order to avoid unbalanced disable_depth warnings from the RPM driver.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
