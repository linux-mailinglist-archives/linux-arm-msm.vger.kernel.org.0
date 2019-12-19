Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1F4125BE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2019 08:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfLSHM3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 02:12:29 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:46706 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726155AbfLSHM3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 02:12:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576739548; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=p6F+HJf9pwTVCYkBLIDwl50rIboYlyyDoCq2S3Q3fjA=;
 b=HKuq9hGl1ty67HQS65483tahWgw9CSmJSvuxa4+O7YGoenkG86/IPDUb478b1Og/eWgNeJWE
 BXwmgpsdLUfAg0bOke/PJkXOrob8FriC4lBuiQb3fPtp9SDPwWa8wVMjXlpeo59sO8l1Vj4T
 lAjBQoSluy8dmuMsL8RzGrBGRxE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfb22da.7f8ab5a5d458-smtp-out-n01;
 Thu, 19 Dec 2019 07:12:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B099FC63C6C; Thu, 19 Dec 2019 07:12:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6AB2DC494BC;
        Thu, 19 Dec 2019 07:12:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 19 Dec 2019 15:12:25 +0800
From:   cang@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, Mark Salyzyn <salyzyn@google.com>,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/7] scsi: ufs-qcom: Add reset control support for host
 controller
In-Reply-To: <20191218041200.GP2536@vkoul-mobl>
References: <20191216190415.GL2536@vkoul-mobl>
 <CAOCk7NpAp+DHBp-owyKGgJFLRajfSQR6ff1XMmAj6A4nM3VnMQ@mail.gmail.com>
 <091562cbe7d88ca1c30638bc10197074@codeaurora.org>
 <20191217041342.GM2536@vkoul-mobl>
 <763d7b30593b31646f3c198c2be99671@codeaurora.org>
 <20191217092433.GN2536@vkoul-mobl>
 <fc8952a0eee5c010fe14e5f107d89e64@codeaurora.org>
 <20191217150852.GO2536@vkoul-mobl>
 <CAOCk7Np691Hau1FdJqWs1UY6jvEvYfzA6NnG9U--ZcRsuV5=Zw@mail.gmail.com>
 <75f7065d08f450c6cbb2b2662658ecaa@codeaurora.org>
 <20191218041200.GP2536@vkoul-mobl>
Message-ID: <983c21bb5ad2d38e11c074528d8898b9@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-18 12:12, Vinod Koul wrote:
> On 18-12-19, 02:44, cang@codeaurora.org wrote:
> 
>> Hi Vinod and Jeffrey,
>> 
>> Let me summary here, now the 1000000us timeout works for both 845 and 
>> 8998.
>> However, 8150 still fails.
>> 
>> > > The bigger question is why is the reset causing the timeout to be
>> > > increased for sdm845 and not to work in case of sm8150! (Vinod)
>> 
>> I would not say this patch increases the timeout. With this patch,
>> the PCS polling timeout, per my profiling, the PCS ready usually needs
>> less than 5000us, which is the actual time needed for PCS bit to be 
>> ready.
>> 
>> The reason why 1000us worked for you is because, w/o the patch, UFS 
>> PHY
>> registers are retained from pre-kernel stage (bootloader i.e.), the 
>> PCS
>> ready
>> bit was set to 1 in pre-kernel stage, so when kernel driver reads it, 
>> it
>> returns
>> 1, not even to be polled at all. It may seem "faster", but not the 
>> right
>> thing to do, because kernel stage may need different PHY settings than
>> pre-kernel stage, keeping the settings configured in pre-kernel stage 
>> is not
>> always right, so this patch is needed. And increasing 1000us to 
>> 1000000us
>> is the right thing to do, but not a hack.
>> 
>> As reg for the phy initialization timeout on 8150, I found there is
>> something
>> wrong with its settings in /drivers/phy/qualcomm/phy-qcom-qmp.c
>> 
>> static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
>> 	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
>> 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
>> 
>> "QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01)" should NOT appear in 
>> the
>> serdes
>> table! I haven't check who made this change, but please have a try 
>> after
>> remove
>> this line from sm8150_ufsphy_serdes_tbl.
> 
> That is me :) Looks like I made an error while porting from downstream. 
> I
> did a quick check to remove this and it doesn't work yet, let me 
> recheck
> the settings again ...
> 
> Thanks for your help!

Hi Vinod,

Indeed, you need to tweak your settings. I spent some time help you
figure this out. Try below change and please let me know if it can
resolve your problem.

I would not say this is a regression caused by my patch, it is just
my patch reveals something incorrect in the settings.

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c 
b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 8e642a6..0cc9044 100755
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -66,7 +66,7 @@
  /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
  #define CLAMP_EN                               BIT(0) /* enables i/o 
clamp_n */

-#define PHY_INIT_COMPLETE_TIMEOUT              1000
+#define PHY_INIT_COMPLETE_TIMEOUT              1000000
  #define POWER_DOWN_DELAY_US_MIN                        10
  #define POWER_DOWN_DELAY_US_MAX                        11

@@ -166,6 +166,7 @@ static const unsigned int 
sdm845_ufsphy_regs_layout[] = {
  };

  static const unsigned int sm8150_ufsphy_regs_layout[] = {
+       [QPHY_SW_RESET]                 = 0x08,
         [QPHY_START_CTRL]               = 0x00,
         [QPHY_PCS_READY_STATUS]         = 0x180,
  };
@@ -885,7 +886,6 @@ static const struct qmp_phy_init_tbl 
msm8998_usb3_pcs_tbl[] = {
  };

  static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
-       QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
         QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
         QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_SEL, 0x11),
         QMP_PHY_INIT_CFG(QSERDES_V4_COM_HSCLK_HS_SWITCH_SEL, 0x00),
@@ -1390,7 +1390,6 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg 
= {
         .pwrdn_ctrl             = SW_PWRDN,

         .is_dual_lane_phy       = true,
-       .no_pcs_sw_reset        = true,
  };

  static void qcom_qmp_phy_configure(void __iomem *base,
---

Aside of the phy settings, your DT needs some modifications too,
seems you copied most of them from sdm845.
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=3834a2e92229ef26d30de28acb698b2b23d3e397

<--snip-->
> +		ufs_mem_phy: phy@1d87000 {
> +			compatible = "qcom,sm8150-qmp-ufs-phy";
> +			reg = <0 0x01d87000 0 0x18c>;

The size 0x18c is wrong, in the code you are even accessing registers
whose offsets are beyond 0x18c, see

#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0	0x1ac
#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0	0x1b0
#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1	0x1b4
#define QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL		0x1bc
#define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1	0x1b8

FYI, the total size of serdes registers is 0x1c0.

<--snip-->
> +			ufs_mem_phy_lanes: lanes@1d87400 {
> +				reg = <0 0x01d87400 0 0x108>,
> +				      <0 0x01d87600 0 0x1e0>,
> +				      <0 0x01d87c00 0 0x1dc>,

Same as above, see

#define QPHY_V4_MULTI_LANE_CTRL1			0x1e0

FYI, the total size of PCS registers is 0x200

> +				      <0 0x01d87800 0 0x108>,
> +				      <0 0x01d87a00 0 0x1e0>;
> +				#phy-cells = <0>;
> +			};
<--snip-->
