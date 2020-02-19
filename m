Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDE78164141
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 11:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgBSKOq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 05:14:46 -0500
Received: from 8bytes.org ([81.169.241.247]:54856 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbgBSKOq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 05:14:46 -0500
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 6E05536A; Wed, 19 Feb 2020 11:14:45 +0100 (CET)
Date:   Wed, 19 Feb 2020 11:14:44 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom: Replace zero-length array with
 flexible-array member
Message-ID: <20200219101443.GB1961@8bytes.org>
References: <20200213001401.GA28587@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213001401.GA28587@embeddedor.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 12, 2020 at 06:14:01PM -0600, Gustavo A. R. Silva wrote:
>  drivers/iommu/qcom_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

