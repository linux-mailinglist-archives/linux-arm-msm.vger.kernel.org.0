Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CAD82CE2E3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Dec 2020 00:46:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726063AbgLCXqW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Dec 2020 18:46:22 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:31593 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729721AbgLCXqW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Dec 2020 18:46:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607039156; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=JlX36sKBivxDBM8LHGzMecxeZx7IR6GkR5hJ7tvId/Y=; b=k7Lka6YihjAlrg0YM5wOLDM9hh/jigZ1+O3H/h9Z7tnJjGJyhNEegurhsFFFl71kI+eKf2px
 rWmMlHZXCTCPGNQrcW5EWZVMdZGS9mi4+upeCrLm5WPSbK9PEW97UAs6ewuDROcTeT87oHn4
 pclt7+Ki/seGE8p4GR8byAmHMn4=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5fc97897aac9455097317380 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Dec 2020 23:45:27
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6FB55C433ED; Thu,  3 Dec 2020 23:45:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EBD82C433CA;
        Thu,  3 Dec 2020 23:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EBD82C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v15 4/4] bus: mhi: Add userspace client interface driver
To:     Hemant Kumar <hemantk@codeaurora.org>,
        manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bbhatt@codeaurora.org, loic.poulain@linaro.org,
        netdev@vger.kernel.org
References: <1607035516-3093-1-git-send-email-hemantk@codeaurora.org>
 <1607035516-3093-5-git-send-email-hemantk@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <1bcddc1c-e489-c867-77fb-f6893a101900@codeaurora.org>
Date:   Thu, 3 Dec 2020 16:45:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1607035516-3093-5-git-send-email-hemantk@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/3/2020 3:45 PM, Hemant Kumar wrote:
> This MHI client driver allows userspace clients to transfer
> raw data between MHI device and host using standard file operations.
> Driver instantiates UCI device object which is associated to device
> file node. UCI device object instantiates UCI channel object when device
> file node is opened. UCI channel object is used to manage MHI channels
> by calling MHI core APIs for read and write operations. MHI channels
> are started as part of device open(). MHI channels remain in start
> state until last release() is called on UCI device file node. Device
> file node is created with format
> 
> /dev/<mhi_device_name>
> 
> Currently it supports QMI channel.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

You dropped Loic's tested by.  Was that a mistake, or did something 
actually change which would invalidate his testing?

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
