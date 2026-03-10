Return-Path: <linux-arm-msm+bounces-96500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBbVIZG6r2nNbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:30:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EE0245D3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:30:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A8F8F30185E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 06:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A801933A717;
	Tue, 10 Mar 2026 06:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cGWl8n4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FC2336EDE;
	Tue, 10 Mar 2026 06:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773124234; cv=none; b=SgswDeHgI5IxovnKOjV9AxhGhXIVCAGfecQJVI4/tqpkaJtgl67vsuh9u+V7RxYB0VsYP2jF0+b2Moipa0JA69vJOIE55UTvdh+eXywGNNl4sFzgTdkcKuUNVSf3A59QrwKC1Eun6kCwm29WcFCyygHTJrA9BOJOUATtBJ+BO8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773124234; c=relaxed/simple;
	bh=b0tiJPx27kb7V2zoV7m0LrOZeVP6jVkMiY5HLsLJbdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtO0XhRXrkJSybtz942u5KQZ10sRxQz9bfxtRDT+6qe3LS+NJf0iC6jNAVR/JQbnjsSSncBmqp45w4GYgtE9rUsJtgvOQgLzuz+4o4l/O3n8V0ZR5zKPqK4YkL+IqX/keEgG0dYxLx0OLLStgc2JFxceZznn99ftZZVfjcnZCxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cGWl8n4Z; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773124233; x=1804660233;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b0tiJPx27kb7V2zoV7m0LrOZeVP6jVkMiY5HLsLJbdg=;
  b=cGWl8n4ZH0tW8nG0oG8315V9qnVul19+f0omSI0IU/p65DRhOwXMo9Ji
   sLQo8YNF9fESLTRoqa1jtU5dutWckbVmI14Z+EfXuBHxD0sxLevf6lbhM
   Xl1NzINFHwr6dr0KrJnf0+ejtY+WY5r76+Bkpxn38CIpJ1YKs8juNe+u1
   jeVyf7+T4CpTWETNeNH/UMqh+smQxfMeBUVLbQym7uUQmsgefVH5Ieg+u
   SHursvQDMGeBRKeSKNoi6qAknT3kXdNZ2kTjaoFCWDc/dyYowsjFUH8M/
   R5IcnnuIVd2TR2OAb/xPYuel4pd5PK5Zglg591QIFf2T9r1FtFMI9xl/8
   g==;
X-CSE-ConnectionGUID: k63bo/InTpOqd6+I1D31UQ==
X-CSE-MsgGUID: 1v+zMoktR9eOFvpqNxxNSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78013856"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="78013856"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 23:30:32 -0700
X-CSE-ConnectionGUID: AV9KxH1LRciBf+ShYMqSGg==
X-CSE-MsgGUID: wPmB7sgLRz+J5P2emD/RQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="216417804"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Mar 2026 23:30:29 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzqbq-000000001Tk-1NyS;
	Tue, 10 Mar 2026 06:30:26 +0000
Date: Tue, 10 Mar 2026 14:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
	krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	bryan.odonoghue@linaro.org, ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH V3 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Message-ID: <202603101413.1egT3NBN-lkp@intel.com>
References: <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308233646.2318676-3-sibi.sankar@oss.qualcomm.com>
X-Rspamd-Queue-Id: C6EE0245D3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-96500-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,01.org:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Sibi,

kernel test robot noticed the following build errors:

