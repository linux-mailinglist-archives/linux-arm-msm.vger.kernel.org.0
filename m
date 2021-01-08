Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2776C2EEE66
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 09:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbhAHIQD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 03:16:03 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:37335 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbhAHIQC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 03:16:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610093742; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=b6AodYinfxqgN5rmyfBtR5RJOs+mkE0k1+xFJsU25VQ=;
 b=GmSOFEqH7dBYBsZp8v6YPepwshWkPYiW+2rINizrr1+EImexg1pPnhTOq0Ao3WB2q4MVHWU0
 JaLaR9/632T1UI5laSE/YSnUf5DR/gJOj6SXBgl7zSY+d1ps34+Lqsh9nWGPDfn455B7h7vw
 xs0R7jgN5aBubSyoosoB5iR3yKM=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ff81491b95fc593262f9a20 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Jan 2021 08:15:13
 GMT
Sender: ziqichen=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65DF1C43467; Fri,  8 Jan 2021 08:15:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: ziqichen)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 80F07C433C6;
        Fri,  8 Jan 2021 08:15:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 08 Jan 2021 16:15:11 +0800
From:   ziqichen@codeaurora.org
To:     Can Guo <cang@codeaurora.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        vinholikatti@gmail.com, jejb@linux.vnet.ibm.com,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
        kernel-team@android.com, saravanak@google.com, salyzyn@google.com,
        kwmad.kim@samsung.com, stanley.chu@mediatek.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] scsi: ufs-qcom: Fix ufs RST_n specs violation
In-Reply-To: <d7e6a5ed6da3b18be7440e7590f6ef14@codeaurora.org>
References: <1610090885-50099-1-git-send-email-ziqichen@codeaurora.org>
 <1610090885-50099-3-git-send-email-ziqichen@codeaurora.org>
 <d7e6a5ed6da3b18be7440e7590f6ef14@codeaurora.org>
Message-ID: <7ba4d02c624ca973257a40e95e04ae69@codeaurora.org>
X-Sender: ziqichen@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-08 16:05, Can Guo wrote:
> On 2021-01-08 15:28, Ziqi Chen wrote:
>> As per specs, e.g, JESD220E chapter 7.2, while powering
>> off/on the ufs device, RST_n signal should be between
>> VSS(Ground) and VCCQ/VCCQ2.
>> 
>> Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
>> ---
>>  drivers/scsi/ufs/ufs-qcom.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
>> index 2206b1e..d8b896c 100644
>> --- a/drivers/scsi/ufs/ufs-qcom.c
>> +++ b/drivers/scsi/ufs/ufs-qcom.c
>> @@ -582,6 +582,10 @@ static int ufs_qcom_suspend(struct ufs_hba *hba,
>> enum ufs_pm_op pm_op)
>>  		ufs_qcom_disable_lane_clks(host);
>>  		phy_power_off(phy);
>> 
>> +		/* reset the connected UFS device during power down */
>> +		if (host->device_reset)
>> +			gpiod_set_value_cansleep(host->device_reset, 1);
>> +
> 
> Instead of calling gpiod_set_value(1/0) directly,
> can we have a wrapper func for it?
> 
> Thanks,
> Can Guo.

Sure, it'll be better that way.

Best Regards,
Ziqi

> 
>>  	} else if (!ufs_qcom_is_link_active(hba)) {
>>  		ufs_qcom_disable_lane_clks(host);
>>  	}
