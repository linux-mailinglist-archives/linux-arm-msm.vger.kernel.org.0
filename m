Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512751F7309
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 06:32:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgFLEcz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 00:32:55 -0400
Received: from mga14.intel.com ([192.55.52.115]:37119 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726349AbgFLEcz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 00:32:55 -0400
IronPort-SDR: x8XuFO5x3yeTjrJZIjf7kMat0ox0qOucNmv6zXz8eisGxxAKYrn0LkQQ1Vhy53H/lTqxgztb7P
 vBVFYj3fXUUA==
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 21:19:36 -0700
IronPort-SDR: SZXQMQoW3Ki+xpFGrnje9fvj1DPKRl93Oxp8EcFbXcb3Igj8sIP3ncKFgPKas5MBmuE6XJxqf/
 hUtzHKCmaI4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,501,1583222400"; 
   d="gz'50?scan'50,208,50";a="260862280"
Received: from lkp-server01.sh.intel.com (HELO b6eec31c25be) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 11 Jun 2020 21:19:33 -0700
Received: from kbuild by b6eec31c25be with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jjbAC-0000U4-V3; Fri, 12 Jun 2020 04:19:32 +0000
Date:   Fri, 12 Jun 2020 12:19:16 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Cc:     kbuild-all@lists.01.org, iommu@lists.linux-foundation.org,
        freedreno@lists.freedesktop.org, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/7] iommu/arm-smmu: Add a pointer to the attached
 device to smmu_domain
Message-ID: <202006121228.zULQUJG2%lkp@intel.com>
References: <20200611222128.28826-5-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="oyUTqETQ0mS9luUI"
Content-Disposition: inline
In-Reply-To: <20200611222128.28826-5-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--oyUTqETQ0mS9luUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jordan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.7 next-20200611]
[cannot apply to iommu/next robh/for-next arm/for-next keystone/next rockchip/for-next arm64/for-next/core shawnguo/for-next soc/for-next]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Jordan-Crouse/iommu-arm-smmu-Enable-split-pagetable-support/20200612-094718
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b961f8dc8976c091180839f4483d67b7c2ca2578
config: arm64-randconfig-s031-20200612 (attached as .config)
compiler: aarch64-linux-gcc (GCC) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-250-g42323db3-dirty
        # save the attached .config to linux build tree
        make W=1 C=1 ARCH=arm64 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

drivers/iommu/arm-smmu.c: In function 'arm_smmu_init_domain_context':
>> drivers/iommu/arm-smmu.c:804:21: error: 'dev' undeclared (first use in this function); did you mean 'cdev'?
804 |  smmu_domain->dev = dev;
|                     ^~~
|                     cdev
drivers/iommu/arm-smmu.c:804:21: note: each undeclared identifier is reported only once for each function it appears in

