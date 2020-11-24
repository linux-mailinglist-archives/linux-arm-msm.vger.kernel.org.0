Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 844422C1A42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 01:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgKXAww (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 19:52:52 -0500
Received: from z5.mailgun.us ([104.130.96.5]:24214 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgKXAwv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 19:52:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606179171; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GKJaxysKeeGFVdLmnzKKpewBaJhq/jbJ8g2o+d4/X6o=;
 b=eTkWVzeF+GyYk6YS7gA9PwVPfk0hKVw4j/fZEXjJDixeG6VJjmE7wKOTJWhXP+wCqoxZiU99
 +mMD9SM+e4lDeumlAX9QWs/otzgCn8E42laqo+XI1nxpiBTFqmN8HP/meNYjF9CmLeAi3BzJ
 BMqyvfWAgSCygwgj9CkXQ2Cn0fk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fbc595ed64ea0b7039cb0c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 24 Nov 2020 00:52:46
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 50A32C433C6; Tue, 24 Nov 2020 00:52:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 08BB8C433ED;
        Tue, 24 Nov 2020 00:52:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 16:52:44 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/8] mhi: pci_generic: Misc improvements
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
References: <1606140666-4986-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <6041716947a501f5c80c095766b55dd1@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 06:10 AM, Loic Poulain wrote:
> This series adjust some configuration values to ensure stability and
> robustness of mhi pci devices (timeout, number of events, burst mode).
> 
> It also includes support for system sleep as well as a recovery 
> procedure
> that can be triggered when a PCI error is reported, either by PCI AER 
> or by
> the new health-check mechanism.
> 
> All these changes have been tested with Telit FN980m module.
> 
> Loic Poulain (8):
>   mhi: pci-generic: Increase number of hardware events
>   mhi: pci-generic: Perform hard reset on remove
>   mhi: pci_generic: Enable burst mode for hardware channels
>   mhi: pci_generic: Add support for reset
>   mhi: pci_generic: Add suspend/resume/recovery procedure
>   mhi: pci_generic: Add PCI error handlers
>   mhi: pci_generic: Add health-check
>   mhi: pci_generic: Increase controller timeout value
> 
>  drivers/bus/mhi/pci_generic.c | 352 
> ++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 335 insertions(+), 17 deletions(-)
Just noticed that you may have missed my reviewed-by on patches 1 and 8 
from the
previous submission.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
