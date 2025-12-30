Return-Path: <linux-arm-msm+bounces-87002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C19CEA378
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 17:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFD3130245DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 16:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E529422756A;
	Tue, 30 Dec 2025 16:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J258kGX7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CD917AE11
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 16:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767113233; cv=none; b=AJnbze8rmdcgjuKud5Y/GIrjiOw8XAZVVjReUudgz/5v9ldbeVtCdc1bLWjFD0UMXy7VgeGFHhREIR8xpf2LRh5bttY+4Jyp3apCr2ZoEBHgLfbOD+SDvM/CwHvK/biTh5Jjt57IgWQBpo1mLEkWWkSsfMe3X52Z8IgEbNoK4us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767113233; c=relaxed/simple;
	bh=azMGZ+Y/w738X1gTmr+Ft9ox9muQzUuW+4LiLYeeONg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qN5Uzh7G1LundgT466lgdWzJgdw0egHhP/AtIQar5t5DQtQvXFM9iC17X4gEJfpGEAL5wBsT6WgRoBNdq+VEhhrVdAeyy31kmiuoV3QUIb8NNdxD8OHsfXE+od++g3FpGjPg2us1MDfJ7escWgoY7Wv0/6VXQBJJHDdUgx0k3BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J258kGX7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42fb03c3cf2so5140162f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 08:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767113229; x=1767718029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3pfquFHr2E1uP9KAC57iEkcByjX7EFnU9BkMGY8sqcI=;
        b=J258kGX7uHWdgvpGqbYW7ud/5IBSNeAZqxwB9k1PdRmHQZsOUW3VoAYAh0cVZn95Nn
         aYXQQNmZ1XiAikkM9a1YLUFcFIgO11QmHqRmTMScDOdGMh51pgiBi/5PEbWLa6RY7B92
         DxUf/6/D3TDqo8h43HP0Rf7KXVn7hOJMsh/oDDWc2/MbobvJJXS36MEHcoS1/Erow739
         DOiOHE7aC+Gi+c9yTOnT1puB/DL1DHO2727C5ok0CwmlvI8nasDQn1ZKd4FUZRiJOPUW
         oBP59Hz2525bGQBWgw9TeDoxU0g9yk6333TA/eFlMllKxUu21T6y0IzBB4AODh9+1pDM
         JjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767113229; x=1767718029;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pfquFHr2E1uP9KAC57iEkcByjX7EFnU9BkMGY8sqcI=;
        b=UlgK4vhAae8UE1RNavCsxIY+pJZ6k1AF590E8P6xE1rKe9Ij+OyYdwyW98Fer0aqkw
         MCfiwup1JynlWTHXAUaBOza9oFBSsq8WJYpyRdcUgQJopMHMKWyYMSTJB504YGAp0cQ+
         +AMb3Mja6ow7CkTzzk1Mpvg029XJZdULJcWg1X+CA/enCj37ksJ7xIbOalfE7QkaDwsa
         RVFW3ufN2M1xxPXwwf14zo6jG0EfaglSgZ2ZMXqoS94ss4ID0b16ec4bqsT5R/063joN
         yLsbjNymav3+vVI368wV40LXzCCqsnt0dcspl7l5jLo1nKPQXrnjBGnnwIa7d1ivKqlk
         AAsg==
X-Forwarded-Encrypted: i=1; AJvYcCVf3iys8S6Xa4uO0vP9ePARlr1H8qgnlaCS3LomefyyMgIjohs/0rnYtRaDYdnvZMfNVUAltroQci1bRNsN@vger.kernel.org
X-Gm-Message-State: AOJu0YyLQentO1S8k4b9/UgIKgvrGVuigqdB/n3u1zOlBt9fmT36Nsr+
	1pjl92m0aSauqbXBnFq0T6zpK+QEG2+72vQLr1/SO4pEqDKVJPpySrLmmHG6ZJz7eSo=
X-Gm-Gg: AY/fxX4pe7/XeenjKS/NAUZrtVByRp5JujXIhvLDg/gF4FT04TJsXlxlCbz86lWK3py
	1z7gAJ1hsLff/ClZKek8iESVzky6oqsIV3YuJfJ2KL/aaqbaCmWcrvtaO3K2X/wu13DXbf1ddk8
	fkHPG5bHAyF0tgVqx6WMriTUj/tJ//Zp8TuU+i62u7p2ormgzqm/F7EbUKifiYOoMJuUOfqtCak
	A+NbrZ0Iic73l3jlbluvzsScH6zQSqRpYJQty94qejoCJ3xJxt1WDLjlvKW0zfkNRprpatRZ/Zx
	CsOJLgn7LHWubLetni7r2kvGgs5Lzcmi4ftMXOuZnxp95xAbK++IxIy6RCq0MDahdrcIzPsyXdM
	mZwh18H3EV2Lz2fic9JsyZ56+snWEKQn5xEaiZZjGzLVbe4nDqv1hX/JSBKCpln/A+ZkY6lm1aa
	ahBEBMAreJ+3eooKOH
