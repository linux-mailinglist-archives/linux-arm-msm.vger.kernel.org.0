Return-Path: <linux-arm-msm+bounces-46724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B406A2571A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 11:40:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D46483A1F58
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 10:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3B7201021;
	Mon,  3 Feb 2025 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4n8tVP2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D06200BA9;
	Mon,  3 Feb 2025 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738579215; cv=none; b=qBFPZh1nuYsH5v0285qe4MMJaEEqf1Y3VlDWObgUgOf7ZNQjn3qUpepw+bOrNMD/EEcaoaLG726u1gzaEVvO2JvuYZdYM/djivluMXZZq5M7NjYytWNGQ1Qkff6aBMvjYlcADAO0l6vG0FxUi40wdbtI+iJLfHkglUUaNhmoKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738579215; c=relaxed/simple;
	bh=d9bnQ06DO7o8o7Yyf6ImAcjPuUXrdTdUfK7SQ7Ls68Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCIlvX9vKHlPPmIqaNfu93Z6xFopSgRvU0h9vEx/EQyKkamtnHFzKf4WXWIGukA+LgzJXSMFu8xGhZZJZ0CfPWRs0wVKyzyVcLpBbFul/gaB/445IezNLxM7r26II6txyKCc9J7lPgjLqDjiwF3+bsgAC7JCgG0xiMCQk+n51kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4n8tVP2; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738579212; x=1770115212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d9bnQ06DO7o8o7Yyf6ImAcjPuUXrdTdUfK7SQ7Ls68Y=;
  b=c4n8tVP2QzxqOL1xt6CVvb1ixzuE3XwwxKm0sNyVkVdeEjZY8nOryS38
   WcTEmtYknpPWd+HolvAPUYuxCu+aFtb8yrWG6S8aSxzUv7LfgNNFt4Dbp
   8QIxG7UZQ1qSs/Q8FjEoEAYYtFKsQo8Fw5rFu+731SmXrPMGkWcyxD+t4
   qWstoLfU4bKUIJGEizX4wwTnqMCgmziKzwnYskXm/shY55UWuRWOyIFHu
   TKD2UT6NnRI/t++fdwgmSa/RFOH4vZayhte/Y6Y84jglI0yOOPsTsEZW7
   TmYUM5Jf8ucI6Y/FcJd1EY4i6xBVCFDIZKyynGcfIOwMY295KTXc+P2Vn
   A==;
X-CSE-ConnectionGUID: ndsNiHF/TRmmcdVouI9yaA==
X-CSE-MsgGUID: M+UlcJ6DTu+eiKtqSfZNUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="41899846"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="41899846"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 02:40:11 -0800
X-CSE-ConnectionGUID: wVdStkHSSNSCc0uj4NkzOQ==
X-CSE-MsgGUID: f6KZqfDiSimv5rhMm+cJ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110084518"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2025 02:40:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tets5-000qoF-16;
	Mon, 03 Feb 2025 10:40:05 +0000
Date: Mon, 3 Feb 2025 18:39:39 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>
Subject: Re: [PATCH v2 6/8] tee: add Qualcomm TEE driver
Message-ID: <202502031838.MfZgQhYA-lkp@intel.com>
References: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-6-297eacd0d34f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-6-297eacd0d34f@quicinc.com>

Hi Amirreza,

kernel test robot noticed the following build errors:

[auto build test ERROR on dab2734f8e9ecba609d66d1dd087a392a7774c04]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250203-104846
base:   dab2734f8e9ecba609d66d1dd087a392a7774c04
patch link:    https://lore.kernel.org/r/20250202-qcom-tee-using-tee-ss-without-mem-obj-v2-6-297eacd0d34f%40quicinc.com
patch subject: [PATCH v2 6/8] tee: add Qualcomm TEE driver
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20250203/202502031838.MfZgQhYA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031838.MfZgQhYA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502031838.MfZgQhYA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tee/qcomtee/call.c:419:40: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     419 |         struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
         |                                               ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:41:1: note: expanded from here
      41 | __free_kfree
         | ^
   include/linux/gfp.h:359:13: note: '__free_pages' declared here
     359 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
