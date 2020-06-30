Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0CAC20F1AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 11:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730256AbgF3Jd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 05:33:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729193AbgF3Jd2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 05:33:28 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771B6C061755;
        Tue, 30 Jun 2020 02:33:28 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 1479826B; Tue, 30 Jun 2020 11:33:26 +0200 (CEST)
Date:   Tue, 30 Jun 2020 11:33:24 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Joe Perches <joe@perches.com>
Cc:     Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Possible PATCH] iommu/qcom: Change CONFIG_BIG_ENDIAN to
 CONFIG_CPU_BIG_ENDIAN
Message-ID: <20200630093324.GD28824@8bytes.org>
References: <5a663096b489b86472fe3bfbd5138c411d669bad.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a663096b489b86472fe3bfbd5138c411d669bad.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 06, 2020 at 12:16:17PM -0700, Joe Perches wrote:
> CONFIG_BIG_ENDIAN does not exist as a Kconfig symbol.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> 
> I don't have the hardware, so I can't tell if this is a
> correct change, but it is a logical one.
> 
> Found by a test script that looks for IS_ENABLED(FOO)
> where FOO must also exist in Kconfig files.
> 
>  drivers/iommu/qcom_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.