vim +804 drivers/iommu/arm-smmu.c

   669	
   670	static int arm_smmu_init_domain_context(struct iommu_domain *domain,
   671						struct arm_smmu_device *smmu)
   672	{
   673		int irq, start, ret = 0;
   674		unsigned long ias, oas;
   675		struct io_pgtable_ops *pgtbl_ops;
   676		struct io_pgtable_cfg pgtbl_cfg;
   677		enum io_pgtable_fmt fmt;
   678		struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
   679		struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
   680	
   681		mutex_lock(&smmu_domain->init_mutex);
   682		if (smmu_domain->smmu)
   683			goto out_unlock;
   684	
   685		if (domain->type == IOMMU_DOMAIN_IDENTITY) {
   686			smmu_domain->stage = ARM_SMMU_DOMAIN_BYPASS;
   687			smmu_domain->smmu = smmu;
   688			goto out_unlock;
   689		}
   690	
   691		/*
   692		 * Mapping the requested stage onto what we support is surprisingly
   693		 * complicated, mainly because the spec allows S1+S2 SMMUs without
   694		 * support for nested translation. That means we end up with the
   695		 * following table:
   696		 *
   697		 * Requested        Supported        Actual
   698		 *     S1               N              S1
   699		 *     S1             S1+S2            S1
   700		 *     S1               S2             S2
   701		 *     S1               S1             S1
   702		 *     N                N              N
   703		 *     N              S1+S2            S2
   704		 *     N                S2             S2
   705		 *     N                S1             S1
   706		 *
   707		 * Note that you can't actually request stage-2 mappings.
   708		 */
   709		if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
   710			smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
   711		if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
   712			smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
   713	
   714		/*
   715		 * Choosing a suitable context format is even more fiddly. Until we
   716		 * grow some way for the caller to express a preference, and/or move
   717		 * the decision into the io-pgtable code where it arguably belongs,
   718		 * just aim for the closest thing to the rest of the system, and hope
   719		 * that the hardware isn't esoteric enough that we can't assume AArch64
   720		 * support to be a superset of AArch32 support...
   721		 */
   722		if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_L)
   723			cfg->fmt = ARM_SMMU_CTX_FMT_AARCH32_L;
   724		if (IS_ENABLED(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) &&
   725		    !IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_ARM_LPAE) &&
   726		    (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S) &&
   727		    (smmu_domain->stage == ARM_SMMU_DOMAIN_S1))
   728			cfg->fmt = ARM_SMMU_CTX_FMT_AARCH32_S;
   729		if ((IS_ENABLED(CONFIG_64BIT) || cfg->fmt == ARM_SMMU_CTX_FMT_NONE) &&
   730		    (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
   731				       ARM_SMMU_FEAT_FMT_AARCH64_16K |
   732				       ARM_SMMU_FEAT_FMT_AARCH64_4K)))
   733			cfg->fmt = ARM_SMMU_CTX_FMT_AARCH64;
   734	
   735		if (cfg->fmt == ARM_SMMU_CTX_FMT_NONE) {
   736			ret = -EINVAL;
   737			goto out_unlock;
   738		}
   739	
   740		switch (smmu_domain->stage) {
   741		case ARM_SMMU_DOMAIN_S1:
   742			cfg->cbar = CBAR_TYPE_S1_TRANS_S2_BYPASS;
   743			start = smmu->num_s2_context_banks;
   744			ias = smmu->va_size;
   745			oas = smmu->ipa_size;
   746			if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
   747				fmt = ARM_64_LPAE_S1;
   748			} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
   749				fmt = ARM_32_LPAE_S1;
   750				ias = min(ias, 32UL);
   751				oas = min(oas, 40UL);
   752			} else {
   753				fmt = ARM_V7S;
   754				ias = min(ias, 32UL);
   755				oas = min(oas, 32UL);
   756			}
   757			smmu_domain->flush_ops = &arm_smmu_s1_tlb_ops;
   758			break;
   759		case ARM_SMMU_DOMAIN_NESTED:
   760			/*
   761			 * We will likely want to change this if/when KVM gets
   762			 * involved.
   763			 */
   764		case ARM_SMMU_DOMAIN_S2:
   765			cfg->cbar = CBAR_TYPE_S2_TRANS;
   766			start = 0;
   767			ias = smmu->ipa_size;
   768			oas = smmu->pa_size;
   769			if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
   770				fmt = ARM_64_LPAE_S2;
   771			} else {
   772				fmt = ARM_32_LPAE_S2;
   773				ias = min(ias, 40UL);
   774				oas = min(oas, 40UL);
   775			}
   776			if (smmu->version == ARM_SMMU_V2)
   777				smmu_domain->flush_ops = &arm_smmu_s2_tlb_ops_v2;
   778			else
   779				smmu_domain->flush_ops = &arm_smmu_s2_tlb_ops_v1;
   780			break;
   781		default:
   782			ret = -EINVAL;
   783			goto out_unlock;
   784		}
   785		ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
   786					      smmu->num_context_banks);
   787		if (ret < 0)
   788			goto out_unlock;
   789	
   790		cfg->cbndx = ret;
   791		if (smmu->version < ARM_SMMU_V2) {
   792			cfg->irptndx = atomic_inc_return(&smmu->irptndx);
   793			cfg->irptndx %= smmu->num_context_irqs;
   794		} else {
   795			cfg->irptndx = cfg->cbndx;
   796		}
   797	
   798		if (smmu_domain->stage == ARM_SMMU_DOMAIN_S2)
   799			cfg->vmid = cfg->cbndx + 1;
   800		else
   801			cfg->asid = cfg->cbndx;
   802	
   803		smmu_domain->smmu = smmu;
 > 804		smmu_domain->dev = dev;
   805	
   806		pgtbl_cfg = (struct io_pgtable_cfg) {
   807			.pgsize_bitmap	= smmu->pgsize_bitmap,
   808			.ias		= ias,
   809			.oas		= oas,
   810			.coherent_walk	= smmu->features & ARM_SMMU_FEAT_COHERENT_WALK,
   811			.tlb		= smmu_domain->flush_ops,
   812			.iommu_dev	= smmu->dev,
   813		};
   814	
   815		if (smmu->impl && smmu->impl->init_context) {
   816			ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg);
   817			if (ret)
   818				goto out_unlock;
   819		}
   820	
   821		if (smmu_domain->non_strict)
   822			pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
   823	
   824		pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, smmu_domain);
   825		if (!pgtbl_ops) {
   826			ret = -ENOMEM;
   827			goto out_clear_smmu;
   828		}
   829	
   830		/* Update the domain's page sizes to reflect the page table format */
   831		domain->pgsize_bitmap = pgtbl_cfg.pgsize_bitmap;
   832	
   833		if (pgtbl_cfg.quirks & IO_PGTABLE_QUIRK_ARM_TTBR1) {
   834			domain->geometry.aperture_start = ~0UL << ias;
   835			domain->geometry.aperture_end = ~0UL;
   836		} else {
   837			domain->geometry.aperture_end = (1UL << ias) - 1;
   838		}
   839	
   840		domain->geometry.force_aperture = true;
   841	
   842		/* Initialise the context bank with our page table cfg */
   843		arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
   844		arm_smmu_write_context_bank(smmu, cfg->cbndx);
   845	
   846		/*
   847		 * Request context fault interrupt. Do this last to avoid the
   848		 * handler seeing a half-initialised domain state.
   849		 */
   850		irq = smmu->irqs[smmu->num_global_irqs + cfg->irptndx];
   851		ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault,
   852				       IRQF_SHARED, "arm-smmu-context-fault", domain);
   853		if (ret < 0) {
   854			dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
   855				cfg->irptndx, irq);
   856			cfg->irptndx = ARM_SMMU_INVALID_IRPTNDX;
   857		}
   858	
   859		mutex_unlock(&smmu_domain->init_mutex);
   860	
   861		/* Publish page table ops for map/unmap */
   862		smmu_domain->pgtbl_ops = pgtbl_ops;
   863		return 0;
   864	
   865	out_clear_smmu:
   866		__arm_smmu_free_bitmap(smmu->context_map, cfg->cbndx);
   867		smmu_domain->smmu = NULL;
   868	out_unlock:
   869		mutex_unlock(&smmu_domain->init_mutex);
   870		return ret;
   871	}
   872	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--oyUTqETQ0mS9luUI
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
VLwf/z9wfrbKRNoBAA==

--oyUTqETQ0mS9luUI--
