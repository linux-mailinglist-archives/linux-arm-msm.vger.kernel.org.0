Return-Path: <linux-arm-msm+bounces-92883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id frLzBZiDkmkEugEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 03:40:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 79431140AB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 03:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A48043008507
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 02:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EEB29E110;
	Mon, 16 Feb 2026 02:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkmWQGUx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B6C286D4B;
	Mon, 16 Feb 2026 02:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771209621; cv=none; b=BjlGppP0q0Sp4S2Pq55Fks1dMADZflNoI5DD0hZftAHJQ0Dj8Hv7IYMVrehrH3Rt/CUPXccxj33HFah2vF5wj+D0mkWWRNMFK5ojdB4+yXQZgH7lJYomYBp58iOJAXnsmZjXIcBhukIdO5e/uNOZ48zxGtdUXUrGaFC29f8xSJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771209621; c=relaxed/simple;
	bh=Q+c3RfmNudyA6okLo+b6gNeR3tguUr+7BZ3rKjSmwsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YDbWryiNhE3wRYoFEI7+STgu+AZmWQoXIhVrcwGXlMxKousrpT3HfT0vPL5L2zcRadzGpW0CBlJie6kzZjQytlo7D9C+amGIVbP5qhOlpxeik1acq9hQfAq0Gg7eVo0k+17S4UI5xaSWDcMckdejJY+LSLQUuvhdRhDsVIoosSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkmWQGUx; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771209619; x=1802745619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q+c3RfmNudyA6okLo+b6gNeR3tguUr+7BZ3rKjSmwsE=;
  b=jkmWQGUxxowHOMqG3dV8MoG4FwIzgNHnEOnUMAmkZgYJk1qc3h6NF3jd
   Uw4REMTHtX8haCDvrVsmZRQzJC0Ybp4I8DjPVzaoRjO/sNyJQMj/UDVwm
   gud/3M22xYGxlOg+Ayx6Q79KVH2HXcdGpIYQiFktHBOFHpmPsmvce4h8N
   9w7LUwJkBjzSd+kT/CD1uJUXXMgQU00F8XO8+xMM80TteS8OoFsXDzHoy
   3LgRqFGTBdgjJvyg1qosOIaDAlB1W2QGzuODxeBQSOhG5rOg/WRvQf4Q7
   bd9o6d38ZE+cF0XIChcjwS3MLZsnAcA1oZRysDN09k6lLoXBuXg2blK7n
   g==;
X-CSE-ConnectionGUID: u2jn6GLTR8ep0XGqjMvPew==
X-CSE-MsgGUID: VndeE5g2RvKBr8DTH2XKSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72339098"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72339098"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 18:40:18 -0800
X-CSE-ConnectionGUID: FNjSZKsPQKSeUnZ2ulGTAA==
X-CSE-MsgGUID: Te9ANFRZQ9+VG5o4AwGH0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="244056967"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Feb 2026 18:40:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vroWz-00000000zKO-1Mvg;
	Mon, 16 Feb 2026 02:40:13 +0000
Date: Mon, 16 Feb 2026 10:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
	dri-devel@lists.freedesktop.org, arnd@arndb.de,
	dmitry.baryshkov@oss.qualcomm.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with
 GENMASK
Message-ID: <202602161009.M2K52X34-lkp@intel.com>
References: <20260215182136.3995111-3-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215182136.3995111-3-ekansh.gupta@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92883-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email,git-scm.com:url]
X-Rspamd-Queue-Id: 79431140AB3
X-Rspamd-Action: no action

Hi Ekansh,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.19 next-20260213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Move-fdlist-to-invoke-context-structure/20260216-022305
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260215182136.3995111-3-ekansh.gupta%40oss.qualcomm.com
patch subject: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
config: hexagon-randconfig-001-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161009.M2K52X34-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161009.M2K52X34-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161009.M2K52X34-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/fastrpc.c:518:29: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     518 |         idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
         |                                    ^
>> drivers/misc/fastrpc.c:654:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     654 |         ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
         |                      ^
   drivers/misc/fastrpc.c:2509:10: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2509 |         ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
         |                 ^
   3 errors generated.


