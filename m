Return-Path: <linux-arm-msm+bounces-52801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EA1A75270
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 23:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 434E53B1132
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 22:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB361EF36D;
	Fri, 28 Mar 2025 22:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AbaRMvsh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6891922D4;
	Fri, 28 Mar 2025 22:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743200530; cv=none; b=LFHVwWKfLQhoVWPetYdAXnTcwCJPZXUySbpac/WsPftzYvgbBPfjqMJp3mIB6FlzIsprBm5h6XPDgYyiW4OuzhLKbddd0zcrrqSIls22F+APl2SMCuL4X2OlyBrhKf4syi7EBdMlcWvq1OMJu2NAvSXeY3EXviy/goIfzU4WAac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743200530; c=relaxed/simple;
	bh=G98Z3WGYvhW2A7hi2E5Ks/YG6A7og48XM823kzIjspc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guZ0JwXMT1fWLnIDKb4Mm0bBTJScmVA0t0XwRRjSBakrEkHX7PWYFRY2UTWcRi7yEHwXaXc+PiejU/HUh25H3QSIUcTJg85eNXNy14pbW8mxNShU98Xlx4bB1UzjS8Va4oJQt73pKsGvFAU3wOuNdMilUquzqiYSZIEz96p9zJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AbaRMvsh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743200529; x=1774736529;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G98Z3WGYvhW2A7hi2E5Ks/YG6A7og48XM823kzIjspc=;
  b=AbaRMvshAIw3RLT6aUctkyKTdI8Hd8VjtbAa0GjRG0dPvFV8nmTuqMGW
   UVkUakuQB+cpQAiYxAB79pdCYvJ5TWdC8X/NfCkCJLFAXM6wsQfs08VBc
   9gLeNfA6gpPGGj4aIkUJjD0PYmF106HY19dXjZLLv8YtbKETTlY1yiIQ+
   W9/BUEM02oBCmQ8EwVziJgM1riMDa/+Qpcid+Qwo0Q56d9MebuaVlHLyT
   UtK0lg4WT/9UBFdwVQSazq8r7w9EEVed/oi4lkqXT4qGpwNSCeEf0DkDl
   IM/YQCLuMu2WpE0Sb5P4SoZYsz5faCyeG+luAeENim0CJOH7JYteGUwXT
   Q==;
X-CSE-ConnectionGUID: /SbMZ5nrRWSMqeHDfor1+Q==
X-CSE-MsgGUID: Pl5+x5pDRD6rZCn2kOxuRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="54771485"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="54771485"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 15:22:09 -0700
X-CSE-ConnectionGUID: KYawj+qMRMyHBjjedYu1Iw==
X-CSE-MsgGUID: ZOy7Bdi5RhSgFN2XMyjDdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="156553352"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 28 Mar 2025 15:22:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyI5R-0007ju-2g;
	Fri, 28 Mar 2025 22:22:01 +0000
Date: Sat, 29 Mar 2025 06:21:16 +0800
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
Subject: Re: [PATCH v3 08/11] tee: add Qualcomm TEE driver
Message-ID: <202503290620.2KJEcZM6-lkp@intel.com>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-8-7f457073282d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-8-7f457073282d@oss.qualcomm.com>

Hi Amirreza,

kernel test robot noticed the following build warnings:

[auto build test WARNING on db8da9da41bced445077925f8a886c776a47440c]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250328-104950
base:   db8da9da41bced445077925f8a886c776a47440c
patch link:    https://lore.kernel.org/r/20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-8-7f457073282d%40oss.qualcomm.com
patch subject: [PATCH v3 08/11] tee: add Qualcomm TEE driver
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250329/202503290620.2KJEcZM6-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290620.2KJEcZM6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290620.2KJEcZM6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tee/qcomtee/core.c:310: warning: Function parameter or struct member 'oic' not described in 'qcomtee_object_qtee_init'


vim +310 drivers/tee/qcomtee/core.c

   298	
   299	/**
   300	 * qcomtee_object_qtee_init() - Initialize an object for QTEE.
   301	 * @object: object returned.
   302	 * @object_id: object ID received from QTEE.
   303	 *
   304	 * Return: On failure, returns < 0 and sets @object to %NULL_QCOMTEE_OBJECT.
   305	 *         On success, returns 0
   306	 */
   307	static int qcomtee_object_qtee_init(struct qcomtee_object_invoke_ctx *oic,
   308					    struct qcomtee_object **object,
   309					    unsigned int object_id)
 > 310	{
   311		int ret = 0;
   312	
   313		switch (qcomtee_object_type(object_id)) {
   314		case QCOMTEE_OBJECT_TYPE_NULL:
   315			*object = NULL_QCOMTEE_OBJECT;
   316	
   317			break;
   318		case QCOMTEE_OBJECT_TYPE_CB:
   319			*object = qcomtee_local_object_get(object_id);
   320			if (*object == NULL_QCOMTEE_OBJECT)
   321				ret = -EINVAL;
   322	
   323			break;
   324	
   325		default: /* QCOMTEE_OBJECT_TYPE_TEE */
   326			*object = qcomtee_qtee_object_alloc(oic, object_id);
   327			if (*object == NULL_QCOMTEE_OBJECT)
   328				ret = -ENOMEM;
   329	
   330			break;
   331		}
   332	
   333		return ret;
   334	}
   335	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

