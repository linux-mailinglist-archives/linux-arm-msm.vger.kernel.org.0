Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837CD26E049
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 18:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgIQQId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 12:08:33 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47608 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728272AbgIQQAt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 12:00:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600358392; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=y735607kPNDTg2hRsQjE5o6xwIGQfMI+rB6mYx0+q4w=;
 b=bsxv2fAvHgOit2VroKOI1lKweKSDRpWUc5B2DgtzuCJiRpMGOw7xJCuebujtfwB1E8tWYvsr
 zyiqsetk0ni08544cXTKBjcMr/4Cj6le9H1K5HFF4eWp5DnOL5wdUm3sk4V5ZXLzIH3F97ub
 Obg9vUwTy07k/KWhMv46o66YjIk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f6387f64398385e30e7c504 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 15:59:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AB9D2C433CA; Thu, 17 Sep 2020 15:59:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DAC9CC433C8;
        Thu, 17 Sep 2020 15:59:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 17 Sep 2020 21:29:48 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, ohad@wizery.com,
        evgreen@chromium.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom_q6v5: Assign mpss region to Q6 before
 MBA boot
In-Reply-To: <160027666863.4188128.6191735162530147774@swboyd.mtv.corp.google.com>
References: <20200916145252.16024-1-sibis@codeaurora.org>
 <160027666863.4188128.6191735162530147774@swboyd.mtv.corp.google.com>
Message-ID: <474e42a6acb527b4d2bb1004d65ad139@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stephen,
Thanks for taking time to review the
series.

On 2020-09-16 22:47, Stephen Boyd wrote:
> Quoting Sibi Sankar (2020-09-16 07:52:52)
>> On secure devices which support warm reset, the MBA firmware requires
>> access to the modem region to clear them out. Hence provide Q6 access
>> to this region before MBA boot. This will be a nop during a modem SSR.
>> 
> 
> Does it need a Fixes: tag? Probably.

it doesn't really fix anything previously
committed. When SC7180 support was added,
mss driver still lacked secure boot support
and when Bjorn added secure boot support,
none of the secure devices necessarily
supported warm reset. So I'll skip adding
fixes tag.

> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>> 
> 
> Trivia time!
> 
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index c401bcc263fa..f989ca81d374 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -931,6 +931,16 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>>                 goto assert_reset;
>>         }
>> 
>> +       /* Some versions of the MBA firmware will upon boot wipe the 
>> MPSS region as well, so provide
> 
> Should have /* on a line by itself.
> 
>> +        * the Q6 access to this region.
>> +        */
>> +       ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, 
>> true,
>> +                                     qproc->mpss_phys, 
>> qproc->mpss_size);
>> +       if (ret) {
>> +               dev_err(qproc->dev, "assigning Q6 access to mpss 
>> memory failed: %d\n", ret);
>> +               goto disable_active_clks;
>> +       }
>> +
>>         /* Assign MBA image access in DDR to q6 */
>>         ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, 
>> true,
>>                                       qproc->mba_phys, 
>> qproc->mba_size);
>> @@ -1137,8 +1147,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
>> 
>>         /**
> 
> Should be /* instead of /**, the latter is for kernel-doc which this is
> not.

sure I'll get ^^ done in the next
re-spin.

> 
>>          * In case of a modem subsystem restart on secure devices, the 
>> modem
>> -        * memory can be reclaimed only after MBA is loaded. For modem 
>> cold
>> -        * boot this will be a nop
>> +        * memory can be reclaimed only after MBA is loaded.
>>          */
>>         q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, true, false,
>>                                 qproc->mpss_phys, qproc->mpss_size);

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
