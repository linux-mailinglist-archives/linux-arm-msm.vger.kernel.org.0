Return-Path: <linux-arm-msm+bounces-70228-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A353B3075D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 22:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC2016284D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 20:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C4B33EAE2;
	Thu, 21 Aug 2025 20:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e16NItCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDB4322A1E;
	Thu, 21 Aug 2025 20:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755808464; cv=none; b=Uvglke9KS4nA3VjHJvJUfIsjXZseRCWRRTa0pV9t7bkA4Q8KN+iKfn+sMRm5TcVrR0JZPIxE4oU6VHOpFS/60xBkD0czs2Fpy5CsiYvth/kxQ9yGC8Cj9NHS8zQSofMqLGa3dBaamWIjBvBNMOE4N7KNMspwJgntSvuvUsBAI+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755808464; c=relaxed/simple;
	bh=U0Zv9xWVRHMVUW3bwnQ1taT/AfB91xGbJzGBFeVtNdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ieeze4AoOzXuFu5NF5sG0JM546JN4EcKDYiYH8CIftaiwRgDQ758itHKxQgnztUNkFobaangMmyg72yzrdfGsQFqhw/vV2rDPMECgJf9pNi2BnRrL6v7hc2GE6TRriqKIrpnRvo3vZxyN9L/lVIwfVpeFJIcXOFq1djmybbCfuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e16NItCk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755808464; x=1787344464;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=U0Zv9xWVRHMVUW3bwnQ1taT/AfB91xGbJzGBFeVtNdY=;
  b=e16NItCkMHUSPU/pmZ9UimZTVJIpZFu5e0j9eGVj7eGSnCJHqob211NX
   t2RTjbSxdSvFkIIl1WlZsrAvXxGsd1kqfJ/KPTc1yMNNUveCua8kDz+qv
   zr2PAoiOAw4Xwjo5YDixD/Tz/7magTE6CLwz5fJqflGXcMh0TEr57U1ON
   A5wNaDdfNOvbA6nwFdxx3Fsda+42LWTZw2EG9sBIlgU4JEIxhD8hm9oZU
   DmBGoKXpFez54iLL9uU8ljbTZ+7RSNPtscujrwlFP3TxMGd0K/QPxPG3r
   75JZaqQOK44WFySCYApLVmazJbvC0U9AShWiLaIEx5kG7swhxN/SZtxac
   A==;
X-CSE-ConnectionGUID: zLZaju6XTM+p3K0vWxnQnQ==
X-CSE-MsgGUID: xbbUVUx8TEezfrhsN7HA8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58060802"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="58060802"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 13:34:23 -0700
X-CSE-ConnectionGUID: 5Zh/bL79Q4qiEpcW6oo8Qw==
X-CSE-MsgGUID: vVhSmUzmS+WslFhCOD7wpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; 
   d="scan'208";a="169323007"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 21 Aug 2025 13:34:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upBzC-000Kdt-2j;
	Thu, 21 Aug 2025 20:34:14 +0000
Date: Fri, 22 Aug 2025 04:34:03 +0800
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
Subject: Re: [PATCH v8 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
Message-ID: <202508220436.qjXO4p8r-lkp@intel.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-3-7066680f138a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-3-7066680f138a@oss.qualcomm.com>

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5303936d609e09665deda94eaedf26a0e5c3a087]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250821-074358
base:   5303936d609e09665deda94eaedf26a0e5c3a087
patch link:    https://lore.kernel.org/r/20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-3-7066680f138a%40oss.qualcomm.com
patch subject: [PATCH v8 03/11] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
config: arm-randconfig-r133-20250821 (https://download.01.org/0day-ci/archive/20250822/202508220436.qjXO4p8r-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce: (https://download.01.org/0day-ci/archive/20250822/202508220436.qjXO4p8r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508220436.qjXO4p8r-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tee/tee_core.c:640:33: sparse: sparse: cast removes address space '__user' of expression

vim +/__user +640 drivers/tee/tee_core.c

   618	
   619	static int params_to_supp(struct tee_context *ctx,
   620				  struct tee_ioctl_param __user *uparams,
   621				  size_t num_params, struct tee_param *params)
   622	{
   623		size_t n;
   624	
   625		for (n = 0; n < num_params; n++) {
   626			struct tee_ioctl_param ip;
   627			struct tee_param *p = params + n;
   628	
   629			ip.attr = p->attr;
   630			switch (p->attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
   631			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
   632			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
   633				ip.a = p->u.value.a;
   634				ip.b = p->u.value.b;
   635				ip.c = p->u.value.c;
   636				break;
   637			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
   638			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
   639			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INOUT:
 > 640				ip.a = (u64)p->u.ubuf.uaddr;
   641				ip.b = p->u.ubuf.size;
   642				ip.c = 0;
   643				break;
   644			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
   645			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
   646			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
   647				ip.b = p->u.memref.size;
   648				if (!p->u.memref.shm) {
   649					ip.a = 0;
   650					ip.c = (u64)-1; /* invalid shm id */
   651					break;
   652				}
   653				ip.a = p->u.memref.shm_offs;
   654				ip.c = p->u.memref.shm->id;
   655				break;
   656			default:
   657				ip.a = 0;
   658				ip.b = 0;
   659				ip.c = 0;
   660				break;
   661			}
   662	
   663			if (copy_to_user(uparams + n, &ip, sizeof(ip)))
   664				return -EFAULT;
   665		}
   666	
   667		return 0;
   668	}
   669	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

