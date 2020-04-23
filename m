Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51DDE1B5865
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 11:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgDWJlJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 05:41:09 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:31325 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726346AbgDWJlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 05:41:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587634867; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=X4JlYBXDzz9vV+CUfgeK/NaJLq5Ep+S6sMu6NUItr0I=;
 b=L/Gq0iu1HaiUN5Rk48hGivV0hrj8XJWZuo40J3BGaBD5xdveCgtYKDt3d/ctvK/BEc/5ruxI
 M/AGnZdCDojL5HI3LQTRoRcqvdy3LW1HdqEU6JdElxycfF3dzOOLzZTu1C+2wQ8uEmisCLAs
 nrAT3zFMAfK/oQxsiBHGEJBqwB8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea162b0.7f2ab732c848-smtp-out-n05;
 Thu, 23 Apr 2020 09:41:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C6496C43637; Thu, 23 Apr 2020 09:41:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C107C433CB;
        Thu, 23 Apr 2020 09:41:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 23 Apr 2020 15:11:03 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-arm-msm-owner@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>,
        LKML <linux-kernel@vger.kernel.org>,
        iommu@lists.linux-foundation.org
Subject: Re: [PATCH] iommu/arm-smmu: Demote error messages to debug in
 shutdown callback
In-Reply-To: <006edb3b-8834-41fe-d9d1-fe873edfca99@arm.com>
References: <20200327132852.10352-1-saiprakash.ranjan@codeaurora.org>
 <0023bc68-45fb-4e80-00c8-01fd0369243f@arm.com>
 <37db9a4d524aa4d7529ae47a8065c9e0@codeaurora.org>
 <5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com>
 <d60196b548e1241b8334fadd0e8c2fb5@codeaurora.org>
 <CAD=FV=WXTN6xxqtL6d6MHxG8Epuo6FSQERRPfnoSCskhjh1KeQ@mail.gmail.com>
 <890456524e2df548ba5d44752513a62c@codeaurora.org>
 <20200331074400.GB25612@willie-the-truck>
 <1bf04938249bcd5b2111c1921facfd25@codeaurora.org>
 <CAD=FV=VBM6cS1UmWTUJ2vrt0a2zn7xV3C53tpthBx58M2=1JPg@mail.gmail.com>
 <6c82e688f335b9c07b0f52987244664b@codeaurora.org>
 <006edb3b-8834-41fe-d9d1-fe873edfca99@arm.com>
Message-ID: <685e51afcf8f89c2d8e225716a57b67a@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-23 14:58, Robin Murphy wrote:
> On 2020-04-23 9:17 am, Sai Prakash Ranjan wrote:
> [...]
>>> Any update on the status here?  If I'm reading the conversation 
>>> above,
>>> Robin said: "we'll *always* see the warning because there's no way to
>>> tear down the default DMA domains, and even if all devices *have* 
>>> been
>>> nicely quiesced there's no way to tell".  Did I understand that
>>> properly?  If so, it seems like it's fully expected to see this
>>> message on every reboot and it doesn't necessarily signify anything
>>> bad.
>>> 
>> 
>> Understanding is the same, waiting for Will and Robin to check if its 
>> OK
>> to make the message more friendly.
> 
> The way I see it, we essentially just want *something* visible that
> will correlate with any misbehaviour that *might* result from turning
> off a possibly-live context. How about simply "disabling translation",
> at dev_warn or dev_info level?
> 


Sounds good, I'll go with disabling translation with dev_info.

Thanks,
Sai
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
