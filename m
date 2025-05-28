Return-Path: <linux-arm-msm+bounces-59639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51545AC5DFA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 02:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 133154A4C29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 00:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0139828E8;
	Wed, 28 May 2025 00:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jcbBXaPj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EB87FD;
	Wed, 28 May 2025 00:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748390694; cv=none; b=out4q2IESO2DtzHSfAamHsEM1JohXDo/gi9zy5bmlaKdb3tdg3D8dpmwJ1x7/zgPP9907YuOsrxkgsAmS5pviUpQfND2iFeAFXLbiXaagHcvgfH6w37CKgL8zub6DG+TK+js1BrRi5Cytz7hqVaAbI2JzHAI6SZjiLzyejtiQTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748390694; c=relaxed/simple;
	bh=0EUqTd8s0a0nZiI7FjdMX0MsV8D/5MPI3MWQmgodAv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CraTpMDlO34L3Jngpa4IyFHulT4PnD2x8e/DGk8JHdh4QGEShQZGsPMt8hJN1qz3LE/46H4a7wuCDYE3eg6beoxWWHmX0zCCwGqyRt8OnlXtlK82qcrAiJwUeIJL+HFaYuG7+xzFb4E0r0hMwdNG7fqyzSi/Ua6Flgrb7hqNvoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jcbBXaPj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748390692; x=1779926692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0EUqTd8s0a0nZiI7FjdMX0MsV8D/5MPI3MWQmgodAv4=;
  b=jcbBXaPjvJIKSKhtMlglepA+P0FFY2uE3QPLFKJVfad3WV7NLxSkm9h8
   s/LlbZ62+NgBRNygv1bwKV2iok2DELpwl2QpWd3XOs9OHpN0NYbXTv9X7
   Z+ylx21rKD/ICit8N3lwQJFGY7jzXQhqhxyqfL/I2mNpFak6ZkBUIDiXC
   5VrN29Sufw03glJWqIj33kW4f1tWkdKfibGe81ITK24Hs6+xmDNj32Oz+
   HVLfLLP1yrxozzWJLi6dnuGlvCEFjnxlzmImIk21Xh1tTEQeDb5qs6/FQ
   f8Z6seJOsg8M+5vVNSDQIOKrnO/hh9vt/zWX3x0hVrNLqSgVtfXISuxV7
   A==;
X-CSE-ConnectionGUID: FWA3fnZCT0KhLhBSnyaHKA==
X-CSE-MsgGUID: Mn26YyyxSAGEkPBKJvLooQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="75791712"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="75791712"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 17:04:51 -0700
X-CSE-ConnectionGUID: Z0dzMtooSOi3rlQ5YDayog==
X-CSE-MsgGUID: w/x9uTQuS320aQAasX4eig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="147790475"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 May 2025 17:04:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK4Hk-000V6u-00;
	Wed, 28 May 2025 00:04:44 +0000
Date: Wed, 28 May 2025 08:04:27 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, Harshal Dev <quic_hdev@quicinc.com>,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-doc@vger.kernel.org,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 03/12] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Message-ID: <202505280721.abBn0GaE-lkp@intel.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-3-024e3221b0b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-3-024e3221b0b9@oss.qualcomm.com>

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3be1a7a31fbda82f3604b6c31e4f390110de1b46]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250527-151020
base:   3be1a7a31fbda82f3604b6c31e4f390110de1b46
patch link:    https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-3-024e3221b0b9%40oss.qualcomm.com
patch subject: [PATCH v5 03/12] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
config: arm64-randconfig-r121-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280721.abBn0GaE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250528/202505280721.abBn0GaE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280721.abBn0GaE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/tee/tee_core.c:393:48: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] uaddr @@     got void [noderef] __user * @@
   drivers/tee/tee_core.c:393:48: sparse:     expected void *[noderef] uaddr
   drivers/tee/tee_core.c:393:48: sparse:     got void [noderef] __user *