>> drivers/tee/qcomtee/call.c:419:40: error: 'cleanup' function '__free_pages' must take 1 parameter
     419 |         struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
         |                                               ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:41:1: note: expanded from here
      41 | __free_kfree
         | ^
   drivers/tee/qcomtee/call.c:421:24: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     421 |         struct qcomtee_arg *u __free(kfree) = NULL;
         |                               ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:42:1: note: expanded from here
      42 | __free_kfree
         | ^
   include/linux/gfp.h:359:13: note: '__free_pages' declared here
     359 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
   drivers/tee/qcomtee/call.c:421:24: error: 'cleanup' function '__free_pages' must take 1 parameter
     421 |         struct qcomtee_arg *u __free(kfree) = NULL;
         |                               ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:42:1: note: expanded from here
      42 | __free_kfree
         | ^
>> drivers/tee/qcomtee/call.c:439:8: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     439 |         oic = kzalloc(sizeof(*oic), GFP_KERNEL);
         |               ^
>> drivers/tee/qcomtee/call.c:439:6: error: incompatible integer to pointer conversion assigning to 'struct qcomtee_object_invoke_ctx *' from 'int' [-Wint-conversion]
     439 |         oic = kzalloc(sizeof(*oic), GFP_KERNEL);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tee/qcomtee/call.c:444:6: error: call to undeclared function 'kcalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     444 |         u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
         |             ^
>> drivers/tee/qcomtee/call.c:444:4: error: incompatible integer to pointer conversion assigning to 'struct qcomtee_arg *' from 'int' [-Wint-conversion]
     444 |         u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
         |           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/qcomtee/call.c:584:39: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     584 |         struct qcomtee_context_data *ctxdata __free(kfree) = NULL;
         |                                              ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:51:1: note: expanded from here
      51 | __free_kfree
         | ^
   include/linux/gfp.h:359:13: note: '__free_pages' declared here
     359 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
   drivers/tee/qcomtee/call.c:584:39: error: 'cleanup' function '__free_pages' must take 1 parameter
     584 |         struct qcomtee_context_data *ctxdata __free(kfree) = NULL;
         |                                              ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:51:1: note: expanded from here
      51 | __free_kfree
         | ^
   drivers/tee/qcomtee/call.c:586:12: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     586 |         ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
         |                   ^
>> drivers/tee/qcomtee/call.c:586:10: error: incompatible integer to pointer conversion assigning to 'struct qcomtee_context_data *' from 'int' [-Wint-conversion]
     586 |         ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tee/qcomtee/call.c:623:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     623 |         kfree(ctxdata);
         |         ^
   drivers/tee/qcomtee/call.c:655:26: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     655 |         struct qcomtee *qcomtee __free(kfree) = NULL;
         |                                 ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:58:1: note: expanded from here
      58 | __free_kfree
         | ^
   include/linux/gfp.h:359:13: note: '__free_pages' declared here
     359 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
   drivers/tee/qcomtee/call.c:655:26: error: 'cleanup' function '__free_pages' must take 1 parameter
     655 |         struct qcomtee *qcomtee __free(kfree) = NULL;
         |                                 ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:58:1: note: expanded from here
      58 | __free_kfree
         | ^
   drivers/tee/qcomtee/call.c:659:12: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     659 |         qcomtee = kzalloc(sizeof(*qcomtee), GFP_KERNEL);
         |                   ^
>> drivers/tee/qcomtee/call.c:659:10: error: incompatible integer to pointer conversion assigning to 'struct qcomtee *' from 'int' [-Wint-conversion]
     659 |         qcomtee = kzalloc(sizeof(*qcomtee), GFP_KERNEL);
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/qcomtee/call.c:721:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     721 |         kfree(qcomtee);
         |         ^
   18 errors generated.
--
>> drivers/tee/qcomtee/core.c:51:11: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      51 |         object = kzalloc(sizeof(*object), GFP_KERNEL);
         |                  ^
>> drivers/tee/qcomtee/core.c:51:9: error: incompatible integer to pointer conversion assigning to 'struct qcomtee_object *' from 'int' [-Wint-conversion]
      51 |         object = kzalloc(sizeof(*object), GFP_KERNEL);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tee/qcomtee/core.c:62:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |         kfree(object->name);
         |         ^
