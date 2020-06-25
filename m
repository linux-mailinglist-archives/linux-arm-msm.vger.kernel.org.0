Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 640BC20A5B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 21:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406356AbgFYTXN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 15:23:13 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12440 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406068AbgFYTXN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 15:23:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593112993; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=XoVTExvOS6FXCKHFErokRwoLzG60QbiYxV+VqNRvXX0=; b=mSVaaHu6HoSo33L1CzOw7ztB4nrN+9MmqZ+vMYjuBtYTxKtcYzLti88bw05zSTKcwlI6dfjL
 Ny2zMsnddBvsqr8eQX7QScsUWLNwPzMaNJZ1VpeYGEgIn1zAIrW5g9GKtF2tnCmQSUzSZ5Db
 xHxzgv4xvBVzLo3yzUnkyWnShQ8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ef4f9920206ad41d10b21ae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 19:22:58
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5AF32C433C6; Thu, 25 Jun 2020 19:22:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.110.85.110] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33998C433C8;
        Thu, 25 Jun 2020 19:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33998C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v2] phy: qcom-snps: Add runtime suspend and resume
 handlers
To:     Vinod Koul <vkoul@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1590112200-1110-1-git-send-email-wcheng@codeaurora.org>
 <20200624122103.GC2324254@vkoul-mobl>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <49c855c6-6fcf-ddbd-25f4-7af6877d5211@codeaurora.org>
Date:   Thu, 25 Jun 2020 12:22:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624122103.GC2324254@vkoul-mobl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/24/2020 5:21 AM, Vinod Koul wrote:
> Hi Wesley,
> 
> On 21-05-20, 18:50, Wesley Cheng wrote:
>> Allow for the PHY to be put into a powered down state when possible.
>> Add the required suspend and resume callbacks, which will determine
>> what resources can be turned off depending on the cable status.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>>
>> ---
>> Changes in v2:
>>  - Addressed checkpatch alignment/line length warnings.
>>  - Removed superfluous init in qcom_snps_hsphy_resume().
>>
>>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 100 ++++++++++++++++++++++++++
>>  1 file changed, 100 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
>> index 4d74045..0a4e77af 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
>> @@ -76,7 +76,9 @@
>>   * @iface_clk: phy interface clock
>>   * @phy_reset: phy reset control
>>   * @vregs: regulator supplies bulk data
>> + * @suspended: PHY is in the suspended state
>>   * @phy_initialized: if PHY has been initialized correctly
>> + * @mode: contains the current mode the PHY is in
>>   */
>>  struct qcom_snps_hsphy {
>>  	struct phy *phy;
>> @@ -87,7 +89,9 @@ struct qcom_snps_hsphy {
>>  	struct reset_control *phy_reset;
>>  	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
>>  
>> +	bool suspended;
>>  	bool phy_initialized;
>> +	enum phy_mode mode;
>>  };
>>  
>>  static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>> @@ -104,6 +108,84 @@ static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>>  	readl_relaxed(base + offset);
>>  }
>>  
>> +static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	if (hsphy->suspended)
>> +		return 0;
> 
> Am still not convinced why this would be called when we are already
> suspended :)
> 

Hi Vinod,

OK, we can remove it for now, and if its really required further on, we
can re-add.

>> +
>> +	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY, mode:%d\n",
>> +		hsphy->mode);
> 
> Remove debug artifacts here?
> 

Sure, can do that.

