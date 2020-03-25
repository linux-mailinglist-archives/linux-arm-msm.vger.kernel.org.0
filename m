Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E92C0192DA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2020 17:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgCYQCS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Mar 2020 12:02:18 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:49636 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725812AbgCYQCS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Mar 2020 12:02:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585152138; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rwYFjjH34Xzwz6CUSnKamcadAswUj8l1Y6KyM0WRdYs=; b=BMSsYylJsTBfA4nmX9Ousbu9/ZrsC8BQ85TO5tFtdqKX75xTYU4qWHQ8GV/qJ5jUivNG96wc
 3EFGZC1IZbqGBP2BN2mR+mOBfe9JeeOcTzNHY++PAqmFFGNvTdTdP2iuglDYoJy4LCYsP17n
 FjeYf98dH95oImAqP0soWulYH2A=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7b8077.7fae400bdc38-smtp-out-n03;
 Wed, 25 Mar 2020 16:01:59 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9CCEEC433BA; Wed, 25 Mar 2020 16:01:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F3AEC433F2;
        Wed, 25 Mar 2020 16:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F3AEC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 3/7] bus: mhi: core: Initialize bhie field in mhi_cntrl
 for RDDM capture
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200324061050.14845-1-manivannan.sadhasivam@linaro.org>
 <20200324061050.14845-4-manivannan.sadhasivam@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <859d465e-c3eb-ab93-b615-ac5fc937f638@codeaurora.org>
Date:   Wed, 25 Mar 2020 10:01:56 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200324061050.14845-4-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/24/2020 12:10 AM, Manivannan Sadhasivam wrote:
> The bhie field in mhi_cntrl needs to be initialized to proper register
> base in order to make mhi_rddm_prepare() to work. Otherwise,
> mhi_rddm_prepare() will cause NULL pointer dereference.
> 
> Fixes: 6fdfdd27328c ("bus: mhi: core: Add support for downloading RDDM image during panic")
> Reported-by: Hemant Kumar <hemantk@codeaurora.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
