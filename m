Return-Path: <linux-arm-msm+bounces-31879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4776697AAE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 07:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C10631F23921
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 05:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B3B4436E;
	Tue, 17 Sep 2024 05:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlR564Qh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576A025763;
	Tue, 17 Sep 2024 05:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726549555; cv=none; b=A34nNXpE7ffdhqiKPPy7c+q0utPyPykZPLxQnBluhlJqNRgzxn6MYVdjmR6jY/6q35O379HYoeudFcGLypZZZJKuASIsceO748f19DNmtZ68OTaYowZ0jAqqb2pD6WBDqr4I+ki+Vrvl48YKIT6P85Ru91/x6VqndiAZm6IbTzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726549555; c=relaxed/simple;
	bh=XqJJFeOp7MdyQLdxKtgi2ITW8F7GZDZkuwkfDas8Xb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VwozU18aFUP8pvYWD34P0lddyghY/HKcL8FKFCTFMDIw38K+9d8fNSosdxF27K38HClfLeF/aPT5K4OwoobBLNGK8p9Lu7qXkQkhInb8Py5akjv+u5zupuGmzjjjPLwI5YBBy/virPnHfUKoFJ02wvIcaTx1mShftQNiVHwbxLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlR564Qh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726549554; x=1758085554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XqJJFeOp7MdyQLdxKtgi2ITW8F7GZDZkuwkfDas8Xb8=;
  b=HlR564Qh3/p5Sh0kkkGBUofPAQ65soGZ4CK5Z8nlxodHDyRb4O9uEMNC
   DpV+aJsmo0HRNGZuht82DWlFbgxY2I0m8dqsFT7Lr6Jqgho6vwK5HATZj
   D4lif6G+V0IoAnTXf7ERJvWNdQoZvsENNoMsIRFzCqIBURiQg5qVRX4I+
   Vrcfz6xo3WXKkX3ML6bYshh0OKfK8HeEidDo5+OYMn6YfnRSoGKWmYLgZ
   p7xcyOIrzUDsmfzq0F4sEG1B+dJ8IcnEpvkhM9h/k7JVg9LxvO/e2IO5c
   MmLHFmWeyKGfnP00nhmLb0l1e4pbh/xWZdf9uXKaEVksQMoKjFbTzu1jA
   g==;
X-CSE-ConnectionGUID: RZaWERXNRE2VLSmrXFOGjA==
X-CSE-MsgGUID: Kka+zk0pT5O5eczFkik6tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="24930138"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="24930138"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 22:05:53 -0700
X-CSE-ConnectionGUID: UDgYpWYHSw6tiyAgLVXzBA==
X-CSE-MsgGUID: w5W0zApoSMCZMnGOleu5JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="68954735"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Sep 2024 22:05:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqQPI-000AoA-22;
	Tue, 17 Sep 2024 05:05:44 +0000
Date: Tue, 17 Sep 2024 13:05:03 +0800
From: kernel test robot <lkp@intel.com>
To: Md Sadre Alam <quic_mdalam@quicinc.com>, axboe@kernel.dk,
	song@kernel.org, yukuai3@huawei.com, agk@redhat.com,
	snitzer@kernel.org, mpatocka@redhat.com, adrian.hunter@intel.com,
	quic_asutoshd@quicinc.com, ritesh.list@gmail.com,
	ulf.hansson@linaro.org, andersson@kernel.org,
	konradybcio@kernel.org, kees@kernel.org, gustavoars@kernel.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, quic_srichara@quicinc.com,
	quic_varada@quicinc.com, quic_mdalam@quicinc.com
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
Message-ID: <202409171209.aEtxsPez-lkp@intel.com>
References: <20240916085741.1636554-2-quic_mdalam@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916085741.1636554-2-quic_mdalam@quicinc.com>

Hi Md,

kernel test robot noticed the following build errors:

[auto build test ERROR on device-mapper-dm/for-next]
[also build test ERROR on axboe-block/for-next linus/master song-md/md-next v6.11 next-20240916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/dm-inlinecrypt-Add-inline-encryption-support/20240916-170452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20240916085741.1636554-2-quic_mdalam%40quicinc.com
patch subject: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
config: openrisc-randconfig-r062-20240917 (https://download.01.org/0day-ci/archive/20240917/202409171209.aEtxsPez-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171209.aEtxsPez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171209.aEtxsPez-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/dm-inline-crypt.c: In function 'crypt_prepare_inline_crypt_key':
>> drivers/md/dm-inline-crypt.c:81:15: error: implicit declaration of function 'blk_crypto_init_key' [-Wimplicit-function-declaration]
      81 |         ret = blk_crypto_init_key(cc->blk_key, cc->key, cc->crypto_mode,
         |               ^~~~~~~~~~~~~~~~~~~
>> drivers/md/dm-inline-crypt.c:88:15: error: implicit declaration of function 'blk_crypto_start_using_key' [-Wimplicit-function-declaration]
      88 |         ret = blk_crypto_start_using_key(cc->dev->bdev, cc->blk_key);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-inline-crypt.c: In function 'crypt_destroy_inline_crypt_key':
>> drivers/md/dm-inline-crypt.c:104:17: error: implicit declaration of function 'blk_crypto_evict_key'; did you mean 'blk_crypto_register'? [-Wimplicit-function-declaration]
     104 |                 blk_crypto_evict_key(cc->dev->bdev, cc->blk_key);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 blk_crypto_register
   drivers/md/dm-inline-crypt.c: In function 'crypt_inline_encrypt_submit':
>> drivers/md/dm-inline-crypt.c:121:17: error: implicit declaration of function 'bio_crypt_set_ctx' [-Wimplicit-function-declaration]
     121 |                 bio_crypt_set_ctx(bio, cc->blk_key, dun, GFP_KERNEL);
         |                 ^~~~~~~~~~~~~~~~~


vim +/blk_crypto_init_key +81 drivers/md/dm-inline-crypt.c

    72	
    73	static int crypt_prepare_inline_crypt_key(struct inlinecrypt_config *cc)
    74	{
    75		int ret;
    76	
    77		cc->blk_key = kzalloc(sizeof(*cc->blk_key), GFP_KERNEL);
    78		if (!cc->blk_key)
    79			return -ENOMEM;
    80	
  > 81		ret = blk_crypto_init_key(cc->blk_key, cc->key, cc->crypto_mode,
    82					  cc->iv_size, cc->sector_size);
    83		if (ret) {
    84			DMERR("Failed to init inline encryption key");
    85			goto bad_key;
    86		}
    87	
  > 88		ret = blk_crypto_start_using_key(cc->dev->bdev, cc->blk_key);
    89		if (ret) {
    90			DMERR("Failed to use inline encryption key");
    91			goto bad_key;
    92		}
    93	
    94		return 0;
    95	bad_key:
    96		kfree_sensitive(cc->blk_key);
    97		cc->blk_key = NULL;
    98		return ret;
    99	}
   100	
   101	static void crypt_destroy_inline_crypt_key(struct inlinecrypt_config *cc)
   102	{
   103		if (cc->blk_key) {
 > 104			blk_crypto_evict_key(cc->dev->bdev, cc->blk_key);
   105			kfree_sensitive(cc->blk_key);
   106			cc->blk_key = NULL;
   107		}
   108	}
   109	
   110	static void crypt_inline_encrypt_submit(struct dm_target *ti, struct bio *bio)
   111	{
   112		struct inlinecrypt_config *cc = ti->private;
   113		u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
   114	
   115		bio_set_dev(bio, cc->dev->bdev);
   116		if (bio_sectors(bio)) {
   117			memset(dun, 0, BLK_CRYPTO_MAX_IV_SIZE);
   118			bio->bi_iter.bi_sector = cc->start +
   119				dm_target_offset(ti, bio->bi_iter.bi_sector);
   120			dun[0] = le64_to_cpu(bio->bi_iter.bi_sector + cc->iv_offset);
 > 121			bio_crypt_set_ctx(bio, cc->blk_key, dun, GFP_KERNEL);
   122		}
   123	
   124		submit_bio_noacct(bio);
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

