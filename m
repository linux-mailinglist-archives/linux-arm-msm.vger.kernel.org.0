Return-Path: <linux-arm-msm+bounces-65039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEC5B05AD5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 15:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFED64E5B71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 13:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C482E173A;
	Tue, 15 Jul 2025 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Myx2Goh5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBC62566;
	Tue, 15 Jul 2025 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752584902; cv=none; b=szCtKIqs1omWOciZf4YE15qY9abEskvnr7/duq83JjLgZZi0k5rMtgTFz3TI3vzFqLTbIUI2YIbLwjU8j6wHFpVgN9xR4MQJD0qgxbGm63rUFqu7Aq1GDpELwG5VmABUopIc94aYFr7Qrxy9KxW0j5Hcbia0nGrdqe7ccMHSyd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752584902; c=relaxed/simple;
	bh=ERgqFp3dWEUt6TrdSa/YUzlMBzQe1R/D7z1fcvnBStk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNK44uo64rqHyF4itq1bvz457/Gv9GSOBkOcRvweMXditZUkCFk6fT45aIZHQHDMsnMxySMa+aPsEL7IrnJP93foxs+smajx6C06Jzxs7gN9zkmtQxMfblMGxKxPgJQF93mBwUuKvArkhCmiNOMZ8FN2JFEVqXCijrZG+QLt9iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Myx2Goh5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752584899; x=1784120899;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ERgqFp3dWEUt6TrdSa/YUzlMBzQe1R/D7z1fcvnBStk=;
  b=Myx2Goh5z5ruC3fY8eAkSaSuz/TKc6fdV4VNlO9eikFEw6ndC2LbsaoO
   UWHIOA3wQGriXCYKezCAr2QWQooFu6mRKDrkdNR5nbXRv6HY+rLbgOHgs
   gAm+jkRKE2OtqHnjhZk2iKBihridvvStyWxsBhZzteva5Z+E+WjIPkRxM
   dNrwrSrxsd5GIGeHoiZQszjAkIsDsnL2Y0xCQewnjyK/LWZb7BO63sHiu
   DCPQYDpu/lNcClsqbKxoUS138kn7zxh87OFjnUNqzVYRQaKMwKrniy1OW
   O5UXnozFHEYylNjG8bCaKgRZjZgTYWiYmLJgO69iOtaG/+gY6d8Q2Rsdz
   Q==;
X-CSE-ConnectionGUID: Br1mH+ceS5qXP6cE+NDHRA==
X-CSE-MsgGUID: HF/HgTUjQKyIPhGBE9IIsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54740059"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="54740059"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 06:08:19 -0700
X-CSE-ConnectionGUID: 1wcdqG34SWqIsJon1ARLKQ==
X-CSE-MsgGUID: TP7UHK2CRpyZLxyiQtiKnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157765105"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 Jul 2025 06:08:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubfOD-000A51-2g;
	Tue, 15 Jul 2025 13:08:09 +0000
Date: Tue, 15 Jul 2025 21:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Joris Verhaegen <verhaegen@google.com>, Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Joris Verhaegen <verhaegen@google.com>,
	kernel-team@android.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, David Li <dvdli@google.com>
Subject: Re: [PATCH v2 4/4] ASoC: codecs: Implement 64-bit pointer operation
Message-ID: <202507152054.EKID8Uop-lkp@intel.com>
References: <20250711093636.28204-5-verhaegen@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711093636.28204-5-verhaegen@google.com>

Hi Joris,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on vkoul-dmaengine/next linus/master v6.16-rc6]
[cannot apply to tiwai-sound/for-next tiwai-sound/for-linus next-20250714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joris-Verhaegen/ALSA-compress_offload-Add-64-bit-safe-timestamp-infrastructure/20250711-174008
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250711093636.28204-5-verhaegen%40google.com
patch subject: [PATCH v2 4/4] ASoC: codecs: Implement 64-bit pointer operation
config: i386-randconfig-141-20250714 (https://download.01.org/0day-ci/archive/20250715/202507152054.EKID8Uop-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507152054.EKID8Uop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507152054.EKID8Uop-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/intel/atom/sst-mfld-platform-compress.o: in function `sst_platform_compr_pointer64':
>> sound/soc/intel/atom/sst-mfld-platform-compress.c:226: undefined reference to `__umoddi3'


vim +226 sound/soc/intel/atom/sst-mfld-platform-compress.c

   216	
   217	static int sst_platform_compr_pointer64(struct snd_soc_component *component,
   218						struct snd_compr_stream *cstream,
   219						struct snd_compr_tstamp64 *tstamp)
   220	{
   221		struct sst_runtime_stream *stream;
   222	
   223		stream = cstream->runtime->private_data;
   224		stream->compr_ops->tstamp64(sst->dev, stream->id, tstamp);
   225		tstamp->byte_offset =
 > 226			tstamp->copied_total % cstream->runtime->buffer_size;
   227		pr_debug("calc bytes offset/copied bytes as %u\n", tstamp->byte_offset);
   228		return 0;
   229	}
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

