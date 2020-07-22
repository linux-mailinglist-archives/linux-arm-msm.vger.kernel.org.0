Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92FF229B9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 17:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730600AbgGVPjN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 11:39:13 -0400
Received: from 8bytes.org ([81.169.241.247]:58750 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727985AbgGVPjN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 11:39:13 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id D1DC941A; Wed, 22 Jul 2020 17:39:11 +0200 (CEST)
Date:   Wed, 22 Jul 2020 17:39:10 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org
Subject: Re: [PATCH] iommu/qcom: Use domain rather than dev as tlb cookie
Message-ID: <20200722153910.GM27672@8bytes.org>
References: <20200720155217.274994-1-robdclark@gmail.com>
 <CA+G9fYtj1RBYcPhXZRm-qm5ygtdLj1jD8vFZSqQvwi_DNJLBwQ@mail.gmail.com>
 <20200722131009.GD27672@8bytes.org>
 <CAF6AEGteY6Mwy+jQaj6Vo0e4bMW6P1q19PMmdOqQrxr-RQxkQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGteY6Mwy+jQaj6Vo0e4bMW6P1q19PMmdOqQrxr-RQxkQg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 22, 2020 at 07:54:40AM -0700, Rob Clark wrote:
> On Wed, Jul 22, 2020 at 6:10 AM Joerg Roedel <joro@8bytes.org> wrote:
> > Is this needed for v5.8/stable? A fixes tag would be great too.
> 
> looks like, yes:
> 
> Fixes: 09b5dfff9ad6 ("iommu/qcom: Use accessor functions for iommu
> private data")

Thanks, applied to fixes branch.
