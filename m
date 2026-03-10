Return-Path: <linux-arm-msm+bounces-96499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLOdF/q3r2mKbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:19:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9494245C92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 07:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A83B304C608
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 06:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2F1F320CAD;
	Tue, 10 Mar 2026 06:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dv+D72SI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38D4264A97;
	Tue, 10 Mar 2026 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773123575; cv=none; b=BGT8smkYiMX4Z7qsTPJdYPLaf+hIAzL5wEQErt++9ba3eKioyf1XK8brpiq1/ty+qQKdYNeKFZ/pNT4HklVIo7KGNPOFZTyDM4BdOXLxTEp9jBT56kriFh2RfuKiERs8+vzLFYJTv+bNLxKj78TmDLIcfpGGaGDnCTkPyIB6Pl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773123575; c=relaxed/simple;
	bh=Qc+fA2dy/0av/8fzQkRGgmdyXlmAQc0dSTfKkwbpp2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gb7XGoL15Jbzq81DD3qVPbnEgBV0ECVdWTuzrK3TRKulYV6qsHYS+K+z/dI/DqB0IeIGCa9t9uQZjMF2Ofy5kdqGzm6Q/CpRuh/euhgwWnqPbpbQVMjvjhZJvIRpqyplB6aBqKbY7gzbevjsKtV95VhqygqTiNQlLd5i4D+5R5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dv+D72SI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773123573; x=1804659573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qc+fA2dy/0av/8fzQkRGgmdyXlmAQc0dSTfKkwbpp2o=;
  b=Dv+D72SIOAcdVassi+vHwcABBWwvYPU3wA4agDwkRd7zwyAiH56vPZtQ
   mdIB+mIeYmLnmkWshbA2z3FSqDQ7zzaBkZRe+V9VcK30GKN74MgfBrx/q
   adv6KIktTaDrJ4FzZW5ZBP9dZIBJU2BD9O4lgSK6GfCeGvG6N0k+xMSFS
   E++ckod8DNkjW5TPJ9O+GYvgdVhaGCYgJ3lO1X6isgKMdnkamnocTid+s
   Xlhd/i/E9GXpjZsYXBAMZbbfzeah0u4D0SQq1/FZqVHeELwjZjMIRBouc
   ufgM7jXzwh5erej8XoVM9zZX4K31Fx2/pNHksEQH4rkHz9pREN2TuAGrS
   Q==;
X-CSE-ConnectionGUID: R6Vl8SyYRLSr9UIedfFmeQ==
X-CSE-MsgGUID: qme370UsRaadwjv0ZApsvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="73861235"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="73861235"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 23:19:33 -0700
X-CSE-ConnectionGUID: Ay38AiUSS4OqjK+vrjfNNA==
X-CSE-MsgGUID: fKJpariwQ8yAee/3VD6/eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="219963162"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Mar 2026 23:19:29 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzqRB-000000001Sm-1ddf;
	Tue, 10 Mar 2026 06:19:25 +0000
Date: Tue, 10 Mar 2026 14:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
	krzk+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	bryan.odonoghue@linaro.org, ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH V3 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Message-ID: <202603101317.ZR8NjiRC-lkp@intel.com>
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
X-Rspamd-Queue-Id: B9494245C92
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-96499-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

Hi Sibi,

kernel test robot noticed the following build errors:

[auto build test ERROR on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Sibi-Sankar/dt-bindings-embedded-controller-Add-EC-bindings-for-Qualcomm-reference-devices/20260309-074148
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260308233646.2318676-3-sibi.sankar%40oss.qualcomm.com
patch subject: [PATCH V3 2/5] platform: arm64: Add driver for EC found on Qualcomm reference devices
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260310/202603101317.ZR8NjiRC-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260310/202603101317.ZR8NjiRC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603101317.ZR8NjiRC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/arm64/qcom-hamoa-ec.c:170:37: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     170 |         cap->fan_cnt = max(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
         |                                            ^
   drivers/platform/arm64/qcom-hamoa-ec.c:56:33: note: expanded from macro 'EC_THERMAL_FAN_CNT'
      56 | #define EC_THERMAL_FAN_CNT(x)           (FIELD_GET(GENMASK(1, 0), (x)))
         |                                          ^
   drivers/platform/arm64/qcom-hamoa-ec.c:171:18: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     171 |         cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
         |                         ^
   drivers/platform/arm64/qcom-hamoa-ec.c:57:34: note: expanded from macro 'EC_THERMAL_FAN_TYPE'
      57 | #define EC_THERMAL_FAN_TYPE(x)          (FIELD_GET(GENMASK(4, 2), (x)))
         |                                          ^
   2 errors generated.


vim +/FIELD_GET +170 drivers/platform/arm64/qcom-hamoa-ec.c

   137	
   138	/*
   139	 * EC Device Thermal Capabilities:
   140	 *
   141	 * Read Response:
   142	 * ----------------------------------------------------------------------
   143	 * | Offset	| Name		| Description				|
   144	 * ----------------------------------------------------------------------
   145	 * | 0x00	| Byte count	| Number of bytes in response		|
   146	 * |		|		| (exluding byte count)			|
   147	 * ----------------------------------------------------------------------
   148	 * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
   149	 * | 0x3	| Capabilities	| Bit 2-4: Type of fan			|
   150	 * |		|		| Bit 5-6: Reserved			|
   151	 * |		|		| Bit 7: Data Valid/Invalid		|
   152	 * |		|		|	 (Valid - 1, Invalid - 0)
   153	 * |		|		| Bit 8-15: Thermistor 0 - 7 presence	|
   154	 * |		|		|	    (0 present, 1 absent)	|
   155	 * ----------------------------------------------------------------------
   156	 *
   157	 */
   158	static int qcom_ec_thermal_capabilities(struct device *dev)
   159	{
   160		struct i2c_client *client = to_i2c_client(dev);
   161		struct qcom_ec *ec = i2c_get_clientdata(client);
   162		struct qcom_ec_thermal_cap *cap = &ec->thermal_cap;
   163		u8 resp[EC_THERMAL_CAP_RESP_LEN];
   164		int ret;
   165	
   166		ret = qcom_ec_read(ec, EC_THERMAL_CAP_CMD, EC_THERMAL_CAP_RESP_LEN, resp);
   167		if (ret < 0)
   168			return ret;
   169	
 > 170		cap->fan_cnt = max(EC_MAX_FAN_CNT, EC_THERMAL_FAN_CNT(resp[1]));
   171		cap->fan_type = EC_THERMAL_FAN_TYPE(resp[1]);
   172		cap->thermistor_mask = EC_THERMAL_THERMISTOR_MASK(resp[2]);
   173	
   174		dev_dbg(dev, "Fan count: %d Fan Type: %d Thermistor Mask: %d\n",
   175			cap->fan_cnt, cap->fan_type, cap->thermistor_mask);
   176	
   177		return 0;
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

