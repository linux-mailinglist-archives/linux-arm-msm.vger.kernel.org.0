Return-Path: <linux-arm-msm+bounces-101175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAKpLVFGzGm+RgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 00:10:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B560372536
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 00:10:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4B16301014D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572D7451051;
	Tue, 31 Mar 2026 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5Lx4SGH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B3A450918
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 22:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994937; cv=none; b=YczhZks4fkskWhQeXup0+46I6lsLg0btfu1aHrwHxDreVBhG1yQ3mL9eF+opccqjr49f8u08Sg97uIt9DQq/N1LmU8+8NFaRz2/Eqvp2FbljysJ1yZOsWZ4zrmAltA04/2zb4jGSMrYuhwS5wkkvcSVBjoIk/qOLXuOgzYRxNtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994937; c=relaxed/simple;
	bh=TJ9efL6+obsXSuvLhbvwl/96x+C8iR5ULWJu8P9ou/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sl76MkQfJk0Xky5/3CymI0hSJqdUB4oAPBd0DA0JVv6hRVBGxabacoyMNWuL0tr2VX+DQZ1AQBVUZwvMf6JqvnWKP3mwYtErYpz2PCx4Cy4uD5QqAjP+GPKrNBAFumug6Yv6SStLoY7AoJAirkFpvJNOZq+x7+X9vRyNtvGR1zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5Lx4SGH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774994935; x=1806530935;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TJ9efL6+obsXSuvLhbvwl/96x+C8iR5ULWJu8P9ou/g=;
  b=M5Lx4SGHIud8VL1YmxrZmTaXi92LNO4KkSxmHY0le2Plg1+XYDo2MS3X
   yEbu//ewnFiIrEyvuWGemiAztgVcQsq3MqkpbR99NzYkFAzbny96hWaVn
   Q4fIWQmNR+5PbJwMkNdyF4p5PwaDFj9ewE7WQnkzya3xxgaAleNqUB2/j
   lZ0iAYtv/vzMjR6ACNnfLwSqoVHLhMjqhEzAZR0yR2u/ZDc2tCWpCeEt2
   Bb+y5alXmzWVuJhtbus2uVCxdxqmJ7Fj6+aX89I+H169L1W68/KhBGtN2
   itLq1HI3qWLRrnk4jlFBMAf8PpeKLJcih5ASBpgsh5+Cx+JDiTd35Gqh7
   g==;
X-CSE-ConnectionGUID: 0Sc4ecOfTDGzufrGCWj6Nw==
X-CSE-MsgGUID: fX/dpQThQfunOeseG6MyNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75916212"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; 
   d="scan'208";a="75916212"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 15:08:54 -0700
X-CSE-ConnectionGUID: hZ45NYVOS969R2USmDmiIw==
X-CSE-MsgGUID: brpXuMoLQquB2tgssGs0aA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Mar 2026 15:08:49 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7hGP-000000004LB-0kCW;
	Tue, 31 Mar 2026 22:08:45 +0000
Date: Wed, 1 Apr 2026 06:07:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 5/5] drm/exec, drm/xe, drm/amdgpu: Add an accessor for
 struct drm_exec::ticket
