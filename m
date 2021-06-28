Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5893B59D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 09:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbhF1Hho (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 03:37:44 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:55751 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229998AbhF1Hho (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 03:37:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624865719; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3eH7JntQIX6WDPF7n8CZ1FE82+sUKpSzL10RD2rH4lE=;
 b=PRldYFsxKjHKmxUgsT5Bd0P2ppNyn7vjKUk3aXYsIj7qL5sKuSqpv7nfdc2r+HjhIHKAHEaK
 HfEiFmH864KnGIXwOoBxSzksFs5+Bd+Vyfffw8W1fnPc0KdDngOJ9XRqFvpmRleMjmk0MQ8m
 gqzPUl1VBZvegd4C0GOP+6/Awfs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60d97bb1d2559fe392700f4a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Jun 2021 07:35:13
 GMT
Sender: cang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 692A8C43217; Mon, 28 Jun 2021 07:35:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9871AC433F1;
        Mon, 28 Jun 2021 07:35:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 28 Jun 2021 15:35:12 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, ziqichen@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Bean Huo <beanhuo@micron.com>,
        Jaegeuk Kim <jaegeuk@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        Satya Tangirala <satyat@google.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 01/10] scsi: ufs: Rename flags pm_op_in_progress and
 is_sys_suspended
In-Reply-To: <b7562bc820fc712196104a5eae30e2e4@codeaurora.org>
References: <1624433711-9339-1-git-send-email-cang@codeaurora.org>
 <1624433711-9339-2-git-send-email-cang@codeaurora.org>
 <cb39c5d7-c21d-66b1-0a86-f9154f73a94e@acm.org>
 <b7562bc820fc712196104a5eae30e2e4@codeaurora.org>
Message-ID: <ba8c618cfce28a7a12d1a1a8ce3dc44c@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-28 15:01, Can Guo wrote:
> On 2021-06-25 07:42, Bart Van Assche wrote:
>> On 6/23/21 12:35 AM, Can Guo wrote:
>>> Rename pm_op_in_progress and is_sys_suspended to 
>>> wlu_pm_op_in_progress and
>>> is_wlu_sys_suspended accordingly.
>> 
>> Can the is_wlu_sys_suspended member variable be removed by checking
>> dev->power.is_suspended where dev represents the WLUN?
>> 
> 
> No, PM set dev->power.is_suspended to "false" even the device failed 
> resuming,
> while is_wlu_sys_suspended can be used to tell that.

FYI,

892 /**
893  * device_resume - Execute "resume" callbacks for given device.
894  * @dev: Device to handle.
895  * @state: PM transition of the system being carried out.
896  * @async: If true, the device is being resumed asynchronously.
897  */
898 static int device_resume(struct device *dev, pm_message_t state, 
bool async)
...
967  End:
968 	error = dpm_run_callback(callback, dev, state, info);
969 	dev->power.is_suspended = false;
...

Can Guo.

> 
> Thanks,
> 
> Can Guo.
> 
>> Thanks,
>> 
>> Bart.
