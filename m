Return-Path: <linux-arm-msm+bounces-98977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLIYEMgBvmkaFQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 03:26:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B190B2E2EA0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 03:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98A1B30333A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Mar 2026 02:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C813C29BD88;
	Sat, 21 Mar 2026 02:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UL3lja34"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0E71A3165;
	Sat, 21 Mar 2026 02:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774059971; cv=none; b=LB+dNT9qZGuyXD2AjTmBGKvp3VMg6Q1ncQ8enDiHWigAUI5/Szl4PHcLmMTN06v0JeUss58gJdAvXnhUNqbJhdcnEKf/axG8t+zjk4oSvw82HLvMePwLcOen0Nx3Pi4a+koxDIlUStr/oFXJArpFQrH4iKMXhPSXoCD/4HheZ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774059971; c=relaxed/simple;
	bh=eG5LkS+9cCOeVxm20ZTUca9k3IWxWt9/hMQ4+PWUen0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sB1rp34azQHz7vYIdb7wUo4Sxs86O9uCDKKho1zwYey3CmLs9C6qjRS0XqaiZ2bKqq1tvnzk32tRxFh1sy91XeMF2Dyq8KAMoCUX6AwVi/zXfg0NYf2MCUDizlZiIGgXAUU0v1GyjkYP4J3nm+nPZAYvlrKcVe3fV+y5owXZOHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UL3lja34; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774059969; x=1805595969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eG5LkS+9cCOeVxm20ZTUca9k3IWxWt9/hMQ4+PWUen0=;
  b=UL3lja342nStXdPKoKxDE5G4uz+pYWAnwLxT7ahLR5veXnHO4dmkuDPS
   kv7hrqWLp/SlTBiTzqteMEmVEvWsJc7XyySRBKjc7PZqZwk9ABCgQioDT
   zTg1xEA63Ux1WAjLWNqhE6fTMRD0kX5tzgY+nQYpqdc26D3+lfpB3fG5f
   X7imsRQXcZ/LcmKLkkppUA7uiEpB/5X3f27EZ8i9m26M9TXJBlrz62z/x
   BlCuFLZlYMbGbBSZpR4MiirshdfyqDDRCIv60pjR1KJe9NxTF/5lB9S7j
   0U80cnlYkNaEIH00EOiZeWk1/HzHT8X/xuGVYlWpB6AZPIhFsEH4AxZsP
   g==;
X-CSE-ConnectionGUID: WlezhvJbTs6alU7Z/RrR6A==
X-CSE-MsgGUID: 0ayDyIC/StGq+WzjItOMmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="86513223"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="86513223"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 19:26:08 -0700
X-CSE-ConnectionGUID: o0WWiGR5QOOQvsToiLyxHg==
X-CSE-MsgGUID: wLO7713QQmCTMFZ6fN/fgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="223679709"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 Mar 2026 19:26:04 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3m2C-000000000CD-0ohq;
	Sat, 21 Mar 2026 02:25:53 +0000
Date: Sat, 21 Mar 2026 10:25:04 +0800
From: kernel test robot <lkp@intel.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v2] drm/msm: default separate_gpu_kms to auto selection
Message-ID: <202603211049.NkgQVReV-lkp@intel.com>
References: <20260317-separate_gpu_kms-v2-1-b027ca97b9fe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-separate_gpu_kms-v2-1-b027ca97b9fe@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98977-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B190B2E2EA0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mahadevan,

kernel test robot noticed the following build errors:

[auto build test ERROR on b84a0ebe421ca56995ff78b66307667b62b3a900]

url:    https://github.com/intel-lab-lkp/linux/commits/Mahadevan-P/drm-msm-default-separate_gpu_kms-to-auto-selection/20260318-063854
base:   b84a0ebe421ca56995ff78b66307667b62b3a900
patch link:    https://lore.kernel.org/r/20260317-separate_gpu_kms-v2-1-b027ca97b9fe%40oss.qualcomm.com
patch subject: [PATCH v2] drm/msm: default separate_gpu_kms to auto selection
config: loongarch-randconfig-002-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211049.NkgQVReV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211049.NkgQVReV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211049.NkgQVReV-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "msm_mdss_count_masters" [drivers/gpu/drm/msm/msm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

