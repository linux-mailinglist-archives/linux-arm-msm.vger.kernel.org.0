Return-Path: <linux-arm-msm+bounces-118220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CdALJKzBUGpn4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:55:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D27CB7394DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:55:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=fX2HIDwM;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118220-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118220-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E3F8C3010532
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B809B3F8245;
	Fri, 10 Jul 2026 09:53:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF03F9A0F
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:53:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677199; cv=none; b=SHhaIZMYBOoYdiYgRsyFm4YQ4pPvK5vgSnc4CebJmKSVR2hmKw4T5yoHj4cInVAxqg9JjzYhIAFfjTKILbI2JDC895el3DvyK1LnTw5j8dYBx3WTfmyBRreDupM86/YeOMg8Vqc9vpDufiV47l34SbGxZxMfeRfSuFP2FWy4pOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677199; c=relaxed/simple;
	bh=7C+dngNiqMnrDedA04HwC0Raajk1d1fX/RhhiLVlUZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpR1GI3lo72LE26KDZmrYEUEiFxx1s4etSUR+D9I8Ciw08K9Yao4zL3hci5VNPs7eAZHosGajqCID3zaEsoRdrRo4Mx5dN5xtejzha8mTMvJOmH9nHSeAwchp1lNV0TxIdyzlv1W5qb+4A7zBBBBEgowcqHu1zMgR/YByEnttmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fX2HIDwM; arc=none smtp.client-ip=198.175.65.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783677198; x=1815213198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7C+dngNiqMnrDedA04HwC0Raajk1d1fX/RhhiLVlUZ0=;
  b=fX2HIDwMLBd0zye7VodRbFdti2cvgHZREsxRYBYfHCWvSFdyZ/HFj8Hb
   8PfmcdcXoYYAEdfqJi7C9DdhPoxCsTR2chZu6/kCoStIVscrcRQIBR6e6
   EfhI6OAmTEj0DaGiCzM0lyA7twhlSLXaKTCqVKJSP+8E5f1yaFpypbR2C
   8Zqc8kSHom805Sk1c/NUQYAPnIrhwBm8CPoF1j9L0B0SHgotfFl41+7rJ
   CrXDzsTDEdR/01pJW5vF8P+GXgiJW7Xkf6SQQXjvrmIB42js8ea/7V/0o
   R6RPY6a09zXHxM09Jyuk0A7KtcYO2kFrmUQ0ddZTOQ3iOWUJ7KPf/jwA8
   g==;
X-CSE-ConnectionGUID: s+oiADcRTIqTW8RtPdxgSw==
X-CSE-MsgGUID: kelzcbL8TwawgxkKB11Sog==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94725881"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94725881"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 02:53:17 -0700
X-CSE-ConnectionGUID: WqODvaY7Tl6nY9vmCHP8Vg==
X-CSE-MsgGUID: j2AG/jkQRxe9juJNrL/FZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255496560"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 02:53:15 -0700
Date: Fri, 10 Jul 2026 11:52:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm-uapi: Sync msm_drm.h
Message-ID: <20260710095257.qw6xrgfb5estyqrq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
	Rob Clark <rob.clark@oss.qualcomm.com>,
	igt-dev@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
