Return-Path: <linux-arm-msm+bounces-37936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFA49C957C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 23:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4D1BB233CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 22:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1F61AF0C2;
	Thu, 14 Nov 2024 22:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dsNrVMYX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CF51AF0DA
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 22:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731625015; cv=none; b=Ld4bszlwN9PVDlgiUWyruhjbyYeCA+WzmK+7QQ0DYunceGExLOvmPevzJferzQjk7lLLLQkA4duzgE5HXSI6bJTUsvYFBBskoI+8e8V0Msn7M9uoVyFomKl9HEVH52efQfNgWFDrNKO+l40fJ//2Bgrz3gtt6rmpepZOEUA9P9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731625015; c=relaxed/simple;
	bh=k4BQ67euoDoJ/SPKCHQxk2IYcNQb9kHPIQ098LSGrVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+BRxpnQpBv5kZ1E9kY2uZvR4NfDuUVKIzavudLDKlqGUfwZvq1JIfxPd6PWrTpYh/HrWSeueYeTMkvwEQet3CGAFq2e8BKGHD2sOKo+YyfLldZmuF7iviSOPPyvIyZQDOhAHvdsdFMPsJybRm/9bEmpAEqerCnVRYMwKc28ovM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dsNrVMYX; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso11884471fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 14:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731625011; x=1732229811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pmfl4ABMHKTZoUV+lq2tWxxUXbB701RvLpr8o/rw01k=;
        b=dsNrVMYXNWl0aefF028mafmGwURInOAtM6YoSW8WzcsJWw4oe3oK23TPGUvohdP3Wo
         /uRskk7fq5ztov2694goPnzL1FW7oDOH3fQICcqQit34GmWG/Q0rcoR2kP5fecYaoirl
         Y6PIbBFjHJhGxegXUO3ZKAcb8xwMu8Op6N6YYyLr4k8qq89DKIPXZGRM3eCPrV90PgE6
         ouDzUfSFghTlpFd81ntB/iQGkEq0/hjUKsluirJ8mAkfddhzJfU5/XcIf1qX/lIJWGs1
         DZsPSQYmc1sC0/R2IhBnN0q3gFVeeN2OONCKc7igyFtYhJk+qUDavB9Pi9lFhRtBEisa
         bgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731625011; x=1732229811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmfl4ABMHKTZoUV+lq2tWxxUXbB701RvLpr8o/rw01k=;
        b=qbbH8W79y6kHB/VRsUTYAXf+jqoxc/O6lLyjTh5BLYr0zB7KCclu+veecf8JzHWogR
         bkoMXGqnDpwHmFjstD77ZIldoLqz5RpkXJMheA0uLB5Ih9BKRyJ72Hy7euHSlaCJJoKD
         WiqCGRW+hLeJDPqSYQwnZCTB+zAcV5Qrl+qJdLAsxmBeWgAfKViMobqU2K0v+mQP/K9j
         2qE285LTsFjN2GLl7tpSFsjP59vZNAkntIJsFZj54kTcr9B/1wfDoD7OqQDKFbPWPGf0
         VXkY5M3QPCQ7bLL47hKuK/vh+PqqBBRre7kKHPRd/CI70+ZYEEu1jVU39PcK2gcqhMmK
         RQ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrWg55QeQsevFG/fBxb7Ya4AoXikDVqJQcXJkcyqe6r/oNfR/cHmjokDB3EERr2DAlQ0EX74kEPkYU1tf+@vger.kernel.org
X-Gm-Message-State: AOJu0YxcI6H1zGQF3igPYuL94P6Za+MCnKEVbjdDapy/kzYE7+7E3QlE
	g7l038dfjztgKHpu5C7dnwiitjMyPoiF22pwA50rQbuXwmrLaMmmGlg/SNKIHTU=
X-Google-Smtp-Source: AGHT+IEhSysQVbCIC6kPYuyMdKoQmxs6cO/QkESpuAOJA6wYmBlWbrN9ca+N830zp4N5gFihdpMAbg==
X-Received: by 2002:a05:651c:221b:b0:2fb:597e:28f5 with SMTP id 38308e7fff4ca-2ff5664c8c2mr17825561fa.2.1731625011301;
        Thu, 14 Nov 2024 14:56:51 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff598907bbsm3303891fa.107.2024.11.14.14.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 14:56:49 -0800 (PST)
Date: Fri, 15 Nov 2024 00:56:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v17 0/5] iommu/arm-smmu: introduction of ACTLR
 implementation for Qualcomm SoCs
