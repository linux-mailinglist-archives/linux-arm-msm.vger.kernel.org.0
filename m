Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C94B30B177
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 21:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbhBAUM2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 15:12:28 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:15414 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230091AbhBAUMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 15:12:24 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612210331; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SyKql35XL39OzKg3Eo5Q5wM868sEliuIeyDdqJDRIl0=; b=Nx0ZAaPkzz8IEGqO6HERuoj0GH4Im0Kwv7P3nxW+tnePCTIDCshfFMSWd+B6IeeLhheY6Asl
 MeLYkh8sBuGOfVmpaPhylX+1V7BT4ajlURI0iyRJd1y9d9HRi6K9+izg55U/uTePcdLvcrZE
 9xxU54+eXMdaQcLHVZxHQyZuNyw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6018606dab96aecb9f46b719 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Feb 2021 20:11:25
 GMT
Sender: asutoshd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 00C76C43463; Mon,  1 Feb 2021 20:11:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: asutoshd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 084F6C433C6;
        Mon,  1 Feb 2021 20:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 084F6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [RFC PATCH v2 0/2] Fix deadlock in ufs
To:     cang@codeaurora.org, martin.petersen@oracle.com,
        stern@rowland.harvard.edu, Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org
References: <cover.1611719814.git.asutoshd@codeaurora.org>
From:   "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <84a182cc-de9c-4d6d-2193-3a44e4c88c8b@codeaurora.org>
Date:   Mon, 1 Feb 2021 12:11:23 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <cover.1611719814.git.asutoshd@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/27/2021 7:26 PM, Asutosh Das wrote:
> v1 -> v2
> Use pm_runtime_get/put APIs.
> Assuming that all bsg devices are scsi devices may break.
> 
> This patchset attempts to fix a deadlock in ufs.
> This deadlock occurs because the ufs host driver tries to resume
> its child (wlun scsi device) to send SSU to it during its suspend.
> 
> Asutosh Das (2):
>    block: bsg: resume scsi device before accessing
>    scsi: ufs: Fix deadlock while suspending ufs host
> 
>   block/bsg.c               |  8 ++++++++
>   drivers/scsi/ufs/ufshcd.c | 18 ++----------------
>   2 files changed, 10 insertions(+), 16 deletions(-)
> 

Hi Alan/Bart

Please can you take a look at this series.
Please let me know if you've any better suggestions for this.


Thanks
-asd


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project
