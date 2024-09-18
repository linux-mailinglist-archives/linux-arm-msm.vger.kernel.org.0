Return-Path: <linux-arm-msm+bounces-31946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D6D97B74C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 07:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89E211C21A76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 05:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD671494B1;
	Wed, 18 Sep 2024 05:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAG1H8us"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CDE13792B;
	Wed, 18 Sep 2024 05:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726636146; cv=none; b=j6GSes9crPFJzvI0owhXqO8yxCEc5LRkjDBYVAanEy4wRf8z7wBUr9IcAbvN2/x/7wLNhFcLNRAct1GIFu4AcVr/FepUAml8bNxNijg0ybgjL2/YjGCUBX1pjQTxpNmKYd30ZSW5J+tZ8QxkPqDpIsyj+psC5iLaCpgJI6+NZxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726636146; c=relaxed/simple;
	bh=As9YAcSfIVcVorbigO5cjdtcP7FT++p9qmX0oJ0wRCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ai9KcWU7PkYVb8AaP8RRY4jF5HCr3ixZjZuopr/zaAKrs8zFwdfSomBrAQhkFxw7fqmqdjwSExY7ZWk9S0ZdwqmT5tBI35rMSu5zAKHZAXoeNZW29wB1iETwLN6j9axUwSIo0cMG0JKQ3VJnyb7AHmiVTej7Rih6LA95OA3mExg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAG1H8us; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726636145; x=1758172145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=As9YAcSfIVcVorbigO5cjdtcP7FT++p9qmX0oJ0wRCQ=;
  b=eAG1H8usHg8/n08bFZ85faWQwSPOc6SFKKlvbHy+1KW5/8FIhKDKCEsI
   CL9TqV/6l42dXQGFz3co2W4xg0cB0Z9VlbBcGou8FXd6hsBKH0VbQv2bS
   RNuWEHkpk1BeGo8wmfmg4EQ/snlG/71HNHbHN84rVdoXV6YPP/VwcODoa
   M+7a/YFGXMuv4vCGRFa3rK5H7oRw0m5n0HmNtozYmAQqOVC5XZ2sBLR4a
   GNd9suj1PiXi75gF95jkgCgAo/RxtPUM65OPT7pbcvNm91F8GQ05eLeOq
   NbD8uPF4ta0mmm4GRlnRBq2O4I8AF2JEaUasy1TvTuXxI+1ol41tEwqf8
   w==;
X-CSE-ConnectionGUID: /7d10skPSn2rAIic22H4LA==
X-CSE-MsgGUID: hqym9ymLTX+24XfwvNo9Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25685993"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="25685993"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 22:09:04 -0700
X-CSE-ConnectionGUID: Cy3mqgGyTzamROZvS8CXGw==
X-CSE-MsgGUID: fdUzLaH/TGeu2Fmg+0hK+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="73779548"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Sep 2024 22:08:58 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqmvv-000Bt8-24;
	Wed, 18 Sep 2024 05:08:55 +0000
Date: Wed, 18 Sep 2024 13:08:09 +0800
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
Message-ID: <202409181233.1FrQNVtU-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on device-mapper-dm/for-next]
[also build test WARNING on axboe-block/for-next linus/master song-md/md-next v6.11 next-20240917]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/dm-inlinecrypt-Add-inline-encryption-support/20240916-170452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20240916085741.1636554-2-quic_mdalam%40quicinc.com
patch subject: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
config: csky-randconfig-r111-20240918 (https://download.01.org/0day-ci/archive/20240918/202409181233.1FrQNVtU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240918/202409181233.1FrQNVtU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181233.1FrQNVtU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/md/dm-inline-crypt.c:120:26: sparse: sparse: cast to restricted __le64
   drivers/md/dm-inline-crypt.c:214:32: sparse: sparse: self-comparison always evaluates to false

vim +120 drivers/md/dm-inline-crypt.c

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
 > 120			dun[0] = le64_to_cpu(bio->bi_iter.bi_sector + cc->iv_offset);
   121			bio_crypt_set_ctx(bio, cc->blk_key, dun, GFP_KERNEL);
   122		}
   123	
   124		submit_bio_noacct(bio);
   125	}
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

