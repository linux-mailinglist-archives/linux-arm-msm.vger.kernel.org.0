Return-Path: <linux-arm-msm+bounces-33465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5D993C62
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 03:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 213331F25202
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 01:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB61B18651;
	Tue,  8 Oct 2024 01:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7ZMifhx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C892617578;
	Tue,  8 Oct 2024 01:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728351753; cv=none; b=jBqpItmqpMp2AtqnnzzE3Jux5GtjB5MPLcFB5lIr6FECQBjoOLjaFJOdFcWepea3moE8JbXAevypk7Dq2UI0f3H6XpH2foVk6wc5vuk0Buf0ultoRBd3fRvb41tYMEi8sGe7r/8ffITDqaEbKWskT+1dvVeayHY5+6gYUQXvIWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728351753; c=relaxed/simple;
	bh=rWQrvuI3kWl4DRnBphjWazL5RHG9DMWBY7HPWDTFW88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLxZvEVPQJ7H0SgEadYst3MMA9zigUrgeQ2CUCADfy+k4XoOfVqnXmhpwl4roHu9AweDpvh6I/REO4TBd/W9X5XoKZMWCtoxAaoM0jKF5zBMn35IdVZfbphDoV595zMqQ/YifismpJ6yheeVnf4+k9QxUEryQ0B4c+zMrf22slU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7ZMifhx; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728351752; x=1759887752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rWQrvuI3kWl4DRnBphjWazL5RHG9DMWBY7HPWDTFW88=;
  b=c7ZMifhx58EpNJSJH3sA6r5QSZccYNjzSkso3zGcPiIBhMGcg8l/ciED
   o82AyOz5EALMGeMaNIHui5JkizhZm8/0iHwh5eLII+88CDhxF3YzwGC8z
   J+YBuN8fojSA4U4FGkr60F1vdblf1DCdcqkdOPE/EKFZR2CQRNOOM4Ri6
   48pXmgCBBcZtirXXnfbBXUsbEYY8Kbzuky0JU9elwc55ShnKGD933cFFW
   ix6Tyzd6qTFa2WyWjTQbsG66U20nMl/9GGLmI7JEHBmS7A4wv6ym/KM5j
   DLa3vYjiY/2mMKMqOtgL8qcMTJuZOjJVasHsWQyekHDmDCNAnvbuXEewd
   g==;
X-CSE-ConnectionGUID: 4fTSpPwPSkqUwenKU7bWIw==
X-CSE-MsgGUID: HCm1NytRRyuAh1e8GlDhQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27691179"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="27691179"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 18:42:30 -0700
X-CSE-ConnectionGUID: 8T0R0NfIQBa5Ga1kQiOj8g==
X-CSE-MsgGUID: apkcM5S+ScytZ5hecFmJiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; 
   d="scan'208";a="80455773"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Oct 2024 18:42:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxzF2-0005ku-2x;
	Tue, 08 Oct 2024 01:42:24 +0000
Date: Tue, 8 Oct 2024 09:41:36 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>,
	srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, gregkh@linuxfoundation.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <202410080906.2kCMkY5c-lkp@intel.com>
References: <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084518.3649876-2-quic_ekangupt@quicinc.com>