[auto build test ERROR on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Sibi-Sankar/dt-bindings-embedded-controller-Add-EC-bindings-for-Qualcomm-reference-devices/20260309-074148
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260308233646.2318676-3-sibi.sankar%40oss.qualcomm.com
patch subject: [PATCH V3 2/5] platform: arm64: Add driver for EC found on Qualcomm reference devices
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260310/202603101413.1egT3NBN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101413.1egT3NBN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603101413.1egT3NBN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ioport.h:16,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/platform/arm64/qcom-hamoa-ec.c:7:
   drivers/platform/arm64/qcom-hamoa-ec.c: In function 'qcom_ec_thermal_capabilities':
>> drivers/platform/arm64/qcom-hamoa-ec.c:56:42: error: implicit declaration of function 'FIELD_GET' [-Wimplicit-function-declaration]
      56 | #define EC_THERMAL_FAN_CNT(x)           (FIELD_GET(GENMASK(1, 0), (x)))
         |                                          ^~~~~~~~~
   include/linux/minmax.h:92:35: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   include/linux/minmax.h:112:25: note: in expansion of macro '__careful_cmp'
     112 | #define max(x, y)       __careful_cmp(max, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/platform/arm64/qcom-hamoa-ec.c:170:24: note: in expansion of macro 'max'
     170 |         cap->fan_cnt = max(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
         |                        ^~~
   drivers/platform/arm64/qcom-hamoa-ec.c:170:44: note: in expansion of macro 'EC_THERMAL_FAN_CNT'
     170 |         cap->fan_cnt = max(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
         |                                            ^~~~~~~~~~~~~~~~~~


vim +/FIELD_GET +56 drivers/platform/arm64/qcom-hamoa-ec.c

   > 7	#include <linux/i2c.h>
     8	#include <linux/kernel.h>
     9	#include <linux/module.h>
    10	#include <linux/pm.h>
    11	#include <linux/thermal.h>
    12	
    13	#define EC_SCI_EVT_READ_CMD	0x05
    14	#define EC_FW_VERSION_CMD	0x0e
    15	#define EC_MODERN_STANDBY_CMD	0x23
    16	#define EC_FAN_DBG_CONTROL_CMD	0x30
    17	#define EC_SCI_EVT_CONTROL_CMD	0x35
    18	#define EC_THERMAL_CAP_CMD	0x42
    19	
    20	#define EC_FW_VERSION_RESP_LEN	4
    21	#define EC_THERMAL_CAP_RESP_LEN	3
    22	#define EC_FAN_DEBUG_CMD_LEN	6
    23	#define EC_FAN_SPEED_DATA_SIZE	4
    24	
    25	#define EC_MODERN_STANDBY_ENTER	0x01
    26	#define EC_MODERN_STANDBY_EXIT	0x00
    27	
    28	#define EC_FAN_DEBUG_MODE_ON    BIT(0)
    29	#define EC_FAN_ON               BIT(1)
    30	#define EC_FAN_DEBUG_TYPE_PWM   BIT(2)
    31	#define EC_MAX_FAN_CNT		2
    32	#define EC_FAN_NAME_SIZE	20
    33	#define EC_FAN_MAX_PWM		255
    34	
    35	enum qcom_ec_sci_events {
    36		EC_FAN1_STATUS_CHANGE_EVT = 0x30,
    37		EC_FAN2_STATUS_CHANGE_EVT,
    38		EC_FAN1_SPEED_CHANGE_EVT,
    39		EC_FAN2_SPEED_CHANGE_EVT,
    40		EC_NEW_LUT_SET_EVT,
    41		EC_FAN_PROFILE_SWITCH_EVT,
    42		EC_THERMISTOR_1_THRESHOLD_CROSS_EVT,
    43		EC_THERMISTOR_2_THRESHOLD_CROSS_EVT,
    44		EC_THERMISTOR_3_THRESHOLD_CROSS_EVT,
    45		/* Reserved: 0x39 - 0x3c/0x3f */
    46		EC_RECOVERED_FROM_RESET_EVT = 0x3d,
    47	};
    48	
    49	struct qcom_ec_version {
    50		u8 main_version;
    51		u8 sub_version;
    52		u8 test_version;
    53	};
    54	
    55	struct qcom_ec_thermal_cap {
  > 56	#define EC_THERMAL_FAN_CNT(x)		(FIELD_GET(GENMASK(1, 0), (x)))
    57	#define EC_THERMAL_FAN_TYPE(x)		(FIELD_GET(GENMASK(4, 2), (x)))
    58	#define EC_THERMAL_THERMISTOR_MASK(x)	(FIELD_GET(GENMASK(7, 0), (x)))
    59		u8 fan_cnt;
    60		u8 fan_type;
    61		u8 thermistor_mask;
    62	};
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

