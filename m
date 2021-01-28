Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72952307C27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 18:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233049AbhA1RVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 12:21:43 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:60273 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233077AbhA1RUf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 12:20:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611854428; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=iuUm89es8XIusxem92uXKqqXeVmqQV52HZ/plYn3jHM=; b=MMSrQxv1WKrDqG2WmJkJaygpejyjSrtOcEESUuz2MO+dburDMqcvyyV6H/PPuhUs0JJxQsDu
 hppzf5IDD+VbZCTEFYyKz4+DQR9D+3fxqDoBU1nCZIH8IJ/lYGZxDw828ICXBqWos5fAXN/s
 X1eiIyqYIHrC5o0MnD0LkZZGa9Q=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6012f22cfb02735e8c15bc06 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Jan 2021 17:19:40
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA2E0C43462; Thu, 28 Jan 2021 17:19:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from stor-presley.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 100F3C43463;
        Thu, 28 Jan 2021 17:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 100F3C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Date:   Thu, 28 Jan 2021 09:19:34 -0800
From:   Asutosh Das <asutoshd@codeaurora.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     "cang@codeaurora.org" <cang@codeaurora.org>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Subject: Re: [RFC PATCH v2 0/2] Fix deadlock in ufs
Message-ID: <20210128171934.GA12764@stor-presley.qualcomm.com>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <DM6PR04MB657580F21E8474678D27D88FFCBA9@DM6PR04MB6575.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <DM6PR04MB657580F21E8474678D27D88FFCBA9@DM6PR04MB6575.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 28 2021 at 01:36 -0800, Avri Altman wrote:
>Hi,
>Asking again:
>Following your 1/2 patch, shouldn't this series revert commit 74e5e468b664d as well?
>
>Thanks,
>Avri
>

Yes I think its reasonable to do that. I'll modify and send the v3 series.

>
>> v1 -> v2
>> Use pm_runtime_get/put APIs.
>> Assuming that all bsg devices are scsi devices may break.
>>
>> This patchset attempts to fix a deadlock in ufs.
>> This deadlock occurs because the ufs host driver tries to resume
>> its child (wlun scsi device) to send SSU to it during its suspend.
>>
>> Asutosh Das (2):
>>   block: bsg: resume scsi device before accessing
>>   scsi: ufs: Fix deadlock while suspending ufs host
>>
>>  block/bsg.c               |  8 ++++++++
>>  drivers/scsi/ufs/ufshcd.c | 18 ++----------------
>>  2 files changed, 10 insertions(+), 16 deletions(-)
>>
>> --
>> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux
>> Foundation Collaborative Project.
>
