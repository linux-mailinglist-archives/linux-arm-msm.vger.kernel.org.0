Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14573ACB8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 15:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbhFRNCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 09:02:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:22913 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230315AbhFRNCc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 09:02:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624021223; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=tD4U/RzNqFGWpjdS5wnIrcWZDQlWRWp1xuR2I5dn0+o=;
 b=Sq8cjU4qwP1Mr/QxLaKRe9PjnYeZzL+RF1DJkhYYWRl0LO6g2KbVVm40CwT0kqV5LvNV3Cbr
 eJLnIB51ICrXgV2KdxXT9+t2EkVyTiwI6zCDd4aDzF2MXMWdo0rVqMlQRfVLczTPbcDWPBO+
 anf8tM2jJZEkIopKv9S16Fx9Obs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60cc98d3e27c0cc77f72ae58 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 13:00:03
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2BF0C43217; Fri, 18 Jun 2021 13:00:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F3DDDC4338A;
        Fri, 18 Jun 2021 13:00:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Jun 2021 18:30:01 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        dianders@chromium.org, mka@chromium.org, sanm@codeaurora.org
Subject: Re: [PATCH v2 3/4] PCIe: qcom: Add support to control pipe clk mux
In-Reply-To: <CAE-0n50WxF_S7Zo4MhFqppjSELTFo7nOEtmCXJ4DoqvhF7kMQw@mail.gmail.com>
References: <1622904059-21244-1-git-send-email-pmaliset@codeaurora.org>
 <1622904059-21244-4-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n50WxF_S7Zo4MhFqppjSELTFo7nOEtmCXJ4DoqvhF7kMQw@mail.gmail.com>
Message-ID: <915d51888c2577cc3266370bfda603e8@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-06 02:56, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-06-05 07:40:58)
>> In PCIe driver pipe-clk mux needs to switch between pipe_clk
>> and XO for GDSC enable. This is done by setting pipe_clk mux
>> as parent of pipe_clk after phy init.
> 
> Just to confirm, we can't set this parent via assigned-clock-parents
> property in DT?
> 
>> 
This clock setting need be done after phy init.

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
>>         struct regulator_bulk_data supplies[2];
>>         struct reset_control *pci_reset;
>>         struct clk *pipe_clk;
>> +       struct clk *pipe_clk_mux;
>> +       struct clk *pipe_ext_src;
>> +       struct clk *ref_clk_src;
>>  };
>> 
>>  union qcom_pcie_resources {
>> @@ -1167,6 +1170,20 @@ static int qcom_pcie_get_resources_2_7_0(struct 
>> qcom_pcie *pcie)
>>         if (ret < 0)
>>                 return ret;
>> 
>> +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280")) 
>> {
>> +               res->pipe_clk_mux = devm_clk_get(dev, "pipe_src");
>> +               if (IS_ERR(res->pipe_clk_mux))
>> +                       return PTR_ERR(res->pipe_clk_mux);
>> +
>> +               res->pipe_ext_src = devm_clk_get(dev, "pipe_ext");
>> +               if (IS_ERR(res->pipe_ext_src))
>> +                       return PTR_ERR(res->pipe_ext_src);
>> +
>> +               res->ref_clk_src = devm_clk_get(dev, "ref");
> 
> Is this going to be used by any code?
> 
Yes, ref clock will be used in system suspend case. currently system 
suspend changes are in under validation.

>> +               if (IS_ERR(res->ref_clk_src))
>> +                       return PTR_ERR(res->ref_clk_src);
>> +       }
>> +
>>         res->pipe_clk = devm_clk_get(dev, "pipe");
>>         return PTR_ERR_OR_ZERO(res->pipe_clk);
>>  }
>> @@ -1255,6 +1272,11 @@ static void qcom_pcie_deinit_2_7_0(struct 
>> qcom_pcie *pcie)
>>  static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>>  {
>>         struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
>> +       struct dw_pcie *pci = pcie->pci;
>> +       struct device *dev = pci->dev;
>> +
>> +       if (of_device_is_compatible(dev->of_node, "qcom,pcie-sc7280"))
>> +               clk_set_parent(res->pipe_clk_mux, res->pipe_ext_src);
>> 
>>         return clk_prepare_enable(res->pipe_clk);
>>  }
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
