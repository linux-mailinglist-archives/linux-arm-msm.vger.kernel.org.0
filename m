Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA3F112936F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 10:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfLWJAs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 04:00:48 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:32043 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726034AbfLWJAr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 04:00:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577091647; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=LpD/XIXRR/PLw8GkamJbjUiErErlWN3nv/jfxUf1yzw=; b=iDYPUYxo1HgEzRl+ADeFYpGhJpPJdxtVEP+J8wLguTNoBc0EH6kMB3T3K8T0iz/7zXF6LVJb
 wE7uheH5AvXYaysFYK3/HBVasaX5DiYcCdUnGkdXAyH2ZHALBeilc/7J2NgSHst9BVZXtZG2
 tkwlbNaUICfuVnm0oesy1LkRaoA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e008233.7efbe1f80768-smtp-out-n01;
 Mon, 23 Dec 2019 09:00:35 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1C8E3C433A2; Mon, 23 Dec 2019 09:00:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.24.214] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mgautam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DBB02C43383;
        Mon, 23 Dec 2019 09:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DBB02C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mgautam@codeaurora.org
Subject: Re: [PATCH 3/4] phy: qcom-qmp: Add optional SW reset
To:     Vinod Koul <vkoul@kernel.org>, Can Guo <cang@codeaurora.org>
Cc:     Asutosh Das <asutoshd@codeaurora.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20191219150433.2785427-1-vkoul@kernel.org>
 <20191219150433.2785427-4-vkoul@kernel.org>
 <ff83ac1f0ec6bca1379e8b873fd30aa2@codeaurora.org>
 <9ef99dcac59dbdc59c7e5eb1a8724ea2@codeaurora.org>
 <20191220042427.GE2536@vkoul-mobl>
 <e55185eda9d7dcbce80a671e630449ea@codeaurora.org>
 <20191220071015.GF2536@vkoul-mobl>
 <b54f1f3a8938587b85aec74f7094006d@codeaurora.org>
 <20191220075338.GG2536@vkoul-mobl>
From:   Manu Gautam <mgautam@codeaurora.org>
Message-ID: <cef4c737-0b4c-000c-93e1-0eb2d24a0065@codeaurora.org>
Date:   Mon, 23 Dec 2019 14:30:27 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191220075338.GG2536@vkoul-mobl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/20/2019 1:23 PM, Vinod Koul wrote:
> On 20-12-19, 15:41, Can Guo wrote:
>> On 2019-12-20 15:10, Vinod Koul wrote:
>>> On 20-12-19, 14:00, Can Guo wrote:
>> Hi Vinod
>>
>> We are just removing the no_pcs_sw_reset for 8150, right? Why is it
>> possibly impacting 845 or older paltforms?
>>
>> In future, we will no longer need no_pcs_sw_reset for any newer QCOM UFS
>> PHY designs, as it is only for 845 and older platforms.
>>
>> I am sure QPHY_SW_RESET will be within PHY's address space since 8150.
>> Otherwise, it will be a regression in UFS PHY design. We had a lot of
>> discussion about this on 845 years ago, then design team decided to add
>> it on later platforms, so I don't see a reason to remove it again. :)
>>
>> I am not sure about the other qmp phys, but so long as UFS PHY needs the
>> reset, we need to keep it, as phy-qcom-qmp.c is a common driver. I am
>> not sure if I get your point here. Please correct me I am wrong.
> The argument here is that we are making this UFS specific and we do not
> know if this will be true in future as QMP is a common phy, so adding a
> separate flag helps to keep it independent and to be used in other
> situations.
>
> Thanks

We should just remove no_pcs_sw_reset and let existing code take care
of PHY reset for UFS.
QMP PHY reset for UFS was differently handled earlier compared to USB/PCie
and relied on core for PHY reset. That is not the case with addition of
PCS based sw_reset and this won't change in future. There is no need to
have UFS specific flag in this driver.


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