Message-ID: <202604010642.6F4lO2Gd-lkp@intel.com>
References: <20260331092023.81616-6-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331092023.81616-6-thomas.hellstrom@linux.intel.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101175-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,linux.intel.com,amd.com,gmail.com,ffwll.ch,kernel.org,suse.de,intel.com,google.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[git-scm.com:url,01.org:url,gitlab.freedesktop.org:url,intel.com:dkim,intel.com:email,intel.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1B560372536
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20260330]
[cannot apply to drm-xe/drm-xe-next linus/master v7.0-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-exec-Remove-the-index-parameter-from-drm_exec_for_each_locked_obj-_reverse/20260331-220349
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260331092023.81616-6-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH 5/5] drm/exec, drm/xe, drm/amdgpu: Add an accessor for struct drm_exec::ticket
config: riscv-randconfig-r073-20260401 (https://download.01.org/0day-ci/archive/20260401/202604010642.6F4lO2Gd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604010642.6F4lO2Gd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604010642.6F4lO2Gd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:3001:59: error: passing 'struct drm_exec' to parameter of incompatible type 'struct drm_exec *'; take the address with &
    3001 |         ret = process_validate_vms(process_info, drm_exec_ticket(exec));
         |                                                                  ^~~~
         |                                                                  &
   include/drm/drm_exec.h:154:71: note: passing argument to parameter 'exec' here
     154 | static inline struct ww_acquire_ctx *drm_exec_ticket(struct drm_exec *exec)
         |                                                                       ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c:3042:63: error: passing 'struct drm_exec' to parameter of incompatible type 'struct drm_exec *'; take the address with &
    3042 |                 ret = amdgpu_vm_handle_moved(adev, peer_vm, drm_exec_ticket(exec));
         |                                                                             ^~~~
         |                                                                             &
   include/drm/drm_exec.h:154:71: note: passing argument to parameter 'exec' here
     154 | static inline struct ww_acquire_ctx *drm_exec_ticket(struct drm_exec *exec)
         |                                                                       ^
   2 errors generated.


vim +3001 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c

  2897	
  2898	/** amdgpu_amdkfd_gpuvm_restore_process_bos - Restore all BOs for the given
  2899	 *   KFD process identified by process_info
  2900	 *
  2901	 * @process_info: amdkfd_process_info of the KFD process
  2902	 *
  2903	 * After memory eviction, restore thread calls this function. The function
  2904	 * should be called when the Process is still valid. BO restore involves -
  2905	 *
  2906	 * 1.  Release old eviction fence and create new one
  2907	 * 2.  Get two copies of PD BO list from all the VMs. Keep one copy as pd_list.
  2908	 * 3   Use the second PD list and kfd_bo_list to create a list (ctx.list) of
  2909	 *     BOs that need to be reserved.
  2910	 * 4.  Reserve all the BOs
  2911	 * 5.  Validate of PD and PT BOs.
  2912	 * 6.  Validate all KFD BOs using kfd_bo_list and Map them and add new fence
  2913	 * 7.  Add fence to all PD and PT BOs.
  2914	 * 8.  Unreserve all BOs
  2915	 */
  2916	int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu **ef)
  2917	{
  2918		struct amdkfd_process_info *process_info = info;
  2919		struct amdgpu_vm *peer_vm;
  2920		struct kgd_mem *mem;
  2921		struct list_head duplicate_save;
  2922		struct amdgpu_sync sync_obj;
  2923		unsigned long failed_size = 0;
  2924		unsigned long total_size = 0;
  2925		struct drm_exec exec;
  2926		int ret;
  2927	
  2928		INIT_LIST_HEAD(&duplicate_save);
  2929	
  2930		mutex_lock(&process_info->lock);
  2931	
  2932		drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
  2933		drm_exec_until_all_locked(&exec) {
  2934			list_for_each_entry(peer_vm, &process_info->vm_list_head,
  2935					    vm_list_node) {
  2936				ret = amdgpu_vm_lock_pd(peer_vm, &exec, 2);
  2937				drm_exec_retry_on_contention(&exec);
  2938				if (unlikely(ret)) {
  2939					pr_err("Locking VM PD failed, ret: %d\n", ret);
  2940					goto ttm_reserve_fail;
  2941				}
  2942			}
  2943	
  2944			/* Reserve all BOs and page tables/directory. Add all BOs from
  2945			 * kfd_bo_list to ctx.list
  2946			 */
  2947			list_for_each_entry(mem, &process_info->kfd_bo_list,
  2948					    validate_list) {
  2949				struct drm_gem_object *gobj;
  2950	
  2951				gobj = &mem->bo->tbo.base;
  2952				ret = drm_exec_prepare_obj(&exec, gobj, 1);
  2953				drm_exec_retry_on_contention(&exec);
  2954				if (unlikely(ret)) {
  2955					pr_err("drm_exec_prepare_obj failed, ret: %d\n", ret);
  2956					goto ttm_reserve_fail;
  2957				}
  2958			}
  2959		}
  2960	
  2961		amdgpu_sync_create(&sync_obj);
  2962	
  2963		/* Validate BOs managed by KFD */
  2964		list_for_each_entry(mem, &process_info->kfd_bo_list,
  2965				    validate_list) {
  2966	
  2967			struct amdgpu_bo *bo = mem->bo;
  2968			uint32_t domain = mem->domain;
  2969			struct dma_resv_iter cursor;
  2970			struct dma_fence *fence;
  2971	
  2972			total_size += amdgpu_bo_size(bo);
  2973	
  2974			ret = amdgpu_amdkfd_bo_validate(bo, domain, false);
  2975			if (ret) {
  2976				pr_debug("Memory eviction: Validate BOs failed\n");
  2977				failed_size += amdgpu_bo_size(bo);
  2978				ret = amdgpu_amdkfd_bo_validate(bo,
  2979							AMDGPU_GEM_DOMAIN_GTT, false);
  2980				if (ret) {
  2981					pr_debug("Memory eviction: Try again\n");
  2982					goto validate_map_fail;
  2983				}
  2984			}
  2985			dma_resv_for_each_fence(&cursor, bo->tbo.base.resv,
  2986						DMA_RESV_USAGE_KERNEL, fence) {
  2987				ret = amdgpu_sync_fence(&sync_obj, fence, GFP_KERNEL);
  2988				if (ret) {
  2989					pr_debug("Memory eviction: Sync BO fence failed. Try again\n");
  2990					goto validate_map_fail;
  2991				}
  2992			}
  2993		}
  2994	
  2995		if (failed_size)
  2996			pr_debug("0x%lx/0x%lx in system\n", failed_size, total_size);
  2997	
  2998		/* Validate PDs, PTs and evicted DMABuf imports last. Otherwise BO
  2999		 * validations above would invalidate DMABuf imports again.
  3000		 */
> 3001		ret = process_validate_vms(process_info, drm_exec_ticket(exec));
  3002		if (ret) {
  3003			pr_debug("Validating VMs failed, ret: %d\n", ret);
  3004			goto validate_map_fail;
  3005		}
  3006	
  3007		/* Update mappings managed by KFD. */
  3008		list_for_each_entry(mem, &process_info->kfd_bo_list,
  3009				    validate_list) {
  3010			struct kfd_mem_attachment *attachment;
  3011	
  3012			list_for_each_entry(attachment, &mem->attachments, list) {
  3013				if (!attachment->is_mapped)
  3014					continue;
  3015	
  3016				kfd_mem_dmaunmap_attachment(mem, attachment);
  3017				ret = update_gpuvm_pte(mem, attachment, &sync_obj);
  3018				if (ret) {
  3019					pr_debug("Memory eviction: update PTE failed. Try again\n");
  3020					goto validate_map_fail;
  3021				}
  3022			}
  3023		}
  3024	
  3025		/* Update mappings not managed by KFD */
  3026		list_for_each_entry(peer_vm, &process_info->vm_list_head,
  3027				vm_list_node) {
  3028			struct amdgpu_device *adev = amdgpu_ttm_adev(
  3029				peer_vm->root.bo->tbo.bdev);
  3030	
  3031			struct amdgpu_fpriv *fpriv =
  3032				container_of(peer_vm, struct amdgpu_fpriv, vm);
  3033	
  3034			ret = amdgpu_vm_bo_update(adev, fpriv->prt_va, false);
  3035			if (ret) {
  3036				dev_dbg(adev->dev,
  3037					"Memory eviction: handle PRT moved failed, pid %8d. Try again.\n",
  3038					pid_nr(process_info->pid));
  3039				goto validate_map_fail;
  3040			}
  3041	
  3042			ret = amdgpu_vm_handle_moved(adev, peer_vm, drm_exec_ticket(exec));
  3043			if (ret) {
  3044				dev_dbg(adev->dev,
  3045					"Memory eviction: handle moved failed, pid %8d. Try again.\n",
  3046					pid_nr(process_info->pid));
  3047				goto validate_map_fail;
  3048			}
  3049		}
  3050	
  3051		/* Update page directories */
  3052		ret = process_update_pds(process_info, &sync_obj);
  3053		if (ret) {
  3054			pr_debug("Memory eviction: update PDs failed. Try again\n");
  3055			goto validate_map_fail;
  3056		}
  3057	
  3058		/* Sync with fences on all the page tables. They implicitly depend on any
  3059		 * move fences from amdgpu_vm_handle_moved above.
  3060		 */
  3061		ret = process_sync_pds_resv(process_info, &sync_obj);
  3062		if (ret) {
  3063			pr_debug("Memory eviction: Failed to sync to PD BO moving fence. Try again\n");
  3064			goto validate_map_fail;
  3065		}
  3066	
  3067		/* Wait for validate and PT updates to finish */
  3068		amdgpu_sync_wait(&sync_obj, false);
  3069	
  3070		/* The old eviction fence may be unsignaled if restore happens
  3071		 * after a GPU reset or suspend/resume. Keep the old fence in that
  3072		 * case. Otherwise release the old eviction fence and create new
  3073		 * one, because fence only goes from unsignaled to signaled once
  3074		 * and cannot be reused. Use context and mm from the old fence.
  3075		 *
  3076		 * If an old eviction fence signals after this check, that's OK.
  3077		 * Anyone signaling an eviction fence must stop the queues first
  3078		 * and schedule another restore worker.
  3079		 */
  3080		if (dma_fence_is_signaled(&process_info->eviction_fence->base)) {
  3081			struct amdgpu_amdkfd_fence *new_fence =
  3082				amdgpu_amdkfd_fence_create(
  3083					process_info->eviction_fence->base.context,
  3084					process_info->eviction_fence->mm,
  3085					NULL, process_info->context_id);
  3086	
  3087			if (!new_fence) {
  3088				pr_err("Failed to create eviction fence\n");
  3089				ret = -ENOMEM;
  3090				goto validate_map_fail;
  3091			}
  3092			dma_fence_put(&process_info->eviction_fence->base);
  3093			process_info->eviction_fence = new_fence;
  3094			replace_eviction_fence(ef, dma_fence_get(&new_fence->base));
  3095		} else {
  3096			WARN_ONCE(*ef != &process_info->eviction_fence->base,
  3097				  "KFD eviction fence doesn't match KGD process_info");
  3098		}
  3099	
  3100		/* Attach new eviction fence to all BOs except pinned ones */
  3101		list_for_each_entry(mem, &process_info->kfd_bo_list, validate_list) {
  3102			if (mem->bo->tbo.pin_count)
  3103				continue;
  3104	
  3105			dma_resv_add_fence(mem->bo->tbo.base.resv,
  3106					   &process_info->eviction_fence->base,
  3107					   DMA_RESV_USAGE_BOOKKEEP);
  3108		}
  3109		/* Attach eviction fence to PD / PT BOs and DMABuf imports */
  3110		list_for_each_entry(peer_vm, &process_info->vm_list_head,
  3111				    vm_list_node) {
  3112			struct amdgpu_bo *bo = peer_vm->root.bo;
  3113	
  3114			dma_resv_add_fence(bo->tbo.base.resv,
  3115					   &process_info->eviction_fence->base,
  3116					   DMA_RESV_USAGE_BOOKKEEP);
  3117		}
  3118	
  3119	validate_map_fail:
  3120		amdgpu_sync_free(&sync_obj);
  3121	ttm_reserve_fail:
  3122		drm_exec_fini(&exec);
  3123		mutex_unlock(&process_info->lock);
  3124		return ret;
  3125	}
  3126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

