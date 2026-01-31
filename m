Return-Path: <linux-arm-msm+bounces-91342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDyPMrZ6fWlXSQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 04:44:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD88C0921
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 04:44:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D273C300DDDE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 03:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CFB334FF5E;
	Sat, 31 Jan 2026 03:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9j5tRXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A4234F48B;
	Sat, 31 Jan 2026 03:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769831090; cv=none; b=tMq/2XvDIB3znK3oeKPKVMpnhWz9mhUQnA+voxJ8Dsoetej6pjnQhbPIRxeV+0RxYS9r8EzP+w5OSG15reOWAtCWWMdviSCW5wn4ZuIBXPgzVhETl3H0zTjpwowo/rO5BFWWIRzBNhe2FPTj1LXWPCHeWG9oZA8rOPtmI6jeE/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769831090; c=relaxed/simple;
	bh=SNJ583uMJNx90Bhg99QOcCcVg2v0mCbIzORnBliCeMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upI+MJQw58rGO6CS0a7V08/OT0gvnqHjADKrmIPnmAWGbZPQiEKT8BwVUXTZO15iz3IEaCPm1phS4M0axFrTC/u3/q3r0bZShKzPxy/lC4AZglveWug6mCnkkyUN7JczIhMUzWwI0v3szghu+OsJ741uFSaktmjG7OIsAdVRnaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9j5tRXk; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769831089; x=1801367089;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SNJ583uMJNx90Bhg99QOcCcVg2v0mCbIzORnBliCeMs=;
  b=d9j5tRXk7ihV6k56y43NgYhcOT2vWUxDNevZSwvlAoAEoSuXF6zhzqWb
   dOJ0RI83oP0L0bt+k0cfP7Nv/sQE5ct4ubJpu0mtzhYZfNjP4nWm8Mbs5
   q47hu/2mle4QQvzc2mQbczTbXeZqZp7HnaoDuHhD5oXQ8QHO2N843G1bW
   Wp9SoLhMkVei0qxncP5nl0uSL9mq1BoolpVYNuUZHQpNdvgaZovV9jGE/
   YZwg1sUpftWX7d4JX7Rl/fAROX+Y/jI9lLaGdLkI9bwhDTenXfrysdqab
   XfQ/7iDdig8RboI8lEmey7F+i532xQesESXN7+OaPixkVqRGx011fgr4E
   w==;
X-CSE-ConnectionGUID: nM+5ZtU2RA2jkUV7EZjPIA==
X-CSE-MsgGUID: kESTGoW9Tcqu58cn8xWLig==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="88656407"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="88656407"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 19:44:48 -0800
X-CSE-ConnectionGUID: oHVPMhvnTgKnAFf6Zdft0g==
X-CSE-MsgGUID: 3eO9R+ihTLGyNGUvdbWDew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="209369766"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jan 2026 19:44:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm1uc-00000000dcW-02b8;
	Sat, 31 Jan 2026 03:44:42 +0000
Date: Sat, 31 Jan 2026 11:44:35 +0800
From: kernel test robot <lkp@intel.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: Re: [PATCH v2 2/3] Input: aw86938 - add driver for Awinic AW86938
Message-ID: <202601311117.t00gEixW-lkp@intel.com>
References: <20260128-aw86938-driver-v2-2-b51ee086aaf5@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-aw86938-driver-v2-2-b51ee086aaf5@fairphone.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91342-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[fairphone.com,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2DD88C0921
X-Rspamd-Action: no action

Hi Griffin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0364de6be161e2360cbb1f26d5aff5b343ef7bb0]

