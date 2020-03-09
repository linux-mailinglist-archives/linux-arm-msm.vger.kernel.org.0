Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A09517DADC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2020 09:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgCII3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Mar 2020 04:29:46 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:61291 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725796AbgCII3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Mar 2020 04:29:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583742585; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=rekte7ocSOaTqiwRNJJAud2b0DVbniIRy+IiXY+P0kk=; b=KnzoVWLiWF6gpXWzPa8sY5/4IBSWHNSeEWpSNR9ydejpmBKg0kmnVEBvqLtH3ZKuM56B/UYP
 2lJkVBNvPzvZlYA2wdtq0kSA0dCsp5G0ntqgejncfTmLvbcAlhLbs4Qsh7sAZWYXTtZew0ba
 9bagc2Bc3fPFuFI1V5qhV7u0rgc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e65fe77.7f4a3132e0d8-smtp-out-n03;
 Mon, 09 Mar 2020 08:29:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C49C6C433BA; Mon,  9 Mar 2020 08:29:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4ED38C433D2;
        Mon,  9 Mar 2020 08:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4ED38C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v12 0/4] Invoke rpmh_flush for non OSI targets
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1583428023-19559-1-git-send-email-mkshah@codeaurora.org>
 <158343060946.7173.9822192224809476773@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <55b79a14-691c-663a-6635-7d809e7841c6@codeaurora.org>
Date:   Mon, 9 Mar 2020 13:59:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158343060946.7173.9822192224809476773@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/5/2020 11:20 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-03-05 09:06:59)
>> Changes in v12:
>> - Kconfig change to remove COMPILE_TEST was dropped in v11, reinclude it.
> What is the difficulty in maintaining COMPILE_TEST support? If it's
> purely making a stub function for OSI support then I'm lost why we can't
> have another patch at the start of the series that makes the function
> return false when PSCI is disabled.
Addressed in v13 to maintain COMPILE_TEST for rpmh driver.
Althought its done from rpmh-rsc driver itself rather thatn by not making a new stub function in PSCI.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
