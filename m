Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092771BFDEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 16:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgD3OYF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 10:24:05 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:29624 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728008AbgD3OYD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 10:24:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588256642; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=LZuaOG4S+qR9ammm/O51mTS7Ln6Qd+RiwI7E7O4Amdk=; b=Bxl8E0n0S4cNZD5+DjhYSnHFkpm+HZOj2erchdTWVvXQ8fJ012F3/Sps1M6fcldtPrBFrvqa
 MRG+Uf1rP5wd7w7rK59ZZRKxPOU1DFt8rxqOcrYS0diiORgrB4e7k65YJiop7n/rB24YZywM
 GuJ44oakxf4L8MZ1DMbuqk9IRTI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eaadf6f.7f1fff91b2d0-smtp-out-n05;
 Thu, 30 Apr 2020 14:23:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0DFBCC433D2; Thu, 30 Apr 2020 14:23:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E7D0EC433CB;
        Thu, 30 Apr 2020 14:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E7D0EC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 2/9] bus: mhi: core: Cache intmod from mhi event to mhi
 channel
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>, mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org
References: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
 <1588193551-31439-3-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <45ebe201-5b2a-f32a-2768-8b710fda4ec2@codeaurora.org>
Date:   Thu, 30 Apr 2020 08:23:39 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1588193551-31439-3-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/29/2020 2:52 PM, Bhaumik Bhatt wrote:
> From: Hemant Kumar <hemantk@codeaurora.org>
> 
> Driver is using zero initialized intmod value from mhi channel when
> configuring TRE for bei field. This prevents interrupt moderation to
> take effect in case it is supported by an event ring. Fix this by
> copying intmod value from associated event ring to mhi channel upon
> registering mhi controller.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---

Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
