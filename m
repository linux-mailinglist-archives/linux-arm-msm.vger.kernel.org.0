Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2293EE6AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 08:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238301AbhHQGk7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 02:40:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37043 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237997AbhHQGky (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 02:40:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629182422; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=AeeA73ZpKawSWZg+PkAg6dDlWEGmMSg3bssyiF/542M=;
 b=KYKWp0UUu73u4dkl4Zst6C+VuFtWHEVHgxb4MXPwBkS8wUtyNK7xygWRXyQYaz9F34jRBxgM
 UhILUNvTR29/yKiIiqyu/eHdfcsLQn9Ur/SJ/SLVVuORR6yR4i9B3JT/dJExuMW3ibhHS/Ue
 V+Vm0reZQjEKvkP/Kbavq8IAhoY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 611b59c6105c6568db2f584f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Aug 2021 06:40:06
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 627AAC4360C; Tue, 17 Aug 2021 06:40:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A5AAC4338F;
        Tue, 17 Aug 2021 06:40:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Aug 2021 12:10:05 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v5 4/4] PCI: qcom: Switch pcie_1_pipe_clk_src after PHY
 init in SC7280
In-Reply-To: <CAE-0n50nYEAhpBADVWutm-SvUMpe+4Qte69iucJvXax=d_59=w@mail.gmail.com>
References: <1628568516-24155-1-git-send-email-pmaliset@codeaurora.org>
 <1628568516-24155-5-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n50nYEAhpBADVWutm-SvUMpe+4Qte69iucJvXax=d_59=w@mail.gmail.com>
Message-ID: <c742065c0469633fe4ea3a74dc42c2f9@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-11 01:07, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-08-09 21:08:36)
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
>> @@ -1167,6 +1169,16 @@ static int qcom_pcie_get_resources_2_7_0(struct 
>> qcom_pcie *pcie)
>>         if (ret < 0)
>>                 return ret;
>> 
>> +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) 
>> {
>> +               res->gcc_pcie_1_pipe_clk_src = devm_clk_get(dev, 
>> "pipe_mux");
>> +               if (IS_ERR(res->gcc_pcie_1_pipe_clk_src))
>> +                       return PTR_ERR(res->gcc_pcie_1_pipe_clk_src);
>> +
>> +               res->phy_pipe_clk = devm_clk_get(dev, "phy_pipe");
>> +               if (IS_ERR(res->phy_pipe_clk))
>> +                       return PTR_ERR(res->phy_pipe_clk);
>> +       }
>> +
>>         res->pipe_clk = devm_clk_get(dev, "pipe");
>>         return PTR_ERR_OR_ZERO(res->pipe_clk);
>>  }
>> @@ -1255,6 +1267,12 @@ static void qcom_pcie_deinit_2_7_0(struct 
>> qcom_pcie *pcie)
>>  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>>  {
>>         struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
>> +       struct dw_pcie *pci = pcie->pci;
>> +       struct device *dev = pci->dev;
>> +       struct device_node *node = dev->of_node;
>> +
>> +       if (of_property_read_bool(node, "pipe-clk-source-switch"))
> 
> This can be straightline code. If gcc_pcie_1_pipe_clk_src is NULL,
> calling clk_set_parent() on it is a nop, return 0, so drop the property
> check and only assign the clk pointer if it needs to be done.
> 
>> +               clk_set_parent(res->gcc_pcie_1_pipe_clk_src, 
>> res->phy_pipe_clk);
> 
> Please check the return value and fail if it fails to set the parent.
> I'd also prefer a comment indicating that we have to set the parent
> because the GDSC must be enabled with the clk at XO speed. The DT 
> should
> probably also have an assigned clock parent of XO so when the driver
> probes it is set to XO parent for gdsc enable and then this driver code
> can change the parent to the phy pipe clk.
> 
>> 
>>         return clk_prepare_enable(res->pipe_clk);
>>  }

Hi Stephen,

Thanks for your review and inputs.

Yes, clk_set_parent function returning NULL if src pointer is NULL. we 
can call clk_set_parent function without any check.

I will validate and incorporate the changes in next version.

Thanks
-Prasad