vim +/FIELD_GET +518 drivers/misc/fastrpc.c

   500	
   501	static void fastrpc_context_free(struct kref *ref)
   502	{
   503		struct fastrpc_invoke_ctx *ctx;
   504		struct fastrpc_channel_ctx *cctx;
   505		unsigned long flags;
   506		int i;
   507	
   508		ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
   509		cctx = ctx->cctx;
   510	
   511		for (i = 0; i < ctx->nbufs; i++)
   512			fastrpc_map_put(ctx->maps[i]);
   513	
   514		if (ctx->buf)
   515			fastrpc_buf_free(ctx->buf);
   516	
   517		spin_lock_irqsave(&cctx->lock, flags);
 > 518		idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
   519		spin_unlock_irqrestore(&cctx->lock, flags);
   520	
   521		kfree(ctx->maps);
   522		kfree(ctx->olaps);
   523		kfree(ctx);
   524	
   525		fastrpc_channel_ctx_put(cctx);
   526	}
   527	
   528	static void fastrpc_context_get(struct fastrpc_invoke_ctx *ctx)
   529	{
   530		kref_get(&ctx->refcount);
   531	}
   532	
   533	static void fastrpc_context_put(struct fastrpc_invoke_ctx *ctx)
   534	{
   535		kref_put(&ctx->refcount, fastrpc_context_free);
   536	}
   537	
   538	static void fastrpc_context_put_wq(struct work_struct *work)
   539	{
   540		struct fastrpc_invoke_ctx *ctx =
   541				container_of(work, struct fastrpc_invoke_ctx, put_work);
   542	
   543		fastrpc_context_put(ctx);
   544	}
   545	
   546	#define CMP(aa, bb) ((aa) == (bb) ? 0 : (aa) < (bb) ? -1 : 1)
   547	static int olaps_cmp(const void *a, const void *b)
   548	{
   549		struct fastrpc_buf_overlap *pa = (struct fastrpc_buf_overlap *)a;
   550		struct fastrpc_buf_overlap *pb = (struct fastrpc_buf_overlap *)b;
   551		/* sort with lowest starting buffer first */
   552		int st = CMP(pa->start, pb->start);
   553		/* sort with highest ending buffer first */
   554		int ed = CMP(pb->end, pa->end);
   555	
   556		return st == 0 ? ed : st;
   557	}
   558	
   559	static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
   560	{
   561		u64 max_end = 0;
   562		int i;
   563	
   564		for (i = 0; i < ctx->nbufs; ++i) {
   565			ctx->olaps[i].start = ctx->args[i].ptr;
   566			ctx->olaps[i].end = ctx->olaps[i].start + ctx->args[i].length;
   567			ctx->olaps[i].raix = i;
   568		}
   569	
   570		sort(ctx->olaps, ctx->nbufs, sizeof(*ctx->olaps), olaps_cmp, NULL);
   571	
   572		for (i = 0; i < ctx->nbufs; ++i) {
   573			/* Falling inside previous range */
   574			if (ctx->olaps[i].start < max_end) {
   575				ctx->olaps[i].mstart = max_end;
   576				ctx->olaps[i].mend = ctx->olaps[i].end;
   577				ctx->olaps[i].offset = max_end - ctx->olaps[i].start;
   578	
   579				if (ctx->olaps[i].end > max_end) {
   580					max_end = ctx->olaps[i].end;
   581				} else {
   582					ctx->olaps[i].mend = 0;
   583					ctx->olaps[i].mstart = 0;
   584				}
   585	
   586			} else  {
   587				ctx->olaps[i].mend = ctx->olaps[i].end;
   588				ctx->olaps[i].mstart = ctx->olaps[i].start;
   589				ctx->olaps[i].offset = 0;
   590				max_end = ctx->olaps[i].end;
   591			}
   592		}
   593	}
   594	
   595	static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
   596				struct fastrpc_user *user, u32 kernel, u32 sc,
   597				struct fastrpc_invoke_args *args)
   598	{
   599		struct fastrpc_channel_ctx *cctx = user->cctx;
   600		struct fastrpc_invoke_ctx *ctx = NULL;
   601		unsigned long flags;
   602		int ret;
   603	
   604		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
   605		if (!ctx)
   606			return ERR_PTR(-ENOMEM);
   607	
   608		INIT_LIST_HEAD(&ctx->node);
   609		ctx->fl = user;
   610		ctx->nscalars = REMOTE_SCALARS_LENGTH(sc);
   611		ctx->nbufs = REMOTE_SCALARS_INBUFS(sc) +
   612			     REMOTE_SCALARS_OUTBUFS(sc);
   613	
   614		if (ctx->nscalars) {
   615			ctx->maps = kcalloc(ctx->nscalars,
   616					    sizeof(*ctx->maps), GFP_KERNEL);
   617			if (!ctx->maps) {
   618				kfree(ctx);
   619				return ERR_PTR(-ENOMEM);
   620			}
   621			ctx->olaps = kcalloc(ctx->nscalars,
   622					    sizeof(*ctx->olaps), GFP_KERNEL);
   623			if (!ctx->olaps) {
   624				kfree(ctx->maps);
   625				kfree(ctx);
   626				return ERR_PTR(-ENOMEM);
   627			}
   628			ctx->args = args;
   629			fastrpc_get_buff_overlaps(ctx);
   630		}
   631	
   632		/* Released in fastrpc_context_put() */
   633		fastrpc_channel_ctx_get(cctx);
   634	
   635		ctx->sc = sc;
   636		ctx->retval = -1;
   637		ctx->pid = current->pid;
   638		ctx->client_id = user->client_id;
   639		ctx->cctx = cctx;
   640		init_completion(&ctx->work);
   641		INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
   642	
   643		spin_lock(&user->lock);
   644		list_add_tail(&ctx->node, &user->pending);
   645		spin_unlock(&user->lock);
   646	
   647		spin_lock_irqsave(&cctx->lock, flags);
   648		ret = idr_alloc_cyclic(&cctx->ctx_idr, ctx, 1,
   649				       FASTRPC_CTX_MAX, GFP_ATOMIC);
   650		if (ret < 0) {
   651			spin_unlock_irqrestore(&cctx->lock, flags);
   652			goto err_idr;
   653		}
 > 654		ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
   655		spin_unlock_irqrestore(&cctx->lock, flags);
   656	
   657		kref_init(&ctx->refcount);
   658	
   659		return ctx;
   660	err_idr:
   661		spin_lock(&user->lock);
   662		list_del(&ctx->node);
   663		spin_unlock(&user->lock);
   664		fastrpc_channel_ctx_put(cctx);
   665		kfree(ctx->maps);
   666		kfree(ctx->olaps);
   667		kfree(ctx);
   668	
   669		return ERR_PTR(ret);
   670	}
   671	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

