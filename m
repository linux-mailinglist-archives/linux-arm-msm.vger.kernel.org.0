Return-Path: <linux-arm-msm+bounces-69406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3269B286F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 22:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ED761890A25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 20:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AC3322F76B;
	Fri, 15 Aug 2025 20:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="VYn1d/+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0246347DD
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 20:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755288654; cv=none; b=V6lnCay61bPuef2ZiLe2tRLBtwpKKxvNTwsn6TQUqko5U+GnooYS1CNcweuD+oXhrPTtxgrrhE+RrTeuTJ3sqgLGnlSZ3H7sHFua17iLFimVYpmxT1oJ44xwejp4gyvaHEdEUOszODxFRTbnnv22rj9CZ9ehBq2umGZq1ycJpJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755288654; c=relaxed/simple;
	bh=pwMzeBPkAj8GjL2ti22UM/2pkaPjVv+pvTjT9Aa6umk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqJfRS5Fj6ZtFr8tO3PPWCY4ewPnU59Omp5JWrwbd0kAQtTEau+CqFaIRiwltPcpY3v/s9KoejHN/yMrOqJTznC01yMTaFjXXEgND/ft6sc3Yq28zEIXLAoIYm9W9clgxHsTitGP/x3ffEXf6NCy12muQo53Lxf06WQDAQ+Ai4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=VYn1d/+v; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cbHrFz8hw9nZbsE2qew8CIqhu1FCZXEtVS7xWdC9YCs=; b=VYn1d/+vwdK3kTFKx4SzpdS2jj
	+AfyL17X4MOH8J5kw5XbPmmVpRul4RgTV4g028BM2bkGZJtqGmQ9yLKoL9q9LMu0bf6u9dc6DswcN
	Qck91fumqtJEYR1Q5GvjIli+9p6DqhrjD6hhDk9E7v9Al8IJN1mOJihuxkWy/nwvAnUJ5kmUXl8Iu
	c5rXkWDlne3iTmA6caXT1Hszu3zYhQ09pZvfe7lPGk9xB8syI5XFOwoNncUzplT42b0pjhKHz4Bb1
	e2NfRQGX1tEPQtJuL3gSw304cJtbMR5HG1/S4PEZKrku36A+FQVErG6ae5PhoUcFvRJ37iVyQ4vNd
	rTYUeurQ==;
Received: from [177.191.196.76] (helo=[192.168.0.165])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1un0l6-00EodS-Gk; Fri, 15 Aug 2025 22:10:40 +0200
Message-ID: <b2dcdd42-7547-47f3-a2f6-5de1f8f26f70@igalia.com>
Date: Fri, 15 Aug 2025 17:10:35 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: Update global fault counter when faulty
 process has already ended
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250720214458.22193-1-mcanal@igalia.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20250720214458.22193-1-mcanal@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping on this patch.

Best Regards,
- Maíra

On 7/20/25 18:42, Maíra Canal wrote:
> The global fault counter is no longer used since commit 12578c075f89
> ("drm/msm/gpu: Skip retired submits in recover worker"). However, it's
> still needed, as we need to handle cases where a GPU fault occurs after
> the faulting process has already ended.
> 
> Hence, increment the global fault counter when the submitting process
> had already ended. This way, the number of faults returned by
> MSM_PARAM_FAULTS will stay consistent.
> 
> While here, s/unusuable/unusable.
> 
> Fixes: 12578c075f89 ("drm/msm/gpu: Skip retired submits in recover worker")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
> 
> v1 -> v2: https://lore.kernel.org/dri-devel/20250714230813.46279-1-mcanal@igalia.com/T/
> 
> * Don't delete the global fault, but instead, increment it when the we get
> 	a fault after the faulting process has ended (Rob Clark)
> * Rewrite the commit message based on the changes.
> 
>   drivers/gpu/drm/msm/msm_gpu.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index c317b25a8162..416d47185ef0 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -465,6 +465,7 @@ static void recover_worker(struct kthread_work *work)
>   	struct msm_gem_submit *submit;
>   	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
>   	char *comm = NULL, *cmd = NULL;
> +	struct task_struct *task;
>   	int i;
>   
>   	mutex_lock(&gpu->lock);
> @@ -482,16 +483,20 @@ static void recover_worker(struct kthread_work *work)
>   
>   	/* Increment the fault counts */
>   	submit->queue->faults++;
> -	if (submit->vm) {
> +
> +	task = get_pid_task(submit->pid, PIDTYPE_PID);
> +	if (!task)
> +		gpu->global_faults++;
> +	else {
>   		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
>   
>   		vm->faults++;
>   
>   		/*
>   		 * If userspace has opted-in to VM_BIND (and therefore userspace
> -		 * management of the VM), faults mark the VM as unusuable.  This
> +		 * management of the VM), faults mark the VM as unusable. This
>   		 * matches vulkan expectations (vulkan is the main target for
> -		 * VM_BIND)
> +		 * VM_BIND).
>   		 */
>   		if (!vm->managed)
>   			msm_gem_vm_unusable(submit->vm);


