Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F023CB2DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 08:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234986AbhGPG5T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 02:57:19 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:33566 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235110AbhGPG5J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 02:57:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626418454; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=egpCdt6/boaiiUOxaKL5GbmqBK0oWlnYWcXclf7Y5ks=;
 b=DwwD980H9fxnge55sAofUO6gqWNa6DgOgPbN8Rf2dx9tpL8lOcPe4ahtwKq9r4P7cQuzWonl
 o63MzqralrTTqOODvk60hKuAWKf4N/9Dfgc6i61NiaAVljnfARer4+D/hZV8Y6zrBbn2F2Zk
 bLN1liXofFdnnGyABkWCkJjR63g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60f12d081d1afe585e6cf303 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Jul 2021 06:54:00
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43074C43217; Fri, 16 Jul 2021 06:54:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 08FABC433D3;
        Fri, 16 Jul 2021 06:53:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 16 Jul 2021 12:23:58 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, bhelgaas@google.com, robh+dt@kernel.org,
        swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, sanm@codeaurora.org, sallenki@codeaurora.org,
        vbadigan@codeaurora.org
Subject: Re: [PATCH v3 4/4] PCIe: qcom: Add support to control pipe clk mux
In-Reply-To: <YOxn5GWQsEH/+bSm@yoga>
References: <1624377651-30604-1-git-send-email-pmaliset@codeaurora.org>
 <1624377651-30604-5-git-send-email-pmaliset@codeaurora.org>
 <YOxn5GWQsEH/+bSm@yoga>
Message-ID: <b0e037b9c6cb58d6ac9f47de9c5aabaf@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-12 21:33, Bjorn Andersson wrote:
> On Tue 22 Jun 11:00 CDT 2021, Prasad Malisetty wrote:
> 
>> pipe-clk mux needs to switch between pipe_clk
> 
> If you spell "pipe-clk mux" as "gcc_pcie_N_pipe_clk_src" there's no
> ambiguity in which clock you refer to.
> 
Sure, it looks fine, I will modify accordingly.

>> and XO as part of LPM squence. This is done by setting
>> pipe_clk mux as parent of pipe_clk after phy init.
> 
> I thought the two possible cases where:
> 
> xo -> gcc_pcie_N_pipe_clk_src -> gcc_pcie_N_pipe_clk
> PHY::pipe_clk -> gcc_pcie_N_pipe_clk_src -> gcc_pcie_N_pipe_clk
> 
> But here you're saying that you're setting the parent of PHY::pipe_clk
> to gcc_pcie_N_pipe_clk?
> 
Yeah, I will correct that statement.

>> This is a new requirement for sc7280.
>> For accessing to DBI registers during L23,
>> need to switch the pipe clock with free-running
>> clock (TCXO) using GCC’s registers
> 
> So in previous platforms we could access DBI registers, in L23, without
> any clock?
> 
> What happens if we use xo as parent for the pipe clock
> 
 From SC7280 onwards, POR value for "gcc_pcie_N_pipe_clk_src" is TCX0. we 
need TCXO as parent to enable gdsc and then once PHY init successful we 
are changing gcc_pcie_N_pipe_clk_src to PHY pipe clk. In system suspend 
call back GDSC will be disabled and gcc_pcie_N_pipe_clk_src changed to 
TCX0. In the same way resume call back switching back 
gcc_pcie_N_pipe_clk_src to PHY pipe clk .

>> 
>> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> ---
>>  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>> 
>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c 
>> b/drivers/pci/controller/dwc/pcie-qcom.c
>> index 8a7a300..80e9ee4 100644
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
> 
> So this is the first 2.7.0 that has this need? Are we just going to add
> more compatibles to this list going forward?
> 
Will check and confirm whether above change will be applicable to future 
targets or not.

>> +		res->pipe_clk_mux = devm_clk_get(dev, "pipe_mux");
>> +		if (IS_ERR(res->pipe_clk_mux))
>> +			return PTR_ERR(res->pipe_clk_mux);
> 
> So this is gcc_pcie_N_pipe_clk_src?
> 
Yes
>> +
>> +		res->pipe_ext_src = devm_clk_get(dev, "phy_pipe");
>> +		if (IS_ERR(res->pipe_ext_src))
>> +			return PTR_ERR(res->pipe_ext_src);
> 
> And this is the pipe_clk coming out of the PHY (What I call
> PHY::pipe_clk above)?
> 
Yes
>> +
>> +		res->ref_clk_src = devm_clk_get(dev, "ref");
>> +		if (IS_ERR(res->ref_clk_src))
>> +			return PTR_ERR(res->ref_clk_src);
> 
> And this is TCXO?
> 
Yes
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
>> +		clk_set_parent(res->pipe_clk_mux, res->pipe_ext_src);
>> 
> 
> So after phy_power_on() (not "phy init" as you say in the commit
> message, perhaps you don't mean phy_init() but in general terms "phy
> initialization") you need to make sure that gcc_pcie_N_pipe_clk_src is
> actually fed by PHY::pipe_clk?
> 
> 1) What's the gcc_pcie_N_pipe_clk_src parent before this?
> 
TCXO is POR value.

> 2) Will the PHY initialization really succeed if the pipe_clk feeding
> back from gcc isn't based on the PHY's pipe_clk? Is this a change in
> sc7280?
> 
PHY init will be successful but PCIe link will not be initialized.
yes, this change is only applicable to SC7280.

> 3) In the commit message you're talking about the need to make XO the
> parent of gcc_pcie_N_pipe_clk_src during L23, where in this patch does
> that happen?
> 
Changes are in validation stage. will submit them soon in coming 
releases.
Just mentioned the purpose of mux settings.

> Regards,
> Bjorn
> 
>>  	return clk_prepare_enable(res->pipe_clk);
>>  }
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
