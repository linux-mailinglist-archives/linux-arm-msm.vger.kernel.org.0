Return-Path: <linux-arm-msm+bounces-32317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C9B98489F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 17:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90CA91F2251C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 15:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5E11AB518;
	Tue, 24 Sep 2024 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyPs0JO+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0B71A76CB;
	Tue, 24 Sep 2024 15:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727191651; cv=none; b=AGhNbMyssZxQcOhcBeS7lZQRx7NrIVjJLvV0B2Jx5yox/103lRdbijNc4NsEKjtxRnCIB3VOUV5EnZBLq6oNABkq2JOZDhilXzcd3C+sucl+mPRqzbY4XBDbQc2weHQ1gumEFRbyURyLMG5gnsdi1VdVNqcUZNj28a5JVvh51IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727191651; c=relaxed/simple;
	bh=cSUDrZ9/tCtMACSuPQuhj1rRgxaaqPi30TYrGXEhtOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oASuL7h6nsD/6pX8GL8YePG0R3akvghrztRbEdCuBXZa1xYIr7gxWqUBFa7gNgIZUq2twB+Dxo3MlEI/BQXtlI1bMoIJn6gIYS1Q9HtJju0io57ikU+VYQ9ey+zfMwhORSpMveQmfpqJntEEjCMFBIkYYnY4Nu7pnQFWjVKrHB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyPs0JO+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727191649; x=1758727649;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cSUDrZ9/tCtMACSuPQuhj1rRgxaaqPi30TYrGXEhtOw=;
  b=SyPs0JO+++9NpxkiwHA7yy9j3jhUnzdI3mtI98XE/SuGm/X4ACjSjGIu
   ncRH764GXS/W49wn1J/S698P2HLfavUpIH+LN3YSuTGB8rGn7fNvPArnG
   nuRzcce+bsR4IuY2JK7Z5JJoEv2UtX1ZtJgXcyrL0T5/J/JHhGgMNvE5T
   JLS5u9xAWg13PPfvx7cZYrfwnmkUYxieoyX1t6tUSHtqhom2qkYzVIlrz
   L0h0FbgVcPQyURL3asiP2Lo9+ylAcPvt3KiQHobSMIZ0oHF3mimtJLGOF
   nDHVHoeqnIPHu+MvXxr0xu5lNI2DJclaTVyW5G5Q0zNpjR9UPClxHO+ie
   Q==;
X-CSE-ConnectionGUID: 4hmlZ2NrQ8u6RKSXi7y8Hw==
X-CSE-MsgGUID: sqcTtIXwTvS1AlIsNicBUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="36762819"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="36762819"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 08:27:28 -0700
X-CSE-ConnectionGUID: wwsChjuYSoyiKGUXrLdiFQ==
X-CSE-MsgGUID: mFn7zVAASSiHkCW/vIKXqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; 
   d="scan'208";a="76219286"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Sep 2024 08:27:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1st7Ri-000IUv-09;
	Tue, 24 Sep 2024 15:27:22 +0000
Date: Tue, 24 Sep 2024 23:27:17 +0800
From: kernel test robot <lkp@intel.com>
To: Shivnandan Kumar <quic_kshivnan@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Ramakrishna Gottimukkula <quic_rgottimu@quicinc.com>,
	Shivnandan Kumar <quic_kshivnan@quicinc.com>
Subject: Re: [PATCH 2/3] mailbox: qcom-cpucp-mbox: Add support for SC7280
 CPUCP mailbox controller
Message-ID: <202409242349.yXq4CDaH-lkp@intel.com>
References: <20240924050941.1251485-3-quic_kshivnan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924050941.1251485-3-quic_kshivnan@quicinc.com>

Hi Shivnandan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.11 next-20240924]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivnandan-Kumar/dt-bindings-mailbox-qcom-cpucp-mbox-Add-sc7280-cpucp-mailbox-instance/20240924-133657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240924050941.1251485-3-quic_kshivnan%40quicinc.com
patch subject: [PATCH 2/3] mailbox: qcom-cpucp-mbox: Add support for SC7280 CPUCP mailbox controller
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240924/202409242349.yXq4CDaH-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409242349.yXq4CDaH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409242349.yXq4CDaH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mailbox/qcom-cpucp-mbox.c:48: warning: Function parameter or struct member 'desc' not described in 'qcom_cpucp_mbox'


vim +48 drivers/mailbox/qcom-cpucp-mbox.c

0e2a9a03106cd5 Sibi Sankar      2024-06-12  34  
0e2a9a03106cd5 Sibi Sankar      2024-06-12  35  /**
0e2a9a03106cd5 Sibi Sankar      2024-06-12  36   * struct qcom_cpucp_mbox - Holder for the mailbox driver
0e2a9a03106cd5 Sibi Sankar      2024-06-12  37   * @chans:			The mailbox channel
0e2a9a03106cd5 Sibi Sankar      2024-06-12  38   * @mbox:			The mailbox controller
0e2a9a03106cd5 Sibi Sankar      2024-06-12  39   * @tx_base:			Base address of the CPUCP tx registers
0e2a9a03106cd5 Sibi Sankar      2024-06-12  40   * @rx_base:			Base address of the CPUCP rx registers
0e2a9a03106cd5 Sibi Sankar      2024-06-12  41   */
0e2a9a03106cd5 Sibi Sankar      2024-06-12  42  struct qcom_cpucp_mbox {
0e2a9a03106cd5 Sibi Sankar      2024-06-12  43  	struct mbox_chan chans[APSS_CPUCP_IPC_CHAN_SUPPORTED];
654ed3904f995a Shivnandan Kumar 2024-09-24  44  	const struct qcom_cpucp_mbox_desc *desc;
0e2a9a03106cd5 Sibi Sankar      2024-06-12  45  	struct mbox_controller mbox;
0e2a9a03106cd5 Sibi Sankar      2024-06-12  46  	void __iomem *tx_base;
0e2a9a03106cd5 Sibi Sankar      2024-06-12  47  	void __iomem *rx_base;
0e2a9a03106cd5 Sibi Sankar      2024-06-12 @48  };
0e2a9a03106cd5 Sibi Sankar      2024-06-12  49  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

