Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AECA129379
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 10:08:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfLWJHj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 04:07:39 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:53449 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725974AbfLWJHj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 04:07:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577092058; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ex26SKaNLsQ18TFYlaYIj/v9DXNlB5xE7qtKt1eqYoM=;
 b=Yk3EqcVYm73MHojp1bbWms2QczBKaqis2ZvB/nh5dlQv+eBZ2zILjZtF5EapQz+diINdEpQX
 Oj16xYZm6bxNKTwJ1HIQK4RzzYNqscBOkrOpJTQnSBZwo5wbc0yePqAxwCkPUkMv/CxNiDMS
 IiB5q31I12Kqu1PK2FaIJ2By7uA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0083d8.7f5ce4ff4928-smtp-out-n03;
 Mon, 23 Dec 2019 09:07:36 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B1B9AC4479C; Mon, 23 Dec 2019 09:07:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C44FC43383;
        Mon, 23 Dec 2019 09:07:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Dec 2019 17:07:35 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] phy: qcom-qmp: Use register defines
In-Reply-To: <341446449242684d4b5a0296d3331b0c@codeaurora.org>
References: <20191220101719.3024693-1-vkoul@kernel.org>
 <20191220101719.3024693-3-vkoul@kernel.org>
 <341446449242684d4b5a0296d3331b0c@codeaurora.org>
Message-ID: <2debc6106f6559681f3760ed7d2cdfba@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-23 16:43, Can Guo wrote:
> On 2019-12-20 18:17, Vinod Koul wrote:
>> We already define register offsets so use them in register layout.
>> 
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c
>> b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> index 66f91726b8b2..1196c85aa023 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
>> @@ -166,8 +166,8 @@ static const unsigned int 
>> sdm845_ufsphy_regs_layout[] = {
>>  };
>> 
>>  static const unsigned int sm8150_ufsphy_regs_layout[] = {
>> -	[QPHY_START_CTRL]		= 0x00,
>> -	[QPHY_PCS_READY_STATUS]		= 0x180,
>> +	[QPHY_START_CTRL]		= QPHY_V4_PHY_START,
>> +	[QPHY_PCS_READY_STATUS]		= QPHY_V4_PCS_READY_STATUS,
> 
> Missed QPHY_SW_RESET?
> 
> Regards,
> Can Guo.
> 

My bad, just saw you added it in another patch.

Can Guo.

>>  };
>> 
>>  static const struct qmp_phy_init_tbl msm8996_pcie_serdes_tbl[] = {