Hi Ekansh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.12-rc2 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Add-CRC-support-using-invokeV2-request/20241007-164734
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20241007084518.3649876-2-quic_ekangupt%40quicinc.com
patch subject: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2 request
config: arc-randconfig-001-20241008 (https://download.01.org/0day-ci/archive/20241008/202410080906.2kCMkY5c-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241008/202410080906.2kCMkY5c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410080906.2kCMkY5c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/fastrpc.c: In function 'fastrpc_context_alloc':
>> drivers/misc/fastrpc.c:584:16: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     584 |         args = (struct fastrpc_invoke_args *)inv2->inv.args;
         |                ^
   drivers/misc/fastrpc.c: In function 'fastrpc_init_create_static_process':
>> drivers/misc/fastrpc.c:1331:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1331 |         ioctl.inv.args = (u64)args;
         |                          ^
   drivers/misc/fastrpc.c: In function 'fastrpc_init_create_process':
   drivers/misc/fastrpc.c:1464:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1464 |         ioctl.inv.args = (u64)args;
         |                          ^
   drivers/misc/fastrpc.c: In function 'fastrpc_release_current_dsp_process':
   drivers/misc/fastrpc.c:1527:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1527 |         ioctl.inv.args = (u64)args;
         |                          ^
   drivers/misc/fastrpc.c: In function 'fastrpc_init_attach':
   drivers/misc/fastrpc.c:1674:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1674 |         ioctl.inv.args = (u64)args;
         |                          ^
   drivers/misc/fastrpc.c: In function 'fastrpc_copy_args':
>> drivers/misc/fastrpc.c:1696:19: warning: assignment to '__u64' {aka 'long long unsigned int'} from 'struct fastrpc_invoke_args *' makes integer from pointer without a cast [-Wint-conversion]
    1696 |         inv->args = args;
         |                   ^
   drivers/misc/fastrpc.c: In function 'fastrpc_invoke':
>> drivers/misc/fastrpc.c:1716:18: warning: passing argument 1 of 'kfree' makes pointer from integer without a cast [-Wint-conversion]
    1716 |         kfree(inv.args);
         |               ~~~^~~~~
         |                  |
         |                  __u64 {aka long long unsigned int}
   In file included from include/linux/mm.h:33,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-buf.h:19,
                    from drivers/misc/fastrpc.c:7:
   include/linux/slab.h:446:24: note: expected 'const void *' but argument is of type '__u64' {aka 'long long unsigned int'}
     446 | void kfree(const void *objp);
         |            ~~~~~~~~~~~~^~~~
   drivers/misc/fastrpc.c: In function 'fastrpc_invokev2':
   drivers/misc/fastrpc.c:1734:23: warning: passing argument 1 of 'kfree' makes pointer from integer without a cast [-Wint-conversion]
    1734 |         kfree(inv2.inv.args);
         |               ~~~~~~~~^~~~~
         |                       |
         |                       __u64 {aka long long unsigned int}
   include/linux/slab.h:446:24: note: expected 'const void *' but argument is of type '__u64' {aka 'long long unsigned int'}
     446 | void kfree(const void *objp);
         |            ~~~~~~~~~~~~^~~~
   drivers/misc/fastrpc.c: In function 'fastrpc_get_info_from_dsp':
   drivers/misc/fastrpc.c:1762:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1762 |         ioctl.inv.args = (u64)args;
         |                          ^
   drivers/misc/fastrpc.c: In function 'fastrpc_req_munmap_impl':
   drivers/misc/fastrpc.c:1864:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1864 |         ioctl.inv.args = (u64)args;
         |                          ^
   drivers/misc/fastrpc.c: In function 'fastrpc_req_mmap':
   drivers/misc/fastrpc.c:1961:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    1961 |         ioctl.inv.args = (u64)args;
         |                          ^
   drivers/misc/fastrpc.c: In function 'fastrpc_req_mem_unmap_impl':
   drivers/misc/fastrpc.c:2042:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2042 |         ioctl.inv.args = (u64)args;
         |                          ^
   drivers/misc/fastrpc.c: In function 'fastrpc_req_mem_map':
   drivers/misc/fastrpc.c:2112:26: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2112 |         ioctl.inv.args = (u64)args;
         |                          ^


vim +584 drivers/misc/fastrpc.c

   573	
   574	static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
   575				struct fastrpc_user *user, u32 kernel, u32 sc,
   576				struct fastrpc_invoke_v2 *inv2)
   577	{
   578		struct fastrpc_channel_ctx *cctx = user->cctx;
   579		struct fastrpc_invoke_ctx *ctx = NULL;
   580		struct fastrpc_invoke_args *args = NULL;
   581		unsigned long flags;
   582		int ret;
   583	
 > 584		args = (struct fastrpc_invoke_args *)inv2->inv.args;
   585		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
   586		if (!ctx)
   587			return ERR_PTR(-ENOMEM);
   588	
   589		INIT_LIST_HEAD(&ctx->node);
   590		ctx->fl = user;
   591		ctx->nscalars = REMOTE_SCALARS_LENGTH(sc);
   592		ctx->nbufs = REMOTE_SCALARS_INBUFS(sc) +
   593			     REMOTE_SCALARS_OUTBUFS(sc);
   594	
   595		if (ctx->nscalars) {
   596			ctx->maps = kcalloc(ctx->nscalars,
   597					    sizeof(*ctx->maps), GFP_KERNEL);
   598			if (!ctx->maps) {
   599				kfree(ctx);
   600				return ERR_PTR(-ENOMEM);
   601			}
   602			ctx->olaps = kcalloc(ctx->nscalars,
   603					    sizeof(*ctx->olaps), GFP_KERNEL);
   604			if (!ctx->olaps) {
   605				kfree(ctx->maps);
   606				kfree(ctx);
   607				return ERR_PTR(-ENOMEM);
   608			}
   609			ctx->args = args;
   610			fastrpc_get_buff_overlaps(ctx);
   611		}
   612	
   613		/* Released in fastrpc_context_put() */
   614		fastrpc_channel_ctx_get(cctx);
   615	
   616		ctx->crc = (u32 *)(uintptr_t)inv2->crc;
   617		ctx->sc = sc;
   618		ctx->retval = -1;
   619		ctx->pid = current->pid;
   620		ctx->tgid = user->tgid;
   621		ctx->cctx = cctx;
   622		init_completion(&ctx->work);
   623		INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
   624	
   625		spin_lock(&user->lock);
   626		list_add_tail(&ctx->node, &user->pending);
   627		spin_unlock(&user->lock);
   628	
   629		spin_lock_irqsave(&cctx->lock, flags);
   630		ret = idr_alloc_cyclic(&cctx->ctx_idr, ctx, 1,
   631				       FASTRPC_CTX_MAX, GFP_ATOMIC);
   632		if (ret < 0) {
   633			spin_unlock_irqrestore(&cctx->lock, flags);
   634			goto err_idr;
   635		}
   636		ctx->ctxid = ret << 4;
   637		spin_unlock_irqrestore(&cctx->lock, flags);
   638	
   639		kref_init(&ctx->refcount);
   640	
   641		return ctx;
   642	err_idr:
   643		spin_lock(&user->lock);
   644		list_del(&ctx->node);
   645		spin_unlock(&user->lock);
   646		fastrpc_channel_ctx_put(cctx);
   647		kfree(ctx->maps);
   648		kfree(ctx->olaps);
   649		kfree(ctx);
   650	
   651		return ERR_PTR(ret);
   652	}
   653	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

