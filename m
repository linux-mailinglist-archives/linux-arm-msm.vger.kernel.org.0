Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32A4A182903
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 07:28:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387953AbgCLG2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 02:28:51 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:29229 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387786AbgCLG2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 02:28:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583994530; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1U9Dhk5Hq6bAWxKppOxTuYI7ucms9N1Z1Z8GWTVbRSk=;
 b=WPUU4xVjsY8ZUmqel4UFjlLx4hnUrXe7pa0LJtKIBORDzoP600ZNGqsv04EEiZFWpMEgTVMQ
 ++eqEprO/tdtvM/WGIA8GgtSz4vxdoOZBaltpNaDLWkQ5NOQ2VEycDCsd8z5268/9OgMoFTy
 aX+5ldy1IIBSiaGLOdy0SmCCICo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e69d68f.7efb4d199ed8-smtp-out-n01;
 Thu, 12 Mar 2020 06:28:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 04A0BC43637; Thu, 12 Mar 2020 06:28:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FDDEC433CB;
        Thu, 12 Mar 2020 06:28:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 12 Mar 2020 11:58:30 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Sibi Sankar <sibis@codeaurora.org>,
        ohad@wizery.com, devicetree@vger.kernel.org,
        linux-kernel-owner@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
        robh+dt@kernel.org, agross@kernel.org,
        saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
In-Reply-To: <a50040a9-54fe-f682-dd7e-b2991b48d633@arm.com>
References: <20200309182255.20142-1-sibis@codeaurora.org>
 <20200310112332.GG3794@8bytes.org>
 <4ed6ddd667a3e6f670084a443d141474@codeaurora.org>
 <20200310162320.GL3794@8bytes.org>
 <a50040a9-54fe-f682-dd7e-b2991b48d633@arm.com>
Message-ID: <ff805c5c647326c5edaddf2efec5cb87@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Robin,

On 2020-03-10 22:14, Robin Murphy wrote:
> On 10/03/2020 4:23 pm, Joerg Roedel wrote:
>> On Tue, Mar 10, 2020 at 07:30:50PM +0530, Sibi Sankar wrote:
>>> The accesses are initiated by the firmware
>>> and they access modem reserved regions.
>>> However as explained in ^^ any accesses
>>> outside the region will result in a violation
>>> and is controlled through XPUs (protection units).
>> 
>> Okay, this sounds like a case for arm_smmu_get_resv_region(). It 
>> should
>> return an entry for the reserved memory region the firmware needs to
>> access, so that generic iommu can setup this mapping.
>> 
>> Note that it should return that entry only for your device, not for 
>> all
>> devices. Maybe there is a property in DT or IORT you can set to
>> transport this information into the arm-smmu driver.
>> 
>> This is pretty similar to RMRR mapping on the Intel VT-d IOMMU or
>> Unity-mapped ranges in the AMD-Vi IOMMU.
> 
> Yup, a way to describe boot-time memory regions in IORT is in the
> process of being specced out; the first attempt at an equivalent for
> DT is here:
> 
> https://lore.kernel.org/linux-iommu/20191209150748.2471814-1-thierry.reding@gmail.com/
> 
> If that's not enough and the SMMU still needs to treat certain Stream
> IDs specially because they may be untranslatable (due to having direct
> access to memory as a side-channel), then that should be handled in
> the SoC-specific corner of the SMMU driver, not delegated to
> individual endpoint drivers.
> 

Are you talking about this one for SoC specific change - 
https://lore.kernel.org/patchwork/patch/1183530/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
