Return-Path: <linux-arm-msm+bounces-98000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLnENV4+uGmxawEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:31:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 693C329E489
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 18:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 55959303AA8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 17:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCBA93D332B;
	Mon, 16 Mar 2026 17:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQw3Blgr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678403D1CA2;
	Mon, 16 Mar 2026 17:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773682165; cv=none; b=UvR7o4g293a/J110Az/aobYfeoVW3T4h4ERxVOXIKct23x63EuIZCU1odajsbYYZ9h+UY9aQg6CtHuCmHZruwRiVwqjkEhx55uyn1ZmPHH2jZMmjfH1PaVSYRWx6NXbwSI4pbVI5v9XfXD3RgdmLcUexf+EAroiTinm6wj58Owg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773682165; c=relaxed/simple;
	bh=wxGX2gFq5BLquXVP03f8zC0BP5xU9gLN5ZVoUeJPYYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FyxGGkiQqz48NBI+MivvvXFTr8/uA4djN9qjWNpSQ/SgE4VheymDBNXzJ2zYJHbgBLY+tit4U8G8ta/kV+pnX3qqFttGHu9ZdDC8PVMK5toAmTDPLCafcePAWtmHa0K0MjOuhX8kFkLf+t05leUsQ7gTMBi3EfEKU07hVhx4gG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQw3Blgr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773682165; x=1805218165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wxGX2gFq5BLquXVP03f8zC0BP5xU9gLN5ZVoUeJPYYw=;
  b=MQw3Blgr6nSpDymMAP/XYCsl3klwX+vhPgJ3CC6ftxZy3cqbf/Xso1HU
   6thS1uDqPdkZU9o4g9CadifWW6c0GVdw3bs7VAS1q7BV86925TlX8OGUN
   WUFcZMcwdvDMhyROXMp/8r4YZuAJZnK+QyeQLZLYFoRnOGvBzgvuGxay3
   BiXRJmrUnZ+mr3wXzgTn7dN+jpnM0e7vjTgcgeuYvi0w/O1OqhTpPmkjn
   vh0y6k7lEhzf3Ccmpzp9MkggzOTDH8g+vDLsTAyUBc4JChg5JeURNjGeI
   Wc5DMJNgylOY8/m+PN2gc+bubVa5vRiaARtH8pJd/RgmhHDZq/lF1SG5T
   A==;
X-CSE-ConnectionGUID: fxWzHr+bSDqog2Yar4VRuQ==
X-CSE-MsgGUID: hrHMeoADT0StZIKEZmsSVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74596434"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74596434"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 10:29:24 -0700
X-CSE-ConnectionGUID: p4T2LBjYQ9+H18eSc/Zk4Q==
X-CSE-MsgGUID: /P4nI6lSQaKad0WXq5uuyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="252507405"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Mar 2026 10:29:20 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2Bki-00000000130-3hfX;
	Mon, 16 Mar 2026 17:29:16 +0000
Date: Tue, 17 Mar 2026 01:28:29 +0800
From: kernel test robot <lkp@intel.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Message-ID: <202603170132.IivRdk9p-lkp@intel.com>
References: <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98000-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 693C329E489
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Anvesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Anvesh-Jain-P/dt-bindings-embedded-controller-Add-EC-bindings-for-Qualcomm-reference-devices/20260314-163112
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa%40oss.qualcomm.com
patch subject: [PATCH v4 2/5] platform: arm64: Add driver for EC found on Qualcomm reference devices
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260317/202603170132.IivRdk9p-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project f46a5153850c1303d687233d4adf699b01041da8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260317/202603170132.IivRdk9p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603170132.IivRdk9p-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/arm64/qcom-hamoa-ec.c:395:31: warning: variable 'cdev' is uninitialized when used here [-Wuninitialized]
     395 |                         dev_err_probe(dev, PTR_ERR(cdev),
         |                                                    ^~~~
   drivers/platform/arm64/qcom-hamoa-ec.c:350:34: note: initialize the variable 'cdev' to silence this warning
     350 |         struct qcom_ec_cooling_dev *cdev;
         |                                         ^
         |                                          = NULL
   1 warning generated.


vim +/cdev +395 drivers/platform/arm64/qcom-hamoa-ec.c

   347	
   348	static int qcom_ec_probe(struct i2c_client *client)
   349	{
   350		struct qcom_ec_cooling_dev *cdev;
   351		struct device *dev = &client->dev;
   352		struct qcom_ec *ec;
   353		int ret, i;
   354	
   355		ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
   356		if (!ec)
   357			return -ENOMEM;
   358	
   359		ec->client = client;
   360	
   361		ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
   362						IRQF_ONESHOT, "qcom_ec", ec);
   363		if (ret < 0)
   364			return dev_err_probe(dev, ret, "Failed to get irq\n");
   365	
   366		i2c_set_clientdata(client, ec);
   367	
   368		ret = qcom_ec_read_fw_version(dev);
   369		if (ret < 0)
   370			return dev_err_probe(dev, ret, "Failed to read ec firmware version\n");
   371	
   372		ret = qcom_ec_thermal_capabilities(dev);
   373		if (ret < 0)
   374			return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
   375	
   376		ret = qcom_ec_sci_evt_control(dev, true);
   377		if (ret < 0)
   378			return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
   379	
   380		ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
   381		if (!ec->ec_cdev)
   382			return -ENOMEM;
   383	
   384		for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
   385			struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
   386			char name[EC_FAN_NAME_SIZE];
   387	
   388			snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
   389			ec_cdev->fan_id = i + 1;
   390			ec_cdev->parent_dev = dev;
   391	
   392			ec_cdev->cdev = thermal_cooling_device_register(name, ec_cdev,
   393									&qcom_ec_thermal_ops);
   394			if (IS_ERR(ec_cdev->cdev)) {
 > 395				dev_err_probe(dev, PTR_ERR(cdev),
   396					      "Thermal cooling device registration failed\n");
   397				ret = -EINVAL;
   398				goto unroll_cooling_dev;
   399			}
   400		}
   401	
   402		return 0;
   403	
   404	unroll_cooling_dev:
   405		for (i--; i >= 0; i--) {
   406			struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
   407	
   408			if (ec_cdev->cdev) {
   409				thermal_cooling_device_unregister(ec_cdev->cdev);
   410				ec_cdev->cdev = NULL;
   411			}
   412		}
   413	
   414		return ret;
   415	}
   416	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

