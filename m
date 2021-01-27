Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17ED30563D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 09:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbhA0I5H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 03:57:07 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:42676 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233242AbhA0Iyy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 03:54:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611737663; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=EUssQP2vZo9f1NeJLiuievSQB3Q8g6yl/yOnTsJJnrY=;
 b=oQTnx3Cwl82f5vFXL+b+FUrZJ31PtSrwZiTpivoWxsgr6URr/XaT/qgA4e8WkUWwCz30+Nee
 4ao/cAm6hozmLvjvV2ABx5rrouWUXM8uFTRYw7ovJ0zTIPA1Pl/V6Nh6wBxugJI13Q3J8Iwv
 k0eymC628r3DergbnbERivLlGlw=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60112a21a8db642432e346aa (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Jan 2021 08:53:53
 GMT
Sender: cang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31DF8C43462; Wed, 27 Jan 2021 08:53:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9273BC433CA;
        Wed, 27 Jan 2021 08:53:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 27 Jan 2021 16:53:52 +0800
From:   Can Guo <cang@codeaurora.org>
To:     Avri Altman <Avri.Altman@wdc.com>
Cc:     Asutosh Das <asutoshd@codeaurora.org>, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stern@rowland.harvard.edu,
        "Bao D . Nguyen" <nguyenb@codeaurora.org>,
        FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>,
        Jens Axboe <axboe@kernel.dk>,
        "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v1 1/2] block: bsg: resume scsi device before
 accessing
In-Reply-To: <75c66862d61c63fcfa61cd6dce254169@codeaurora.org>
References: <cover.1611719814.git.asutoshd@codeaurora.org>
 <c04a11a590628c2497cef113b0dfea781de90416.1611719814.git.asutoshd@codeaurora.org>
 <DM6PR04MB6575D64869B24B4275D63503FCBB9@DM6PR04MB6575.namprd04.prod.outlook.com>
 <75c66862d61c63fcfa61cd6dce254169@codeaurora.org>
Message-ID: <19e1d785e5fb3d8ee79bf55758ef2dcf@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-01-27 15:59, Can Guo wrote:
> On 2021-01-27 15:09, Avri Altman wrote:
>>> 
>>> Resumes the scsi device before accessing it.
>>> 
>>> Change-Id: I2929af60f2a92c89704a582fcdb285d35b429fde
>>> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
>>> Signed-off-by: Can Guo <cang@codeaurora.org>
>>> Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
>> Following this patch, is it possible to revert commit 74e5e468b664d?
>> 
> 
> No, but this is a good finding... This change assumes
> that the queue->queue_data is a scsi_device, which is
> why we call scsi_auto_pm_get(). But for ufs_bsg's case,
> queue->queue_data is a device...
> 

If we call pm_runtime_get/put_sync(bcd->class_dev->parent) in
bsg_get/put_device(), commit 74e5e468b664d can be reverted.
This is just a rough idea.

> Thanks,
> Can Guo.
> 
>> Thanks,
>> Avri
