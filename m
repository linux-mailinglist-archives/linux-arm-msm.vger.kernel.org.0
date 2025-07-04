Return-Path: <linux-arm-msm+bounces-63682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FA8AF8E5E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 11:23:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C61517E4DA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 09:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8012F234F;
	Fri,  4 Jul 2025 09:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ydu/QZE0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D506288526;
	Fri,  4 Jul 2025 09:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620595; cv=none; b=ijOgkS1CSQJ1/kcLhR78juBCxSvGOXg8LRi3uEJKAXGCuzU+Iq3Gpdbe2mf9i1jTmkdxiuS72KUW1AP+Ckj/BcmrZ0jfrvIdTzKsDEOQh0IWibWALzEC/nLwb/57CN+igQAfq3v5efz81FnUIWGJfxaBW3uHUKGwHqTD16nLa+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620595; c=relaxed/simple;
	bh=AkRYvE+iRYD9m1Wwp6Jy8xhOGndE4ScJG+8190VCBdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvTYdiD5Fnrx1ooKPmkygqwb0edOoWI+7hc2dwi1F3wkpfNTmaRl+AwLV2P/hp21zWKjx5EWbWVOW8HMuDh9nTby7m+ce6URb2o9HjRv/OFJrIwRvqDBi17xLD3ge1VseZHNSs/R34ZTEC90GSwgOcr7JGarpWyhQK7fSfuXj1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ydu/QZE0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751620594; x=1783156594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AkRYvE+iRYD9m1Wwp6Jy8xhOGndE4ScJG+8190VCBdY=;
  b=Ydu/QZE0DMqV5aKFHLPElTFOl4GtzfmBZjyxKwyM9w5H5zEa65tYoYyd
   aytr8k084YXjOIxrGCL12tZA+Jk3UNz+IWk5g4T5uyvxLVe/YxQa3gPVy
   Y96uZ9uYeDeB2347JMnhCTviOPBq/eOvP8x/fbiVahwg1qrxXgjPJ3nNe
   rxk9C1+rHB73678OBZ+LGXYqhldbBf5Jq5w69QjzuA7cOr+IZNNUO8VEU
   kSZue3aOtXNbqixaShVYMe6fmS+jmW5xjuUEBSyPYVKxatlD2WR/8+y8D
   tTnGIZAilmiRcVx4UnScpIsQavzVbArEsqLC/a4zxWxcRdRX0AoCCyv5F
   g==;
X-CSE-ConnectionGUID: ui3M3KoiTeaBYIiH8Wpl5w==
X-CSE-MsgGUID: 1K7aQcqsTFGeuYJhkVlizw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="57763093"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="57763093"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 02:16:33 -0700
X-CSE-ConnectionGUID: 7OgdyKb4TLujesp+0RKKLA==
X-CSE-MsgGUID: YIr1wxvYRqOmp50GpF9Aew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154011509"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 04 Jul 2025 02:16:31 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXcWy-0003XX-2I;
	Fri, 04 Jul 2025 09:16:28 +0000
Date: Fri, 4 Jul 2025 17:15:49 +0800
From: kernel test robot <lkp@intel.com>
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vivek Pernamitta <quic_vpernami@quicinc.com>
Subject: Re: [PATCH 4/5] bus: mhi: host: pci_generic: Remove MHI driver and
 ensure graceful device recovery
Message-ID: <202507041755.evB3U2Ju-lkp@intel.com>
References: <20250703-sriov_vdev_next-20250630-v1-4-87071d1047e3@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-sriov_vdev_next-20250630-v1-4-87071d1047e3@quicinc.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 1343433ed38923a21425c602e92120a1f1db5f7a]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Pernamitta-quicinc-com/bus-mhi-host-pci_generic-Add-SRIOV-support-for-PCIe-device/20250703-231724
base:   1343433ed38923a21425c602e92120a1f1db5f7a
patch link:    https://lore.kernel.org/r/20250703-sriov_vdev_next-20250630-v1-4-87071d1047e3%40quicinc.com
patch subject: [PATCH 4/5] bus: mhi: host: pci_generic: Remove MHI driver and ensure graceful device recovery
config: i386-buildonly-randconfig-001-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041755.evB3U2Ju-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041755.evB3U2Ju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041755.evB3U2Ju-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/bus/mhi/host/pci_generic.c:63 struct member 'reset_on_driver_unbind' not described in 'mhi_pci_dev_info'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

