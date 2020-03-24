Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54DB3191B7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 21:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgCXUui (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 16:50:38 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:29496 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726984AbgCXUui (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 16:50:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585083037; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ddvd2aTPOKAU2rsf+pwve6VGhBM2CcVIjGKqs4Lcb+4=; b=wy+lqMG0YdVMI2Qz81gTd/RepATQ7TdB1dHZduxjsCCzYN90A2ijnfQ4el9ZjyHP/rCOkeZC
 q7gXqpgW4B9mKNeZGopk/mS0JLKEOs9/oycArpEP52Qy3OZaN1gWEhpW095jD3TSn8l5ruRk
 8jfKbO9ehi2sUmgGxa4wgd6Va2g=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7a728f.7f7a4c39c9d0-smtp-out-n05;
 Tue, 24 Mar 2020 20:50:23 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0C17DC43637; Tue, 24 Mar 2020 20:50:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.95.232] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CAF2AC433CB;
        Tue, 24 Mar 2020 20:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CAF2AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v2 2/4] phy: qcom-snps: Add SNPS USB PHY driver for QCOM
 based SOCs
To:     Philipp Zabel <pza@pengutronix.de>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1584994632-31193-1-git-send-email-wcheng@codeaurora.org>
 <1584994632-31193-3-git-send-email-wcheng@codeaurora.org>
 <20200324094924.GA22281@pengutronix.de>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <047976bd-709e-d935-38f3-7c8767590e2b@codeaurora.org>
Date:   Tue, 24 Mar 2020 13:50:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200324094924.GA22281@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Philipp,

On 3/24/2020 2:49 AM, Philipp Zabel wrote:
> Hi Wesley,
> 
> On Mon, Mar 23, 2020 at 01:17:10PM -0700, Wesley Cheng wrote:
>> This adds the SNPS FemtoPHY driver used in QCOM SOCs.  There
>> are potentially multiple instances of this UTMI PHY on the
>> SOC, all which can utilize this driver.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  drivers/phy/qualcomm/Kconfig             |  10 ++
>>  drivers/phy/qualcomm/Makefile            |   1 +
>>  drivers/phy/qualcomm/phy-qcom-snps-7nm.c | 294 +++++++++++++++++++++++++++++++
>>  3 files changed, 305 insertions(+)
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-snps-7nm.c
>>
> [...]
>> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-7nm.c b/drivers/phy/qualcomm/phy-qcom-snps-7nm.c
>> new file mode 100644
>> index 0000000..8d4ba53
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-snps-7nm.c
>> @@ -0,0 +1,294 @@
> [...]
>> +static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct qcom_snps_hsphy *hsphy;
>> +	struct phy_provider *phy_provider;
>> +	struct phy *generic_phy;
>> +	struct resource *res;
>> +	int ret, i;
>> +	int num;
>> +
>> +	hsphy = devm_kzalloc(dev, sizeof(*hsphy), GFP_KERNEL);
>> +	if (!hsphy)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	hsphy->base = devm_ioremap_resource(dev, res);
>> +	if (IS_ERR(hsphy->base))
>> +		return PTR_ERR(hsphy->base);
>> +
>> +	hsphy->ref_clk = devm_clk_get(dev, "ref");
>> +	if (IS_ERR(hsphy->ref_clk)) {
>> +		ret = PTR_ERR(hsphy->ref_clk);
>> +		if (ret != -EPROBE_DEFER)
>> +			dev_err(dev, "failed to get ref clk, %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	hsphy->phy_reset = devm_reset_control_get_by_index(&pdev->dev, 0);
>> +	if (IS_ERR(hsphy->phy_reset)) {
>> +		dev_err(dev, "failed to get phy core reset\n");
>> +		return PTR_ERR(hsphy->phy_reset);
>> +	}
> 
> There is only a single reset specified, so there is no need for
> _by_index. Also please explicitly request exclusive reset control
> for this driver, I suggest:
> 
> 	hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> 
> If you do want to prepare for future addition of other resets to the
> bindings (but if so, why not specify those right now?), you should add
> a reset-names property and request the reset control by id string
> instead.
> 
> regards
> Philipp
> 

Thanks for the feedback.  Sure, I will move to using
devm_reset_control_get_exclusive, as we won't be having multiple resets
for this particular PHY.  Will update a new patch series.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
