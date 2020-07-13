Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60D6B21E204
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 23:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgGMV03 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 17:26:29 -0400
Received: from mga04.intel.com ([192.55.52.120]:63516 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726416AbgGMV02 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 17:26:28 -0400
IronPort-SDR: y+v7CrR6hX72XtDjVYxSzwN1LklNNeowvNrq9/7wUm48ZlgcvPbmTR8lQMG6ZhgFVlrKa7kArP
 QA+jCz3AJnyQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="146213709"
X-IronPort-AV: E=Sophos;i="5.75,348,1589266800"; 
   d="scan'208";a="146213709"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2020 14:26:28 -0700
IronPort-SDR: wl6dTmbNOz5n9G3weeYoKBT1IgauYfprPYVf8slN86O+c9kPvftuaseYdwg/g/Gm0/gS+0CdwF
 MBp6gZHTxhSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,348,1589266800"; 
   d="scan'208";a="285534434"
Received: from lkp-server02.sh.intel.com (HELO fb03a464a2e3) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Jul 2020 14:26:25 -0700
Received: from kbuild by fb03a464a2e3 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jv5xw-0000zQ-Cf; Mon, 13 Jul 2020 21:26:24 +0000
Date:   Tue, 14 Jul 2020 05:25:30 +0800
From:   kernel test robot <lkp@intel.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH] iommu/arm-smmu: arm_smmu_setup_identity() can be static
Message-ID: <20200713212530.GA87620@1f5a2ab6ad98>
References: <20200709050145.3520931-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709050145.3520931-2-bjorn.andersson@linaro.org>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Signed-off-by: kernel test robot <lkp@intel.com>
---
 arm-smmu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 2e27cf9815ab6..fb85e716ae9ac 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1924,7 +1924,7 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-int arm_smmu_setup_identity(struct arm_smmu_device *smmu)
+static int arm_smmu_setup_identity(struct arm_smmu_device *smmu)
 {
 	int i;
 
