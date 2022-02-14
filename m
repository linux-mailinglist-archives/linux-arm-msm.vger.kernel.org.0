Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 656754B5193
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 14:24:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346810AbiBNNYR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 08:24:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbiBNNYR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 08:24:17 -0500
X-Greylist: delayed 487 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 14 Feb 2022 05:24:09 PST
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E46748889
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Feb 2022 05:24:09 -0800 (PST)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id A1DAB2FB; Mon, 14 Feb 2022 14:15:59 +0100 (CET)
Date:   Mon, 14 Feb 2022 14:15:58 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     will@kernel.org, Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] iommu/rockchip: : Use standard driver registration
Message-ID: <YgpWDkcftsILEjpq@8bytes.org>
References: <05ca5e1b29bdd350f4e20b9ceb031a2c281e23d2.1644005728.git.robin.murphy@arm.com>
 <c08d58bff340da6a829e76d66d2fa090a9718384.1644005728.git.robin.murphy@arm.com>
 <4984895.Adqdaih0Sd@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4984895.Adqdaih0Sd@phil>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 04, 2022 at 10:34:05PM +0100, Heiko Stuebner wrote:
> Am Freitag, 4. Februar 2022, 21:16:41 CET schrieb Robin Murphy:
> > It's been a long time since there was any reason to register IOMMU
> > drivers early. Convert to the standard platform driver helper.
> > 
> > CC: Heiko Stuebner <heiko@sntech.de>
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Applied both, thanks.
