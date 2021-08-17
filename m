Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B50A3EE6A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 08:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238067AbhHQGhi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 02:37:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61697 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234388AbhHQGhh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 02:37:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629182225; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iXGuKgg2bh81naBeKDWA/sZgr8If5bEpsCpMLB50+Tw=;
 b=xM9M3nmqAtyTAaxmB+3DVpbvteASs3oQbyZd6S1XrxY0e25X0tzNQTZSZoQNkXrV4oXEJe/z
 2QeHQRFTeW6fnXibgljg2lIzncd9GJpWv/T05Zvd3hunHA+qEAkuS52RK5zAtffx5k62cT3N
 DedA0cHvr0LiUelSg4fg6Y037Tk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 611b59109507ca1a341c3deb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Aug 2021 06:37:03
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3FC77C4360D; Tue, 17 Aug 2021 06:37:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF304C4338F;
        Tue, 17 Aug 2021 06:37:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Aug 2021 12:07:01 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org
Subject: Re: [PATCH v5 4/4] PCI: qcom: Switch pcie_1_pipe_clk_src after PHY
 init in SC7280
In-Reply-To: <20210812061110.GB72145@thinkpad>
References: <1628568516-24155-1-git-send-email-pmaliset@codeaurora.org>
 <1628568516-24155-5-git-send-email-pmaliset@codeaurora.org>
 <20210812061110.GB72145@thinkpad>
Message-ID: <4fe9e931935b85748753611aa752b9b9@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-12 11:41, Manivannan Sadhasivam wrote:
> On Tue, Aug 10, 2021 at 09:38:36AM +0530, Prasad Malisetty wrote:
>> On the SC7280, By default the clock source for pcie_1_pipe is
>> TCXO for gdsc enable. But after the PHY is initialized, the clock
>> source must be switched to gcc_pcie_1_pipe_clk from TCXO.
>> 
>> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> ---
>>  drivers/pci/controller/dwc/pcie-qcom.c | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>> 
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c 
>> b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 8a7a300..39e3b21 100644
>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -166,6 +166,8 @@ struct qcom_pcie_resources_2_7_0 {
>>  	struct regulator_bulk_data supplies[2];
>>  	struct reset_control *pci_reset;
>>  	struct clk *pipe_clk;
>> +	struct clk *gcc_pcie_1_pipe_clk_src;
>> +	struct clk *phy_pipe_clk;
>>  };
>> 
>>  union qcom_pcie_resources {
>> @@ -1167,6 +1169,16 @@ static int qcom_pcie_get_resources_2_7_0(struct 
>> qcom_pcie *pcie)
>>  	if (ret < 0)
>>  		return ret;
>> 
>> +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
>> +		res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
>> +		if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
>> +			return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
>> +
>> +		res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
>> +		if (IS_ERR(res->phy_pipe_clk))
>> +			return PTR_ERR(res->phy_pipe_clk);
>> +	}
>> +
>>  	res->pipe_clk = devm_clk_get(dev, "pipe");
>>  	return PTR_ERR_OR_ZERO(res->pipe_clk);
>>  }
>> @@ -1255,6 +1267,12 @@ static void qcom_pcie_deinit_2_7_0(struct 
>> qcom_pcie *pcie)
>>  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>>  {
>>  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
>> +	struct dw_pcie *pci = pcie->pci;
>> +	struct device *dev = pci->dev;
>> +	struct device_node *node = dev->of_node;
>> +
>> +	if (of_property_read_bool(node, "pipe-clk-source-switch"))
> 
> Wondering why you didn't use the compatible here as well. This will 
> break if the
> property exist but the clocks are not.
> 
> Thanks,
> Mani
> 

Hi Mani,

In earlier versions we used compatible method here as well, but in v5 
replaced compatible with new boolean flag.

In recent comments as Stephen suggested, its straight forward approach. 
if src pointer is NULL, clk_set_parent return 0 and nop
I will remove both compatible and property read approach and update the 
change in next version.


>> +		clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);
>> 
>>  	return clk_prepare_enable(res->pipe_clk);
>>  }
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
