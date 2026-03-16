Return-Path: <linux-arm-msm+bounces-97959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBRKOH4EuGlpYAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:24:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8458229A4A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:24:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DCAC300C011
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 13:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A3A397695;
	Mon, 16 Mar 2026 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aObIXB/M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF24B396B76;
	Mon, 16 Mar 2026 13:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773667450; cv=none; b=Owrv4tLNMdnfinPdj0uLFsrmtmWIQ73CO5CVQ748Jrjib/YDA5sCmNqJY0pGVTwrDgoellwwdHq0/vQUTpOu8jOfOYDEES4663y0tk+rLUBlV2+FFhT5ZFG/eGfCPL/YcMOlcQg7Qal1XFgyl5XIvYgIiP9BXVW6YXZvhgXUxVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773667450; c=relaxed/simple;
	bh=NMlLH2VFH/Y5/XY1P7lMtQNhv2RSfsbBoVRQz0IvbBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Obks05p8b/nzSz0OYftF8a+vVePs+667UKIBCP8R4fD+EWfC7h2Ex7Qmnp+s+pP8TGwKVlTbfFRJq/PnAoQ/cr9UVZa51OBVrHLQQ3/oi/x6cRCulhUmzecoA4BbEAdPcTHEGplJhAOOvYQ8vWkP0iwuze9qco9QAhP3hbhXRQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aObIXB/M; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773667448; x=1805203448;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NMlLH2VFH/Y5/XY1P7lMtQNhv2RSfsbBoVRQz0IvbBQ=;
  b=aObIXB/MJSwDGCgEShvQRfMGUrvGXUMiVusF3KJiGQXfyGosrCZfqBhn
   mmhnQbbXIHJdf41lbEa0WL85h2Q8nkpNujpUtB1my6aSTiqcVUJ4PuPGs
   H3gNV35Th34SrJsgQBE/xUg421UdFY+0I5PYs1NfQcBcm3Tl+Y88oEf2m
   EEuSCob3CZNM6/gZRkeGfoBOrgahbiAZCvrEmEHFbGeMN5bKHGerHkNb7
   j+92kkLq7qAgCznZS/RPRyZtUIBjV8EfdBRS3njLwggGozM46XeAOHBwG
   PnZJamVsmabO20Ya4bpDhXNt5SDoq75nwI+fuF3S8hry2eOlaQpY9d5bi
   Q==;
X-CSE-ConnectionGUID: Wq9VJHrZRgGeKdZxCOqRhQ==
X-CSE-MsgGUID: K7VG6avDQumRhldbRDzJVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78529580"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="78529580"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 06:24:07 -0700
X-CSE-ConnectionGUID: 9/YWBNp3T6SmxeRKZ+Wv9w==
X-CSE-MsgGUID: SyKXNVf/Qj6adp44vZHmBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="259821298"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Mar 2026 06:24:04 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w27vM-000000000i6-1PkI;
	Mon, 16 Mar 2026 13:24:00 +0000
Date: Mon, 16 Mar 2026 21:23:33 +0800
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
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
Message-ID: <202603162107.pwsms8tn-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,oss.qualcomm.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97959-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8458229A4A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Anvesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Anvesh-Jain-P/dt-bindings-embedded-controller-Add-EC-bindings-for-Qualcomm-reference-devices/20260314-163112
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa%40oss.qualcomm.com
patch subject: [PATCH v4 2/5] platform: arm64: Add driver for EC found on Qualcomm reference devices
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260316/202603162107.pwsms8tn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603162107.pwsms8tn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603162107.pwsms8tn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/arm64/qcom-hamoa-ec.c: In function 'qcom_ec_probe':
>> drivers/platform/arm64/qcom-hamoa-ec.c:388:63: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 8 [-Wformat-truncation=]
     388 |                 snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
         |                                                               ^~
   drivers/platform/arm64/qcom-hamoa-ec.c:388:50: note: directive argument in the range [-2147483641, 254]
     388 |                 snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/platform/arm64/qcom-hamoa-ec.c:388:17: note: 'snprintf' output between 14 and 24 bytes into a destination of size 20
     388 |                 snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +388 drivers/platform/arm64/qcom-hamoa-ec.c

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
 > 388			snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
   389			ec_cdev->fan_id = i + 1;
   390			ec_cdev->parent_dev = dev;
   391	
   392			ec_cdev->cdev = thermal_cooling_device_register(name, ec_cdev,
   393									&qcom_ec_thermal_ops);
   394			if (IS_ERR(ec_cdev->cdev)) {
   395				dev_err_probe(dev, PTR_ERR(cdev),
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

