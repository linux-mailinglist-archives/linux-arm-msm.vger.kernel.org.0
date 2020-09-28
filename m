Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6EC027B7C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 01:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727362AbgI1XPh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 19:15:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:60224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727251AbgI1XPb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 19:15:31 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4447D23A58;
        Mon, 28 Sep 2020 23:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601334522;
        bh=yx7Kl0l4LL/Tx5VWW4V3Yshm8iNUcgJJrDqsEi+/CI0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=esDNOvaQBOKfLSsr97k+I5mnTJEnZaivBEIgHvM19pd79mkh8+Th6XPwP9Dg7Nu8F
         n1JK1azkKbq5XAjhQvWuh8gZeIXNRzYUR0SLDbng3W2pSqMX5+frAs9Kre/PSATOTQ
         1mB7qdIrAZLVKO/Jx9zpQxnEd4tPpiq3CWHfS3ps=
Date:   Tue, 29 Sep 2020 00:08:35 +0100
From:   Will Deacon <will@kernel.org>
To:     kernel test robot <lkp@intel.com>
Cc:     Yu Kuai <yukuai3@huawei.com>, robdclark@gmail.com, joro@8bytes.org,
        kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        yi.zhang@huawei.com
Subject: Re: [PATCH] iommu/qcom: add missing put_device() call in
 qcom_iommu_of_xlate()
Message-ID: <20200928230835.GA12939@willie-the-truck>
References: <20200918011357.909335-1-yukuai3@huawei.com>
 <202009220340.bJfsaeQn%lkp@intel.com>
 <20200921204556.GB3811@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921204556.GB3811@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 09:45:57PM +0100, Will Deacon wrote:
> On Tue, Sep 22, 2020 at 03:13:53AM +0800, kernel test robot wrote:
> > Thank you for the patch! Perhaps something to improve:
> > 
> > [auto build test WARNING on iommu/next]
> > [also build test WARNING on linus/master v5.9-rc6 next-20200921]
> > [cannot apply to robclark/msm-next]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> > 
> > url:    https://github.com/0day-ci/linux/commits/Yu-Kuai/iommu-qcom-add-missing-put_device-call-in-qcom_iommu_of_xlate/20200918-091341
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
> > config: arm64-randconfig-r023-20200920 (attached as .config)
> > compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 4e8c028158b56d9c2142a62464e8e0686bde3584)
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # install arm64 cross compiling tool for clang build
> >         # apt-get install binutils-aarch64-linux-gnu
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm64 
> > 
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/iommu/arm/arm-smmu/qcom_iommu.c:601:4: warning: misleading indentation; statement is not part of the previous 'if' [-Wmisleading-indentation]
> >                            return -EINVAL;
> >                            ^
> >    drivers/iommu/arm/arm-smmu/qcom_iommu.c:599:3: note: previous statement is here
> >                    if (WARN_ON(qcom_iommu != dev_iommu_priv_get(dev)))
> 
> Oh, this looks like a nasty bug. Seems we're missing some braces.

Yu Kuai: please could you send a v2 of this?

Will
