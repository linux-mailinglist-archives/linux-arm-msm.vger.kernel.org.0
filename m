Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7221540C06F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Sep 2021 09:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236486AbhIOHZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Sep 2021 03:25:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:35047 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231410AbhIOHZY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Sep 2021 03:25:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631690646; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SPMUc+IeXgwlU6aQYQ8KqJroIVGV8hffE7mWUc2ERIY=;
 b=jTfFblipj5vZ4/wmtQsa0O19GHYuXsj2BkljdfGrsE8WAqj5J1ocyW9Qd68UGOzbdsr2uWJF
 x4Q+rl+jxBr11tIk1GQ8EEegew5MsSvS6zWqpvj6lA8p6jjpQgcgH7xWez6YSrF3MZLZVJ9T
 ouesyN3fTS0p5LfGo1u+IAKo5cM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61419f7e648642cc1cd0e827 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 15 Sep 2021 07:23:42
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA8D0C43617; Wed, 15 Sep 2021 07:23:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DBE05C4338F;
        Wed, 15 Sep 2021 07:23:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 15 Sep 2021 12:53:41 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v7 4/4] PCI: qcom: Switch pcie_1_pipe_clk_src after PHY
 init in SC7280
In-Reply-To: <20210914185228.GA1443558@bjorn-Precision-5520>
References: <20210914185228.GA1443558@bjorn-Precision-5520>
Message-ID: <c63b7811ad74303fbb80dbbfe2d11a17@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-09-15 00:22, Bjorn Helgaas wrote:
> On Tue, Sep 14, 2021 at 11:49:10PM +0530, Prasad Malisetty wrote:
>> On the SC7280, the clock source for gcc_pcie_1_pipe_clk_src
>> must be the TCXO while gdsc is enabled. After PHY init successful
>> clock source should switch to pipe clock for gcc_pcie_1_pipe_clk_src.
>> 
>> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> ---
>>  drivers/pci/controller/dwc/pcie-qcom.c | 90 
>> +++++++++++++++++++++++++++++-----
>>  1 file changed, 79 insertions(+), 11 deletions(-)
>> 
>> +struct qcom_pcie_cfg {
>> +	const struct qcom_pcie_ops *ops;
>> +	bool pcie_1_pipe_clk_src_switch;
> 
> This is OK, but all things being equal I like "unsigned int x:1" a
> little better.  Here's some background:
> 
> 
Hi Bjorn,

Thanks for sharing the details.

Sure, I will replace bool with unsigned int in next patch version.

Thanks
-Prasad

> https://lore.kernel.org/r/CA+55aFzKQ6Pj18TB8p4Yr0M4t+S+BsiHH=BJNmn=76-NcjTj-g@mail.gmail.com/
> 
> https://lore.kernel.org/r/CA+55aFxnePDimkVKVtv3gNmRGcwc8KQ5mHYvUxY8sAQg6yvVYg@mail.gmail.com/
> 
>> @@ -1467,6 +1531,7 @@ static int qcom_pcie_probe(struct 
>> platform_device *pdev)
>>  	struct pcie_port *pp;
>>  	struct dw_pcie *pci;
>>  	struct qcom_pcie *pcie;
>> +	const struct qcom_pcie_cfg *pcie_cfg = NULL;
> 
> No need to initialize this, since you always assign it before using
> it.
> 
Agree, I will remove initialization in next patch series.

>>  	int ret;
>> 
>>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
>> @@ -1488,7 +1553,9 @@ static int qcom_pcie_probe(struct 
>> platform_device *pdev)
>> 
>>  	pcie->pci = pci;
>> 
>> -	pcie->ops = of_device_get_match_data(dev);
>> +	pcie_cfg = of_device_get_match_data(dev);
>> +	pcie->ops = pcie_cfg->ops;
>> +	pcie->pcie_1_pipe_clk_src_switch = 
>> pcie_cfg->pcie_1_pipe_clk_src_switch;
>> 
>>  	pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
>>  	if (IS_ERR(pcie->reset)) {
> 
> Looks good, thanks for working on this!

Thanks Bjorn for the review.
