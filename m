Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C822FEA17
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Nov 2019 02:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727159AbfKPB3F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 20:29:05 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:58408 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbfKPB3F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 20:29:05 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 709AB61014; Sat, 16 Nov 2019 01:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573867744;
        bh=7Ghgp3FOix//yzH3IQgrTmcv8JL6sZTeQJ7oATrwpvU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dw6DGzhG3Wb1d03CkLnoS7chUsZPVtYhRxwKCPQ4ost0t+QDuFT+XnhHbUOLa2JEb
         VgUgkpBeRgVrgU54XkcHOnJOsplO92GsWtIXQ09Vo8u+ji07XfzcUVSWkPPAOJLspm
         WPFICw8fVMDDxhv2o0Fg5cXLT1P1R/DPPem1s1yA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 8DBB0601B4;
        Sat, 16 Nov 2019 01:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573867743;
        bh=7Ghgp3FOix//yzH3IQgrTmcv8JL6sZTeQJ7oATrwpvU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=F0OjOM0AciNxc1yKBcFe4faNu5BLpveWi+FXmbVo+07PL5ZNBTUf05ysEE4MMpAPe
         47zeL/p1tz8eaZD/T825H7AI6mwHPT5hgZ4KaFh+T8xDx2NJqe3pEAF0VzhUlS1i6C
         70ggb9LA9vJz9OCIVzjIyci8fnhtmhZUPKIY+UqA=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 15 Nov 2019 17:29:03 -0800
From:   eberman@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/18] firmware: qcom_scm-64: Improve SMC convention
 detection
In-Reply-To: <5dcf4109.1c69fb81.ef683.dbd7@mx.google.com>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
 <1573593774-12539-11-git-send-email-eberman@codeaurora.org>
 <5dcf4109.1c69fb81.ef683.dbd7@mx.google.com>
Message-ID: <9b17a38238447780199a7902d8ca0943@codeaurora.org>
X-Sender: eberman@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-15 16:21, Stephen Boyd wrote:
> Quoting Elliot Berman (2019-11-12 13:22:46)
>> diff --git a/drivers/firmware/qcom_scm-64.c 
>> b/drivers/firmware/qcom_scm-64.c
>> index 977654bb..b82b450 100644
>> --- a/drivers/firmware/qcom_scm-64.c
>> +++ b/drivers/firmware/qcom_scm-64.c
>> @@ -302,21 +302,20 @@ int __qcom_scm_hdcp_req(struct device *dev, 
>> struct qcom_scm_hdcp_req *req,
>> 
>>  void __qcom_scm_init(void)
>>  {
>> -       u64 cmd;
>> -       struct arm_smccc_res res;
>> -       u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, 
>> QCOM_SCM_INFO_IS_CALL_AVAIL);
>> -
>> -       /* First try a SMC64 call */
>> -       cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, 
>> ARM_SMCCC_SMC_64,
>> -                                ARM_SMCCC_OWNER_SIP, function);
>> -
>> -       arm_smccc_smc(cmd, QCOM_SCM_ARGS(1), cmd & 
>> (~BIT(ARM_SMCCC_TYPE_SHIFT)),
>> -                     0, 0, 0, 0, 0, &res);
>> -
>> -       if (!res.a0 && res.a1)
>> -               qcom_smccc_convention = ARM_SMCCC_SMC_64;
>> -       else
>> -               qcom_smccc_convention = ARM_SMCCC_SMC_32;
>> +       qcom_smccc_convention = ARM_SMCCC_SMC_64;
>> +       if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
>> +                       QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
> 
> Is this asking if the "is call available function" is available by 
> using
> the is call available function? That is recursive. Isn't that why we
> make a manually open coded SMC call to see if it works? If this isn't
> going to work we may want to just have a property in DT that tells us
> what to do.

Yes. The reason the open coded SMC call was made was because a fast call
works better here. __qcom_scm_is_call_available uses standard call, and
I'll address this in v3.

>> +       BUG();
> 
> This BUG() is new and not mentioned in the commit text. Why can't we
> just start failing all scm calls if we can't detect the calling
> convention?

Bjorn has requested that the BUG was introduced in v1:
https://lore.kernel.org/patchwork/patch/1148619/#1350062


>> +out:
>> +       pr_debug("QCOM SCM SMC Convention: %llu\n", 
>> qcom_smccc_convention);
> 
> Maybe pr_info() is more appropriate. PSCI currently prints out the
> version info so maybe printing something like "QCOM SCM SMC_64 calling
> convention" will be useful for early debugging.

Sure, will do.

Thanks,

Elliot

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
