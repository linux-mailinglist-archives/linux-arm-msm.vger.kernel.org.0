Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09C823B0547
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 14:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhFVM5K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 08:57:10 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:19079 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231736AbhFVM5J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 08:57:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624366494; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WEn6bmPzMMSHhv6oUOTaDk3Jg7DB4eW7EAvGkoNzk5k=;
 b=uFI14CmZYMAlgqjS6PQc+gnBHMIXd40lyOsYwGsCXl9x0uTULnVMchel62UgS+7aS+aMx1Uk
 ydEymx/CQYM2j5Ik08jY3Qj3mg2gW3hzZr+GFvzp55LAMQtAIUYRH6hI9XA3qjCMDoAswhRT
 XqUyVdDeGUH+O75mtauVbKjksH0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60d1dd831200320241f50cb5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Jun 2021 12:54:27
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A6B2EC433F1; Tue, 22 Jun 2021 12:54:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D23CC433D3;
        Tue, 22 Jun 2021 12:54:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 22 Jun 2021 18:24:24 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, bhelgaas@google.com, robh+dt@kernel.org,
        swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        dianders@chromium.org, mka@chromium.org, sanm@codeaurora.org
Subject: Re: [PATCH v2 3/4] PCIe: qcom: Add support to control pipe clk mux
In-Reply-To: <YLwvyiBzs0kU0oRk@builder.lan>
References: <1622904059-21244-1-git-send-email-pmaliset@codeaurora.org>
 <1622904059-21244-4-git-send-email-pmaliset@codeaurora.org>
 <YLwvyiBzs0kU0oRk@builder.lan>
Message-ID: <e2998dde18c5b989a8211fffbb611ac3@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-06 07:45, Bjorn Andersson wrote:
> On Sat 05 Jun 09:40 CDT 2021, Prasad Malisetty wrote:
> 
>> In PCIe driver pipe-clk mux needs to switch between pipe_clk
>> and XO for GDSC enable. This is done by setting pipe_clk mux
>> as parent of pipe_clk after phy init.
> 
> But you're not switching between pipe_clk and XO, you're only making
> sure that the pipe_clk is parented by the PHY's pipe clock.
> 
> Also, can you please elaborate on how this relates to the GDSC?
> 
>> yes we are parenting the pipe clock by PHY's pipe clock. and also 
>> switching back to XO during suspend.

Below is the new requirement for SC7280 as part of LPM sequence.

In L1ss low power mode PHY turns the pipe clock off, so each access on 
slave AXI causes to exit from low power modes.
For completing the access, the pipe clock should be active from PHY.

In L23 mode, access on slave AXI doesn’t wake the core.
For accessing to DBI registers during L23, the SW should switch the pipe 
clock with 19.2MHz free-running clock (TCXO)
using GCC’s registers

>> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> ---
>>  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>> 
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c 
>> b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 8a7a300..5cbbea4 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -166,6 +166,9 @@ struct qcom_pcie_resources_2_7_0 {
>>  	struct regulator_bulk_data supplies[2];
>>  	struct reset_control *pci_reset;
>>  	struct clk *pipe_clk;
>> +	struct clk *pipe_clk_mux;
>> +	struct clk *pipe_ext_src;
>> +	struct clk *ref_clk_src;
>>  };
>> 
>>  union qcom_pcie_resources {
>> @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct 
>> qcom_pcie *pcie)
>>  	if (ret < 0)
>>  		return ret;
>> 
>> +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
>> +		res->pipe_clk_mux = devm_clk_get(dev, "pipe_src");
>> +		if (IS_ERR(res->pipe_clk_mux))
>> +			return PTR_ERR(res->pipe_clk_mux);
>> +
>> +		res->pipe_ext_src = devm_clk_get(dev, "pipe_ext");
>> +		if (IS_ERR(res->pipe_ext_src))
>> +			return PTR_ERR(res->pipe_ext_src);
>> +
>> +		res->ref_clk_src = devm_clk_get(dev, "ref");
>> +		if (IS_ERR(res->ref_clk_src))
>> +			return PTR_ERR(res->ref_clk_src);
>> +	}
>> +
>>  	res->pipe_clk = devm_clk_get(dev, "pipe");
>>  	return PTR_ERR_OR_ZERO(res->pipe_clk);
>>  }
>> @@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct 
>> qcom_pcie *pcie)
>>  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>>  {
>>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
>> +	struct dw_pcie *pci = pcie->pci;
>> +	struct device *dev = pci->dev;
>> +
>> +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))
> 
> If this is something only found on 7280, you need to document (in the
> commit message at least) why this does not apply to other platforms 
> with
> this controller.
> 
> Thanks,
> Bjorn
> 
Sure, will add more info about the requirement.

>> +		clk_set_parent(res->pipe_clk_mux, res->pipe_ext_src);
>> 
>>  	return clk_prepare_enable(res->pipe_clk);
>>  }
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
