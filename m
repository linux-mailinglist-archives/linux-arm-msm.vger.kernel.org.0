Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D5831E2841
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 19:17:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbgEZRRh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 13:17:37 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:30770 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726930AbgEZRRh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 13:17:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590513455; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=cZseVKyM7byZX8GzsmhKM3pgrExfy9wX8Sb9mIb2EQY=; b=loIAzEfO9cozgzxerdz3wUru02ii/DQrk7wgf30/A6hT3DIqnfKEybIzw9ccmhhiSOYHfC6+
 bT9fq3Ve7pF3tPApngzHMvOfHH2OmRARxT2hNqV1UbkkX+bkyCgXR1mOJc8RWMdFz6No+0/S
 O3gL5Hd+7L8mgSdi045HnP9qX28=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ecd4f1f809d9049674c22cb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 May 2020 17:17:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 16EFEC433AF; Tue, 26 May 2020 17:17:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.8.176] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 13AAAC433CA;
        Tue, 26 May 2020 17:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 13AAAC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v2 1/3] scsi: ufshcd: Update the set frequency to devfreq
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, c_vkoul@quicinc.com,
        hongwus@codeaurora.org
Cc:     Avri Altman <Avri.Altman@wdc.com>, Can Guo <cang@codeaurora.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, MSM <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>,
        Tomas Winkler <tomas.winkler@intel.com>,
        open list <linux-kernel@vger.kernel.org>
References: <cover.1585160616.git.asutoshd@codeaurora.org>
 <d0c6c22455811e9f0eda01f9bc70d1398b51b2bd.1585160616.git.asutoshd@codeaurora.org>
 <CAOCk7NrrBoO2k1M7XX0W6L2+efBbo-s6WVaKZx4EtSqNpCaUyA@mail.gmail.com>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <f52a59df-5697-9e82-d12d-292ee9653f45@codeaurora.org>
Date:   Tue, 26 May 2020 10:17:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CAOCk7NrrBoO2k1M7XX0W6L2+efBbo-s6WVaKZx4EtSqNpCaUyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey
On 5/25/2020 3:19 PM, Jeffrey Hugo wrote:
> On Wed, Mar 25, 2020 at 12:29 PM Asutosh Das <asutoshd@codeaurora.org> wrote:
>>
>> Currently, the frequency that devfreq provides the
>> driver to set always leads the clocks to be scaled up.
>> Hence, round the clock-rate to the nearest frequency
>> before deciding to scale.
>>
>> Also update the devfreq statistics of current frequency.
>>
>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> 
> This change appears to cause issues for the Lenovo Miix 630, as
> identified by git bisect.
> 

Thanks for reporting this.

> On 5.6-final, My boot log looks normal.  On 5.7-rc7, the Lenovo Miix
> 630 rarely boots, usually stuck in some kind of infinite printk loop.
> 
> If I disable some of the UFS logging, I can capture this from the
> logs, as soon as UFS inits -
> 
> [    4.353860] ufshcd-qcom 1da4000.ufshc: ufshcd_intr: Unhandled
> interrupt 0x00000000
> [    4.359605] ufshcd-qcom 1da4000.ufshc: ufshcd_intr: Unhandled
> interrupt 0x00000000
> [    4.365412] ufshcd-qcom 1da4000.ufshc: ufshcd_check_errors:
> saved_err 0x4 saved_uic_err 0x2
> [    4.371121] ufshcd-qcom 1da4000.ufshc: hba->ufs_version = 0x210,
> hba->capabilities = 0x1587001f
> [    4.376846] ufshcd-qcom 1da4000.ufshc: hba->outstanding_reqs =
> 0x100000, hba->outstanding_tasks = 0x0
> [    4.382636] ufshcd-qcom 1da4000.ufshc: last_hibern8_exit_tstamp at
> 0 us, hibern8_exit_cnt = 0
> [    4.388368] ufshcd-qcom 1da4000.ufshc: No record of pa_err
> [    4.394001] ufshcd-qcom 1da4000.ufshc: dl_err[0] = 0x80000001 at 3873626 us
> [    4.399577] ufshcd-qcom 1da4000.ufshc: No record of nl_err
> [    4.405053] ufshcd-qcom 1da4000.ufshc: No record of tl_err
> [    4.410464] ufshcd-qcom 1da4000.ufshc: No record of dme_err
> [    4.415747] ufshcd-qcom 1da4000.ufshc: No record of auto_hibern8_err
> [    4.420950] ufshcd-qcom 1da4000.ufshc: No record of fatal_err
> [    4.426013] ufshcd-qcom 1da4000.ufshc: No record of link_startup_fail
> [    4.430950] ufshcd-qcom 1da4000.ufshc: No record of resume_fail
> [    4.435786] ufshcd-qcom 1da4000.ufshc: No record of suspend_fail
> [    4.440538] ufshcd-qcom 1da4000.ufshc: dev_reset[0] = 0x0 at 3031009 us
> [    4.445199] ufshcd-qcom 1da4000.ufshc: No record of host_reset
> [    4.449750] ufshcd-qcom 1da4000.ufshc: No record of task_abort
> [    4.454214] ufshcd-qcom 1da4000.ufshc: clk: core_clk, rate: 50000000
> [    4.458590] ufshcd-qcom 1da4000.ufshc: clk: core_clk_unipro, rate: 37500000
> 
> I don't understand how this change is breaking things, but it clearly is for me.
> 
> What kind of additional data would be useful to get to the bottom of this?
> 

++

Let me take a look and get back on this.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
