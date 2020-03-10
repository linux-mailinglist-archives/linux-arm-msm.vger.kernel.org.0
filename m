Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1BCD1803CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 17:44:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgCJQoY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 12:44:24 -0400
Received: from foss.arm.com ([217.140.110.172]:39442 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgCJQoY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 12:44:24 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E0AB1FB;
        Tue, 10 Mar 2020 09:44:24 -0700 (PDT)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09A613F67D;
        Tue, 10 Mar 2020 09:44:19 -0700 (PDT)
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
To:     Joerg Roedel <joro@8bytes.org>, Sibi Sankar <sibis@codeaurora.org>
Cc:     ohad@wizery.com, devicetree@vger.kernel.org,
        linux-kernel-owner@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
        robh+dt@kernel.org, agross@kernel.org
References: <20200309182255.20142-1-sibis@codeaurora.org>
 <20200310112332.GG3794@8bytes.org>
 <4ed6ddd667a3e6f670084a443d141474@codeaurora.org>
 <20200310162320.GL3794@8bytes.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <a50040a9-54fe-f682-dd7e-b2991b48d633@arm.com>
Date:   Tue, 10 Mar 2020 16:44:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200310162320.GL3794@8bytes.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/03/2020 4:23 pm, Joerg Roedel wrote:
> On Tue, Mar 10, 2020 at 07:30:50PM +0530, Sibi Sankar wrote:
>> The accesses are initiated by the firmware
>> and they access modem reserved regions.
>> However as explained in ^^ any accesses
>> outside the region will result in a violation
>> and is controlled through XPUs (protection units).
> 
> Okay, this sounds like a case for arm_smmu_get_resv_region(). It should
> return an entry for the reserved memory region the firmware needs to
> access, so that generic iommu can setup this mapping.
> 
> Note that it should return that entry only for your device, not for all
> devices. Maybe there is a property in DT or IORT you can set to
> transport this information into the arm-smmu driver.
> 
> This is pretty similar to RMRR mapping on the Intel VT-d IOMMU or
> Unity-mapped ranges in the AMD-Vi IOMMU.

Yup, a way to describe boot-time memory regions in IORT is in the 
process of being specced out; the first attempt at an equivalent for DT 
is here:

https://lore.kernel.org/linux-iommu/20191209150748.2471814-1-thierry.reding@gmail.com/

If that's not enough and the SMMU still needs to treat certain Stream 
IDs specially because they may be untranslatable (due to having direct 
access to memory as a side-channel), then that should be handled in the 
SoC-specific corner of the SMMU driver, not delegated to individual 
endpoint drivers.

Robin.