>> +
>> +	if (hsphy->mode == PHY_MODE_USB_HOST) {
>> +		/* Enable auto-resume to meet remote wakeup timing */
>> +		qcom_snps_hsphy_write_mask(hsphy->base,
>> +						USB2_PHY_USB_PHY_HS_PHY_CTRL2,
>> +						USB2_AUTO_RESUME,
>> +						USB2_AUTO_RESUME);
> 
> Lets align the lines above to opening brace please..
> If you run checkpatch with --strict option you would get this CHECK: Alignment should match open parenthesis
> 

OK, got it.  Fixed a few other spacing warnings as well.

>> +		usleep_range(500, 1000);
>> +		qcom_snps_hsphy_write_mask(hsphy->base,
>> +						USB2_PHY_USB_PHY_HS_PHY_CTRL2,
>> +						0, USB2_AUTO_RESUME);
>> +	}
>> +
>> +	clk_disable_unprepare(hsphy->cfg_ahb_clk);
>> +	hsphy->suspended = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
>> +{
>> +	int ret;
>> +
>> +	if (!hsphy->suspended)
>> +		return 0;
>> +
>> +	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode:%d\n",
>> +		hsphy->mode);
> 
> here as well
> 

Done.

>> +
>> +	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
>> +	if (ret) {
>> +		dev_err(&hsphy->phy->dev,
>> +			"failed to enable cfg ahb clock, %d\n", ret);
> 
> single line should be okay now :)
> 

Yep!

>> +		return ret;
>> +	}
>> +
>> +	hsphy->suspended = false;
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
>> +{
>> +	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
>> +
>> +	if (!hsphy->phy_initialized)
>> +		return 0;
>> +
>> +	qcom_snps_hsphy_suspend(hsphy);
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
>> +{
>> +	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
>> +
>> +	if (!hsphy->phy_initialized)
>> +		return 0;
>> +
>> +	qcom_snps_hsphy_resume(hsphy);
>> +	return 0;
>> +}
>> +
>> +static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
>> +					int submode)
>> +{
>> +	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
>> +
>> +	hsphy->mode = mode;
>> +	return 0;
>> +}
>> +
>>  static int qcom_snps_hsphy_init(struct phy *phy)
>>  {
>>  	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
>> @@ -175,6 +257,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>>  					UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0);
>>  
>>  	hsphy->phy_initialized = true;
>> +	hsphy->suspended = false;
>>  
>>  	return 0;
>>  
>> @@ -201,6 +284,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
>>  static const struct phy_ops qcom_snps_hsphy_gen_ops = {
>>  	.init		= qcom_snps_hsphy_init,
>>  	.exit		= qcom_snps_hsphy_exit,
>> +	.set_mode	= qcom_snps_hsphy_set_mode,
> 
> This should be a separate patch, whats set_mode got to do with suspend
> support :)
> 

Got it, will split this into another patch

>>  	.owner		= THIS_MODULE,
>>  };
>>  
>> @@ -212,6 +296,11 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
>>  };
>>  MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
>>  
>> +static const struct dev_pm_ops qcom_snps_hsphy_pm_ops = {
>> +	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_runtime_suspend,
>> +			   qcom_snps_hsphy_runtime_resume, NULL)
>> +};
>> +
>>  static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>> @@ -255,6 +344,14 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>>  		return ret;
>>  	}
>>  
>> +	pm_runtime_set_active(dev);
>> +	pm_runtime_enable(dev);
>> +	/*
>> +	 * Prevent runtime pm from being ON by default. Users can enable
>> +	 * it using power/control in sysfs.
>> +	 */
>> +	pm_runtime_forbid(dev);
>> +
>>  	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_hsphy_gen_ops);
>>  	if (IS_ERR(generic_phy)) {
>>  		ret = PTR_ERR(generic_phy);
>> @@ -269,6 +366,8 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>>  	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>>  	if (!IS_ERR(phy_provider))
>>  		dev_dbg(dev, "Registered Qcom-SNPS HS phy\n");
>> +	else
>> +		pm_runtime_disable(dev);
>>  
>>  	return PTR_ERR_OR_ZERO(phy_provider);
>>  }
>> @@ -277,6 +376,7 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>>  	.probe		= qcom_snps_hsphy_probe,
>>  	.driver = {
>>  		.name	= "qcom-snps-hs-femto-v2-phy",
>> +		.pm = &qcom_snps_hsphy_pm_ops,
>>  		.of_match_table = qcom_snps_hsphy_of_match_table,
>>  	},
>>  };
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
