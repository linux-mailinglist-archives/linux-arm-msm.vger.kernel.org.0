Return-Path: <linux-arm-msm+bounces-28121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F42E94B22A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 23:29:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 357CE1C21199
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 21:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC7D14B087;
	Wed,  7 Aug 2024 21:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtgaXFTb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C159E14D2BD;
	Wed,  7 Aug 2024 21:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723066169; cv=none; b=q/0nIBQgRBWvXYT3oTgdPBQ55R97/rhTxwb/SucJVJKmL4r/Whk5OmlSxirdmmw/A4k8p7RzBpAJu8V1sAExBdvNW4wxbg7SwRmKL9cd1nOPhuePJB54gXWFNixcRW4LFeNCX04ER+q/3LpQd9WxqUeuaRjcjMBsrr1xjWAdFrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723066169; c=relaxed/simple;
	bh=UMW8ZjWFYWzUMZlPzvOnD8SvOFmznM3WZ+q+ybh9Mtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jcszDn5JeSZcSJQzdML2NaytVxoYMEh8FOLW1g25mraowkjLvwMn0kkwFx2JgKGNuAcNQVn0eCJA6SADjnZgJZRdlaO0J01z+7d7V48XIMrI5DHExdLlJ0qs14dCr8V70UIGpW+D3lexxbBNIqeMxaMKrw5+P9rl+UGkJOUZF1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtgaXFTb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723066167; x=1754602167;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UMW8ZjWFYWzUMZlPzvOnD8SvOFmznM3WZ+q+ybh9Mtc=;
  b=YtgaXFTbl2WKlZb85WFjKF7dCXqNxcqcD1YmuPoD9lnAAW25r2RKsKrF
   TiudTXAsANPKJmneyo5NNqXvmlFUXUvNPdNBB/9cRbVfL6ehlpSYd4Dz4
   yZoqhtvY3yooV+kQZBw9t8HkdNbAfq6fJ5rkRuNt6SwWPvTpJx/8gwsqk
   k9NlIlJejVO08XcAz5G95RbYwRm7J+EkYQfGieRgo0295Q8lwzyYA8icN
   iPUpdYtTrBsXX5i90iHyd7ZzkbYzkUjN3I1Jmsf33f7y2EtKTlwjAlLwG
   B3ScCezU8UcaXpSlQwFpH8aBHkDGNqBSxNGJp/ywR6Yn9ThWrjg6TC9F3
   g==;
X-CSE-ConnectionGUID: dTAUbYRHTLa579q6pvozWg==
X-CSE-MsgGUID: 6aLuHtLwR3WYBt1HdLsumw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21021117"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="21021117"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 14:29:26 -0700
X-CSE-ConnectionGUID: atX5bEDeRKy13kZkUkgljQ==
X-CSE-MsgGUID: yWU5z7LdRnifhCVpkR0W5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="56844713"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Aug 2024 14:29:22 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sboDY-0005jd-0B;
	Wed, 07 Aug 2024 21:29:14 +0000
Date: Thu, 8 Aug 2024 05:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mao Jinlong <quic_jinlmao@quicinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] coresight: Add remote etm support
Message-ID: <202408080511.RIKNKoHh-lkp@intel.com>
References: <20240807071054.12742-3-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807071054.12742-3-quic_jinlmao@quicinc.com>

Hi Mao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11-rc2 next-20240807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mao-Jinlong/dt-bindings-arm-Add-qcom-inst-id-for-remote-etm/20240807-151315
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240807071054.12742-3-quic_jinlmao%40quicinc.com
patch subject: [PATCH v2 2/2] coresight: Add remote etm support
config: arm-kismet-CONFIG_QCOM_QMI_HELPERS-CONFIG_CORESIGHT_REMOTE_ETM-0-0 (https://download.01.org/0day-ci/archive/20240808/202408080511.RIKNKoHh-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240808/202408080511.RIKNKoHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080511.RIKNKoHh-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS when selected by CORESIGHT_REMOTE_ETM
   WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
     Depends on [n]: NET [=n]
     Selected by [y]:
     - CORESIGHT_REMOTE_ETM [=y] && CORESIGHT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