>> drivers/tee/qcomtee/core.c:378:12: error: call to undeclared function 'copy_from_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     378 |                 else if (copy_from_user(ptr, u[i].b.uaddr, u[i].b.size))
         |                          ^
>> drivers/tee/qcomtee/core.c:458:12: error: call to undeclared function 'copy_to_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     458 |                 else if (copy_to_user(u[i].b.uaddr, ptr, u[i].b.size))
         |                          ^
   5 errors generated.
--
>> drivers/tee/qcomtee/user_obj.c:238:4: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     238 |                         kfree(ureq);
         |                         ^
>> drivers/tee/qcomtee/user_obj.c:252:28: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     252 |         struct qcomtee_ureq *ureq __free(kfree) = NULL;
         |                                   ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:59:1: note: expanded from here
      59 | __free_kfree
         | ^
   include/linux/gfp.h:359:13: note: '__free_pages' declared here
     359 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
>> drivers/tee/qcomtee/user_obj.c:252:28: error: 'cleanup' function '__free_pages' must take 1 parameter
     252 |         struct qcomtee_ureq *ureq __free(kfree) = NULL;
         |                                   ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:59:1: note: expanded from here
      59 | __free_kfree
         | ^
>> drivers/tee/qcomtee/user_obj.c:255:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     255 |         ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
         |                ^