Message-ID: <mcyes5nikfr6ptzorlttrzvtjgh5zugmbo5ao3pkh4q2r5h6j4@vonmpvsqykv4>
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>

On Thu, Nov 14, 2024 at 09:37:16PM +0530, Bibek Kumar Patro wrote:
> This patch series consist of six parts and covers the following:
> 
> 1. Provide option to re-enable context caching to retain prefetcher
>    settings during reset and runtime suspend.
> 
> 2. Remove cfg inside qcom_smmu structure and replace it with single
>    pointer to qcom_smmu_match_data avoiding replication of multiple
>    members from same.
> 
> 3. Add support for ACTLR PRR bit setup via adreno-smmu-priv interface.
> 
> 4. Introduce intital set of driver changes to implement ACTLR register
>    for custom prefetcher settings in Qualcomm SoCs.
> 
> 5. Add ACTLR data and support for qcom_smmu_500.
> 
> Resend of v17:
>  Addition of minor fix of the build warning reported by kernel test robot [1] by powerpc_random config [2].
>  [1]:https://lore.kernel.org/all/202411140748.6mcFdJdO-lkp@intel.com/#t
>  [2]:https://download.01.org/0day-ci/archive/20241114/202411140748.6mcFdJdO-lkp@intel.com/config

Nit: then it's not a resend, but a new iteration. RESEND literally means
resending the same patchset.

