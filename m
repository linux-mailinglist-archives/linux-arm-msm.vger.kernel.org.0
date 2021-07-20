Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2113CF8D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 13:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237643AbhGTKsW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 06:48:22 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:55598 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236743AbhGTKsN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 06:48:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626780531; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4qeavdXtXyl2WU+HnaSqzbijV0jvPvZSQil59/8Hj3g=;
 b=tgsto8FW2D90WVNlBCGr56oK+9kJ96ZhFcPYXQUUNjx+bYHTlQq6RgnTTSTtFu0/EIUuyv8z
 jzbHlyl96GXSRNQmbEPukeHfreLeRvby2FZ4kyWtKDzEvhytOmzNujhacwU9IH+zVtpWdDWU
 OrnRi+mKOYJFA7bTNsKWSiC1Tsk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60f6b36ac923fb7e09eb73ff (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 11:28:42
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ABF49C4323A; Tue, 20 Jul 2021 11:28:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7117EC433D3;
        Tue, 20 Jul 2021 11:28:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 20 Jul 2021 16:58:39 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Bjorn Helgaas <helgaas@kernel.org>, agross@kernel.org,
        bhelgaas@google.com, robh+dt@kernel.org, swboyd@chromium.org,
        lorenzo.pieralisi@arm.com, svarbanov@mm-sol.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org
Subject: Re: [PATCH v4 4/4] PCIe: qcom: Add support to control pipe clk src
In-Reply-To: <YPHuWudai/FO6SMN@yoga>
References: <1626443927-32028-5-git-send-email-pmaliset@codeaurora.org>
 <20210716150646.GA2098485@bjorn-Precision-5520> <YPHuWudai/FO6SMN@yoga>
Message-ID: <f5defd3c9f710d3b52d51657467367ac@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-17 02:08, Bjorn Andersson wrote:
> On Fri 16 Jul 10:06 CDT 2021, Bjorn Helgaas wrote:
> 
>> Run this:
>> 
>>   $ git log --oneline drivers/pci/controller/dwc/pcie-qcom.c
>> 
>> and make your subject match the style and structure (in particular,
>> s/PCIe/PCI/).  In this case, maybe something like this?
>> 
>>   PCI: qcom: Switch sc7280 gcc_pcie_1_pipe_clk_src after PHY init
>> 
>> On Fri, Jul 16, 2021 at 07:28:47PM +0530, Prasad Malisetty wrote:
>> > This is a new requirement for sc7280 SoC.
>> > To enable gdsc gcc_pcie_1_pipe_clk_src should be TCXO.
>> > after PHY initialization gcc_pcie_1_pipe_clk_src needs
>> > to switch from TCXO to gcc_pcie_1_pipe_clk.
>> 
>> This says what *needs* to happen, but it doesn't actually say what
>> this patch *does*.  I think it's something like:
>> 
>>   On the sc7280 SoC, the clock source for pcie_1_pipe must be the TCXO
>>   while gdsc is enabled.  But after the PHY is initialized, the clock
>>   source must be switched to gcc_pcie_1_pipe_clk.
>> 
>>   On sc7280, switch gcc_pcie_1_pipe_clk_src from TCXO to
>>   gcc_pcie_1_pipe_clk after the PHY has been initialized.
>> 
>> Nits: Rewrap to fill 75 columns or so.  Add blank lines between
>> paragraphs.  Start sentences with capital letter.
>> 
Agree, looks good. will add more details and update the commit message 
in next version.

>> > Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> > ---
>> >  drivers/pci/controller/dwc/pcie-qcom.c | 22 ++++++++++++++++++++++
>> >  1 file changed, 22 insertions(+)
>> >
>> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>> > index 8a7a300..9e0e4ab 100644
>> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
>> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> > @@ -166,6 +166,9 @@ struct qcom_pcie_resources_2_7_0 {
>> >  	struct regulator_bulk_data supplies[2];
>> >  	struct reset_control *pci_reset;
>> >  	struct clk *pipe_clk;
>> > +	struct clk *gcc_pcie_1_pipe_clk_src;
>> > +	struct clk *phy_pipe_clk;
>> > +	struct clk *ref_clk_src;
>> >  };
>> >
>> >  union qcom_pcie_resources {
>> > @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct qcom_pcie *pcie)
>> >  	if (ret < 0)
>> >  		return ret;
>> >
>> > +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) {
>> > +		res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, "pipe_mux");
>> > +		if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
>> > +			return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
>> > +
>> > +		res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
>> > +		if (IS_ERR(res->phy_pipe_clk))
>> > +			return PTR_ERR(res->phy_pipe_clk);
>> > +
>> > +		res->ref_clk_src = devm_clk_get(dev, "ref");
>> > +		if (IS_ERR(res->ref_clk_src))
>> > +			return PTR_ERR(res->ref_clk_src);
>> 
>> Not clear why ref_clk_src is here, since it's not used anywhere.  If
>> it's not necessary here, drop it and add it in a future patch that
>> uses it.
>> 
Its more useful in suspend /resume patch set. as of now we will move to 
suspend/resume patch set.
>> > +	}
>> > +
>> >  	res->pipe_clk = devm_clk_get(dev, "pipe");
>> >  	return PTR_ERR_OR_ZERO(res->pipe_clk);
>> >  }
>> > @@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
>> >  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>> >  {
>> >  	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
>> > +	struct dw_pcie *pci = pcie->pci;
>> > +	struct device *dev = pci->dev;
>> > +
>> > +	if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))
>> 
>> Using of_device_is_compatible() follows existing style in the driver,
>> which is good.  But I'm not sure that's good style in general because
>> it's a little repetitious and wasteful.
>> 
> 
> Following the style is good, but up until the recent sm8250 addition it
> was just a hack to deal with legacy platforms that we don't know the
> exact details about.
> 
> But, all platforms I know of has the pipe_clk from the PHY fed into the
> pipe_clk_src mux in the gcc block and then ends up in the PCIe
> controller. As such, I suspect that the pipe_clk handling should be 
> moved
> to the common code path of the driver and there's definitely no harm in
> making sure that the pipe_clk_src mux is explicitly configured on
> existing platforms (at least all 2.7.0 based ones).
> 
>> qcom_pcie_probe() already calls of_device_get_match_data(), which does
>> basically the same thing as of_device_is_compatible(), so I think we
>> could take better advantage of that by augmenting struct qcom_pcie_ops
>> with these device-specific details.
>> 
> 
> I agree.
> 
> Regards,
> Bjorn
> 
>> Some drivers that use this strategy:
>> 
>>   drivers/pci/controller/cadence/pci-j721e.c
>>   drivers/pci/controller/dwc/pci-imx6.c
>>   drivers/pci/controller/dwc/pci-layerscape.c
>>   drivers/pci/controller/dwc/pci-layerscape-ep.c
>>   drivers/pci/controller/dwc/pcie-tegra194.c
>>   drivers/pci/controller/pci-ftpci100.c
>>   drivers/pci/controller/pcie-brcmstb.c
>>   drivers/pci/controller/pcie-mediatek.c
>> 
>> > +		clk_set_parent(res->gcc_pcie_1_pipe_clk_src, res->phy_pipe_clk);
>> >
>> >  	return clk_prepare_enable(res->pipe_clk);
>> >  }

Sure, we will make use of struct qcom_pcie_ops and add a new callback to 
configure pipe clk src.
In coming platforms, if the platform doesn't need to configure pipe clk 
src, it will return as callback not defined.

We will incorporate the changes in next release.

>> > --
>> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> > a Linux Foundation Collaborative Project
>> >
