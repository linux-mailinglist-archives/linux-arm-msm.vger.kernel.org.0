Return-Path: <linux-arm-msm+bounces-4295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C115A80DF59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 00:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7720C282515
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 23:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37BD56468;
	Mon, 11 Dec 2023 23:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHLNimI1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A9A9A;
	Mon, 11 Dec 2023 15:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702336634; x=1733872634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ck35hHnCHFtH+d2GzNW7cjDeYHKAdUN4ZsaO0xxGAYs=;
  b=UHLNimI1LelydaQiGSTQ3hybOJ+yJ2Sxafvaf3/x7gPJKQpFoFM4zIib
   f3z87HL5sGbArumVRSOSE4YF/InKQjJdpx1p277IkIj7BUZzvzNStJkgv
   EW/rK1j0OHdNfZcCTBIdgL/n/8N7H17vr75v0Rp/24CbCMzgbeW7SsgMS
   guFB7Tt5NHWKcsaAVvsiCrWRtGj0nSiH5GGEbm3BYN6hdk3KsHhoo3RhC
   rL/PoXJAAZPYusL8ofbgDEtX7CDxboggrJKISKZdMf4l9PWxEIxZrkppJ
   9HJa1ahqJTcsmvrcEkjAOG8oGj1x1eVs+BJdSuH0sNDZ+cHwO7iIBlUui
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374230372"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="374230372"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 15:17:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722996351"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="722996351"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 11 Dec 2023 15:17:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCpWM-000IYd-2i;
	Mon, 11 Dec 2023 23:17:07 +0000
Date: Tue, 12 Dec 2023 07:16:50 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Xu <lizhi.xu@windriver.com>,
	syzbot+006987d1be3586e13555@syzkaller.appspotmail.com
Cc: oe-kbuild-all@lists.linux.dev, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mani@kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] radix-tree: fix memory leak in radix_tree_insert
Message-ID: <202312120651.92GGXeX4-lkp@intel.com>
References: <20231211094840.642118-1-lizhi.xu@windriver.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231211094840.642118-1-lizhi.xu@windriver.com>

Hi Lizhi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v6.7-rc5 next-20231211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Xu/radix-tree-fix-memory-leak-in-radix_tree_insert/20231211-174951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20231211094840.642118-1-lizhi.xu%40windriver.com
patch subject: [PATCH] radix-tree: fix memory leak in radix_tree_insert
config: i386-randconfig-061-20231212 (https://download.01.org/0day-ci/archive/20231212/202312120651.92GGXeX4-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231212/202312120651.92GGXeX4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312120651.92GGXeX4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/radix-tree.c:266:36: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *nodes @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:266:36: sparse:     expected struct xa_node *nodes
   lib/radix-tree.c:266:36: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:284:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] __rcu *parent @@     got struct xa_node *parent @@
   lib/radix-tree.c:284:29: sparse:     expected struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:284:29: sparse:     got struct xa_node *parent
   lib/radix-tree.c:344:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] __rcu *parent @@     got struct xa_node *nodes @@
   lib/radix-tree.c:344:38: sparse:     expected struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:344:38: sparse:     got struct xa_node *nodes
   lib/radix-tree.c:446:54: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node [noderef] __rcu *parent @@     got struct xa_node *node @@
   lib/radix-tree.c:446:54: sparse:     expected struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:446:54: sparse:     got struct xa_node *node
   lib/radix-tree.c:558:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *parent @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:558:24: sparse:     expected struct xa_node *parent
   lib/radix-tree.c:558:24: sparse:     got struct xa_node [noderef] __rcu *parent
>> lib/radix-tree.c:653:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *pn @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:653:28: sparse:     expected struct xa_node *pn
   lib/radix-tree.c:653:28: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:687:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *[assigned] child @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:687:31: sparse:     expected struct xa_node *[assigned] child
   lib/radix-tree.c:687:31: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:962:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *node @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:962:22: sparse:     expected struct xa_node *node
   lib/radix-tree.c:962:22: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:1022:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *node @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:1022:22: sparse:     expected struct xa_node *node
   lib/radix-tree.c:1022:22: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:1542:38: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *[assigned] node @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:1542:38: sparse:     expected struct xa_node *[assigned] node
   lib/radix-tree.c:1542:38: sparse:     got struct xa_node [noderef] __rcu *parent
   lib/radix-tree.c:1602:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct xa_node *nodes @@     got struct xa_node [noderef] __rcu *parent @@
   lib/radix-tree.c:1602:28: sparse:     expected struct xa_node *nodes
   lib/radix-tree.c:1602:28: sparse:     got struct xa_node [noderef] __rcu *parent

vim +653 lib/radix-tree.c

   581	
   582	/**
   583	 *	__radix_tree_create	-	create a slot in a radix tree
   584	 *	@root:		radix tree root
   585	 *	@index:		index key
   586	 *	@nodep:		returns node
   587	 *	@slotp:		returns slot
   588	 *
   589	 *	Create, if necessary, and return the node and slot for an item
   590	 *	at position @index in the radix tree @root.
   591	 *
   592	 *	Until there is more than one item in the tree, no nodes are
   593	 *	allocated and @root->xa_head is used as a direct slot instead of
   594	 *	pointing to a node, in which case *@nodep will be NULL.
   595	 *
   596	 *	Returns -ENOMEM, or 0 for success.
   597	 */
   598	static int __radix_tree_create(struct radix_tree_root *root,
   599			unsigned long index, struct radix_tree_node **nodep,
   600			void __rcu ***slotp)
   601	{
   602		struct radix_tree_node *node = NULL, *child;
   603		void __rcu **slot = (void __rcu **)&root->xa_head;
   604		unsigned long maxindex;
   605		unsigned int shift, offset = 0, mmshift = 0;
   606		unsigned long max = index;
   607		gfp_t gfp = root_gfp_mask(root);
   608		int ret;
   609	
   610		shift = radix_tree_load_root(root, &child, &maxindex);
   611	
   612		/* Make sure the tree is high enough.  */
   613		if (max > maxindex) {
   614			int error = radix_tree_extend(root, gfp, max, shift);
   615			if (error < 0)
   616				return error;
   617			shift = error;
   618			mmshift = error;
   619			child = rcu_dereference_raw(root->xa_head);
   620		}
   621	
   622		while (shift > 0) {
   623			shift -= RADIX_TREE_MAP_SHIFT;
   624			if (child == NULL) {
   625				/* Have to add a child node.  */
   626				child = radix_tree_node_alloc(gfp, node, root, shift,
   627								offset, 0, 0);
   628				if (!child) {
   629					 ret = -ENOMEM;
   630					 goto freec;
   631				}
   632				rcu_assign_pointer(*slot, node_to_entry(child));
   633				if (node)
   634					node->count++;
   635			} else if (!radix_tree_is_internal_node(child))
   636				break;
   637	
   638			/* Go a level down */
   639			node = entry_to_node(child);
   640			offset = radix_tree_descend(node, &child, index);
   641			slot = &node->slots[offset];
   642		}
   643	
   644		if (nodep)
   645			*nodep = node;
   646		if (slotp)
   647			*slotp = slot;
   648		return 0;
   649	freec:
   650		if (mmshift > 0) {
   651			struct radix_tree_node *pn;
   652			while (shift < mmshift && node) {
 > 653				pn = node->parent;
   654				radix_tree_node_rcu_free(&node->rcu_head);
   655				shift += RADIX_TREE_MAP_SHIFT;
   656				node = pn;
   657			}
   658		}
   659		return ret;
   660	}
   661	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