>  
> Changes in v17 from v16:
>  Tags provided earlier not collected yet on patch 1/5, 3/5, 4/5, 5/5
>  due to the following revisions:
>  - 1/5 : Move the CPRE workaround out of qualcomm specific logic and gate with config
>          , update the silicon-errata.rst file
>  - 2/5 : No changes - reviewed-by tags collected
>  - 3/5 : Move the compatible check before assignment of callback as suggested.
>  - 4/5 : Add the actlr setting for *adreno variant* of MMU-500 as well.
>  - 5/5 : Due to changes in 1/5, minor refactoring had to be done before adding table.
>  Link to v16:
>  https://lore.kernel.org/all/20241008125410.3422512-1-quic_bibekkum@quicinc.com/
> 
> Changes in v16 from v15:
>  - Incorporate Dimitry's suggestion on patch 4/5 to use dev_dbg instead of dev_notice.
>  - Fix kernel test robot warning [1] coming for 32bit architecture configuration.
>  - Updatingthe tags
>  [1]: https://lore.kernel.org/all/202409230343.Q8KnYl2w-lkp@intel.com/
>  Link to v15:
>  https://lore.kernel.org/all/20240920155813.3434021-1-quic_bibekkum@quicinc.com/
> 
> Changes in v15 from v14:
>  - As discussed with Robin and Dmitry modify the actlr table and logic to use
>    compatible string instead of sid, mask for device matching which is
>    similar to qcom_smmu_client_of_match mechanism.
>  - Expand the comment in qcom_smmu500_reset to document reason why CPRE bit is re-enabled again
>    after arm_mmu500_reset resets the bit.
>  - Rearrange the series in order to keep prefetch setting patches in the end.
>  Link to v14:
>  https://lore.kernel.org/all/20240816174259.2056829-1-quic_bibekkum@quicinc.com/
> 
> Changes in v14 from v13:
>  Patch 6/6:
>  - As discussed incorprate changes to carry out PRR implementation only for
>    targets based on MMU-500 by using compat string based SMMU version detection.
>  - Split the set_actlr interface into two separate interface namely set_prr_bit
>    and set_prr_addr to set the prr enable bit and prr page address resepectively.
>  Patch 3/6:
>   - Fix a bug in gfx actlr_config which is uncovered while testing the gfx actlr setting in sc7280
>     during PRR experiment which prevented clients on certain sids of gfx smmmu to be skipped during
>     setting up of the ACTLR values : Fix involves swapping the arguments passed in smr_is_subset to make
>      device smr <from devicetree> a subset of actlr_config table entries < defined in the driver>.
>  Patch 4/6, 5/6:
>   - Sort the actlr table values in increasing order of the SIDs.
>  Link to v13:
>  https://lore.kernel.org/all/20240628140435.1652374-1-quic_bibekkum@quicinc.com/
> 
> Changes in v13 from v12:
>  - Fix the compilation issues reported by kernel test robot [1].
>  [1]: https://lore.kernel.org/all/202406281241.xEX0TWjt-lkp@intel.com/#t
>  Link to v12:
>  https://lore.kernel.org/all/20240626143020.3682243-1-quic_bibekkum@quicinc.com/
> 
> Changes in v12 from v11:
>  Changes to incorporate suggestion from Rob:
>  - Fix the set and reset logic for prr bit as pointed out in v11-6/6.
>  - Rename set_actlr_bit function name to set_prr.
>  - Add extension for PRR name as Partially-Resident-Region in comments
>    for set_prr function.
>  - Add few missing sids for sc7280 in patch-5/6.
>  Link to v11:
>  https://lore.kernel.org/all/20240605121713.3596499-1-quic_bibekkum@quicinc.com/
> 
> Changes in v11 from v10:
>  - Include a new patch 6/6 to add support for ACTLR PRR bit
>    through adreno-smmu-priv interface as suggested by Rob and Dmitry.
>  Link to v10:
>  https://lore.kernel.org/all/20240524131800.2288259-1-quic_bibekkum@quicinc.com/
> 
> Changes in v10 from v9:
>  - Added reviewed-by tags 1/5,2/5,3/5.
>  Changes incorporated:
>  - Remove redundant PRR bit setting from gfx actlr table(patch 4/5,5/5)
>    as this bit needs special handling in the gfx driver along with
>    the associated register settings.
>  Link to discussion on PRR bit:
>  https://lore.kernel.org/all/f2222714-1e00-424e-946d-c314d55541b8@quicinc.com/
>  Link to v9:
>  https://lore.kernel.org/all/20240123144543.9405-1-quic_bibekkum@quicinc.com/
> 
> Changes in v9 from v8:
>  Changes to incorporate suggestions from Konrad as follows:
>  - Re-wrap struct members of actlr_variant in patch 4/5,5/5
>    in a cleaner way.
>  - Move actlr_config members to the header.
>  Link to v8:
>  https://lore.kernel.org/all/20240116150411.23876-1-quic_bibekkum@quicinc.com/
> 
> Changes in v8 from v7:
>  - Added reviewed-by tags on patch 1/5, 2/5.
>  Changes to incorporate suggestions from Pavan and Konrad:
>  - Remove non necessary extra lines.
>  - Use num_smmu and num_actlrcfg to store the array size and use the
>    same to traverse the table and save on sentinel space along with
>    indentation levels.
>  - Refactor blocks containing qcom_smmu_set_actlr to remove block
>    repetition in patch 3/5.
>  - Change copyright year from 2023 to 2022-2023 in patch 3/5.
>  - Modify qcom_smmu_match_data.actlrvar and actlr_variant.actlrcfg to
>    const pointer to a const resource.
>  - use C99 designated initializers and put the address first.
>  Link to v7:
>  https://lore.kernel.org/all/20240109114220.30243-1-quic_bibekkum@quicinc.com/
> 
> Changes in v7 from v6:
>  Changes to incorporate suggestions from Dmitry as follows:
>  - Use io_start address instead of compatible string to identify the
>    correct instance by comparing with smmu start address and check for
>    which smmu the corresponding actlr table is to be picked.
> Link to v6:
> https://lore.kernel.org/all/20231220133808.5654-1-quic_bibekkum@quicinc.com/
> 
> Changes in v6 from v5:
>  - Remove extra Suggested-by tags.
>  - Add return check for arm_mmu500_reset in 1/5 as discussed.
> Link to v5:
> https://lore.kernel.org/all/20231219135947.1623-1-quic_bibekkum@quicinc.com/
> 
> Changes in v5 from v4:
>  New addition:
>  - Modify copyright year in arm-smmu-qcom.h to 2023 from 2022.
>  Changes to incorporate suggestions from Dmitry as follows:
>  - Modify the defines for prefetch in (foo << bar) format
>    as suggested.(FIELD_PREP could not be used in defines
>    is not inside any block/function)
>  Changes to incorporate suggestions from Konrad as follows:
>  - Shift context caching enablement patch as 1/5 instead of 5/5 to
>    be picked up as independent patch.
>  - Fix the codestyle to orient variables in reverse xmas tree format
>    for patch 1/5.
>  - Fix variable name in patch 1/5 as suggested.
>  Link to v4:
> https://lore.kernel.org/all/20231215101827.30549-1-quic_bibekkum@quicinc.com/
> 
> Changes in v4 from v3:
>  New addition:
>  - Remove actlrcfg_size and use NULL end element instead to traverse
>    the actlr table, as this would be a cleaner approach by removing
>    redundancy of actlrcfg_size.
>  - Renaming of actlr set function to arm_smmu_qcom based proprietary
>    convention.
>  - break from loop once sid is found and ACTLR value is initialized
>    in qcom_smmu_set_actlr.
>  - Modify the GFX prefetch value separating into 2 sensible defines.
>  - Modify comments for prefetch defines as per SMMU-500 TRM.
>  Changes to incorporate suggestions from Konrad as follows:
>  - Use Reverse-Christmas-tree sorting wherever applicable.
>  - Pass arguments directly to arm_smmu_set_actlr instead of creating
>    duplicate variables.
>  - Use array indexing instead of direct pointer addressed by new
>    addition of eliminating actlrcfg_size.
>  - Switch the HEX value's case from upper to lower case in SC7280
>    actlrcfg table.
>  Changes to incorporate suggestions from Dmitry as follows:
>  - Separate changes not related to ACTLR support to different commit
>    with patch 5/5.
>  - Using pointer to struct for arguments in smr_is_subset().
>  Changes to incorporate suggestions from Bjorn as follows:
>  - fix the commit message for patch 2/5 to properly document the
>    value space to avoid confusion.
>  Fixed build issues reported by kernel test robot [1] for
>  arm64-allyesconfig [2].
>  [1]: https://lore.kernel.org/all/202312011750.Pwca3TWE-lkp@intel.com/
>  [2]:
> https://download.01.org/0day-ci/archive/20231201/202312011750.Pwca3TWE-lkp@intel.com/config
>  Link to v3:
> https://lore.kernel.org/all/20231127145412.3981-1-quic_bibekkum@quicinc.com/
> 
> Changes in v3 from v2:
>  New addition:
>  - Include patch 3/4 for adding ACTLR support and data for SC7280.
>  - Add driver changes for actlr support in gpu smmu.
>  - Add target wise actlr data and implementation ops for gpu smmu.
>  Changes to incorporate suggestions from Robin as follows:
>  - Match the ACTLR values with individual corresponding SID instead
>    of assuming that any SMR will be programmed to match a superset of
>    the data.
>  - Instead of replicating each elements from qcom_smmu_match_data to
>    qcom_smmu structre during smmu device creation, replace the
>    replicated members with qcom_smmu_match_data structure inside
>    qcom_smmu structre and handle the dereference in places that
>    requires them.
>  Changes to incorporate suggestions from Dmitry and Konrad as follows:
>  - Maintain actlr table inside a single structure instead of
>    nested structure.
>  - Rename prefetch defines to more appropriately describe their
>    behavior.
>  - Remove SM8550 specific implementation ops and roll back to default
>    qcom_smmu_500_impl implementation ops.
>  - Add back the removed comments which are NAK.
>  - Fix commit description for patch 4/4.
>  Link to v2:
> https://lore.kernel.org/all/20231114135654.30475-1-quic_bibekkum@quicinc.com/
> 
> Changes in v2 from v1:
>  - Incorporated suggestions on v1 from Dmitry,Konrad,Pratyush.
>  - Added defines for ACTLR values.
>  - Linked sm8550 implementation structure to corresponding
>    compatible string.
>  - Repackaged actlr value set implementation to separate function.
>  - Fixed indentation errors.
>  - Link to v1:
> https://lore.kernel.org/all/20231103215124.1095-1-quic_bibekkum@quicinc.com/
> 
> Changes in v1 from RFC:
>  - Incorporated suggestion form Robin on RFC
>  - Moved the actlr data table into driver, instead of maintaining
>    it inside soc specific DT and piggybacking on exisiting iommus
>    property (iommu = <SID, MASK, ACTLR>) to set this value during
>    smmu probe.
>  - Link to RFC:
> https://lore.kernel.org/all/a01e7e60-6ead-4a9e-ba90-22a8a6bbd03f@quicinc.com/
> 
> Bibek Kumar Patro (5):
>   iommu/arm-smmu: re-enable context caching in smmu reset operation
>   iommu/arm-smmu: refactor qcom_smmu structure to include single pointer
>   iommu/arm-smmu: add support for PRR bit setup
>   iommu/arm-smmu: introduction of ACTLR for custom prefetcher settings
>   iommu/arm-smmu: add ACTLR data and support for qcom_smmu_500
> 
>  Documentation/arch/arm64/silicon-errata.rst   |   3 +-
>  drivers/iommu/Kconfig                         |  12 ++
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   5 +-
>  .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  |   2 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 105 +++++++++++++++++-
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    |   3 +-
>  drivers/iommu/arm/arm-smmu/arm-smmu.h         |   2 +
>  include/linux/adreno-smmu-priv.h              |  14 +++
>  8 files changed, 140 insertions(+), 6 deletions(-)
> 
> --
> 2.34.1
> 

-- 
With best wishes
Dmitry