References: <20260708161224.507091-1-rob.clark@oss.qualcomm.com>
 <20260708161224.507091-2-rob.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708161224.507091-2-rob.clark@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118220-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[kamil.konieczny@linux.intel.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:igt-dev@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kamil.konieczny@linux.intel.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:email,intel.com:dkim,gitlab.freedesktop.org:url,vger.kernel.org:from_smtp,kamilkon-DESK.igk.intel.com:mid,linux.intel.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D27CB7394DC

Hi Rob,
On 2026-07-08 at 09:12:23 -0700, Rob Clark wrote:

please make subject explicit with which commit you syncing,
like:

[PATCH v2 1/2] drm-uapi/msm: Sync with drm-next up to a7b378c94937

> Pull in updated UABI header with PERFCNTR_CONFIG ioctl.  Sync with:
> 
>    commit 44c460d2cc8b87c08360fe60f861660c8045ef90
>    Merge: 9bb8af2770b7 9a967125427e
>    Author: Dave Airlie <airlied@redhat.com>
> 
>        Merge tag 'drm-msm-next-2026-05-30' of https://gitlab.freedesktop.org/drm/msm into drm-next

Here also imho just write down which new commits appear,
like:

Sync msm drm uapi with drm-next up to commit a7b378c94937, this
will bring following changes:

a7b378c94937 ("drm/msm: Add PERFCNTR_CONFIG ioctl")
64ac64bb6206 ("drm/msm/adreno: Expose a PARAM to check AQE support")
2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")

> 
> Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
> Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41158>

imho better to place this in main description and without '<' '>'

with this
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. no need for resend, I can edit it at merge.

> ---
>  include/drm-uapi/msm_drm.h | 204 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 188 insertions(+), 16 deletions(-)
> 
> diff --git a/include/drm-uapi/msm_drm.h b/include/drm-uapi/msm_drm.h
> index 2377147b6af0..7f2e594be4eb 100644
> --- a/include/drm-uapi/msm_drm.h
> +++ b/include/drm-uapi/msm_drm.h
> @@ -90,6 +90,34 @@ struct drm_msm_timespec {
>  #define MSM_PARAM_RAYTRACING 0x11 /* RO */
>  #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
>  #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> +#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> +/* PRR (Partially Resident Region) is required for sparse residency: */
> +#define MSM_PARAM_HAS_PRR    0x15  /* RO */
> +/* MSM_PARAM_EN_VM_BIND is set to 1 to enable VM_BIND ops.
> + *
> + * With VM_BIND enabled, userspace is required to allocate iova and use the
> + * VM_BIND ops for map/unmap ioctls.  MSM_INFO_SET_IOVA and MSM_INFO_GET_IOVA
> + * will be rejected.  (The latter does not have a sensible meaning when a BO
> + * can have multiple and/or partial mappings.)
> + *
> + * With VM_BIND enabled, userspace does not include a submit_bo table in the
> + * SUBMIT ioctl (this will be rejected), the resident set is determined by
> + * the the VM_BIND ops.
> + *
> + * Enabling VM_BIND will fail on devices which do not have per-process pgtables.
> + * And it is not allowed to disable VM_BIND once it has been enabled.
> + *
> + * Enabling VM_BIND should be done (attempted) prior to allocating any BOs or
> + * submitqueues of type MSM_SUBMITQUEUE_VM_BIND.
> + *
> + * Relatedly, when VM_BIND mode is enabled, the kernel will not try to recover
> + * from GPU faults or failed async VM_BIND ops, in particular because it is
> + * difficult to communicate to userspace which op failed so that userspace
> + * could rewind and try again.  When the VM is marked unusable, the SUBMIT
> + * ioctl will throw -EPIPE.
> + */
> +#define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
> +#define MSM_PARAM_AQE	     0x17  /* RO */
>  
>  /* For backwards compat.  The original support for preemption was based on
>   * a single ring per priority level so # of priority levels equals the #
> @@ -113,6 +141,19 @@ struct drm_msm_param {
>  
>  #define MSM_BO_SCANOUT       0x00000001     /* scanout capable */
>  #define MSM_BO_GPU_READONLY  0x00000002
> +/* Private buffers do not need to be explicitly listed in the SUBMIT
> + * ioctl, unless referenced by a drm_msm_gem_submit_cmd.  Private
> + * buffers may NOT be imported/exported or used for scanout (or any
> + * other situation where buffers can be indefinitely pinned, but
> + * cases other than scanout are all kernel owned BOs which are not
> + * visible to userspace).
> + *
> + * In exchange for those constraints, all private BOs associated with
> + * a single context (drm_file) share a single dma_resv, and if there
> + * has been no eviction since the last submit, there are no per-BO
> + * bookeeping to do, significantly cutting the SUBMIT overhead.
> + */
> +#define MSM_BO_NO_SHARE      0x00000004
>  #define MSM_BO_CACHE_MASK    0x000f0000
>  /* cache modes */
>  #define MSM_BO_CACHED        0x00010000
> @@ -122,6 +163,7 @@ struct drm_msm_param {
>  
>  #define MSM_BO_FLAGS         (MSM_BO_SCANOUT | \
>                                MSM_BO_GPU_READONLY | \
> +                              MSM_BO_NO_SHARE | \
>                                MSM_BO_CACHE_MASK)
>  
>  struct drm_msm_gem_new {
> @@ -179,6 +221,17 @@ struct drm_msm_gem_cpu_fini {
>   * Cmdstream Submission:
>   */
>  
> +#define MSM_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
> +#define MSM_SYNCOBJ_FLAGS ( \
> +		MSM_SYNCOBJ_RESET | \
> +		0)
> +
> +struct drm_msm_syncobj {
> +	__u32 handle;     /* in, syncobj handle. */
> +	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
> +	__u64 point;      /* in, timepoint for timeline syncobjs. */
> +};
> +
>  /* The value written into the cmdstream is logically:
>   *
>   *   ((relocbuf->gpuaddr + reloc_offset) << shift) | or
> @@ -220,7 +273,10 @@ struct drm_msm_gem_submit_cmd {
>  	__u32 size;           /* in, cmdstream size */
>  	__u32 pad;
>  	__u32 nr_relocs;      /* in, number of submit_reloc's */
> -	__u64 relocs;         /* in, ptr to array of submit_reloc's */
> +	union {
> +		__u64 relocs; /* in, ptr to array of submit_reloc's */
> +		__u64 iova;   /* cmdstream address (for VM_BIND contexts) */
> +	};
>  };
>  
>  /* Each buffer referenced elsewhere in the cmdstream submit (ie. the
> @@ -268,17 +324,6 @@ struct drm_msm_gem_submit_bo {
>  		MSM_SUBMIT_FENCE_SN_IN   | \
>  		0)
>  
> -#define MSM_SUBMIT_SYNCOBJ_RESET 0x00000001 /* Reset syncobj after wait. */
> -#define MSM_SUBMIT_SYNCOBJ_FLAGS        ( \
> -		MSM_SUBMIT_SYNCOBJ_RESET | \
> -		0)
> -
> -struct drm_msm_gem_submit_syncobj {
> -	__u32 handle;     /* in, syncobj handle. */
> -	__u32 flags;      /* in, from MSM_SUBMIT_SYNCOBJ_FLAGS */
> -	__u64 point;      /* in, timepoint for timeline syncobjs. */
> -};
> -
>  /* Each cmdstream submit consists of a table of buffers involved, and
>   * one or more cmdstream buffers.  This allows for conditional execution
>   * (context-restore), and IB buffers needed for per tile/bin draw cmds.
> @@ -292,13 +337,80 @@ struct drm_msm_gem_submit {
>  	__u64 cmds;           /* in, ptr to array of submit_cmd's */
>  	__s32 fence_fd;       /* in/out fence fd (see MSM_SUBMIT_FENCE_FD_IN/OUT) */
>  	__u32 queueid;        /* in, submitqueue id */
> -	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_gem_submit_syncobj */
> -	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_gem_submit_syncobj */
> +	__u64 in_syncobjs;    /* in, ptr to array of drm_msm_syncobj */
> +	__u64 out_syncobjs;   /* in, ptr to array of drm_msm_syncobj */
>  	__u32 nr_in_syncobjs; /* in, number of entries in in_syncobj */
>  	__u32 nr_out_syncobjs; /* in, number of entries in out_syncobj. */
>  	__u32 syncobj_stride; /* in, stride of syncobj arrays. */
>  	__u32 pad;            /*in, reserved for future use, always 0. */
> +};
> +
> +#define MSM_VM_BIND_OP_UNMAP	0
> +#define MSM_VM_BIND_OP_MAP	1
> +#define MSM_VM_BIND_OP_MAP_NULL	2
>  
> +#define MSM_VM_BIND_OP_DUMP	1
> +#define MSM_VM_BIND_OP_FLAGS ( \
> +		MSM_VM_BIND_OP_DUMP | \
> +		0)
> +
> +/**
> + * struct drm_msm_vm_bind_op - bind/unbind op to run
> + */
> +struct drm_msm_vm_bind_op {
> +	/** @op: one of MSM_VM_BIND_OP_x */
> +	__u32 op;
> +	/** @handle: GEM object handle, MBZ for UNMAP or MAP_NULL */
> +	__u32 handle;
> +	/** @obj_offset: Offset into GEM object, MBZ for UNMAP or MAP_NULL */
> +	__u64 obj_offset;
> +	/** @iova: Address to operate on */
> +	__u64 iova;
> +	/** @range: Number of bites to to map/unmap */
> +	__u64 range;
> +	/** @flags: Bitmask of MSM_VM_BIND_OP_FLAG_x */
> +	__u32 flags;
> +	/** @pad: MBZ */
> +	__u32 pad;
> +};
> +
> +#define MSM_VM_BIND_FENCE_FD_IN		0x00000001
> +#define MSM_VM_BIND_FENCE_FD_OUT	0x00000002
> +#define MSM_VM_BIND_FLAGS ( \
> +		MSM_VM_BIND_FENCE_FD_IN | \
> +		MSM_VM_BIND_FENCE_FD_OUT | \
> +		0)
> +
> +/**
> + * struct drm_msm_vm_bind - Input of &DRM_IOCTL_MSM_VM_BIND
> + */
> +struct drm_msm_vm_bind {
> +	/** @flags: in, bitmask of MSM_VM_BIND_x */
> +	__u32 flags;
> +	/** @nr_ops: the number of bind ops in this ioctl */
> +	__u32 nr_ops;
> +	/** @fence_fd: in/out fence fd (see MSM_VM_BIND_FENCE_FD_IN/OUT) */
> +	__s32 fence_fd;
> +	/** @queue_id: in, submitqueue id */
> +	__u32 queue_id;
> +	/** @in_syncobjs: in, ptr to array of drm_msm_gem_syncobj */
> +	__u64 in_syncobjs;
> +	/** @out_syncobjs: in, ptr to array of drm_msm_gem_syncobj */
> +	__u64 out_syncobjs;
> +	/** @nr_in_syncobjs: in, number of entries in in_syncobj */
> +	__u32 nr_in_syncobjs;
> +	/** @nr_out_syncobjs: in, number of entries in out_syncobj */
> +	__u32 nr_out_syncobjs;
> +	/** @syncobj_stride: in, stride of syncobj arrays */
> +	__u32 syncobj_stride;
> +	/** @op_stride: sizeof each struct drm_msm_vm_bind_op in @ops */
> +	__u32 op_stride;
> +	union {
> +		/** @op: used if num_ops == 1 */
> +		struct drm_msm_vm_bind_op op;
> +		/** @ops: userptr to array of drm_msm_vm_bind_op if num_ops > 1 */
> +		__u64 ops;
> +	};
>  };
>  
>  #define MSM_WAIT_FENCE_BOOST	0x00000001
> @@ -344,10 +456,20 @@ struct drm_msm_gem_madvise {
>  /*
>   * Draw queues allow the user to set specific submission parameter. Command
>   * submissions specify a specific submitqueue to use.  ID 0 is reserved for
> - * backwards compatibility as a "default" submitqueue
> + * backwards compatibility as a "default" submitqueue.
> + *
> + * Because VM_BIND async updates happen on the CPU, they must run on a
> + * virtual queue created with the flag MSM_SUBMITQUEUE_VM_BIND.  If we had
> + * a way to do pgtable updates on the GPU, we could drop this restriction.
>   */
>  
> -#define MSM_SUBMITQUEUE_FLAGS (0)
> +#define MSM_SUBMITQUEUE_ALLOW_PREEMPT	0x00000001
> +#define MSM_SUBMITQUEUE_VM_BIND	0x00000002  /* virtual queue for VM_BIND ops */
> +
> +#define MSM_SUBMITQUEUE_FLAGS		    ( \
> +		MSM_SUBMITQUEUE_ALLOW_PREEMPT | \
> +		MSM_SUBMITQUEUE_VM_BIND | \
> +		0)
>  
>  /*
>   * The submitqueue priority should be between 0 and MSM_PARAM_PRIORITIES-1,
> @@ -369,6 +491,52 @@ struct drm_msm_submitqueue_query {
>  	__u32 pad;
>  };
>  
> +#define MSM_PERFCNTR_STREAM	0x00000001
> +#define MSM_PERFCNTR_UPDATE	0x00000002
> +#define MSM_PERFCNTR_FLAGS	( \
> +		MSM_PERFCNTR_STREAM | \
> +		MSM_PERFCNTR_UPDATE | \
> +		0)
> +
> +struct drm_msm_perfcntr_group {
> +	char group_name[16];
> +	__u32 nr_countables;
> +	__u32 pad;         /* mbz */
> +	__u64 countables;  /* pointer to an array of nr_countables u32 */
> +};
> +
> +/*
> + * Note, for MSM_PERFCNTR_STREAM, the ioctl returns an fd to read recorded
> + * counters.  This only works because the ioctl is DRM_IOW(), if we returned
> + * a out param in the ioctl struct the copy_to_user() (in drm_ioctl())
> + * could fault, causing us to leak the fd.
> + *
> + * If the ioctl returns with error E2BIG, that means more counters/countables
> + * are requested than are currently available.  If MSM_PERFCNTR_UPDATE flag
> + * is set, drm_msm_perfcntr_group::nr_countables will be updated to return
> + * the actual # of counters available.
> + *
> + * The data read from the has the following format for each sampling period:
> + *
> + *     uint64_t timestamp;  // CP_ALWAYS_ON_COUNTER captured at sample time
> + *     uint32_t seqno;      // increments by 1 each period, reset to 0 on discontinuity
> + *     uint32_t mbz;        // pad out counters to 64b
> + *     struct {
> + *        uint64_t counter[nr_countables];
> + *     } groups[nr_groups];
> + *
> + * The ordering of groups and counters matches the order in PERFCNTR_CONFIG
> + * ioctl.
> + */
> +struct drm_msm_perfcntr_config {
> +	__u32 flags;         /* bitmask of MSM_PERFCNTR_x */
> +	__u32 nr_groups;     /* # of entries in groups array */
> +	__u64 groups;        /* pointer to array of drm_msm_perfcntr_group */
> +	__u64 period;        /* sampling period in ns */
> +	__u32 bufsz_shift;   /* sample buffer size in bytes is 1<<bufsz_shift */
> +	__u32 group_stride;  /* sizeof(struct drm_msm_perfcntr_group) */
> +};
> +
>  #define DRM_MSM_GET_PARAM              0x00
>  #define DRM_MSM_SET_PARAM              0x01
>  #define DRM_MSM_GEM_NEW                0x02
> @@ -384,6 +552,8 @@ struct drm_msm_submitqueue_query {
>  #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
>  #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
>  #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
> +#define DRM_MSM_VM_BIND                0x0D
> +#define DRM_MSM_PERFCNTR_CONFIG        0x0E
>  
>  #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
>  #define DRM_IOCTL_MSM_SET_PARAM        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SET_PARAM, struct drm_msm_param)
> @@ -397,6 +567,8 @@ struct drm_msm_submitqueue_query {
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
>  #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
> +#define DRM_IOCTL_MSM_VM_BIND          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_VM_BIND, struct drm_msm_vm_bind)
> +#define DRM_IOCTL_MSM_PERFCNTR_CONFIG  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_PERFCNTR_CONFIG, struct drm_msm_perfcntr_config)
>  
>  #if defined(__cplusplus)
>  }
> -- 
> 2.55.0
> 

