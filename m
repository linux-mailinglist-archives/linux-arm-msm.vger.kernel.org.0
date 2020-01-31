Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADF714F50A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2020 00:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgAaXAf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jan 2020 18:00:35 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:48403 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726246AbgAaXAe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jan 2020 18:00:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580511634; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=i3PwaHsN67/54M0kZuRccV6gcxHouSS2QlRHmHVgiq8=; b=vpLl3arbncTzJFjt1EE/v8aikA5KX1CvztYAtwEj1syhvrYkbKBS+pTmTaDcEVQTTjzehpTO
 G1A4joXSXSmFbKCsVw5iYVqice+PP417jk5asNDoATjCTJMid3VmrUbeSGctzqpHx9TZepFR
 ZD/B2ed8bOcSoqaziAxkDGvDQfQ=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e34b186.7f3e2a97c378-smtp-out-n01;
 Fri, 31 Jan 2020 23:00:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EE445C447A1; Fri, 31 Jan 2020 23:00:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B74EFC433A2;
        Fri, 31 Jan 2020 23:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B74EFC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2 03/16] bus: mhi: core: Add support for registering MHI
 client drivers
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        gregkh@linuxfoundation.org, arnd@arndb.de
Cc:     smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200131135009.31477-1-manivannan.sadhasivam@linaro.org>
 <20200131135009.31477-4-manivannan.sadhasivam@linaro.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <0af134d9-6df6-e79b-cab2-1f96b16323c4@codeaurora.org>
Date:   Fri, 31 Jan 2020 16:00:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200131135009.31477-4-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 1/31/2020 6:49 AM, Manivannan Sadhasivam wrote:
> This commit adds support for registering MHI client drivers with the
> MHI stack. MHI client drivers binds to one or more MHI devices inorder
> to sends and receive the upper-layer protocol packets like IP packets,
> modem control messages, and diagnostics messages over MHI bus.
> 
> This is based on the patch submitted by Sujeev Dias:
> https://lkml.org/lkml/2018/7/9/987
> 
> Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
> Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
> [mani: splitted and cleaned up for upstream]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
