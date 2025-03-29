Return-Path: <linux-arm-msm+bounces-52807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C90A7543B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 05:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 257517A6D20
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Mar 2025 04:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9194135A53;
	Sat, 29 Mar 2025 04:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWGIvbX+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F99D15B543;
	Sat, 29 Mar 2025 04:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743224362; cv=none; b=rNT1sHeiOHjk3adRGZQAuRr9VImQeTMeGyc/EQzhAmTwyy+dQ1JjT/MyJVdO5i0WaII5Jc/yHoDGwXMdJ9c390IE2w4bEr5fR183FHyyAyKte4PPmJkYlIu7mv6PVQBXRGM726UbmFe5z/KqhdkN82DcXwxCeAirkLFDwl1nO/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743224362; c=relaxed/simple;
	bh=2Yne1QbhxA+8CZWwW8yAQd6QasSrkff6bi9RqIVQxpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQSp014BshvfSIDtDt/H51WUVSdp5PZkWhzhnX3t/oXIEi7YGBgfwE2itZub2ZTjjSDOU1Ex72WVSVgctFeWrXYIo2yV1x1r/vdlQuCB08AohbCD7aDXpvQpV3DOUWPVTUhP7YffE2+hkkncPUjs8PDB6VqWt0QIEhI5WwwBAaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWGIvbX+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743224361; x=1774760361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Yne1QbhxA+8CZWwW8yAQd6QasSrkff6bi9RqIVQxpI=;
  b=aWGIvbX+7sPZ3/QLXuOyv4OOr3zwnZ8/Q0x5/Eb67VUfpIjeKxI2bOeN
   baybo38bjoJgkz3NMOWcw2Qn55cKURojY8lKJ4blDNjxfa1dr5H3hk99+
   Sb/gAVgnEOspLXQvJvHF40XaoVLNeOeCPwl/SE0XwEREbVDpAuz2mrrY/
   3OZ0FcajzE3nQF/JBiThjMjohu0hAXyS0xuRX8cDH3TWjqXtG76LCz+hl
   +EwhewQWfVKLm7Ok35Pr5c4ZH8hcdITDuHyFeivlQcytvvVRBJJQfeMBz
   6ct+DtxJWFZ8jD4Xfh8MFEHOdnEaedMndOtA4DOSEFZb3cHCN5Y6WfGUl
   w==;
X-CSE-ConnectionGUID: uWMSZTVoTM6Sm72VM4MaMQ==
X-CSE-MsgGUID: OLmr5RJ3QIKlyHk4bointQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44718738"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="44718738"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 21:59:20 -0700
X-CSE-ConnectionGUID: IhXeNcEpQXmA46pvyVZ4WQ==
X-CSE-MsgGUID: 52fOeOn6QNehvEx91wWYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="162869118"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Mar 2025 21:59:15 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyOHo-0007uc-2j;
	Sat, 29 Mar 2025 04:59:12 +0000
Date: Sat, 29 Mar 2025 12:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Apurupa Pattapu <quic_apurupa@quicinc.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: Re: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Message-ID: <202503291204.imMRd3l7-lkp@intel.com>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d@oss.qualcomm.com>

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on db8da9da41bced445077925f8a886c776a47440c]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250328-104950
base:   db8da9da41bced445077925f8a886c776a47440c
patch link:    https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-3-7f457073282d%40oss.qualcomm.com
patch subject: [PATCH v3 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
config: x86_64-randconfig-122-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291204.imMRd3l7-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291204.imMRd3l7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291204.imMRd3l7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tee/tee_core.c:410:48: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] uaddr @@     got void [noderef] __user * @@
   drivers/tee/tee_core.c:410:48: sparse:     expected void *[noderef] uaddr
   drivers/tee/tee_core.c:410:48: sparse:     got void [noderef] __user *
