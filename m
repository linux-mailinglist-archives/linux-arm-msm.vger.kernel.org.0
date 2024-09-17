Return-Path: <linux-arm-msm+bounces-31885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D91C497AB81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 08:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AC1E28C97D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2024 06:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14BAB7DA91;
	Tue, 17 Sep 2024 06:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cueBtm+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9493B1A2;
	Tue, 17 Sep 2024 06:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726555139; cv=none; b=citjyUXYpWLO4JCCgzxJxwK2pdKxz2rIlsBzyOnhgUQCuzFHA6WfBS1YCWsgTbpY74/eI+eQTQ1N2fvYaXHnCD0jDftpZMmQJUdjTEXdGcZUtXJdub30eX+MkIQOML3ZN1jvjoXRmZYbdgnnF2e2ny4LG8e3E+tCJm1X9+Vz4Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726555139; c=relaxed/simple;
	bh=XnDdcAYgUkXwdHYhr7LavMOrnmdRQitkG7WdHLSiYP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAYVNW4W+dLAsNT67agIDRPbngfowLQqHwSz6J6+rN72yf0CA/710EEmpFXFWNpCE63rxP8G3tWk/oPdSpO9KFjkxw0Se2MGcF9NagCHXagUDLJOq4NATvmo4oVxSWERscCYHiXfQRQ2z61OCQWGhm3nW/sf5ucnajrG2LYDgEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cueBtm+8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726555136; x=1758091136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XnDdcAYgUkXwdHYhr7LavMOrnmdRQitkG7WdHLSiYP4=;
  b=cueBtm+8w5NSb6SKrpSH+ml+w8XmGq1tGP2K9ZDYK5cpIim8dcsBxo0C
   grCqAh32HAqkZS6IA3uTJj4vc+3kJJmIldWM6v64xLij+cbt149ZjtgJh
   VwCIAm3zh9tIloixffe6nGQPRduqK3kl7ctFXHWisCxwsgwYC0Txziymo
   YJsM3QiNG2/ujoeiZ7n5VVcVYqHFsLBBYcwB31geKS1n+lkSynpo1B17v
   d0R+yXH6ba9FTzybyu0BHsBxQRf+7Pv5toeu74XZ66wKYPi/p3/DmHFVm
   To59bjvvX2fP4CeFPRlaeWaRMJU54VU0WRWMLFZH1D55DKUUaHgGfX78U
   g==;
X-CSE-ConnectionGUID: 0gK2a0a7Q4KbY5AMWt370A==
X-CSE-MsgGUID: S6lqnWikR9qJQkuZuaUdRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25555130"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="25555130"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 23:38:55 -0700
X-CSE-ConnectionGUID: BfL39eQ1SDKBh37aW8qZcw==
X-CSE-MsgGUID: cKKZaTReQmm5HK/CUj8/Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; 
   d="scan'208";a="69321099"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2024 23:38:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqRrM-000ArC-0l;
	Tue, 17 Sep 2024 06:38:48 +0000
Date: Tue, 17 Sep 2024 14:38:30 +0800
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
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	quic_srichara@quicinc.com, quic_varada@quicinc.com,
	quic_mdalam@quicinc.com
