Return-Path: <linux-arm-msm+bounces-95939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKS8ASj9q2mgiwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 11:25:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A208422B049
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 11:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D1313021700
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 10:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741ED371066;
	Sat,  7 Mar 2026 10:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpunLiy6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF872F25E4;
	Sat,  7 Mar 2026 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772879114; cv=none; b=M5VZtFgzQCRQnSMiHgLEkFUhCWWnB3/9WiBKWRvVJfEJZFDo8kjwISQP5uAMXj6QfFe/MBGWH7MO5jr2ffBGvZ3NbShgyGawAYdNtiYIx5j8rBZA2sMf3Ujg2LEEAGWh4NI5mp2Qy0eX6yu9cRnCahz9Y2s7nBB5ivgDvdZez+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772879114; c=relaxed/simple;
	bh=7zO7aGmPRNM/2d2bS4B3dOXbH9VOChey5Vf66yraSW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yd+oRENFC4QxA7cD+TxpxTWEtIakd+/cyGJ7SUS0kR8/9TSjxlehtj9MykYqvdgr7wCBz44JE3+SKKc2jsV/EFbOhivPGMpRc4Uw1kAze1pI8+PKuz0BEG9ME2WzbusDwcfikxQgi60scs4ymLRff2V0QJ7i+pHs9CBZl85lflc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpunLiy6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772879111; x=1804415111;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7zO7aGmPRNM/2d2bS4B3dOXbH9VOChey5Vf66yraSW8=;
  b=dpunLiy6yJB3dPIjFIylz3JiZN/YBUQB2fJ8PG+Ekp9F3pZQQYTIsI7N
   Lg9KDvUnOVVWrJGBiCnhAVp6jTx8NgOFCNUR3R/IWC1avThZrM7TRiNFb
   +t7apsB6eloqWN3mXQgnCH1NdB/yUL5YM096X2jwyEaV1tLtAM4gXQWHr
   MKopPelCnY5va7KgtKK5pPsZm0hIDqMY3VswUaXJkzFyfbcr9bFznsBFr
   43mkynpCw3wWd9WMr+YaTssKU73FXsJ47o/r+dLfORtiQ3+HYkVMJsFDN
   5gh4EE2If3AAtNf81jHAYNkvW6SRJaLf7AxDltnmRFxVocKv/gxqivxAS
   w==;
X-CSE-ConnectionGUID: 7osKlMegQAiUFCnQnqsyww==
X-CSE-MsgGUID: MEG4IvxnQRy2Pm87BgzE4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73000704"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73000704"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 02:25:11 -0800
X-CSE-ConnectionGUID: 9FH9KpraQdys52Tf5oiftA==
X-CSE-MsgGUID: 6ba6qCt1Tr+VmIMv2h+chQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="257175900"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2026 02:25:05 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyoqD-000000001sf-1dCb;
	Sat, 07 Mar 2026 10:25:01 +0000
Date: Sat, 7 Mar 2026 18:24:51 +0800
From: kernel test robot <lkp@intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Tianyu Gao <gty0622@gmail.com>, White Lewis <liu224806@gmail.com>,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on
 SC8280XP
Message-ID: <202603071819.Xjfeftm2-lkp@intel.com>
References: <20260228141715.35307-5-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228141715.35307-5-mitltlatltl@gmail.com>
X-Rspamd-Queue-Id: A208422B049
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_FROM(0.00)[bounces-95939-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com,marek.ca];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-0.989];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,01.org:url,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

Hi Pengyu,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm/drm-next robh/for-next linus/master v7.0-rc2 next-20260305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pengyu-Luo/dt-bindings-display-msm-dsi-phy-7nm-Add-SC8280XP/20260228-222044
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260228141715.35307-5-mitltlatltl%40gmail.com
patch subject: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP
config: arm64-randconfig-002-20260307 (https://download.01.org/0day-ci/archive/20260307/202603071819.Xjfeftm2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071819.Xjfeftm2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071819.Xjfeftm2-lkp@intel.com/

All errors (new ones prefixed by >>):

   Error: arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4898.11-37 syntax error
>> FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

