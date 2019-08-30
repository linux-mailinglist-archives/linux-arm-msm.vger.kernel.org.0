Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9496A3957
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 16:36:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbfH3Oga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 10:36:30 -0400
Received: from 8bytes.org ([81.169.241.247]:52564 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727434AbfH3Oga (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 10:36:30 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id BD69E246; Fri, 30 Aug 2019 16:36:28 +0200 (CEST)
Date:   Fri, 30 Aug 2019 16:36:27 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom_iommu: Use struct_size() helper
Message-ID: <20190830143627.GG11578@8bytes.org>
References: <20190830040327.GA6483@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830040327.GA6483@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 29, 2019 at 11:03:27PM -0500, Gustavo A. R. Silva wrote:
>  drivers/iommu/qcom_iommu.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied, thanks.
