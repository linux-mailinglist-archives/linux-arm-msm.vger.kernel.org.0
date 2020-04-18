Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E79E11AEC3D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2020 13:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725862AbgDRLyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Apr 2020 07:54:04 -0400
Received: from 8bytes.org ([81.169.241.247]:36274 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgDRLyE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Apr 2020 07:54:04 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id F25AB342; Sat, 18 Apr 2020 13:54:02 +0200 (CEST)
Date:   Sat, 18 Apr 2020 13:54:00 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Tang Bin <tangbin@cmss.chinamobile.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        robdclark@gmail.com, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom:fix local_base status check
Message-ID: <20200418115400.GF21900@8bytes.org>
References: <20200402063302.20640-1-tangbin@cmss.chinamobile.com>
 <20200402064552.GG663905@yoga>
 <7a565c74-f223-83da-cf32-0474be6c9460@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a565c74-f223-83da-cf32-0474be6c9460@cmss.chinamobile.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 16, 2020 at 02:42:23PM +0800, Tang Bin wrote:
>         The function qcom_iommu_device_probe() does not perform sufficient
> error checking after executing devm_ioremap_resource(), which can result in
> crashes if a critical error path is encountered.
> 
> Fixes: 0ae349a0("iommu/qcom: Add qcom_iommu")

Yes, that sounds better. Please use it for the commit message and also
add the Fixes line and resubmit the fix to me.
Please make the fixes line:

	Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")

So that the commit-id is 12 characters long and a space between it and
the subject.

Thanks,

	Joerg

