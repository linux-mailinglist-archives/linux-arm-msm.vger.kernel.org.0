Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 610E319DC36
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 18:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728377AbgDCQ4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Apr 2020 12:56:52 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:29935 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391008AbgDCQ4u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Apr 2020 12:56:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585933009; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9GAbZWuPcTKjEXz3EeVxBNWDn+mYvVxInvRy5MFxrck=; b=exY1mdH5usVAVNjV1pjSINXxmhIkZn2PrpNoO3Ia8XC1gVI+avMdfPCnAwA24rSTCeENORyb
 OUsJD1rxvm1r7l3Jzvq/NZyJX1gi/pw/CaC6E77oVTNKjeK1L5iQBtUd+BHRPEytYd8FDacd
 OF++izEHc3I5NeilEzoxtPDPVmk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e876ac7.7fc470598378-smtp-out-n01;
 Fri, 03 Apr 2020 16:56:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 658F5C44791; Fri,  3 Apr 2020 16:56:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.122.98] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 171CCC433D2;
        Fri,  3 Apr 2020 16:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 171CCC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v5 2/5] phy: qcom-snps: Add SNPS USB PHY driver for QCOM
 based SOCs
To:     Vinod Koul <vkoul@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1585880634-15222-1-git-send-email-wcheng@codeaurora.org>
 <1585880634-15222-3-git-send-email-wcheng@codeaurora.org>
 <20200403060127.GM72691@vkoul-mobl>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <91262538-6b1e-afd3-97f8-614bb4a54b5a@codeaurora.org>
Date:   Fri, 3 Apr 2020 09:56:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200403060127.GM72691@vkoul-mobl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vinod,

Thanks for the review, I'll address these in the next version.

On 4/2/2020 11:01 PM, Vinod Koul wrote:
> On 02-04-20, 19:23, Wesley Cheng wrote:
>> This adds the SNPS FemtoPHY V2 driver used in QCOM SOCs.  There
>> are potentially multiple instances of this UTMI PHY on the
>> SOC, all which can utilize this driver.  The V2 driver will
>> have a different register map compared to V1.
> 
> Some nitpicks below, otherwise:
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 
>> +/**
>> + * struct qcom_snps_hsphy - structure holding snps hs phy attributes
>> + *
>> + * @phy: generic phy
>> + * @base: iomapped memory space for qubs2 phy
>> + *
>> + * @cfg_ahb_clk: AHB2PHY interface clock
>> + * @ref_clk: phy reference clock
>> + * @iface_clk: phy interface clock
>> + * @phy_reset: phy reset control
>> + * @vregs: regulator supplies bulk data
>> +
> 
> This is missing the marker * for kernel doc
> 
>> + * @phy_initialized: if PHY has been initialized correctly
>> + *
> 
> This empty line is redundant
> 
>> + */
>> +struct qcom_snps_hsphy {
>> +	struct phy *phy;
>> +	void __iomem *base;
>> +
>> +	struct clk *cfg_ahb_clk;
>> +	struct clk *ref_clk;
>> +	struct reset_control *phy_reset;
>> +	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
>> +
>> +	bool phy_initialized;
>> +};
>> +
>> +static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>> +				    u32 mask, u32 val)
> 
> coding style mandates that second line should start at preceeding line
> opening brace :), so can you please make it:
> 
> static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>                                               u32 mask, u32 val)
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