url:    https://github.com/intel-lab-lkp/linux/commits/Griffin-Kroah-Hartman/dt-bindings-input-awinic-aw86927-Add-Awinic-AW86938/20260129-000753
base:   0364de6be161e2360cbb1f26d5aff5b343ef7bb0
patch link:    https://lore.kernel.org/r/20260128-aw86938-driver-v2-2-b51ee086aaf5%40fairphone.com
patch subject: [PATCH v2 2/3] Input: aw86938 - add driver for Awinic AW86938
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260131/202601311117.t00gEixW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311117.t00gEixW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311117.t00gEixW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/misc/aw86927.c:778:19: warning: cast to smaller integer type 'enum aw86927_model' from 'const void *' [-Wvoid-pointer-to-enum-cast]
     778 |         haptics->model = (enum aw86927_model)device_get_match_data(&client->dev);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +778 drivers/input/misc/aw86927.c

   766	
   767	static int aw86927_probe(struct i2c_client *client)
   768	{
   769		struct aw86927_data *haptics;
   770		int err;
   771	
   772		haptics = devm_kzalloc(&client->dev, sizeof(struct aw86927_data), GFP_KERNEL);
   773		if (!haptics)
   774			return -ENOMEM;
   775	
   776		haptics->dev = &client->dev;
   777		haptics->client = client;
 > 778		haptics->model = (enum aw86927_model)device_get_match_data(&client->dev);
   779	
   780		i2c_set_clientdata(client, haptics);
   781	
   782		haptics->regmap = devm_regmap_init_i2c(client, &aw86927_regmap_config);
   783		if (IS_ERR(haptics->regmap))
   784			return dev_err_probe(haptics->dev, PTR_ERR(haptics->regmap),
   785						"Failed to allocate register map\n");
   786	
   787		haptics->input_dev = devm_input_allocate_device(haptics->dev);
   788		if (!haptics->input_dev)
   789			return -ENOMEM;
   790	
   791		haptics->reset_gpio = devm_gpiod_get(haptics->dev, "reset", GPIOD_OUT_HIGH);
   792		if (IS_ERR(haptics->reset_gpio))
   793			return dev_err_probe(haptics->dev, PTR_ERR(haptics->reset_gpio),
   794					     "Failed to get reset gpio\n");
   795	
   796		/* Hardware reset */
   797		aw86927_hw_reset(haptics);
   798	
   799		/* Software reset */
   800		err = regmap_write(haptics->regmap, AW86927_RSTCFG_REG, AW86927_RSTCFG_SOFTRST);
   801		if (err)
   802			return dev_err_probe(haptics->dev, err,	"Failed Software reset\n");
   803	
   804		/* Wait ~3ms until I2C is accessible */
   805		usleep_range(3000, 3500);
   806	
   807		err = aw86927_detect(haptics);
   808		if (err)
   809			return dev_err_probe(haptics->dev, err, "Failed to find chip\n");
   810	
   811		/* IRQ config */
   812		err = regmap_write(haptics->regmap, AW86927_SYSCTRL4_REG,
   813				   FIELD_PREP(AW86927_SYSCTRL4_INT_MODE_MASK,
   814					      AW86927_SYSCTRL4_INT_MODE_EDGE) |
   815					FIELD_PREP(AW86927_SYSCTRL4_INT_EDGE_MODE_MASK,
   816						   AW86927_SYSCTRL4_INT_EDGE_MODE_POS));
   817		if (err)
   818			return dev_err_probe(haptics->dev, err, "Failed to configure interrupt modes\n");
   819	
   820		err = regmap_write(haptics->regmap, AW86927_SYSINTM_REG,
   821				   AW86927_SYSINTM_BST_OVPM |
   822					AW86927_SYSINTM_FF_AEM |
   823					AW86927_SYSINTM_FF_AFM |
   824					AW86927_SYSINTM_DONEM);
   825		if (err)
   826			return dev_err_probe(haptics->dev, err, "Failed to configure interrupt masks\n");
   827	
   828		err = devm_request_threaded_irq(haptics->dev, client->irq, NULL,
   829						aw86927_irq, IRQF_ONESHOT, NULL, haptics);
   830		if (err)
   831			return dev_err_probe(haptics->dev, err, "Failed to request threaded irq\n");
   832	
   833		INIT_WORK(&haptics->play_work, aw86927_haptics_play_work);
   834	
   835		haptics->input_dev->name = "aw86927-haptics";
   836		haptics->input_dev->close = aw86927_close;
   837	
   838		input_set_drvdata(haptics->input_dev, haptics);
   839		input_set_capability(haptics->input_dev, EV_FF, FF_RUMBLE);
   840	
   841		err = input_ff_create_memless(haptics->input_dev, NULL, aw86927_haptics_play);
   842		if (err)
   843			return dev_err_probe(haptics->dev, err, "Failed to create FF dev\n");
   844	
   845		/* Set up registers */
   846		err = aw86927_play_mode(haptics, AW86927_STANDBY_MODE);
   847		if (err)
   848			return dev_err_probe(haptics->dev, err,
   849					     "Failed to enter standby for Haptic init\n");
   850	
   851		err = aw86927_haptic_init(haptics);
   852		if (err)
   853			return dev_err_probe(haptics->dev, err, "Haptic init failed\n");
   854	
   855		/* RAM init, upload the waveform for playback */
   856		err = aw86927_ram_init(haptics);
   857		if (err)
   858			return dev_err_probe(haptics->dev, err, "Failed to init aw86927 sram\n");
   859	
   860		err = input_register_device(haptics->input_dev);
   861		if (err)
   862			return dev_err_probe(haptics->dev, err, "Failed to register input device\n");
   863	
   864		return 0;
   865	}
   866	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

