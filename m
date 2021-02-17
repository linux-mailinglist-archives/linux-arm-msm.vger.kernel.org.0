Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E8731DD91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 17:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbhBQQpI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 11:45:08 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:19371 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234121AbhBQQpH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 11:45:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613580287; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=lP/wW1WoOhWCByLzAv/Wf4dAFE7ofJU7cPtmIjec1tA=; b=mNiFtbzkFkTO9bh2Ytt1ayxXL4j+8psm4XgoJc0WJFOkg2bWvDXCGsAy8bs04carApYUbI3G
 sK9+9BgE67P7O6ew4kh1qyzGVkWAxZCXJsLdFUzhqD61iA5ov2mypclBLhybTSOfmpJOGvFu
 1hQhnkLEhLenFQYk/V3GFLUOl94=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 602d47e570933e9467bf42b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 16:44:21
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B4C08C433CA; Wed, 17 Feb 2021 16:44:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1423EC433C6;
        Wed, 17 Feb 2021 16:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1423EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3] bus: mhi: core: Return EAGAIN if MHI ring is full
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fan Wu <wufan@codeaurora.org>
References: <1613579209-3675-1-git-send-email-jhugo@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <7f8120f7-e7bd-756c-cdbb-8580cd87bc13@codeaurora.org>
Date:   Wed, 17 Feb 2021 08:44:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1613579209-3675-1-git-send-email-jhugo@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/17/21 8:26 AM, Jeffrey Hugo wrote:
> From: Fan Wu <wufan@codeaurora.org>
> 
> Currently ENOMEM is returned when MHI ring is full. This error code is
> very misleading. Change to EAGAIN instead.
> 
> Signed-off-by: Fan Wu <wufan@codeaurora.org>
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
