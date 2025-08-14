Return-Path: <linux-arm-msm+bounces-69298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F17FB27320
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 01:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E6FD5C800D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 23:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FFB230270;
	Thu, 14 Aug 2025 23:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nogP06os"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDC17260B;
	Thu, 14 Aug 2025 23:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755215336; cv=none; b=crdMb9YzqNXKDz+DYaOay09S1pVJkbxC6x3vK8y41+YeUw35wHWEMMvnlJrHe6BpNbP3GMvSrEtSgsnjDhhFJwIopNlpOE+MQ5QIC2eT/YDTMRm9zyqdSugSotrrj6YkP2USaeFkzJZwwQ1kD1xC1U8afKGmmCNut7W+BhIXS8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755215336; c=relaxed/simple;
	bh=J2pOmDG+0oiYVuABnzLpk0FXLDrvf8TG3nt5h0zb8Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldDaSAyA1EMM0QM908LXRf5G17twEolwkC+Ezp84eUBbNgLsuv12YB+PJjkUBvQGwuCMFGonIXzIt6S6a2zC/0JURIh/NNUlzAW/zy4Zbooh2zVtwC5ZgUsGfTu9NUa++Ko8jsJ+iLNQtqvrh1Qlpr5/HJMpteK82wu90NaQaPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nogP06os; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D75C4CEED;
	Thu, 14 Aug 2025 23:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755215335;
	bh=J2pOmDG+0oiYVuABnzLpk0FXLDrvf8TG3nt5h0zb8Wc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=nogP06oslO7URh1TMZmmDCnc0s7XptzWzvQrNbaa5my3Xl7uQMYaj5rv3Qy3ygMua
	 pru3uNCkv3Q5ukA56dwBTHaG1B4kHdPspMyxzIYiFRpMMH/UUaYTfHgVhHvQem9y/s
	 d/f0MpKWkE2Z0dpqSfygQDBx2ElwFfMxGWdbU663kQISXjlOrI9CkAYAz9MOh5SIjK
	 ZxbCxMubhnpqVA+uSGzvAFoLLT4WXOYFPAI0LNNbgZX4fmHTvBNo7oAi2WT0ib787f
	 LBDuDEXNjUrdehRjHWMgWAjzI5pq5yuZswGdrAVM4pgJ7Vuy38hMVX4nVcNTGtNdDs
	 yjlclV3hr8MgA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 19419CE0ADB; Thu, 14 Aug 2025 16:48:54 -0700 (PDT)
Date: Thu, 14 Aug 2025 16:48:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
	jessica.zhang@oss.qualcomm.com, sean@poorly.run,
	marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
	antomani103@gmail.com, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm: Fix objtool warning in submit_lock_objects()
Message-ID: <00f16170-93ca-4dac-a01f-4c5e0c60ff4c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20250807131058.1013858-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807131058.1013858-1-sashal@kernel.org>

On Thu, Aug 07, 2025 at 09:10:58AM -0400, Sasha Levin wrote:
> Split the vmbind case into a separate helper function
> submit_lock_objects_vmbind() to fix objtool warning:
> 
>   drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x451:
>   sibling call from callable instruction with modified stack frame
> 
> The drm_exec_until_all_locked() macro uses computed gotos internally
> for its retry loop. Having return statements inside this macro, or
> immediately after it in certain code paths, confuses objtool's static
> analysis of stack frames, causing it to incorrectly flag tail call
> optimizations.
> 
> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Tested-by: Paul E. McKenney <paulmck@kernel.org>

> ---
> 
> Changes since v1:
>  - Extract helper submit_lock_objects_vmbind() instead of refactoring
>    single loop
> 
>  drivers/gpu/drm/msm/msm_gem_submit.c | 49 +++++++++++++++-------------
>  1 file changed, 27 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 5f8e939a5906..1ce90e351b7a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -271,32 +271,37 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
>  	return ret;
>  }
>  
> -/* This is where we make sure all the bo's are reserved and pin'd: */
> -static int submit_lock_objects(struct msm_gem_submit *submit)
> +static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
>  {
> -	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
> +	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_DUPLICATES;
>  	struct drm_exec *exec = &submit->exec;
> -	int ret;
> +	int ret = 0;
>  
> -	if (msm_context_is_vmbind(submit->queue->ctx)) {
> -		flags |= DRM_EXEC_IGNORE_DUPLICATES;
> +	drm_exec_init(&submit->exec, flags, submit->nr_bos);
>  
> -		drm_exec_init(&submit->exec, flags, submit->nr_bos);
> +	drm_exec_until_all_locked (&submit->exec) {
> +		ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> +		drm_exec_retry_on_contention(exec);
> +		if (ret)
> +			break;
>  
> -		drm_exec_until_all_locked (&submit->exec) {
> -			ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
> -			drm_exec_retry_on_contention(exec);
> -			if (ret)
> -				return ret;
> +		ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
> +		drm_exec_retry_on_contention(exec);
> +		if (ret)
> +			break;
> +	}
>  
> -			ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
> -			drm_exec_retry_on_contention(exec);
> -			if (ret)
> -				return ret;
> -		}
> +	return ret;
> +}
>  
> -		return 0;
> -	}
> +/* This is where we make sure all the bo's are reserved and pin'd: */
> +static int submit_lock_objects(struct msm_gem_submit *submit)
> +{
> +	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
> +	int ret = 0;
> +
> +	if (msm_context_is_vmbind(submit->queue->ctx))
> +		return submit_lock_objects_vmbind(submit);
>  
>  	drm_exec_init(&submit->exec, flags, submit->nr_bos);
>  
> @@ -305,17 +310,17 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
>  					drm_gpuvm_resv_obj(submit->vm));
>  		drm_exec_retry_on_contention(&submit->exec);
>  		if (ret)
> -			return ret;
> +			break;
>  		for (unsigned i = 0; i < submit->nr_bos; i++) {
>  			struct drm_gem_object *obj = submit->bos[i].obj;
>  			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
>  			drm_exec_retry_on_contention(&submit->exec);
>  			if (ret)
> -				return ret;
> +				break;
>  		}
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int submit_fence_sync(struct msm_gem_submit *submit)
> -- 
> 2.39.5
> 

