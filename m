Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7283F3977
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 21:20:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbfKGUUs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 15:20:48 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:33404 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbfKGUUs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 15:20:48 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1D86A60D86; Thu,  7 Nov 2019 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573158047;
        bh=AF9VLY6watOJ3PKU051QSd4D4th+Q/5xWRFMYozEKGQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=hw4PuUTLHrpa+1Ethw6L99BRbUCuzrcMhWRHDMng0R1GPZCAgmpGwekganXfkcrqZ
         QPXbHJKvkVWk/F/lu2W3eD4CMBip36x3h2TrByxqwsNumGTy+1FMlcTAzY2GThPUkl
         ko1Lj/PQhMf+aYUHyL9ek1LkNwsZhsYAsZ7YXYag=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 9D3B060D86;
        Thu,  7 Nov 2019 20:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573158045;
        bh=AF9VLY6watOJ3PKU051QSd4D4th+Q/5xWRFMYozEKGQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=eSkfbIRVoQNojtHphJpnfLwF6B56iWgUKo+Hh7/zi2EM4mM6AKapBodxLv69NBjoY
         QZXB07SPW063wGz+KKTnHVs5uPrOfrttf+Nhc/ohDpqH+gCb0jmt1YS5cUnJF1NCVf
         RkqriY+rSR2YK3/oSFXW+1REg20Cl05sZsvAPwHs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 07 Nov 2019 12:20:44 -0800
From:   eberman@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     saiprakash.ranjan@codeaurora.org, agross@kernel.org,
        tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/17] firmware: qcom_scm-64: Improve SMC convention
 detection
In-Reply-To: <20191107191846.GA3907604@builder>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
 <1572917256-24205-10-git-send-email-eberman@codeaurora.org>
 <20191107191846.GA3907604@builder>
Message-ID: <1eb1c0db6f2d9e65479205ddad92bac7@codeaurora.org>
X-Sender: eberman@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-11-07 11:18, Bjorn Andersson wrote:
>> +		(qcom_smc_convention == SMC_CONVENTION_ARM_64) ?
>> +			ARM_SMCCC_SMC_64 :
>> +			ARM_SMCCC_SMC_32,
> 
> Here SMC_CONVENTION_UNKNOWN would mean ARM_SMCCC_SMC_32...

Idea is that __qcom_scm_call_smccc would only be called if 
qcom_smc_convention
is SMC_CONVENTION_ARM_64 or _32. It should not be possible to get into
__qcom_scm_call_smccc with the current convention being 
SMC_CONVENTION_UNKNOWN.

> 
>>  		desc->owner,
>>  		SMCCC_FUNCNUM(desc->svc, desc->cmd));
>>  	smc.a[1] = desc->arginfo;
>> @@ -117,7 +125,7 @@ static int ___qcom_scm_call_smccc(struct device 
>> *dev,
>>  		if (!args_virt)
>>  			return -ENOMEM;
>> 
>> -		if (qcom_smccc_convention == ARM_SMCCC_SMC_32) {
>> +		if (qcom_smc_convention == SMC_CONVENTION_ARM_32) {
> 
> ...but here it would mean ARM_SMCCC_SMC_64.

I will clean up to be consistent what the "else" case is.


>> @@ -583,19 +591,17 @@ int __qcom_scm_qsmmu500_wait_safe_toggle(struct 
>> device *dev, bool en)
>> 
>>  void __qcom_scm_init(void)
>>  {
>> -	u64 cmd;
>> -	struct arm_smccc_res res;
>> -	u32 function = SMCCC_FUNCNUM(QCOM_SCM_SVC_INFO, 
>> QCOM_SCM_INFO_IS_CALL_AVAIL);
>> -
>> -	/* First try a SMC64 call */
>> -	cmd = ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64,
>> -				 ARM_SMCCC_OWNER_SIP, function);
>> -
>> -	arm_smccc_smc(cmd, QCOM_SCM_ARGS(1), cmd & 
>> (~BIT(ARM_SMCCC_TYPE_SHIFT)),
>> -		      0, 0, 0, 0, 0, &res);
>> -
>> -	if (!res.a0 && res.a1)
>> -		qcom_smccc_convention = ARM_SMCCC_SMC_64;
>> -	else
>> -		qcom_smccc_convention = ARM_SMCCC_SMC_32;
>> +	qcom_smc_convention = SMC_CONVENTION_ARM_64;
>> +	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
>> +			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
>> +		goto out;
>> +
>> +	qcom_smc_convention = SMC_CONVENTION_ARM_32;
>> +	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
>> +			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
>> +		goto out;
>> +
>> +	qcom_smc_convention = SMC_CONVENTION_UNKNOWN;
> 
> If above two tests can be considered reliable I would suggest that you
> fail hard here instead.

Is the suggestion here to BUG out?

Thanks,

Elliot


--
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
