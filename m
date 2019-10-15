Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FBC3D7283
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 11:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfJOJvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 05:51:17 -0400
Received: from 8bytes.org ([81.169.241.247]:47358 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726525AbfJOJvR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 05:51:17 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 622FF398; Tue, 15 Oct 2019 11:51:15 +0200 (CEST)
Date:   Tue, 15 Oct 2019 11:51:14 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     agross@kernel.org, robdclark@gmail.com,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom: Simplify a test in 'qcom_iommu_add_device()'
Message-ID: <20191015095113.GA14518@8bytes.org>
References: <20190916202936.30403-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916202936.30403-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 16, 2019 at 10:29:36PM +0200, Christophe JAILLET wrote:
> 'iommu_group_get_for_dev()' never returns NULL, so this test can be
> simplified a bit.
> 
> This way, the test is consistent with all other calls to
> 'iommu_group_get_for_dev()'.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/iommu/qcom_iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.
