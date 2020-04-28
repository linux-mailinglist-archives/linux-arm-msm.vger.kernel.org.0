Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 982A01BC12D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 16:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgD1O1k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 10:27:40 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:22340 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726900AbgD1O1j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 10:27:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588084058; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=DzYwKPXEkmphkl14ZmOq9ivMq1C4gQZY6RKv6+b/FPw=; b=Qjv7BszoJZCz4jhn7cSjwBBgOvyLXq7crLJdWoyYtaYeDpawQsvi7bHs85hkbNJAAqo4yZoK
 LjsBS17XDrS+2d8Apm3XKfmTGPkDramJVPqiLzUIpbYcFy9broIjEehyU/IXhkU81voer1ex
 4H7zxUPALl8tmehA4iwdPvnUBXI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea83d55.7fe57b838768-smtp-out-n03;
 Tue, 28 Apr 2020 14:27:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CD985C432C2; Tue, 28 Apr 2020 14:27:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E546C433CB;
        Tue, 28 Apr 2020 14:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2E546C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2 4/8] bus: mhi: core: Handle firmware load using state
 worker
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>, mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org
References: <1588042766-17496-1-git-send-email-bbhatt@codeaurora.org>
 <1588042766-17496-5-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <407b5720-b1df-c7e0-b676-baad3d148d56@codeaurora.org>
Date:   Tue, 28 Apr 2020 08:27:30 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1588042766-17496-5-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Err, you fixed the SOB on patches 1-3, but now broke 4+.

On 4/27/2020 8:59 PM, Bhaumik Bhatt wrote:

No "From: ..." means you are the author.

> Upon power up, driver queues firmware worker thread if the execution
> environment is PBL. Firmware worker is blocked with a timeout until
> state worker gets a chance to run and unblock firmware worker. An
> endpoint power up failure can be seen if state worker gets a chance to
> run after firmware worker has timed out. Remove this dependency and
> handle firmware load directly using state worker thread.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

SOB from you meets the developers certificate of origin.

> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>

SOB from Hemant here, is confusing.  This would normally signal that 
Hemant is sending a patch you authored (ie patches 1-3 are authored by 
Hemant but you posted them to list), and he is attesting that he has the 
right to do so (certificate of origin), but this email came from you. 
This doesn't add up.

If you are trying to imply that Hemant wrote this change with you, there 
is a Co-authored-by tag you can use (goes before the SOB) to indicate 
multiple authors since git only has a single author field.  The 
Documentation/process/submitting-patches I pointed out on v1 should have 
the details for this.

Otherwise, you are listed as the author, and the patch has your SOB, 
therefore nothing else is needed.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