>> drivers/tee/tee_core.c:396:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *addr @@     got void *[noderef] uaddr @@
   drivers/tee/tee_core.c:396:56: sparse:     expected void const [noderef] __user *addr
   drivers/tee/tee_core.c:396:56: sparse:     got void *[noderef] uaddr
   drivers/tee/tee_core.c:785:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *[noderef] uaddr @@     got void [noderef] __user * @@
   drivers/tee/tee_core.c:785:41: sparse:     expected void *[noderef] uaddr
   drivers/tee/tee_core.c:785:41: sparse:     got void [noderef] __user *
   drivers/tee/tee_core.c:788:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __user *addr @@     got void *[noderef] uaddr @@
   drivers/tee/tee_core.c:788:56: sparse:     expected void const [noderef] __user *addr
   drivers/tee/tee_core.c:788:56: sparse:     got void *[noderef] uaddr
   drivers/tee/tee_core.c:396:46: sparse: sparse: dereference of noderef expression
   drivers/tee/tee_core.c:396:46: sparse: sparse: dereference of noderef expression
   drivers/tee/tee_core.c:677:37: sparse: sparse: dereference of noderef expression
   drivers/tee/tee_core.c:788:46: sparse: sparse: dereference of noderef expression
   drivers/tee/tee_core.c:788:46: sparse: sparse: dereference of noderef expression

vim +396 drivers/tee/tee_core.c

   361	
   362	static int params_from_user(struct tee_context *ctx, struct tee_param *params,
   363				    size_t num_params,
   364				    struct tee_ioctl_param __user *uparams)
   365	{
   366		size_t n;
   367	
   368		for (n = 0; n < num_params; n++) {
   369			struct tee_shm *shm;
   370			struct tee_ioctl_param ip;
   371	
   372			if (copy_from_user(&ip, uparams + n, sizeof(ip)))
   373				return -EFAULT;
   374	
   375			/* All unused attribute bits has to be zero */
   376			if (ip.attr & ~TEE_IOCTL_PARAM_ATTR_MASK)
   377				return -EINVAL;
   378	
   379			params[n].attr = ip.attr;
   380			switch (ip.attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
   381			case TEE_IOCTL_PARAM_ATTR_TYPE_NONE:
   382			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT:
   383				break;
   384			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
   385			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
   386				params[n].u.value.a = ip.a;
   387				params[n].u.value.b = ip.b;
   388				params[n].u.value.c = ip.c;
   389				break;
   390			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
   391			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
   392			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
   393				params[n].u.ubuf.uaddr = u64_to_user_ptr(ip.a);
   394				params[n].u.ubuf.size = ip.b;
   395	
 > 396				if (!access_ok(params[n].u.ubuf.uaddr,
   397					       params[n].u.ubuf.size))
   398					return -EFAULT;
   399	
   400				break;
   401			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
   402			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
   403			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
   404				/*
   405				 * If a NULL pointer is passed to a TA in the TEE,
   406				 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
   407				 * indicating a NULL memory reference.
   408				 */
   409				if (ip.c != TEE_MEMREF_NULL) {
   410					/*
   411					 * If we fail to get a pointer to a shared
   412					 * memory object (and increase the ref count)
   413					 * from an identifier we return an error. All
   414					 * pointers that has been added in params have
   415					 * an increased ref count. It's the callers
   416					 * responibility to do tee_shm_put() on all
   417					 * resolved pointers.
   418					 */
   419					shm = tee_shm_get_from_id(ctx, ip.c);
   420					if (IS_ERR(shm))
   421						return PTR_ERR(shm);
   422	
   423					/*
   424					 * Ensure offset + size does not overflow
   425					 * offset and does not overflow the size of
   426					 * the referred shared memory object.
   427					 */
   428					if ((ip.a + ip.b) < ip.a ||
   429					    (ip.a + ip.b) > shm->size) {
   430						tee_shm_put(shm);
   431						return -EINVAL;
   432					}
   433				} else if (ctx->cap_memref_null) {
   434					/* Pass NULL pointer to OP-TEE */
   435					shm = NULL;
   436				} else {
   437					return -EINVAL;
   438				}
   439	
   440				params[n].u.memref.shm_offs = ip.a;
   441				params[n].u.memref.size = ip.b;
   442				params[n].u.memref.shm = shm;
   443				break;
   444			default:
   445				/* Unknown attribute */
   446				return -EINVAL;
   447			}
   448		}
   449		return 0;
   450	}
   451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

