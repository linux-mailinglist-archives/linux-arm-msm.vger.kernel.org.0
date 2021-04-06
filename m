Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7499E354F72
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 11:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240302AbhDFJI3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Apr 2021 05:08:29 -0400
Received: from 8bytes.org ([81.169.241.247]:33522 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240199AbhDFJI3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Apr 2021 05:08:29 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 27AE33A4; Tue,  6 Apr 2021 11:08:20 +0200 (CEST)
Date:   Tue, 6 Apr 2021 11:08:18 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     "chenxiang (M)" <chenxiang66@hisilicon.com>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH] iommu: Add device name to iommu map/unmap trace events
Message-ID: <YGwlAqQVSV6k5z9j@8bytes.org>
References: <20210209123620.19993-1-saiprakash.ranjan@codeaurora.org>
 <20210212105039.GG7302@8bytes.org>
 <626fbcb8-b84f-1522-4ec3-9c7c1f5f7a93@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <626fbcb8-b84f-1522-4ec3-9c7c1f5f7a93@hisilicon.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 06, 2021 at 02:56:53PM +0800, chenxiang (M) wrote:
> Is it possible to use group id to identify different domains?

No, the best is to do this during post-processing of your traces by also
keeping tack of domain-device attachments/detachments.

Regards,

	Joerg
