Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3449E19CD4F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2020 01:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387919AbgDBXG1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 19:06:27 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:58246 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388621AbgDBXG0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 19:06:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585868786; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=joEfBFYVnCUn1rHziGrcFQaULpvVa2IqWI3HP0gQeC0=; b=jVvdUX5OR2uEQh2FYcA1POmQ6p60cW5X9GTvp4HeXmI1E/gOGeUSdhGMI8vLa2U/KZTZO7Oz
 IeHDJWQsqyUkq+akeLjTkMzvOBV4FVmJsc5hup70cBBni8+NxAL6itAiK888Y4v4BfQ5Bys0
 w8ORIK3+rmuVRct7WiDykY1SegA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e866ff0.7f06974ecea0-smtp-out-n02;
 Thu, 02 Apr 2020 23:06:24 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D7368C4478C; Thu,  2 Apr 2020 23:06:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.0
Received: from [10.110.122.98] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF71EC433D2;
        Thu,  2 Apr 2020 23:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF71EC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v4 3/4] phy: qcom-qmp: Add SM8150 QMP USB3 PHY support
To:     Manu Gautam <mgautam@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, kishon@ti.com, robh+dt@kernel.org,
        mark.rutland@arm.com, p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jack Pham <jackp@codeaurora.org>
References: <1585597017-30683-1-git-send-email-wcheng@codeaurora.org>
 <1585597017-30683-4-git-send-email-wcheng@codeaurora.org>
 <6295c8d8-9763-be1d-9227-e61369000536@codeaurora.org>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <b0382fcc-d580-79a8-65d8-85afbd2047f0@codeaurora.org>
Date:   Thu, 2 Apr 2020 16:06:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6295c8d8-9763-be1d-9227-e61369000536@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manu,

On 4/2/2020 12:00 AM, Manu Gautam wrote:
> 
> On 3/31/2020 1:06 AM, Wesley Cheng wrote:
>> From: Jack Pham <jackp@codeaurora.org>
>>
>> Add support for SM8150 QMP USB3 PHY with the necessary
>> initialization sequences as well as additional QMP V4
>> register definitions.
>>
>> Signed-off-by: Jack Pham <jackp@codeaurora.org>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp.c | 153 ++++++++++++++++++++++++++++
>>  drivers/phy/qualcomm/phy-qcom-qmp.h | 198 +++++++++++++++++++++++++++++++++++-
>>  2 files changed, 349 insertions(+), 2 deletions(-)
> 
> [snip]
> 
>>  
>> -/* Only for QMP V4 PHY - PCS registers */
>> +/* Only for QMP V4 PHY - UFS PCS registers */
>>  #define QPHY_V4_PHY_START				0x000
>>  #define QPHY_V4_POWER_DOWN_CONTROL			0x004
>>  #define QPHY_V4_SW_RESET				0x008
>> @@ -409,4 +446,161 @@
>>  #define QPHY_V4_TX_MID_TERM_CTRL1			0x1d8
>>  #define QPHY_V4_MULTI_LANE_CTRL1			0x1e0
>>  
>> +/* Only for QMP V4 PHY - USB/PCIe PCS registers */
>> +#define QPHY_V4_PCS_SW_RESET				0x000
> 
> It is a mess not given that UFS wrapper uses different PCS register layout:
> E.g. UFS uses - QPHY_V4_SW_RESET 0x008
> 
> Would it help to add UFS prefix for UFS specific registers to avoid confusion and typos.
> E.g. rename QPHY_V4_SW_RESET to QPHY_V4_UFS_PCS_SW_RESET ?
> 

I think we can follow your suggestion.  The UFS PHY has a significantly
different set of PCS registers versus USB/PCIe, so it will be good to
differentiate them.  I will add a patch to rename the defines and add it
to the patch series.

