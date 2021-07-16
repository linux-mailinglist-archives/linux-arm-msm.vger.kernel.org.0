Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A99C3CB016
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 02:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhGPAip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jul 2021 20:38:45 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51685 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhGPAip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jul 2021 20:38:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626395751; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Hg4UHJ6k0BkePlXHMCIMP/orYnASJUN8pewnaW0YCJU=;
 b=jHxlXl5caTcF/uKMOHPyzLf5SQMc4Iq4cFfx5lPaatvEtmsshV6YRBxeJi02aLDPWo47iuCk
 HJnKcBHhWhKr4fB4IHFBhPyQfbnQ54Jij6bIVYwdVYEqG4O+oKkBJ9kJUBU72mMxImz7ADef
 dtpSjeBCOYqbYAlRapkVCdbLfkk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60f0d45d17c2b4047d6e6a5b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Jul 2021 00:35:41
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5917BC43217; Fri, 16 Jul 2021 00:35:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F1763C433D3;
        Fri, 16 Jul 2021 00:35:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 15 Jul 2021 17:35:38 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Hemant Kumar <hemantk@codeaurora.org>,
        Paul Davey <paul.davey@alliedtelesis.co.nz>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v3 2/2] bus: mhi: Fix MHI DMA structure endianness
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1625104371.10055.21.camel@codeaurora.org>
References: <20210629035357.11091-1-paul.davey@alliedtelesis.co.nz>
 <20210629035357.11091-3-paul.davey@alliedtelesis.co.nz>
 <1625104371.10055.21.camel@codeaurora.org>
Message-ID: <f396b676cf96a7b7e5e26edf9f45e9ae@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Paul,

On 2021-06-30 06:52 PM, Hemant Kumar wrote:
> Hi Paul,
> On Tue, 2021-06-29 at 15:53 +1200, Paul Davey wrote:
>> The MHI driver does not work on big endian architectures.  The
>> controller never transitions into mission mode.  This appears to be
>> due
>> to the modem device expecting the various contexts and transfer rings
>> to
>> have fields in little endian order in memory, but the driver
>> constructs
>> them in native endianness.
>> 
>> Fix MHI event, channel and command contexts and TRE handling macros
>> to
>> use explicit conversion to little endian.  Mark fields in relevant
>> structures as little endian to document this requirement.
>> 
>> Signed-off-by: Paul Davey <paul.davey@alliedtelesis.co.nz>
>> ---
>> Removed Tested-by as patch has changed somewhat from v2.
> Bhaumik is going to help testing V2 on x86 platform. Change looks good
> to me. Will ack it once testing is done.
>>  [..]
>> 
> 
> Thanks,
> Hemant

Just following up on this one. I have been seeing problems with my setup 
and
will try to get to this test next week.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
