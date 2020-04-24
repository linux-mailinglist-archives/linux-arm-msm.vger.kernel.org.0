Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CABE1B6AA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 03:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbgDXBFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 21:05:36 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:13367 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727902AbgDXBFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 21:05:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587690335; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ShZafi+ANNOf8BzHrjTpL0wcGrk3vYLZaq3XFRW2kwI=; b=AHT5yYRyKcBlyKQUnfm027OxfBdNSdRBxFWV6cbm0cmeu8sEPutEbOIUgZ3rK9/cPIEvsfy6
 1lShoqfh8vCw2u9Nd7lefZ3LLCxq8Wb/cDoz//y7KPH+9WF2wdeRPVAlX0mBiW9SIxk8jm2c
 Wdo8QAitg2/5bozTt63iVIJQjfc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea23b56.7f9bd04c6228-smtp-out-n03;
 Fri, 24 Apr 2020 01:05:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5CF38C433D2; Fri, 24 Apr 2020 01:05:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.142.6] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: clew)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 764B9C433CB;
        Fri, 24 Apr 2020 01:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 764B9C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=clew@codeaurora.org
Subject: Re: [PATCH 4/4] arm64: defconfig: Remove QCOM_GLINK_SSR
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi <sibis@codeaurora.org>,
        Siddharth Gupta <sidgup@codeaurora.org>
References: <20200423003736.2027371-1-bjorn.andersson@linaro.org>
 <20200423003736.2027371-5-bjorn.andersson@linaro.org>
From:   Chris Lew <clew@codeaurora.org>
Message-ID: <118d0c75-bfd7-ec34-2565-df33e8f2b35b@codeaurora.org>
Date:   Thu, 23 Apr 2020 18:05:23 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200423003736.2027371-5-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/22/2020 5:37 PM, Bjorn Andersson wrote:
> Remove the QCOM_GLINK_SSR option from the arm64 defconfig, as the module
> is assimilated by QCOM_GLINK - which is selected by other means.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Acked-by: Chris Lew <clew@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
