Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1171C33DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 09:51:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgEDHvx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 03:51:53 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:35102 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727088AbgEDHvx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 03:51:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588578712; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Gm+ck2cB95VAaRfiAV1AhlwdbM3i0yfSnXxwhtbbaZE=; b=PRMxKoWT7MJhMmJCpqxHCiQ+Gz6BhFh9ud6EkKL8oqBpWpZXOdpFaiEUt9kWiyVi8FhWDI/Q
 TrYSHfD5L5rOMm5ZXkqR/elCdLdyctldAr/9ebNuRUeozRIL7rJhdpEJ3mevOJCkSkPaVqDb
 t34vkEKN0qt5I6MEotJAK9w9Jwk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eafc987.7f4fa18ee9d0-smtp-out-n05;
 Mon, 04 May 2020 07:51:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8F5DAC432C2; Mon,  4 May 2020 07:51:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.9.159] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7AE2CC433CB;
        Mon,  4 May 2020 07:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7AE2CC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v6 0/5] Add SS/HS-USB changes for Qualcomm SM8150 chipset
To:     Vinod Koul <vkoul@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        robh+dt@kernel.org, mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1586472749-18599-1-git-send-email-wcheng@codeaurora.org>
 <20200504071502.GM1375924@vkoul-mobl>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <655be70d-918b-7a59-8a6d-48d542226486@codeaurora.org>
Date:   Mon, 4 May 2020 00:51:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504071502.GM1375924@vkoul-mobl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/4/2020 12:15 AM, Vinod Koul wrote:
> Hi Wesley,
> 
> On 09-04-20, 15:52, Wesley Cheng wrote:
>> This series adds support for the Synopsis 7nm HSPHY USB driver being
>> used in QCOM chipsets.  The HSPHY register map differs compared to 
>> other PHY revisions.  In addition, modifications and updates are done
>> to the QMP driver to add new registers/offsets, and to update the
>> initialization sequence for enabling the SSUSB path on SM8150.
> 
> This fails to apply for me, Can you please rebase on
> git://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next and
> send.
> 
> Also, I saw checkpatch --strict complain about "Alignment should match
> open parenthesis" please check and fix while not sacrificing readablity.
> 
> Thanks
> 

Hi Vinod,

Got it!  Will rebase and fix warnings, and resend a patch revision
tomorrow.  Thanks again.

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
