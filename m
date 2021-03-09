Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19D2332E95
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 19:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhCIS4h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 13:56:37 -0500
Received: from z11.mailgun.us ([104.130.96.11]:57819 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230328AbhCIS4h (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 13:56:37 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615316197; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=32y+inxCeOK2MIaRgFOPtvv00suyT08GlD3+dXA/07g=; b=efjsx3HnQAiJqxrxlIpbUk1KbpFApMHTag7+yzfruk5fFqIBp17CveVoSYHLMpkJgrm9NR6Q
 HtlFyAb70ZwV56XA9vE4amhtliFljz9AKFtAmJzKl9T9N+vXJfIyeQuJowP9X+ZbR7QxZ+RJ
 GDxHnvyd9RvQPAfNrb/iem3ngzk=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6047c4e4b2591bd5689abcb7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 18:56:36
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ACB1BC43463; Tue,  9 Mar 2021 18:56:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4E25BC433C6;
        Tue,  9 Mar 2021 18:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4E25BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3] bus: mhi: core: Add missing checks for MMIO register
 entries
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, loic.poulain@linaro.org
References: <1615315490-36017-1-git-send-email-bbhatt@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <d2a3b67e-673d-2c90-f62b-1fe9f4f37968@codeaurora.org>
Date:   Tue, 9 Mar 2021 11:56:34 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1615315490-36017-1-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/9/2021 11:44 AM, Bhaumik Bhatt wrote:
> As per documentation, fields marked as (required) in an MHI
> controller structure need to be populated by the controller driver
> before calling mhi_register_controller(). Ensure all required
> pointers and non-zero fields are present in the controller before
> proceeding with the registration.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
