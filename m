Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40DEF129373
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 10:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726032AbfLWJDH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 04:03:07 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:21759 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726028AbfLWJDH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 04:03:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577091786; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Bm/9NWmrJfIW6bpIJ0JZdnYU7Rre2hwxn3Yk3TswvDc=; b=TBZotRWE4j05gp8lcxAIjld2kcLfL4G3CBUwGFZe4t4POYauaGIbKipxfBrAEahWOEf3jmAb
 4G4k6a9sk8TIgCcFJMPgCQJpJXjI0H4UqaSYxmc38rjM980ZHClfHuRGZof0g3QsD+PYUyYB
 vErI1p63kYN1J7XAYbiT6wEZ+Z4=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0082c8.7f6247b65ca8-smtp-out-n03;
 Mon, 23 Dec 2019 09:03:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CAD2FC4479F; Mon, 23 Dec 2019 09:03:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.214] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C3A1C433CB;
        Mon, 23 Dec 2019 09:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C3A1C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH 3/4] phy: qcom-qmp: Add optional SW reset
To:     cang@codeaurora.org, Vinod Koul <vkoul@kernel.org>
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20191219150433.2785427-1-vkoul@kernel.org>
 <20191219150433.2785427-4-vkoul@kernel.org>
 <ff83ac1f0ec6bca1379e8b873fd30aa2@codeaurora.org>
 <9ef99dcac59dbdc59c7e5eb1a8724ea2@codeaurora.org>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <9535bad2-4870-ce6b-fe51-2a24a6e922c7@codeaurora.org>
Date:   Mon, 23 Dec 2019 14:32:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9ef99dcac59dbdc59c7e5eb1a8724ea2@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/20/2019 6:19 AM, cang@codeaurora.org wrote:
> On 2019-12-20 08:22, cang@codeaurora.org wrote:
>> On 2019-12-19 23:04, Vinod Koul wrote:
>>> For V4 QMP UFS Phy, we need to assert reset bits, configure the phy and
>>> then deassert it, so add optional has_sw_reset flag and use that to
>>> configure the QPHY_SW_RESET register.
>>>
>>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>>> ---
>>>  drivers/phy/qualcomm/phy-qcom-qmp.c | 10 ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c
>>> b/drivers/phy/qualcomm/phy-qcom-qmp.c
>>> index 06f971ca518e..80304b7cd895 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
>>> @@ -1023,6 +1023,9 @@ struct qmp_phy_cfg {
>>>
>>>      /* true, if PCS block has no separate SW_RESET register */
>>>      bool no_pcs_sw_reset;
>>> +
>>> +    /* true if sw reset needs to be invoked */
>>> +    bool has_sw_reset;
>>>  };
>>>
>>>  /**
>>> @@ -1391,6 +1394,7 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
>>>
>>>      .is_dual_lane_phy    = true,
>>>      .no_pcs_sw_reset    = true,
>>> +    .has_sw_reset        = true,
>>>  };
>>>
>>>  static void qcom_qmp_phy_configure(void __iomem *base,
>>> @@ -1475,6 +1479,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>>>                   SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
>>>      }
>>>
>>> +    if (cfg->has_sw_reset)
>>> +        qphy_setbits(serdes, cfg->regs[QPHY_SW_RESET], SW_RESET);
>>> +
>>
>> Are you sure you want to set this in the serdes register? QPHY_SW_RESET
>> is in its pcs register.
>>
>>>      if (cfg->has_phy_com_ctrl)
>>>          qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>>>                   SW_PWRDN);
>>> @@ -1651,6 +1658,9 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>>>      if (cfg->has_phy_dp_com_ctrl)
>>>          qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
>>>
>>> +    if (cfg->has_sw_reset)
>>> +        qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>>> +
>>
>> Yet you are clearing it from pcs register.
>>
>> Regards,
>> Can Guo
>>
>>>      /* start SerDes and Phy-Coding-Sublayer */
>>>      qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);
>
> I thought your change would be like this
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 8e642a6..a4ab4b7 100755
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -166,6 +166,7 @@ static const unsigned int sdm845_ufsphy_regs_layout[] = {
>  };
>
>  static const unsigned int sm8150_ufsphy_regs_layout[] = {
> +       [QPHY_SW_RESET]                 = 0x08,
>         [QPHY_START_CTRL]               = 0x00,
>         [QPHY_PCS_READY_STATUS]         = 0x180,
>  };
> @@ -1390,7 +1391,6 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
>         .pwrdn_ctrl             = SW_PWRDN,
>
>         .is_dual_lane_phy       = true,
> -       .no_pcs_sw_reset        = true,


This makes sense to me.

>  };
>
>  static void qcom_qmp_phy_configure(void __iomem *base,
> @@ -1475,6 +1475,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>                              SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
>         }
>
> +       if ((cfg->type == PHY_TYPE_UFS) && (!cfg->no_pcs_sw_reset))
> +               qphy_setbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
> +


This change is not needed as POR value of SW_RESET bit is '1' which will be
set as part of GCC or clk_reset.
We just need to clear this bit which code already takes care of.


>         if (cfg->has_phy_com_ctrl)
>                 qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>                              SW_PWRDN);
>
> Regards,
> Can Guo.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