Subject: Re: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
Message-ID: <202409171440.qx2iOkY3-lkp@intel.com>
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
[also build test WARNING on axboe-block/for-next linus/master song-md/md-next v6.11 next-20240916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Md-Sadre-Alam/dm-inlinecrypt-Add-inline-encryption-support/20240916-170452
base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
patch link:    https://lore.kernel.org/r/20240916085741.1636554-2-quic_mdalam%40quicinc.com
patch subject: [PATCH v2 1/3] dm-inlinecrypt: Add inline encryption support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240917/202409171440.qx2iOkY3-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409171440.qx2iOkY3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409171440.qx2iOkY3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/dm-inline-crypt.c:198:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     198 |         if ((sscanf(argv[2], "%llu%c", &tmpll, &dummy) != 1) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     199 |             (tmpll & ((cc->sector_size >> SECTOR_SHIFT) - 1))) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-inline-crypt.c:250:9: note: uninitialized use occurs here
     250 |         return ret;
         |                ^~~
   drivers/md/dm-inline-crypt.c:198:2: note: remove the 'if' if its condition is always false
     198 |         if ((sscanf(argv[2], "%llu%c", &tmpll, &dummy) != 1) ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     199 |             (tmpll & ((cc->sector_size >> SECTOR_SHIFT) - 1))) {
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     200 |                 ti->error = "Invalid iv_offset sector";
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     201 |                 goto bad;
         |                 ~~~~~~~~~
     202 |         }
         |         ~
>> drivers/md/dm-inline-crypt.c:198:6: warning: variable 'ret' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
     198 |         if ((sscanf(argv[2], "%llu%c", &tmpll, &dummy) != 1) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-inline-crypt.c:250:9: note: uninitialized use occurs here
     250 |         return ret;
         |                ^~~
   drivers/md/dm-inline-crypt.c:198:6: note: remove the '||' if its condition is always false
     198 |         if ((sscanf(argv[2], "%llu%c", &tmpll, &dummy) != 1) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/dm-inline-crypt.c:178:9: note: initialize the variable 'ret' to silence this warning
     178 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +198 drivers/md/dm-inline-crypt.c

   168	
   169	static int inlinecrypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
   170	{
   171		struct inlinecrypt_config *cc;
   172		char *cipher_api = NULL;
   173		char *cipher, *chainmode;
   174		unsigned long long tmpll;
   175		char *ivmode;
   176		int key_size;
   177		char dummy;
   178		int ret;
   179	
   180		if (argc < 5) {
   181			ti->error = "Not enough arguments";
   182			return -EINVAL;
   183		}
   184	
   185		key_size = strlen(argv[1]) >> 1;
   186	
   187		cc = kzalloc(struct_size(cc, key, key_size), GFP_KERNEL);
   188		if (!cc) {
   189			ti->error = "Cannot allocate encryption context";
   190			return -ENOMEM;
   191		}
   192		cc->key_size = key_size;
   193		cc->sector_size = (1 << SECTOR_SHIFT);
   194		cc->sector_shift = 0;
   195	
   196		ti->private = cc;
   197	
 > 198		if ((sscanf(argv[2], "%llu%c", &tmpll, &dummy) != 1) ||
   199		    (tmpll & ((cc->sector_size >> SECTOR_SHIFT) - 1))) {
   200			ti->error = "Invalid iv_offset sector";
   201			goto bad;
   202		}
   203		cc->iv_offset = tmpll;
   204	
   205		ret = dm_get_device(ti, argv[3], dm_table_get_mode(ti->table),
   206				    &cc->dev);
   207		if (ret) {
   208			ti->error = "Device lookup failed";
   209			goto bad;
   210		}
   211	
   212		ret = -EINVAL;
   213		if (sscanf(argv[4], "%llu%c", &tmpll, &dummy) != 1 ||
   214		    tmpll != (sector_t)tmpll) {
   215			ti->error = "Invalid device sector";
   216			goto bad;
   217		}
   218	
   219		cc->start = tmpll;
   220	
   221		cipher = strsep(&argv[0], "-");
   222		chainmode = strsep(&argv[0], "-");
   223		ivmode = strsep(&argv[0], "-");
   224	
   225		cipher_api = kmalloc(CRYPTO_MAX_ALG_NAME, GFP_KERNEL);
   226		if (!cipher_api)
   227			goto bad;
   228	
   229		ret = snprintf(cipher_api, CRYPTO_MAX_ALG_NAME,
   230			       "%s(%s)", chainmode, cipher);
   231		if (ret < 0 || ret >= CRYPTO_MAX_ALG_NAME) {
   232			kfree(cipher_api);
   233			ret = -ENOMEM;
   234			goto bad;
   235		}
   236	
   237		ret = crypt_select_inline_crypt_mode(ti, cipher_api, ivmode);
   238	
   239		/* Initialize and set key */
   240		ret = inlinecrypt_set_key(cc, argv[1]);
   241		if (ret < 0) {
   242			ti->error = "Error decoding and setting key";
   243			return ret;
   244		}
   245	
   246		return 0;
   247	bad:
   248		ti->error = "Error in inlinecrypt mapping";
   249		inlinecrypt_dtr(ti);
   250		return ret;
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

