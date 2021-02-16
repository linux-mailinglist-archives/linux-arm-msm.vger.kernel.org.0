Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF4E31CF27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 18:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhBPRhk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 12:37:40 -0500
Received: from z11.mailgun.us ([104.130.96.11]:44495 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229879AbhBPRhi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 12:37:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613497040; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4TotQZ50sSfWZrTT8rH4ez4ieOzXl8RQM5CTNGHrW6M=;
 b=BsLclu3RBqhp/yxCy6/ffBW2aftGMLgZwSWPCbjllv9It5Kmsz356R4LgkQJciyLQil+ltee
 K8NJ3meDxjGoQJCrJpmhj4Kp3mkzy+Yy71zW9r38I+Nfywxz+s0ORDUeXGjkqL+BRRRJ4E8A
 Qr+Z0oIxE2vVnNebDXNYTTx3ROw=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 602c02c4e3b5620c2ea5a642 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 17:37:08
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CA78BC433C6; Tue, 16 Feb 2021 17:37:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD2B0C43462;
        Tue, 16 Feb 2021 17:37:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 16 Feb 2021 09:37:05 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v3] mhi: pci_generic: Ensure device readiness before
 starting MHI
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <CAMZdPi_rWc93B+e_P9cKvtx8v83AW18+r7HXYxn3fxALSp_1+Q@mail.gmail.com>
References: <1613071507-31489-1-git-send-email-loic.poulain@linaro.org>
 <fc43871e37761808e5c1e00406daef5e@codeaurora.org>
 <CAMZdPi_rWc93B+e_P9cKvtx8v83AW18+r7HXYxn3fxALSp_1+Q@mail.gmail.com>
Message-ID: <d09e57132b03431964633f1d53b5a24d@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-02-14 11:30 PM, Loic Poulain wrote:
> Hi Bhaumik,
> 
> On Fri, 12 Feb 2021 at 02:41, Bhaumik Bhatt <bbhatt@codeaurora.org> 
> wrote:
>> 
>> Hi Loic,
>> 
>> On 2021-02-11 11:25 AM, Loic Poulain wrote:
>> > The PCI device may have not been bound from cold boot and be in
>> > undefined state, or simply not yet ready for MHI operations. This
>> > change ensures that the MHI layer is reset to initial state and
>> > ready for MHI initialization and power up.
>> >
>> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> [...]
>> > +
>> >       err = mhi_sync_power_up(mhi_cntrl);
>> >       if (err) {
>> >               dev_err(&pdev->dev, "failed to power up MHI controller\n");
>> 
>> Can you share logs of what you're seeing as it is not clear why you
>> would need
>> this patch.
>> 
>> We have a mechanism in place that Jeff added a while back [1], to 
>> check
>> if device
>> is in SYS_ERROR state and do the same: issue reset and later, wait for
>> ready from
>> within mhi_sync_power_up() API.
>> 
>> Note that the MHI_IN_PBL() macro includes EDL and Pass Through modes 
>> as
>> well and
>> we do expect an MHI READY state move after Pass Through.
> 
> I think this is a mix of several issues, that could be fixed by latest
> Jeffrey's patch and
> this one: "mhi: core: Move to polling method to wait for MHI ready".
> 
> I assume it would be easier if you send this last one as standalone
> fix, for review and merge.
> 
Will do.
> Regards,
> Loic

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