>> drivers/tee/tee_core.c:413:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got void *[noderef] uaddr @@
   drivers/tee/tee_core.c:413:30: sparse:     expected void const [noderef] __user *ptr
   drivers/tee/tee_core.c:413:30: sparse:     got void *[noderef] uaddr
   drivers/tee/tee_core.c:802:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] uaddr @@     got void [noderef] __user * @@
   drivers/tee/tee_core.c:802:41: sparse:     expected void *[noderef] uaddr
   drivers/tee/tee_core.c:802:41: sparse:     got void [noderef] __user *
   drivers/tee/tee_core.c:805:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *ptr @@     got void *[noderef] uaddr @@
   drivers/tee/tee_core.c:805:30: sparse:     expected void const [noderef] __user *ptr
   drivers/tee/tee_core.c:805:30: sparse:     got void *[noderef] uaddr
>> drivers/tee/tee_core.c:413:30: sparse: sparse: dereference of noderef expression
>> drivers/tee/tee_core.c:413:30: sparse: sparse: dereference of noderef expression
   drivers/tee/tee_core.c:694:37: sparse: sparse: dereference of noderef expression
   drivers/tee/tee_core.c:805:30: sparse: sparse: dereference of noderef expression
   drivers/tee/tee_core.c:805:30: sparse: sparse: dereference of noderef expression

vim +410 drivers/tee/tee_core.c

   378	
   379	static int params_from_user(struct tee_context *ctx, struct tee_param *params,
   380				    size_t num_params,
   381				    struct tee_ioctl_param __user *uparams)
   382	{
   383		size_t n;
   384	
   385		for (n = 0; n < num_params; n++) {
   386			struct tee_shm *shm;
   387			struct tee_ioctl_param ip;
   388	
   389			if (copy_from_user(&ip, uparams + n, sizeof(ip)))
   390				return -EFAULT;
   391	
   392			/* All unused attribute bits has to be zero */
   393			if (ip.attr & ~TEE_IOCTL_PARAM_ATTR_MASK)
   394				return -EINVAL;
   395	
   396			params[n].attr = ip.attr;
   397			switch (ip.attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
   398			case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
   399			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
   400				break;
   401			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
   402			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
   403				params[n].u.value.a = ip.a;
   404				params[n].u.value.b = ip.b;
   405				params[n].u.value.c = ip.c;
   406				break;
   407			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
   408			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
   409			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
 > 410				params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
   411				params[n].u.ubuf.size = ip.b;
   412	
 > 413				if (!access_ok(params[n].u.ubuf.uaddr,
   414					       params[n].u.ubuf.size))
   415					return -EFAULT;
   416	
   417				break;
   418			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
   419			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
   420			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
   421				/*
   422				 * If a NULL pointer is passed to a TA in the TEE,
   423				 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
   424				 * indicating a NULL memory reference.
   425				 */
   426				if (ip.c != TEE_MEMREF_NULL) {
   427					/*
   428					 * If we fail to get a pointer to a shared
   429					 * memory object (and increase the ref count)
   430					 * from an identifier we return an error. All
   431					 * pointers that has been added in params have
   432					 * an increased ref count. It's the callers
   433					 * responibility to do tee_shm_put() on all
   434					 * resolved pointers.
   435					 */
   436					shm = tee_shm_get_from_id(ctx, ip.c);
   437					if (IS_ERR(shm))
   438						return PTR_ERR(shm);
   439	
   440					/*
   441					 * Ensure offset + size does not overflow
   442					 * offset and does not overflow the size of
   443					 * the referred shared memory object.
   444					 */
   445					if ((ip.a + ip.b) < ip.a ||
   446					    (ip.a + ip.b) > shm->size) {
   447						tee_shm_put(shm);
   448						return -EINVAL;
   449					}
   450				} else if (ctx->cap_memref_null) {
   451					/* Pass NULL pointer to OP-TEE */
   452					shm = NULL;
   453				} else {
   454					return -EINVAL;
   455				}
   456	
   457				params[n].u.memref.shm_offs = ip.a;
   458				params[n].u.memref.size = ip.b;
   459				params[n].u.memref.shm = shm;
   460				break;
   461			default:
   462				/* Unknown attribute */
   463				return -EINVAL;
   464			}
   465		}
   466		return 0;
   467	}
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

