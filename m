Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 969CB2298F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 15:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730800AbgGVNKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 09:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgGVNKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 09:10:12 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98589C0619DC;
        Wed, 22 Jul 2020 06:10:12 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 44C622C8; Wed, 22 Jul 2020 15:10:11 +0200 (CEST)
Date:   Wed, 22 Jul 2020 15:10:10 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org
Subject: Re: [PATCH] iommu/qcom: Use domain rather than dev as tlb cookie
Message-ID: <20200722131009.GD27672@8bytes.org>
References: <20200720155217.274994-1-robdclark@gmail.com>
 <CA+G9fYtj1RBYcPhXZRm-qm5ygtdLj1jD8vFZSqQvwi_DNJLBwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtj1RBYcPhXZRm-qm5ygtdLj1jD8vFZSqQvwi_DNJLBwQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 21, 2020 at 12:45:17AM +0530, Naresh Kamboju wrote:
> On Mon, 20 Jul 2020 at 21:21, Rob Clark <robdclark@gmail.com> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The device may be torn down, but the domain should still be valid.  Lets
> > use that as the tlb flush ops cookie.
> >
> > Fixes a problem reported in [1]
> 
> This proposed fix patch applied on top of linux mainline master
> and boot test PASS on db410c.
> 
> The reported problem got fixed.

Is this needed for v5.8/stable? A fixes tag would be great too.

Regards,

	Joerg