X-Google-Smtp-Source: AGHT+IHMq3rkyfVIFLOAgqrtI8Kd81444k2H0h1pzFPyc4MxuoT1oRDzP4THcxMscABTwCEuwuAx4Q==
X-Received: by 2002:a05:6000:144c:b0:430:ff81:2965 with SMTP id ffacd0b85a97d-4324e50bb11mr43495198f8f.49.1767113228812;
        Tue, 30 Dec 2025 08:47:08 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b82a58sm35493375f8f.6.2025.12.30.08.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 08:47:08 -0800 (PST)
Date: Tue, 30 Dec 2025 19:47:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Sebastian Reichel <sre@kernel.org>,
	Bartosz Golaszewski <bgolasze@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Subject: Re: [PATCH v22 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Message-ID: <202512271806.n2lycyZw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-next-15nov_expose_sysfs-v22-2-2d153438ba19@oss.qualcomm.com>

Hi Shivendra,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Shivendra-Pratap/Documentation-ABI-Add-sysfs-class-reboot-mode-reboot_modes/20251227-025914
base:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
patch link:    https://lore.kernel.org/r/20251227-next-15nov_expose_sysfs-v22-2-2d153438ba19%40oss.qualcomm.com
patch subject: [PATCH v22 2/2] power: reset: reboot-mode: Expose sysfs for registered reboot_modes
config: x86_64-randconfig-161-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271806.n2lycyZw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202512271806.n2lycyZw-lkp@intel.com/

smatch warnings:
drivers/power/reset/reboot-mode.c:147 reboot_mode_create_device() error: we previously assumed 'head' could be null (see line 112)

vim +/head +147 drivers/power/reset/reboot-mode.c

e5f49083a20ae0 Shivendra Pratap 2025-12-27  103  static int reboot_mode_create_device(struct reboot_mode_driver *reboot)
e5f49083a20ae0 Shivendra Pratap 2025-12-27  104  {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  105  	struct sysfs_data *sysfs_info;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  106  	struct sysfs_data *next;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  107  	struct list_head *head;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  108  	struct mode_info *info;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  109  	int ret;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  110  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  111  	head = kzalloc(sizeof(*head), GFP_KERNEL);
e5f49083a20ae0 Shivendra Pratap 2025-12-27 @112  	if (!head) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  113  		ret = -ENOMEM;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  114  		goto error;

This should just be return -ENOMEM;

e5f49083a20ae0 Shivendra Pratap 2025-12-27  115  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  116  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  117  	INIT_LIST_HEAD(head);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  118  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  119  	list_for_each_entry(info, &reboot->head, list) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  120  		sysfs_info = kzalloc(sizeof(*sysfs_info), GFP_KERNEL);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  121  		if (!sysfs_info) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  122  			ret = -ENOMEM;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  123  			goto error;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  124  		}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  125  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  126  		sysfs_info->mode = kstrdup_const(info->mode, GFP_KERNEL);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  127  		if (!sysfs_info->mode) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  128  			kfree(sysfs_info);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  129  			ret = -ENOMEM;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  130  			goto error;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  131  		}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  132  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  133  		list_add_tail(&sysfs_info->list, head);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  134  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  135  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  136  	reboot->reboot_mode_device = device_create(&reboot_mode_class, NULL, 0,
e5f49083a20ae0 Shivendra Pratap 2025-12-27  137  						   (void *)head, reboot->dev->driver->name);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  138  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  139  	if (IS_ERR(reboot->reboot_mode_device)) {
e5f49083a20ae0 Shivendra Pratap 2025-12-27  140  		ret = PTR_ERR(reboot->reboot_mode_device);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  141  		goto error;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  142  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  143  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  144  	return 0;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  145  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  146  error:
e5f49083a20ae0 Shivendra Pratap 2025-12-27 @147  	list_for_each_entry_safe(sysfs_info, next, head, list) {
                                                                                                   ^^^^
But it is a crash instead.

e5f49083a20ae0 Shivendra Pratap 2025-12-27  148  		list_del(&sysfs_info->list);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  149  		kfree_const(sysfs_info->mode);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  150  		kfree(sysfs_info);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  151  	}
e5f49083a20ae0 Shivendra Pratap 2025-12-27  152  
e5f49083a20ae0 Shivendra Pratap 2025-12-27  153  	kfree(head);
e5f49083a20ae0 Shivendra Pratap 2025-12-27  154  	reboot->reboot_mode_device = NULL;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  155  	return ret;
e5f49083a20ae0 Shivendra Pratap 2025-12-27  156  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


