Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B35B412728E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 01:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbfLTAt5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 19:49:57 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:45446 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726986AbfLTAt5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 19:49:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576802996; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jUpr23tiVEby6XBvi3JbQitdR58sTc5kIsZaB83jplw=;
 b=qqh2eo+R3YtClsyyyDRkGbSj2ONOKlnKZQC+cOFbqTBGHce6A3aBY21DCULp0mPVvEi+v/sM
 k6pPJYmT+I38aoPuFWiuvoGzFU0cRA5JanZvw0ZCECyk4hhnEAMy26oxsyDKpsjey7LNEiwk
 hauxtd66G3wqD5/4/QoqgCUFG10=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfc1ab3.7efbe2d7c768-smtp-out-n01;
 Fri, 20 Dec 2019 00:49:55 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 377D1C4479D; Fri, 20 Dec 2019 00:49:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 83C20C433A2;
        Fri, 20 Dec 2019 00:49:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 20 Dec 2019 08:49:53 +0800
From:   cang@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] phy: qcom-qmp: Add optional SW reset
In-Reply-To: <ff83ac1f0ec6bca1379e8b873fd30aa2@codeaurora.org>
References: <20191219150433.2785427-1-vkoul@kernel.org>
 <20191219150433.2785427-4-vkoul@kernel.org>
 <ff83ac1f0ec6bca1379e8b873fd30aa2@codeaurora.org>
Message-ID: <9ef99dcac59dbdc59c7e5eb1a8724ea2@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-20 08:22, cang@codeaurora.org wrote:
> On 2019-12-19 23:04, Vinod Koul wrote:
>> For V4 QMP UFS Phy, we need to assert reset bits, configure the phy 
>> and
>> then deassert it, so add optional has_sw_reset flag and use that to
>> configure the QPHY_SW_RESET register.
>> 
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c
>> b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> index 06f971ca518e..80304b7cd895 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> @@ -1023,6 +1023,9 @@ struct qmp_phy_cfg {
>> 
>>  	/* true, if PCS block has no separate SW_RESET register */
>>  	bool no_pcs_sw_reset;
>> +
>> +	/* true if sw reset needs to be invoked */
>> +	bool has_sw_reset;
>>  };
>> 
>>  /**
>> @@ -1391,6 +1394,7 @@ static const struct qmp_phy_cfg 
>> sm8150_ufsphy_cfg = {
>> 
>>  	.is_dual_lane_phy	= true,
>>  	.no_pcs_sw_reset	= true,
>> +	.has_sw_reset		= true,
>>  };
>> 
>>  static void qcom_qmp_phy_configure(void __iomem *base,
>> @@ -1475,6 +1479,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy 
>> *qphy)
>>  			     SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
>>  	}
>> 
>> +	if (cfg->has_sw_reset)
>> +		qphy_setbits(serdes, cfg->regs[QPHY_SW_RESET], SW_RESET);
>> +
> 
> Are you sure you want to set this in the serdes register? QPHY_SW_RESET
> is in its pcs register.
> 
>>  	if (cfg->has_phy_com_ctrl)
>>  		qphy_setbits(serdes, cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
>>  			     SW_PWRDN);
>> @@ -1651,6 +1658,9 @@ static int qcom_qmp_phy_enable(struct phy *phy)
>>  	if (cfg->has_phy_dp_com_ctrl)
>>  		qphy_clrbits(dp_com, QPHY_V3_DP_COM_SW_RESET, SW_RESET);
>> 
>> +	if (cfg->has_sw_reset)
>> +		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>> +
> 
> Yet you are clearing it from pcs register.
> 
> Regards,
> Can Guo
> 
>>  	/* start SerDes and Phy-Coding-Sublayer */
>>  	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], cfg->start_ctrl);

I thought your change would be like this

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c 
b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 8e642a6..a4ab4b7 100755
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -166,6 +166,7 @@ static const unsigned int 
sdm845_ufsphy_regs_layout[] = {
  };

  static const unsigned int sm8150_ufsphy_regs_layout[] = {
+       [QPHY_SW_RESET]                 = 0x08,
         [QPHY_START_CTRL]               = 0x00,
         [QPHY_PCS_READY_STATUS]         = 0x180,
  };
@@ -1390,7 +1391,6 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg 
= {
         .pwrdn_ctrl             = SW_PWRDN,

         .is_dual_lane_phy       = true,
-       .no_pcs_sw_reset        = true,
  };

  static void qcom_qmp_phy_configure(void __iomem *base,
@@ -1475,6 +1475,9 @@ static int qcom_qmp_phy_com_init(struct qmp_phy 
*qphy)
                              SW_USB3PHY_RESET_MUX | SW_USB3PHY_RESET);
         }

+       if ((cfg->type == PHY_TYPE_UFS) && (!cfg->no_pcs_sw_reset))
+               qphy_setbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+
         if (cfg->has_phy_com_ctrl)
                 qphy_setbits(serdes, 
cfg->regs[QPHY_COM_POWER_DOWN_CONTROL],
                              SW_PWRDN);

Regards,
Can Guo.
