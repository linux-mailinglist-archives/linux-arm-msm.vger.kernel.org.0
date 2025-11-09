Return-Path: <linux-arm-msm+bounces-80893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B229C44954
	for <lists+linux-arm-msm@lfdr.de>; Sun, 09 Nov 2025 23:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D28188A6D9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Nov 2025 22:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DFC258EE0;
	Sun,  9 Nov 2025 22:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6/ufYUE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A624A049;
	Sun,  9 Nov 2025 22:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762728058; cv=none; b=Ryl/pqseQG5CBgEff26itAvMA7ZsyqAV/w0n9Oc4qifj7qnJ9KkfqOMchTU+FDnpzD87DKHeBRRmVOnrTZEZMLQOXS/sHUUKf/njzW6BvLEBqbRiZBibwNSCp1ZK+dLHHpS9QPC/Jqxe0EmPmQqBlF9qqtumpuSJ+rT/iy+U64Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762728058; c=relaxed/simple;
	bh=cMmPa9Fxj7ZO+ut5H2ulYJ53jkvVxvjyBkouir73++0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCawxlEKfcDb5tbT7T6E3+ljUYDXnHWr7lTXz5YmPDYh7Rq0EB76G1YX1lESXWpi6tYr10w3jHzCSDsZauDz/aVYYnq0XzJpmfdKoy+XfWXBPVzQLZmuH9jO8QcqDW1zaU/rbFlJAq95S1oiOF186T8AlUZbjvOyPbafjHCowqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6/ufYUE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762728057; x=1794264057;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cMmPa9Fxj7ZO+ut5H2ulYJ53jkvVxvjyBkouir73++0=;
  b=H6/ufYUExB+5X8KVqNlDYlQELHoLdvkQtDhRlo4VR7+LVeIDBNJdjaR2
   NivFWtMjisJP8eWLf+pj0aDtiAN+eE0zXU+fLTuGrxhcoWZdeO/jvM3Hy
   HuecjagmKFkKIR3HoSAM5l6GaocT37n2stCtBwVDS7YrB/mtAv+zfNKYV
   ZTss8PMisgAaSskC7Ena5XEIwFpGrPC8qSWb1NQL+2aLRnO0g2zFSvjMr
   51tn0Rpz53keNXBR/FesSQe/ts/P30r70UcoIcO1uQ7vv5siw18nM/nsS
   k8eZpYyemMnocZZZ/xcXzBBiEN7McUbMPcp54EXQBgxb6+SslDLWsBDir
   w==;
X-CSE-ConnectionGUID: RhgSzLsaQxiAmIXyjh9FSQ==
X-CSE-MsgGUID: IJKCj/EGQDa8jwv5ZqAq/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="75472365"
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="75472365"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 14:40:56 -0800
X-CSE-ConnectionGUID: xAz8T/LTTc2AJbg4gm+ITg==
X-CSE-MsgGUID: lWAqsRqVTdurGKj8c/WK7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,292,1754982000"; 
   d="scan'208";a="193540812"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2025 14:40:53 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIE5b-0002Sl-1r;
	Sun, 09 Nov 2025 22:40:51 +0000
Date: Mon, 10 Nov 2025 06:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Akhil Vinod <akhil.vinod@oss.qualcomm.com>,
	Subramanian Ananthanarayanan <subramanian.ananthanarayanan@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, quic_vpernami@quicinc.com,
	Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] bus: mhi: ep: Add loopback driver for data path
 testing
Message-ID: <202511100649.KfikwcaY-lkp@intel.com>
References: <20251104-loopback_mhi-v2-3-727a3fd9aa74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104-loopback_mhi-v2-3-727a3fd9aa74@oss.qualcomm.com>

Hi Sumit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on e6b9dce0aeeb91dfc0974ab87f02454e24566182]

url:    https://github.com/intel-lab-lkp/linux/commits/Sumit-Kumar/bus-mhi-host-Add-loopback-driver-with-sysfs-interface/20251104-174320
base:   e6b9dce0aeeb91dfc0974ab87f02454e24566182
patch link:    https://lore.kernel.org/r/20251104-loopback_mhi-v2-3-727a3fd9aa74%40oss.qualcomm.com
patch subject: [PATCH v2 3/3] bus: mhi: ep: Add loopback driver for data path testing
config: csky-randconfig-r061-20251110 (https://download.01.org/0day-ci/archive/20251110/202511100649.KfikwcaY-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511100649.KfikwcaY-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/bus/mhi/ep/mhi_ep_loopback.c:80:2-7: WARNING: NULL check before some freeing functions is not needed.
--
>> drivers/bus/mhi/ep/mhi_ep_loopback.c:46:8-15: WARNING opportunity for kmemdup

vim +80 drivers/bus/mhi/ep/mhi_ep_loopback.c

    37	
    38	static void mhi_ep_loopback_ul_callback(struct mhi_ep_device *mhi_dev,
    39						struct mhi_result *mhi_res)
    40	{
    41		struct mhi_ep_loopback *mhi_ep_lb = dev_get_drvdata(&mhi_dev->dev);
    42		struct mhi_ep_loopback_work *mhi_ep_lb_work;
    43		void *buf;
    44	
    45		if (!(mhi_res->transaction_status)) {
  > 46			buf = kmalloc(mhi_res->bytes_xferd, GFP_KERNEL);
    47			if (!buf) {
    48				dev_err(&mhi_dev->dev, "Failed to allocate buffer\n");
    49				return;
    50			}
    51	
    52			memcpy(buf, mhi_res->buf_addr, mhi_res->bytes_xferd);
    53	
    54			mhi_ep_lb_work = kmalloc(sizeof(*mhi_ep_lb_work), GFP_KERNEL);
    55			if (!mhi_ep_lb_work) {
    56				dev_err(&mhi_dev->dev, "Unable to allocate the work structure\n");
    57				kfree(buf);
    58				return;
    59			}
    60	
    61			INIT_WORK(&mhi_ep_lb_work->work, mhi_ep_loopback_work_handler);
    62			mhi_ep_lb_work->mdev = mhi_dev;
    63			mhi_ep_lb_work->buf = buf;
    64			mhi_ep_lb_work->len = mhi_res->bytes_xferd;
    65	
    66			queue_work(mhi_ep_lb->loopback_wq, &mhi_ep_lb_work->work);
    67		}
    68	}
    69	
    70	static void mhi_ep_loopback_dl_callback(struct mhi_ep_device *mhi_dev,
    71						struct mhi_result *mhi_res)
    72	{
    73		void *buf;
    74	
    75		if (mhi_res->transaction_status)
    76			return;
    77	
    78		buf = mhi_res->buf_addr;
    79		if (buf)
  > 80			kfree(buf);
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

