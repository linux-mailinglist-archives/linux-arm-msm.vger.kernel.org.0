Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84230152656
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 07:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgBEGbs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 01:31:48 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:50167 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725906AbgBEGbs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 01:31:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580884307; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ViCP3t2YRGW6lTwQZQeQAgzT2huQLFAv95wozwScy2g=;
 b=GqROEBvf95zmPcORI96RNCSCbOr+oOY4fJJx5aFCJDtyYBG30ZpR6pxtF3lmUbSFm+Bnq/xD
 7hTmeBJdmYhku87mjhvYsKC9ZUYHnYw7EmjJZT2SVpt/Iv0frNgwmZnu2HlB+v92NEStOnDW
 UtPGiSjgrvPNAAHcNvMsCKIoUR8=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3a6153.7f282edce848-smtp-out-n03;
 Wed, 05 Feb 2020 06:31:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B30C3C447A3; Wed,  5 Feb 2020 06:31:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E25B5C43383;
        Wed,  5 Feb 2020 06:31:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 05 Feb 2020 14:31:45 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] scsi: ufs: Fix registers dump vops caused scheduling
 while atomic
In-Reply-To: <3e529862-7790-c506-abaa-9a6972f5d53c@acm.org>
References: <1580882795-29675-1-git-send-email-cang@codeaurora.org>
 <3e529862-7790-c506-abaa-9a6972f5d53c@acm.org>
Message-ID: <749a1db94df00278ec9f5c121cd937fe@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-05 14:21, Bart Van Assche wrote:
> On 2020-02-04 22:06, Can Guo wrote:
>> @@ -5617,7 +5622,7 @@ static irqreturn_t ufshcd_check_errors(struct
>> 
>>  					__func__, hba->saved_err,
>>  					hba->saved_uic_err);
>> 
>> -				ufshcd_print_host_regs(hba);
>> +				__ufshcd_print_host_regs(hba, true);
>>  				ufshcd_print_pwr_info(hba);
>>  				ufshcd_print_tmrs(hba,
>> 					hba->outstanding_tasks);
>>  				ufshcd_print_trs(hba,
>> 					hba->outstanding_reqs,
> 
> Hi Can,
> 
> Please fix this by splitting ufs_qcom_dump_dbg_regs() into two
> functions: one function that doesn't sleep and a second function that
> behaves identically to the current function. If the function names will
> make it clear which function sleeps and which function doesn't that 
> will
> result in code that is much easier to read than the above code. For the
> above code it is namely impossible to figure out what will happen
> without looking up the caller.
> 
> Thanks,
> 
> Bart.

Hi Bart,

Do you mean by splitting ufshcd_print_host_regs() into two functions?
One behaves identically same to the current function, another one called
ufshcd_print_host_regs_nosleep(). No?

Thanks,
Can Guo.