>> +#define QPHY_V4_PCS_REVISION_ID0			0x004
>> +#define QPHY_V4_PCS_REVISION_ID1			0x008
>> +#define QPHY_V4_PCS_REVISION_ID2			0x00c
>> +#define QPHY_V4_PCS_REVISION_ID3			0x010
>> +#define QPHY_V4_PCS_PCS_STATUS1				0x014
>> +#define QPHY_V4_PCS_PCS_STATUS2				0x018
>> +#define QPHY_V4_PCS_PCS_STATUS3				0x01c
>> +#define QPHY_V4_PCS_PCS_STATUS4				0x020
>> +#define QPHY_V4_PCS_PCS_STATUS5				0x024
>> +#define QPHY_V4_PCS_PCS_STATUS6				0x028
>> +#define QPHY_V4_PCS_PCS_STATUS7				0x02c
>> +#define QPHY_V4_PCS_DEBUG_BUS_0_STATUS			0x030
>> +#define QPHY_V4_PCS_DEBUG_BUS_1_STATUS			0x034
>> +#define QPHY_V4_PCS_DEBUG_BUS_2_STATUS			0x038
>> +#define QPHY_V4_PCS_DEBUG_BUS_3_STATUS			0x03c
>> +#define QPHY_V4_PCS_POWER_DOWN_CONTROL			0x040
>> +#define QPHY_V4_PCS_START_CONTROL			0x044
>> +#define QPHY_V4_PCS_INSIG_SW_CTRL1			0x048
>> +#define QPHY_V4_PCS_INSIG_SW_CTRL2			0x04c
>> +#define QPHY_V4_PCS_INSIG_SW_CTRL3			0x050
>> +#define QPHY_V4_PCS_INSIG_SW_CTRL4			0x054
>> +#define QPHY_V4_PCS_INSIG_SW_CTRL5			0x058
>> +#define QPHY_V4_PCS_INSIG_SW_CTRL6			0x05c
>> +#define QPHY_V4_PCS_INSIG_SW_CTRL7			0x060
>> +#define QPHY_V4_PCS_INSIG_SW_CTRL8			0x064
>> +#define QPHY_V4_PCS_INSIG_MX_CTRL1			0x068
>> +#define QPHY_V4_PCS_INSIG_MX_CTRL2			0x06c
>> +#define QPHY_V4_PCS_INSIG_MX_CTRL3			0x070
>> +#define QPHY_V4_PCS_INSIG_MX_CTRL4			0x074
>> +#define QPHY_V4_PCS_INSIG_MX_CTRL5			0x078
>> +#define QPHY_V4_PCS_INSIG_MX_CTRL7			0x07c
>> +#define QPHY_V4_PCS_INSIG_MX_CTRL8			0x080
>> +#define QPHY_V4_PCS_OUTSIG_SW_CTRL1			0x084
>> +#define QPHY_V4_PCS_OUTSIG_MX_CTRL1			0x088
>> +#define QPHY_V4_PCS_CLAMP_ENABLE			0x08c
>> +#define QPHY_V4_PCS_POWER_STATE_CONFIG1			0x090
>> +#define QPHY_V4_PCS_POWER_STATE_CONFIG2			0x094
>> +#define QPHY_V4_PCS_FLL_CNTRL1				0x098
>> +#define QPHY_V4_PCS_FLL_CNTRL2				0x09c
>> +#define QPHY_V4_PCS_FLL_CNT_VAL_L			0x0a0
>> +#define QPHY_V4_PCS_FLL_CNT_VAL_H_TOL			0x0a4
>> +#define QPHY_V4_PCS_FLL_MAN_CODE			0x0a8
>> +#define QPHY_V4_PCS_TEST_CONTROL1			0x0ac
>> +#define QPHY_V4_PCS_TEST_CONTROL2			0x0b0
>> +#define QPHY_V4_PCS_TEST_CONTROL3			0x0b4
>> +#define QPHY_V4_PCS_TEST_CONTROL4			0x0b8
>> +#define QPHY_V4_PCS_TEST_CONTROL5			0x0bc
>> +#define QPHY_V4_PCS_TEST_CONTROL6			0x0c0
>> +#define QPHY_V4_PCS_LOCK_DETECT_CONFIG1			0x0c4
>> +#define QPHY_V4_PCS_LOCK_DETECT_CONFIG2			0x0c8
>> +#define QPHY_V4_PCS_LOCK_DETECT_CONFIG3			0x0cc
>> +#define QPHY_V4_PCS_LOCK_DETECT_CONFIG4			0x0d0
>> +#define QPHY_V4_PCS_LOCK_DETECT_CONFIG5			0x0d4
>> +#define QPHY_V4_PCS_LOCK_DETECT_CONFIG6			0x0d8
>> +#define QPHY_V4_PCS_REFGEN_REQ_CONFIG1			0x0dc
>> +#define QPHY_V4_PCS_REFGEN_REQ_CONFIG2			0x0e0
>> +#define QPHY_V4_PCS_REFGEN_REQ_CONFIG3			0x0e4
>> +#define QPHY_V4_PCS_BIST_CTRL				0x0e8
>> +#define QPHY_V4_PCS_PRBS_POLY0				0x0ec
>> +#define QPHY_V4_PCS_PRBS_POLY1				0x0f0
>> +#define QPHY_V4_PCS_FIXED_PAT0				0x0f4
>> +#define QPHY_V4_PCS_FIXED_PAT1				0x0f8
>> +#define QPHY_V4_PCS_FIXED_PAT2				0x0fc
>> +#define QPHY_V4_PCS_FIXED_PAT3				0x100
>> +#define QPHY_V4_PCS_FIXED_PAT4				0x104
>> +#define QPHY_V4_PCS_FIXED_PAT5				0x108
>> +#define QPHY_V4_PCS_FIXED_PAT6				0x10c
>> +#define QPHY_V4_PCS_FIXED_PAT7				0x110
>> +#define QPHY_V4_PCS_FIXED_PAT8				0x114
>> +#define QPHY_V4_PCS_FIXED_PAT9				0x118
>> +#define QPHY_V4_PCS_FIXED_PAT10				0x11c
>> +#define QPHY_V4_PCS_FIXED_PAT11				0x120
>> +#define QPHY_V4_PCS_FIXED_PAT12				0x124
>> +#define QPHY_V4_PCS_FIXED_PAT13				0x128
>> +#define QPHY_V4_PCS_FIXED_PAT14				0x12c
>> +#define QPHY_V4_PCS_FIXED_PAT15				0x130
>> +#define QPHY_V4_PCS_TXMGN_CONFIG			0x134
>> +#define QPHY_V4_PCS_G12S1_TXMGN_V0			0x138
>> +#define QPHY_V4_PCS_G12S1_TXMGN_V1			0x13c
>> +#define QPHY_V4_PCS_G12S1_TXMGN_V2			0x140
>> +#define QPHY_V4_PCS_G12S1_TXMGN_V3			0x144
>> +#define QPHY_V4_PCS_G12S1_TXMGN_V4			0x148
>> +#define QPHY_V4_PCS_G12S1_TXMGN_V0_RS			0x14c
>> +#define QPHY_V4_PCS_G12S1_TXMGN_V1_RS			0x150
>> +#define QPHY_V4_PCS_G12S1_TXMGN_V2_RS			0x154
>> +#define QPHY_V4_PCS_G12S1_TXMGN_V3_RS			0x158
>> +#define QPHY_V4_PCS_G12S1_TXMGN_V4_RS			0x15c
>> +#define QPHY_V4_PCS_G3S2_TXMGN_MAIN			0x160
>> +#define QPHY_V4_PCS_G3S2_TXMGN_MAIN_RS			0x164
>> +#define QPHY_V4_PCS_G12S1_TXDEEMPH_M6DB			0x168
>> +#define QPHY_V4_PCS_G12S1_TXDEEMPH_M3P5DB		0x16c
>> +#define QPHY_V4_PCS_G3S2_PRE_GAIN			0x170
>> +#define QPHY_V4_PCS_G3S2_POST_GAIN			0x174
>> +#define QPHY_V4_PCS_G3S2_PRE_POST_OFFSET		0x178
>> +#define QPHY_V4_PCS_G3S2_PRE_GAIN_RS			0x17c
>> +#define QPHY_V4_PCS_G3S2_POST_GAIN_RS			0x180
>> +#define QPHY_V4_PCS_G3S2_PRE_POST_OFFSET_RS		0x184
>> +#define QPHY_V4_PCS_RX_SIGDET_LVL			0x188
>> +#define QPHY_V4_PCS_RX_SIGDET_DTCT_CNTRL		0x18c
>> +#define QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_L		0x190
>> +#define QPHY_V4_PCS_RCVR_DTCT_DLY_P1U2_H		0x194
>> +#define QPHY_V4_PCS_RATE_SLEW_CNTRL1			0x198
>> +#define QPHY_V4_PCS_RATE_SLEW_CNTRL2			0x19c
>> +#define QPHY_V4_PCS_PWRUP_RESET_DLY_TIME_AUXCLK		0x1a0
>> +#define QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_L	0x1a4
>> +#define QPHY_V4_PCS_P2U3_WAKEUP_DLY_TIME_AUXCLK_H	0x1a8
>> +#define QPHY_V4_PCS_TSYNC_RSYNC_TIME			0x1ac
>> +#define QPHY_V4_PCS_CDR_RESET_TIME			0x1b0
>> +#define QPHY_V4_PCS_TSYNC_DLY_TIME			0x1b4
>> +#define QPHY_V4_PCS_ELECIDLE_DLY_SEL			0x1b8
>> +#define QPHY_V4_PCS_CMN_ACK_OUT_SEL			0x1bc
>> +#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG1		0x1c0
>> +#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG2		0x1c4
>> +#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG3		0x1c8
>> +#define QPHY_V4_PCS_ALIGN_DETECT_CONFIG4		0x1cc
>> +#define QPHY_V4_PCS_PCS_TX_RX_CONFIG			0x1d0
>> +#define QPHY_V4_PCS_RX_IDLE_DTCT_CNTRL			0x1d4
>> +#define QPHY_V4_PCS_RX_DCC_CAL_CONFIG			0x1d8
>> +#define QPHY_V4_PCS_EQ_CONFIG1				0x1dc
>> +#define QPHY_V4_PCS_EQ_CONFIG2				0x1e0
>> +#define QPHY_V4_PCS_EQ_CONFIG3				0x1e4
>> +#define QPHY_V4_PCS_EQ_CONFIG4				0x1e8
>> +#define QPHY_V4_PCS_EQ_CONFIG5				0x1ec
>> +#define QPHY_V4_PCS_USB3_POWER_STATE_CONFIG1		0x300
>> +#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_STATUS		0x304
>> +#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL		0x308
>> +#define QPHY_V4_PCS_USB3_AUTONOMOUS_MODE_CTRL2		0x30c
>> +#define QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_SOURCE_STATUS	0x310
>> +#define QPHY_V4_PCS_USB3_LFPS_RXTERM_IRQ_CLEAR		0x314
>> +#define QPHY_V4_PCS_USB3_LFPS_DET_HIGH_COUNT_VAL	0x318
>> +#define QPHY_V4_PCS_USB3_LFPS_TX_ECSTART		0x31c
>> +#define QPHY_V4_PCS_USB3_LFPS_PER_TIMER_VAL		0x320
>> +#define QPHY_V4_PCS_USB3_LFPS_TX_END_CNT_U3_START	0x324
>> +#define QPHY_V4_PCS_USB3_RXEQTRAINING_LOCK_TIME		0x328
>> +#define QPHY_V4_PCS_USB3_RXEQTRAINING_WAIT_TIME		0x32c
>> +#define QPHY_V4_PCS_USB3_RXEQTRAINING_CTLE_TIME		0x330
>> +#define QPHY_V4_PCS_USB3_RXEQTRAINING_WAIT_TIME_S2	0x334
>> +#define QPHY_V4_PCS_USB3_RXEQTRAINING_DFE_TIME_S2	0x338
>> +#define QPHY_V4_PCS_USB3_RCVR_DTCT_DLY_U3_L		0x33c
>> +#define QPHY_V4_PCS_USB3_RCVR_DTCT_DLY_U3_H		0x340
>> +#define QPHY_V4_PCS_USB3_ARCVR_DTCT_EN_PERIOD		0x344
>> +#define QPHY_V4_PCS_USB3_ARCVR_DTCT_CM_DLY		0x348
>> +#define QPHY_V4_PCS_USB3_TXONESZEROS_RUN_LENGTH		0x34c
>> +#define QPHY_V4_PCS_USB3_ALFPS_DEGLITCH_VAL		0x350
>> +#define QPHY_V4_PCS_USB3_SIGDET_STARTUP_TIMER_VAL	0x354
>> +#define QPHY_V4_PCS_USB3_TEST_CONTROL			0x358
>> +
>> +/* Only for QMP V4 PHY - PCS_MISC registers */
>> +#define QPHY_V4_PCS_MISC_TYPEC_CTRL			0x00
>> +#define QPHY_V4_PCS_MISC_TYPEC_PWRDN_CTRL		0x04
>> +#define QPHY_V4_PCS_MISC_PCS_MISC_CONFIG1		0x08
>> +#define QPHY_V4_PCS_MISC_CLAMP_ENABLE			0x0c
>> +#define QPHY_V4_PCS_MISC_TYPEC_STATUS			0x10
>> +#define QPHY_V4_PCS_MISC_PLACEHOLDER_STATUS		0x14
>> +
>>  #endif
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
