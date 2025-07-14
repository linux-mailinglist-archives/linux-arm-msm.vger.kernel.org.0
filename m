Return-Path: <linux-arm-msm+bounces-64864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 692A1B04782
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 20:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246FD3A45B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 18:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60EFF25E471;
	Mon, 14 Jul 2025 18:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qyu7Fvom"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B882253A7;
	Mon, 14 Jul 2025 18:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752519002; cv=none; b=asdlwW0ppdWc1DFZmiMfvq57cvfZVBvEEeH34lqOgj7tGhuTLm48EQAjc4yThDTxpYlqNaxn4DxBf/Z8HgZApYJh8KqjPytPbZUKh/j0ilxQWZebsJyJdp+73esp64BNwAoDqG89c4cEPzQImCGme3Lh+a9zeu2vKK2lBhUvEUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752519002; c=relaxed/simple;
	bh=g/hdVwW4OrDEpaJ2jeOYNUGdpDfpOP3FpqeHfrFX5Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmD3g2W6W3ID2nclMWzHVmTZZXoCPuMIvMnvjsxZenJfoyn8SPjKbTlmofPQLHVK5t7BF+L2Z+pFDShaMZKRXQEEFIvuIMcxWFdu3PgZtRAY3x/jT2j52f37GSfFDtOtb6E3S84xih/dowvfIMI0sNOC9rjulMdEzP3FXqOhg0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qyu7Fvom; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752519001; x=1784055001;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g/hdVwW4OrDEpaJ2jeOYNUGdpDfpOP3FpqeHfrFX5Q4=;
  b=Qyu7FvomqSBeaQc4dV6s/XpHySGK/WmhngPKChdZIiyzTemp/mHHxUQ+
   wkUT1zRxuQOKWgJCeK80t6lJiUIreM8+T5JWn7zymnULEGtL+GoMKPYr0
   3CqmBSR5DTzhVd7QgK+90ybNOQv4pHatS+yVpHACHiWFDXQkXDv/0oMMK
   K8Kbs9EsFFNY32IQ+5PBcEjgCQ8Kv0JZ2Y/UYY6/yt4xurj9wpw9GCuro
   9B6tiLWAtdmNdOI0CzGppga0ZVaVlnIRjjd7fvaCyaIiFaKQsmXhTTEB8
   8TyR3yuCDTQ80rNQUbuKhpYD2F+SpgDF5nwxT7zHdtRDtnsYKH0Zx9I+L
   Q==;
X-CSE-ConnectionGUID: 4XeZdS7fQ8SsdQOuRx6g3A==
X-CSE-MsgGUID: Ochzz3YvRC6TT4cjvcy6gA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66171359"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="66171359"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 11:50:00 -0700
X-CSE-ConnectionGUID: n6iP6M2LTgWMCXmgik1TTw==
X-CSE-MsgGUID: LOJAA0uFQLidXjoFjsHfaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; 
   d="scan'208";a="156651276"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jul 2025 11:49:54 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubOFM-0009EJ-1n;
	Mon, 14 Jul 2025 18:49:52 +0000
Date: Tue, 15 Jul 2025 02:49:15 +0800
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
Subject: Re: [PATCH v6 09/12] tee: add Qualcomm TEE driver
Message-ID: <202507150221.oWiaX1I9-lkp@intel.com>
References: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-9-697fb7d41c36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-9-697fb7d41c36@oss.qualcomm.com>

Hi Amirreza,

kernel test robot noticed the following build errors:

[auto build test ERROR on 835244aba90de290b4b0b1fa92b6734f3ee7b3d9]

url:    https://github.com/intel-lab-lkp/linux/commits/Amirreza-Zarrabi/tee-allow-a-driver-to-allocate-a-tee_device-without-a-pool/20250714-085215
base:   835244aba90de290b4b0b1fa92b6734f3ee7b3d9
patch link:    https://lore.kernel.org/r/20250713-qcom-tee-using-tee-ss-without-mem-obj-v6-9-697fb7d41c36%40oss.qualcomm.com
patch subject: [PATCH v6 09/12] tee: add Qualcomm TEE driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250715/202507150221.oWiaX1I9-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507150221.oWiaX1I9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507150221.oWiaX1I9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/tee/qcomtee/qcomtee.h:12,
                    from drivers/tee/qcomtee/async.c:8:
   drivers/tee/qcomtee/qcomtee_msg.h: In function 'qcomtee_msg_num_ib':
>> drivers/tee/qcomtee/qcomtee_msg.h:172:16: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     172 |         return FIELD_GET(QCOMTEE_MASK_IB, counts);
         |                ^~~~~~~~~
--
   In file included from drivers/tee/qcomtee/qcomtee.h:12,
                    from drivers/tee/qcomtee/core.c:14:
   drivers/tee/qcomtee/qcomtee_msg.h: In function 'qcomtee_msg_num_ib':
>> drivers/tee/qcomtee/qcomtee_msg.h:172:16: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     172 |         return FIELD_GET(QCOMTEE_MASK_IB, counts);
         |                ^~~~~~~~~
   drivers/tee/qcomtee/core.c: In function 'qcomtee_object_user_init':
   drivers/tee/qcomtee/core.c:303:17: warning: function 'qcomtee_object_user_init' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     303 |                 object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
         |                 ^~~~~~
   drivers/tee/qcomtee/core.c: In function 'qcomtee_prepare_msg':
   drivers/tee/qcomtee/core.c:417:26: error: implicit declaration of function 'copy_from_user' [-Wimplicit-function-declaration]
     417 |                 else if (copy_from_user(ptr, u[i].b.uaddr, u[i].b.size))
         |                          ^~~~~~~~~~~~~~
   drivers/tee/qcomtee/core.c: In function 'qcomtee_update_args':
   drivers/tee/qcomtee/core.c:496:26: error: implicit declaration of function 'copy_to_user' [-Wimplicit-function-declaration]
     496 |                 else if (copy_to_user(u[i].b.uaddr, ptr, u[i].b.size))
         |                          ^~~~~~~~~~~~
--
   In file included from drivers/tee/qcomtee/qcomtee.h:12,
                    from drivers/tee/qcomtee/user_obj.c:10:
   drivers/tee/qcomtee/qcomtee_msg.h: In function 'qcomtee_msg_num_ib':
>> drivers/tee/qcomtee/qcomtee_msg.h:172:16: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
     172 |         return FIELD_GET(QCOMTEE_MASK_IB, counts);
         |                ^~~~~~~~~
   drivers/tee/qcomtee/user_obj.c: In function 'qcomtee_cb_params_from_args':
   drivers/tee/qcomtee/user_obj.c:449:29: error: implicit declaration of function 'copy_to_user' [-Wimplicit-function-declaration]
     449 |                         if (copy_to_user(params[i].u.ubuf.uaddr, u[i].b.addr,
         |                             ^~~~~~~~~~~~
   drivers/tee/qcomtee/user_obj.c: In function 'qcomtee_cb_params_to_args':
   drivers/tee/qcomtee/user_obj.c:526:29: error: implicit declaration of function 'copy_from_user' [-Wimplicit-function-declaration]
     526 |                         if (copy_from_user(u[i].b.addr, params[i].u.ubuf.uaddr,
         |                             ^~~~~~~~~~~~~~


vim +/FIELD_GET +172 drivers/tee/qcomtee/qcomtee_msg.h

   169	
   170	static inline unsigned int qcomtee_msg_num_ib(u32 counts)
   171	{
 > 172		return FIELD_GET(QCOMTEE_MASK_IB, counts);
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

