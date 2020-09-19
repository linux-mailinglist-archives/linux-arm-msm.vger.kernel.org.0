Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BCD270A11
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 04:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbgISCeM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 22:34:12 -0400
Received: from m42-11.mailgun.net ([69.72.42.11]:29317 "EHLO
        m42-11.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgISCeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 22:34:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600482851; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4F8t7lOdjL4CizPpSX+WSxbqj9BXweXrxIbsa280HLQ=;
 b=b9I9KVbaTyYz9nkqZGPjtrNOt151SDGPXahTA4dmFh9CUtziVbQN/P4OihkmA9th7ANZ9bMe
 Z1BXjSZ9tImdQGUmNbc1KvKKgkGFRaiMVQYicGsFWTZs+skpoo4Dxx2Xg2XzxHnqLTzQtulF
 T5+TfzldXd/g6r+67isARCm6JGM=
X-Mailgun-Sending-Ip: 69.72.42.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f656e23c4180d293bf64c5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Sep 2020 02:34:11
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4BD5BC433F1; Sat, 19 Sep 2020 02:34:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5EA5C433C8;
        Sat, 19 Sep 2020 02:34:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 18 Sep 2020 19:34:10 -0700
From:   bbhatt@codeaurora.org
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        jhugo@codeaurora.org, sdias@codeaurora.org,
        linux-arm-msm@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: bus/mhi/core: Double lock in mhi_device_put() and dev_wake
 inc/dec
In-Reply-To: <5029d4b5-d614-eef3-5a7a-9c8e1c3e7ddb@linuxfoundation.org>
References: <5029d4b5-d614-eef3-5a7a-9c8e1c3e7ddb@linuxfoundation.org>
Message-ID: <05ea5c258f0b3b2bf9a8fdc54500259f@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-17 16:16, Shuah Khan wrote:
> While looking at this file for an unrelated issue, I happen to notice
> there is a double locking on mhi_cntrl->pm_lock in the mhi_device_put()
> when it gets called from mhi_driver_remove()
> 
> The other two calls from mhi_driver_probe() don't hold the pm_lock.
> 
> In addition, lock holding while dev_wake updates is inconsistent.
> 
> dev_wake gets incremented and decremented without holding pm_lock in
> mhi_device_get(), mhi_device_get_sync() and mhi_device_put().
> 
> Exception are when mhi_device_put() is called from mhi_driver_remove().
> 
> The following commit is where all this code is added.
> 
> bus: mhi: core: Add support for data transfer
> https://github.com/torvalds/linux/commit/189ff97cca53e3fe2d8b38d64105040ce17fc62d
> 
> It appears to be real problem. I don't have a way to test this driver,
> hence reaching out to let you know about my findings.
> 
> thanks,
> -- Shuah
Thank you for inputs.

Hemant and I discussed this and we agree that there are inconsistencies 
we need to fix.

We will be uploading a patch to remove the read_lock_bh/read_unlock_bh 
calls from the
mhi_driver_remove().

Thanks,
Bhaumik
'The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project'
