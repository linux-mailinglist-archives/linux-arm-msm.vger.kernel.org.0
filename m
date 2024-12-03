Return-Path: <linux-arm-msm+bounces-40032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E69449E158C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 09:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80703B2E5B8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 08:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853051E00B5;
	Tue,  3 Dec 2024 08:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DS9EMnKI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7B11E0086;
	Tue,  3 Dec 2024 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212927; cv=none; b=VTP/2SmaNKrF04GTsDj1ufDhtslQlBV5cVendMMtDKMQlsIgvukkCnTNHg6fu++p3DspMkzK1XFPN46I6cgls1RgPRkPJk5tVFxVnkP7ijoxvg9UBvUJN0eLF52p+po5DMW2u4X6B2ciBzD+dPcv3LxDlkm4AHJqx/3yDI0IJKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212927; c=relaxed/simple;
	bh=TLdYz69D4oSs9byzuY4TBv15PtsAimwWNEYs64grDXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l56QKj9PXcZ0Ys2741AIR1AT7/fI3hxf6ndcSm+aBmS59mw4lbFg/9wg1hHRr8HHU6lOACQHa5ZR8OpNh9uqOHyHUj36XnWdRw1OHJbU53QvuXvYZ1RXyJiWKMegotoOCedG4tpFdOtw+kZBAublN4eLKB4LrpFyMugE+yETZ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DS9EMnKI; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733212926; x=1764748926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TLdYz69D4oSs9byzuY4TBv15PtsAimwWNEYs64grDXE=;
  b=DS9EMnKIV3kQX/SUG33STGveorN8tQd4CsHUNA35lGHaF+SG11ph+68I
   uVBvYCvw+BcymQzy03OwJYxJSz//h5nNxu6zE7CXnvPmDi14clVdnvUy4
   QBv/+HO2Dt0I7ZUlPHdTB/l5dhE5tNVMbqywqI1bhKgfgeO2wck0pGXn/
   gTHccG5jZ7IbMfHvn2vQ00O/fIh030KZgwZhdSq2BWerOkBVbBZY4hXIU
   L1P7ybeyQKT2DafNO95nSHjE3+176qlq3Z8DhB9a0mimF7FiXtfULskKn
   V0ezUEqaJuvDsscYwurGwocbMDdrlgT8Uk/Cq4oPNBrjyv48ianfJ1uiv
   A==;
X-CSE-ConnectionGUID: dqmHe9+ISHaVghZw6uMf/Q==
X-CSE-MsgGUID: NFb7WOmXT2SlfK1OEPDWLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="20995785"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="20995785"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 00:02:05 -0800
X-CSE-ConnectionGUID: jlSieFyFTw21jcpHKNe2xQ==
X-CSE-MsgGUID: ciUaPcTSQCWYpyhrqVDYag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="93816380"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Dec 2024 00:02:01 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tINr5-0000KF-1C;
	Tue, 03 Dec 2024 08:01:59 +0000
Date: Tue, 3 Dec 2024 16:01:25 +0800
From: kernel test robot <lkp@intel.com>
To: Amirreza Zarrabi <quic_azarrabi@quicinc.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Subject: Re: [PATCH 02/10] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF
Message-ID: <202412031510.Oh9kNGeK-lkp@intel.com>
References: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-2-f502ef01e016@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-2-f502ef01e016@quicinc.com>

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f486c8aa16b8172f63bddc70116a0c897a7f3f02]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20241203-122412
base:   f486c8aa16b8172f63bddc70116a0c897a7f3f02
patch link:    https://lore.kernel.org/r/20241202-qcom-tee-using-tee-ss-without-mem-obj-v1-2-f502ef01e016%40quicinc.com
patch subject: [PATCH 02/10] tee: add TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF
config: i386-buildonly-randconfig-002-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031510.Oh9kNGeK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031510.Oh9kNGeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031510.Oh9kNGeK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tee/tee_core.c: In function 'params_to_supp':
>> drivers/tee/tee_core.c:669:32: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     669 |                         ip.a = (u64)p->u.membuf.uaddr;
         |                                ^


vim +669 drivers/tee/tee_core.c

   648	
   649	static int params_to_supp(struct tee_context *ctx,
   650				  struct tee_ioctl_param __user *uparams,
   651				  size_t num_params, struct tee_param *params)
   652	{
   653		size_t n;
   654	
   655		for (n = 0; n < num_params; n++) {
   656			struct tee_ioctl_param ip;
   657			struct tee_param *p = params + n;
   658	
   659			ip.attr = p->attr;
   660			switch (p->attr & TEE_IOCTL_PARAM_ATTR_TYPE_MASK) {
   661			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INPUT:
   662			case TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT:
   663				ip.a = p->u.value.a;
   664				ip.b = p->u.value.b;
   665				ip.c = p->u.value.c;
   666				break;
   667			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INPUT:
   668			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMBUF_INOUT:
 > 669				ip.a = (u64)p->u.membuf.uaddr;
   670				ip.b = p->u.membuf.size;
   671				ip.c = 0;
   672				break;
   673			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
   674			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
   675			case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
   676				ip.b = p->u.memref.size;
   677				if (!p->u.memref.shm) {
   678					ip.a = 0;
   679					ip.c = (u64)-1; /* invalid shm id */
   680					break;
   681				}
   682				ip.a = p->u.memref.shm_offs;
   683				ip.c = p->u.memref.shm->id;
   684				break;
   685			default:
   686				ip.a = 0;
   687				ip.b = 0;
   688				ip.c = 0;
   689				break;
   690			}
   691	
   692			if (copy_to_user(uparams + n, &ip, sizeof(ip)))
   693				return -EFAULT;
   694		}
   695	
   696		return 0;
   697	}
   698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