>> drivers/tee/qcomtee/user_obj.c:255:7: error: incompatible integer to pointer conversion assigning to 'struct qcomtee_ureq *' from 'int' [-Wint-conversion]
     255 |         ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/qcomtee/user_obj.c:336:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     336 |         kfree(ureq);
         |         ^
   drivers/tee/qcomtee/user_obj.c:352:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     352 |         ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
         |                ^
   drivers/tee/qcomtee/user_obj.c:352:7: error: incompatible integer to pointer conversion assigning to 'struct qcomtee_ureq *' from 'int' [-Wint-conversion]
     352 |         ureq = kzalloc(sizeof(*ureq), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tee/qcomtee/user_obj.c:361:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     361 |                 kfree(ureq);
         |                 ^
   drivers/tee/qcomtee/user_obj.c:370:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     370 |         kfree(uo);
         |         ^
   drivers/tee/qcomtee/user_obj.c:394:42: error: use of undeclared identifier '__free_kfree'; did you mean '__free_pages'?
     394 |         struct qcomtee_user_object *user_object __free(kfree) = NULL;
         |                                                 ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:82:1: note: expanded from here
      82 | __free_kfree
         | ^
   include/linux/gfp.h:359:13: note: '__free_pages' declared here
     359 | extern void __free_pages(struct page *page, unsigned int order);
         |             ^
   drivers/tee/qcomtee/user_obj.c:394:42: error: 'cleanup' function '__free_pages' must take 1 parameter
     394 |         struct qcomtee_user_object *user_object __free(kfree) = NULL;
         |                                                 ^
   include/linux/cleanup.h:200:33: note: expanded from macro '__free'
     200 | #define __free(_name)   __cleanup(__free_##_name)
         |                                   ^
   <scratch space>:82:1: note: expanded from here
      82 | __free_kfree
         | ^
   drivers/tee/qcomtee/user_obj.c:398:16: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     398 |         user_object = kzalloc(sizeof(*user_object), GFP_KERNEL);
         |                       ^
>> drivers/tee/qcomtee/user_obj.c:398:14: error: incompatible integer to pointer conversion assigning to 'struct qcomtee_user_object *' from 'int' [-Wint-conversion]
     398 |         user_object = kzalloc(sizeof(*user_object), GFP_KERNEL);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/tee/qcomtee/user_obj.c:484:8: error: call to undeclared function 'copy_to_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     484 |                         if (copy_to_user(params[i].u.ubuf.uaddr, u[i].b.addr,
         |                             ^
>> drivers/tee/qcomtee/user_obj.c:561:8: error: call to undeclared function 'copy_from_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     561 |                         if (copy_from_user(u[i].b.addr, params[i].u.ubuf.uaddr,
         |                             ^
   drivers/tee/qcomtee/user_obj.c:672:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     672 |                 kfree(ureq);
         |                 ^
   17 errors generated.


vim +419 drivers/tee/qcomtee/call.c

   406	
   407	/**
   408	 * qcomtee_object_invoke() - Invoke a QTEE object.
   409	 * @ctx: TEE context.
   410	 * @arg: ioctl arguments.
   411	 * @params: parameters for the object.
   412	 *
   413	 * Return: On success, returns 0; on failure, returns < 0.
   414	 */
   415	static int qcomtee_object_invoke(struct tee_context *ctx,
   416					 struct tee_ioctl_object_invoke_arg *arg,
   417					 struct tee_param *params)
   418	{
 > 419		struct qcomtee_object_invoke_ctx *oic __free(kfree) = NULL;
   420		struct qcomtee_context_data *ctxdata = ctx->data;
 > 421		struct qcomtee_arg *u __free(kfree) = NULL;
   422		struct qcomtee_object *object;
   423		int i, ret, result;
   424	
   425		if (qcomtee_params_check(params, arg->num_params))
   426			return -EINVAL;
   427	
   428		/* First, handle reserved operations: */
   429		if (arg->op == QCOMTEE_OBJREF_OP_RELEASE) {
   430			del_qtee_object(arg->object, ctxdata);
   431	
   432			return 0;
   433		} else if (arg->op > QCOMTEE_OBJREF_OP_MIN) {
   434			return -EINVAL;
   435		}
   436	
   437		/* Otherwise, invoke a QTEE object: */
   438	
 > 439		oic = kzalloc(sizeof(*oic), GFP_KERNEL);
   440		if (!oic)
   441			return -ENOMEM;
   442	
   443		/* +1 for ending QCOMTEE_ARG_TYPE_INV. */
 > 444		u = kcalloc(arg->num_params + 1, sizeof(*u), GFP_KERNEL);
   445		if (!u)
   446			return -ENOMEM;
   447	
   448		/* Get an object to invoke. */
   449		if (arg->object == TEE_OBJREF_NULL) {
   450			/* Use ROOT if TEE_OBJREF_NULL is invoked. */
   451			if (qcomtee_root_object_check(arg->op, params, arg->num_params))
   452				return -EINVAL;
   453	
   454			object = ROOT_QCOMTEE_OBJECT;
   455		} else if (find_qtee_object(&object, arg->object, ctxdata)) {
   456			return -EINVAL;
   457		}
   458	
   459		ret = qcomtee_params_to_args(u, params, arg->num_params, ctx);
   460		if (ret)
   461			goto out;
   462	
   463		ret = qcomtee_object_do_invoke(oic, object, arg->op, u, &result);
   464		if (ret) {
   465			qcomtee_arg_for_each_input_object(i, u) {
   466				qcomtee_user_object_set_notify(u[i].o, false);
   467				qcomtee_object_put(u[i].o);
   468			}
   469	
   470			goto out;
   471		}
   472	
   473		if (!result) {
   474			/* Assume service is UNAVAIL if unable to process the result. */
   475			if (qcomtee_params_from_args(params, u, arg->num_params, ctx))
   476				result = QCOMTEE_MSG_ERROR_UNAVAIL;
   477		} else {
   478			/*
   479			 * qcomtee_params_to_args() gets a copy of IO for the driver to
   480			 * make sure they do not get released while in the middle of
   481			 * invocation. On success (!result), qcomtee_params_from_args()
   482			 * puts them.
   483			 */
   484			qcomtee_arg_for_each_input_object(i, u)
   485				qcomtee_object_put(u[i].o);
   486		}
   487	
   488		arg->ret = result;
   489	out:
   490		qcomtee_object_put(object);
   491	
   492		return ret;
   493	}
   494	
   495	/**
   496	 * qcomtee_supp_recv() - Wait for a request for the supplicant.
   497	 * @ctx: TEE context.
   498	 * @op: requested operation on the object.
   499	 * @num_params: number of elements in the parameter array.
   500	 * @params: parameters for @op.
   501	 *
   502	 * The first parameter is a meta %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT.
   503	 * On input, it provides a user buffer. This buffer is used for parameters of
   504	 * type %TEE_IOCTL_PARAM_ATTR_TYPE_UBUF_INPUT in qcomtee_cb_params_from_args().
   505	 * On output, the object ID and request ID are stored in the meta parameter.
   506	 *
   507	 * @num_params is updated to the number of parameters that actually exist
   508	 * in @params on return.
   509	 *
   510	 * Return: On success, returns 0; on failure, returns < 0.
   511	 */
   512	static int qcomtee_supp_recv(struct tee_context *ctx, u32 *op, u32 *num_params,
   513				     struct tee_param *params)
   514	{
   515		struct qcomtee_user_object_request_data data;
   516		void __user *uaddr;
   517		size_t ubuf_size;
   518		int i, ret;
   519	
   520		if (!*num_params)
   521			return -EINVAL;
   522	
   523		/* We expect the first parameter to be an INOUT + meta parameter. */
   524		if (params->attr !=
   525		    (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_INOUT | TEE_IOCTL_PARAM_ATTR_META))
   526			return -EINVAL;
   527	
   528		/* Other parameters are none. */
   529		for (i = 1; i < *num_params; i++)
   530			if (params[i].attr)
   531				return -EINVAL;
   532	
   533		if (!IS_ALIGNED(params->u.value.a, 8))
   534			return -EINVAL;
   535	
   536		/* User buffer and size from meta parameter. */
   537		uaddr = u64_to_user_ptr(params->u.value.a);
   538		ubuf_size = params->u.value.b;
   539		/* Process TEE parameters. +/-1 to ignore the meta parameter. */
   540		ret = qcomtee_user_object_select(ctx, params + 1, *num_params - 1,
   541						 uaddr, ubuf_size, &data);
   542		if (ret)
   543			return ret;
   544	
   545		params->u.value.a = data.object_id;
   546		params->u.value.b = data.id;
   547		params->u.value.c = 0;
   548		*op = data.op;
   549		*num_params = data.np + 1;
   550	
   551		return 0;
   552	}
   553	
   554	/**
   555	 * qcomtee_supp_send() - Submit a response for a request.
   556	 * @ctx: TEE context.
   557	 * @errno: return value for the request.
   558	 * @num_params: number of elements in the parameter array.
   559	 * @params: returned parameters.
   560	 *
   561	 * The first parameter is a meta %TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT.
   562	 * It specifies the request ID this response belongs to.
   563	 *
   564	 * Return: On success, returns 0; on failure, returns < 0.
   565	 */
   566	static int qcomtee_supp_send(struct tee_context *ctx, u32 errno, u32 num_params,
   567				     struct tee_param *params)
   568	{
   569		if (!num_params)
   570			return -EINVAL;
   571	
   572		/* We expect the first parameter to be an OUTPUT + meta parameter. */
   573		if (params->attr != (TEE_IOCTL_PARAM_ATTR_TYPE_VALUE_OUTPUT |
   574				     TEE_IOCTL_PARAM_ATTR_META))
   575			return -EINVAL;
   576	
   577		/* Process TEE parameters. +/-1 to ignore the meta parameter. */
   578		return qcomtee_user_object_submit(ctx, params + 1, num_params - 1,
   579						  params->u.value.a, errno);
   580	}
   581	
   582	static int qcomtee_open(struct tee_context *ctx)
   583	{
   584		struct qcomtee_context_data *ctxdata __free(kfree) = NULL;
   585	
 > 586		ctxdata = kzalloc(sizeof(*ctxdata), GFP_KERNEL);
   587		if (!ctxdata)
   588			return -ENOMEM;
   589	
   590		idr_init(&ctxdata->qtee_objects_idr);
   591		spin_lock_init(&ctxdata->qtee_lock);
   592		idr_init(&ctxdata->reqs_idr);
   593		INIT_LIST_HEAD(&ctxdata->reqs_list);
   594		mutex_init(&ctxdata->reqs_lock);
   595		init_completion(&ctxdata->req_c);
   596	
   597		ctx->data = no_free_ptr(ctxdata);
   598	
   599		return 0;
   600	}
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

