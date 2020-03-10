Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD86C18031F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 17:23:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgCJQXY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 12:23:24 -0400
Received: from 8bytes.org ([81.169.241.247]:50882 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726488AbgCJQXY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 12:23:24 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id BF8F2396; Tue, 10 Mar 2020 17:23:21 +0100 (CET)
Date:   Tue, 10 Mar 2020 17:23:20 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        agross@kernel.org, linux-kernel-owner@vger.kernel.org
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
Message-ID: <20200310162320.GL3794@8bytes.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
 <20200310112332.GG3794@8bytes.org>
 <4ed6ddd667a3e6f670084a443d141474@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ed6ddd667a3e6f670084a443d141474@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 07:30:50PM +0530, Sibi Sankar wrote:
> The accesses are initiated by the firmware
> and they access modem reserved regions.
> However as explained in ^^ any accesses
> outside the region will result in a violation
> and is controlled through XPUs (protection units).

Okay, this sounds like a case for arm_smmu_get_resv_region(). It should
return an entry for the reserved memory region the firmware needs to
access, so that generic iommu can setup this mapping.

Note that it should return that entry only for your device, not for all
devices. Maybe there is a property in DT or IORT you can set to
transport this information into the arm-smmu driver.

This is pretty similar to RMRR mapping on the Intel VT-d IOMMU or
Unity-mapped ranges in the AMD-Vi IOMMU.

Regards,

	Joerg
