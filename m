Return-Path: <linux-arm-msm+bounces-65754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF66DB0B2BE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 01:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D602189AB4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 23:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F37328A730;
	Sat, 19 Jul 2025 23:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JowmF4+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7DC288CBA;
	Sat, 19 Jul 2025 23:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752967337; cv=none; b=opg3xO+rwUNcbLGpCYg7j9XVBemX+1p4IeknzUOzbCkaT+Og7mxTmd+DzoDOatgKxPnwfNDyjVqag5PKUKdT8yoXLh6A1gv8VZUoN2/QbZAE6vOe90pp0b1oCr59s6yL/5gfJm4ZXqTSWLVcshbxQ/gAfWB6VfoLf7g9te65qsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752967337; c=relaxed/simple;
	bh=592mduOSIIbjRo6QOG1O1f748urmA9UgcK+qaVVszxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ic9vlKTTcZTq2uBaeFOGPp0vnZ8cNMxbL6rfxnEsljjxJhT+UfIb71uh/Wp1SdK0+RXBMuQeewh8nzTxbFPcbcHC98gvk1j3en425dyNYolm6KyepyAiMYXWjK+5pMDjGW4xSVFmkj+4C7mLJftgOEeHoVV4iYqqCVj+LiLgwrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JowmF4+o; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752967335; x=1784503335;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=592mduOSIIbjRo6QOG1O1f748urmA9UgcK+qaVVszxw=;
  b=JowmF4+oMR7uc/bvahy8yNe8EWGt2QwNKwpPn6EixHr+bnwASfsWCXtj
   kC1oa+grz2lRZg4OFLcLBSfK+FpyYJEYR0NLNFoPoJWkQuCNQzPAQb6Xr
   k2byGpbJQEKV4MCRKe8zEO+nWDS6tdiYlV3rsMWS6KotpsGPXpxnagBip
   5jYqpoofU0tp+rOykkU4fzvDLSC2N3MEY1ec+2RyppKy+3apkjrccsmFh
   9QQkxt7VMjzbsA+MLG/XtP8/nVl4z2u2ATMia7/f0gc+NMs6xvfHiN54l
   oG9SqFBV3rwpt+IWnJszYDWjzpchnRpfF61e0eTQ+LfJw7NgjaFrTQcXE
   w==;
X-CSE-ConnectionGUID: 7Hx6cFLMTq+KQ8zITO7gMQ==
X-CSE-MsgGUID: 47SZ4qeTTzKgSN3xM9C0cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="55105536"
X-IronPort-AV: E=Sophos;i="6.16,325,1744095600"; 
   d="scan'208";a="55105536"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 16:22:15 -0700
X-CSE-ConnectionGUID: DE2RZxVNR9maiV7c8OKcRw==
X-CSE-MsgGUID: 5djQIU38Qxqxg9c80EihYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,325,1744095600"; 
   d="scan'208";a="158560564"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Jul 2025 16:22:11 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udGsb-000Fpx-0q;
	Sat, 19 Jul 2025 23:22:09 +0000
Date: Sun, 20 Jul 2025 07:22:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mihai Moldovan <ionic@ionic.de>, linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Denis Kenzior <denkenz@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 03/10] net: qrtr: support identical node ids
Message-ID: <202507200739.pd0Gkp22-lkp@intel.com>
References: <4d0fe1eab4b38fb85e2ec53c07289bc0843611a2.1752947108.git.ionic@ionic.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d0fe1eab4b38fb85e2ec53c07289bc0843611a2.1752947108.git.ionic@ionic.de>

Hi Mihai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mani-mhi/mhi-next]
[also build test WARNING on net-next/main net/main linus/master v6.16-rc6 next-20250718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mihai-Moldovan/net-qrtr-ns-validate-msglen-before-ctrl_pkt-use/20250720-030426
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git mhi-next
patch link:    https://lore.kernel.org/r/4d0fe1eab4b38fb85e2ec53c07289bc0843611a2.1752947108.git.ionic%40ionic.de
patch subject: [PATCH v2 03/10] net: qrtr: support identical node ids
config: arc-randconfig-002-20250720 (https://download.01.org/0day-ci/archive/20250720/202507200739.pd0Gkp22-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250720/202507200739.pd0Gkp22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507200739.pd0Gkp22-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/qrtr/af_qrtr.c: In function 'qrtr_node_assign':
>> net/qrtr/af_qrtr.c:429:36: warning: left shift count >= width of type [-Wshift-count-overflow]
     key = (unsigned long)node->ep->id << 32 | nid;
                                       ^~


vim +429 net/qrtr/af_qrtr.c

   412	
   413	/* Assign node id to node.
   414	 *
   415	 * This is mostly useful for automatic node id assignment, based on
   416	 * the source id in the incoming packet.
   417	 */
   418	static void qrtr_node_assign(struct qrtr_node *node, unsigned int nid)
   419	{
   420		unsigned long flags;
   421		unsigned long key;
   422	
   423		if (nid == QRTR_EP_NID_AUTO)
   424			return;
   425	
   426		spin_lock_irqsave(&qrtr_nodes_lock, flags);
   427	
   428		/* Always insert with the endpoint_id + node_id */
 > 429		key = (unsigned long)node->ep->id << 32 | nid;
   430		radix_tree_insert(&qrtr_nodes, key, node);
   431	
   432		if (!radix_tree_lookup(&qrtr_nodes, nid))
   433			radix_tree_insert(&qrtr_nodes, nid, node);
   434	
   435		if (node->nid == QRTR_EP_NID_AUTO)
   436			node->nid = nid;
   437		spin_unlock_irqrestore(&qrtr_nodes_lock, flags);
   438	}
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

