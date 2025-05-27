Return-Path: <linux-arm-msm+bounces-59635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41798AC5C32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 23:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0FFE4A6CCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 21:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6138A213253;
	Tue, 27 May 2025 21:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnSfeSmr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1647212B3B;
	Tue, 27 May 2025 21:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748381320; cv=none; b=X/S4vhDZCulqgwr+9v8SE7v+zLfE+++q6tMS/Gsw7Se2ubpA74B28bF/WQk7SKIuxYGzGfCjFgJdmRACmB0rZTFWvYtQpYGuxEyPaig+fxEUUyeKT0is0CThaBfqosyxaO55hlFOO6kYkcBOjUf96T2HMNNQPgfF3JQD5sNDT3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748381320; c=relaxed/simple;
	bh=pvfxwe5X86PEZiMzFXgJ3ebwhN+gbHIPHFzJHUdFvdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poSX/22DlBtyLVL680wnEFcXW1Exzc4zbioR8uwBqA/F1tAdnun3qWonpgtfIPn4CNcZuD1R7QZG+txroHOjw43eRnjydLSZfiYgd2619p9sLvocrXfHTVaYGA1f4uFkfJzXWNTg9qbAfxbTFg2fvmi71sVyvneJ+OrsU5p97cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnSfeSmr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748381319; x=1779917319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pvfxwe5X86PEZiMzFXgJ3ebwhN+gbHIPHFzJHUdFvdU=;
  b=dnSfeSmrFVBleqKy+QQ4QUHjlBfj4lfhLBtTSp2AIo4h1M5S1Ga6rEkH
   zzUB0lQZvgFM70JjKar+XlJBNH7xOJYwXWw0rgEROyBQP+rjkABLk6kzZ
   /ZM+c9/eECrU+CzA/S9+R8bKOgc8/dwsE9e89H0AgdoGENWAwmuhSNL13
   S2XVm+TYCuJtv2GlfEwHElslOFXpGVE4J+SdW3Y7qXPjkYA591rckNv42
   kWbUcidKSFNto8tzfBS49vo+/MugHDFoktcqKM6bV8BrlDBI1hh9Ow402
   M8Sl4vxzbDXuj9U/PpZWKAzHzN7RnofobmXMf/PQIRUgfxAIwSlDzhpo6
   A==;
X-CSE-ConnectionGUID: X9awjNpYQ8GxekHGbVfxPw==
X-CSE-MsgGUID: Fhbgp9jVSF6kvPYKRsPtVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50390359"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="50390359"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 14:28:38 -0700
X-CSE-ConnectionGUID: hfdT22DnS6m7rAqHRMUh6Q==
X-CSE-MsgGUID: dv0lT3O0QW2I1eH/5eXZTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="143953217"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2025 14:28:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK1qZ-000V1c-1Y;
	Tue, 27 May 2025 21:28:31 +0000
Date: Wed, 28 May 2025 05:28:14 +0800
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
Subject: Re: [PATCH v5 09/12] tee: add Qualcomm TEE driver
Message-ID: <202505280538.DVSrdWK7-lkp@intel.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9@oss.qualcomm.com>

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3be1a7a31fbda82f3604b6c31e4f390110de1b46]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250527-151020
base:   3be1a7a31fbda82f3604b6c31e4f390110de1b46
patch link:    https://lore.kernel.org/r/20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-9-024e3221b0b9%40oss.qualcomm.com
patch subject: [PATCH v5 09/12] tee: add Qualcomm TEE driver
config: i386-randconfig-062-20250528 (https://download.01.org/0day-ci/archive/20250528/202505280538.DVSrdWK7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280538.DVSrdWK7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280538.DVSrdWK7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tee/qcomtee/call.c:227:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *uaddr @@     got void *[noderef] uaddr @@
   drivers/tee/qcomtee/call.c:227:38: sparse:     expected void [noderef] __user *uaddr
   drivers/tee/qcomtee/call.c:227:38: sparse:     got void *[noderef] uaddr

vim +227 drivers/tee/qcomtee/call.c

   203	
   204	/**
   205	 * qcomtee_params_to_args() - Convert TEE parameters to QTEE arguments.
   206	 * @u: QTEE arguments.
   207	 * @params: TEE parameters.
   208	 * @num_params: number of elements in the parameter array.
   209	 * @ctx: context in which the conversion should happen.
   210	 *
   211	 * It assumes @u has at least @num_params + 1 entries and has been initialized
   212	 * with %QCOMTEE_ARG_TYPE_INV as &struct qcomtee_arg.type.
   213	 *
   214	 * Return: On success, returns 0; on failure, returns < 0.
   215	 */
   216	static int qcomtee_params_to_args(struct qcomtee_arg *u,
   217					  struct tee_param *params, int num_params,
   218					  struct tee_context *ctx)
   219	{
   220		int i;
   221	
   222		for (i = 0; i < num_params; i++) {
   223			switch (params[i].attr) {
   224			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT:
   225			case TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT:
   226				u[i].flags = QCOMTEE_ARG_FLAGS_UADDR;
 > 227				u[i].b.uaddr = params[i].u.ubuf.uaddr;
   228				u[i].b.size = params[i].u.ubuf.size;
   229	
   230				if (params[i].attr ==
   231				    TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT)
   232					u[i].type = QCOMTEE_ARG_TYPE_IB;
   233				else /* TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_OUTPUT */
   234					u[i].type = QCOMTEE_ARG_TYPE_OB;
   235	
   236				break;
   237			case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_INPUT:
   238				u[i].type = QCOMTEE_ARG_TYPE_IO;
   239				if (qcomtee_objref_to_arg(&u[i], &params[i], ctx))
   240					goto out_failed;
   241	
   242				break;
   243			case TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_OUTPUT:
   244				u[i].type = QCOMTEE_ARG_TYPE_OO;
   245				u[i].o = NULL_QCOMTEE_OBJECT;
   246				break;
   247			default:
   248				goto out_failed;
   249			}
   250		}
   251	
   252		return 0;
   253	
   254	out_failed:
   255		/* Undo qcomtee_objref_to_arg(). */
   256		for (i--; i >= 0; i--) {
   257			if (u[i].type != QCOMTEE_ARG_TYPE_IO)
   258				continue;
   259	
   260			qcomtee_user_object_set_notify(u[i].o, false);
   261			if (typeof_qcomtee_object(u[i].o) == QCOMTEE_OBJECT_TYPE_CB)
   262				qcomtee_object_put(u[i].o);
   263	
   264			qcomtee_object_put(u[i].o);
   265		}
   266	
   267		return -EINVAL;
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

