Return-Path: <linux-arm-msm+bounces-22055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B404E90026D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A8ED1F234CD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D26190664;
	Fri,  7 Jun 2024 11:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cup/PNym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F7813FD7D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 11:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760512; cv=none; b=H62xrBJxnyKaDosNHerLORqjyRT2qr6viwfAcAfgp4TLTWY0PjC1cTNErhYVGdsRhCcC210fLV5tBoSlCLLV45qycKnttVkGGjY0UgbxxDBvNFTFNQZXLhrWuf0L3xYshHIm02d7TaZaQICCtebGwvPyy+ox0jxHI8Moz3L80Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760512; c=relaxed/simple;
	bh=zZfi4B/3xlwRwJ5Ae5BptjUYE+Mbt9SK7pYyryo1ftI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/47zJ/RwS2+PErKOEdeh/scKzwuxIyvSJmA+5YLOfCFMG+e1Hb6kKyvG6cJTx4vGHzrRo6dREZovkxlyDZGwK6dMn7kzwxpop7ftF9Nu9aYBegY90KQjDmb1VjDpo+rKpcH1sipTFzWpYQHpKsA8U/C/k3RYIlmZ0hC7fPyqcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cup/PNym; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52bc1261e8fso385722e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 04:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717760509; x=1718365309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d3TWoGizEobT5QO5GTHAzDYLdCFbSYQPW14yvUV/BPk=;
        b=cup/PNymZPx1a8lQeeaRArbVxz3I2sKIURDu60GGqGYAa3ALWeSycmJH8WxwhQPWVi
         3mR/dptXlehpB9kmPteYPdsvvgqnhN5hUwjnfjpfWEVDyfjHsh2zKsQlfpsYU6r3xj9x
         t/7k68wMKbR+c9hWFAlh9cqF0AhNjiTN+1HiDXUkbmzFv8PYJGRjFUG+pLaZ7O4aDXk4
         4kXBUvNumzGdm4c5/yhE40n5mmkNT19UWp/U2p2AmBZsZgoJEf0c6UdgrNfKhpMsK8E2
         TxPyye3yiLn/x6JIpzTdGBaCCBTMslzSEHOv5+9PyMvyXtaA75y7B7nkwRITMARNatu6
         R3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717760509; x=1718365309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3TWoGizEobT5QO5GTHAzDYLdCFbSYQPW14yvUV/BPk=;
        b=p/aNxpW/lg2RW5n9C1AQDrfL2dICoDgG1qapyWfis6CNovJHor14r4ccw2Ur6Z3N73
         hnaAW1aQTcTvY6Vaoj8TDSfca3YhqqE3C0wHXe2z20wVS/t5YJfUK1/ems8rTMOuzcMW
         EsvisNNBowJ9kgxNoJWOpGE1XQAEDnlucEePXECFES70i8xnIgmSV2G+uqRx18ddZRGU
         B3ctsZ9r6SgL32kC8OcDRnbqAF7m2DIiOXQFwHym1Q5mGsxFGt9z4eKQoj6AcliXJUtY
         2kcRg894FPU1hKVGbDc3S95E/EiU3U2GIb20B5KMc4f5haxLVThiyx4wwtzNH6MFCRoi
         1aDw==
X-Forwarded-Encrypted: i=1; AJvYcCWA7B5CnMM7lBcd+QZnLpzTajmathOvcIjAwOWu9XIvO2FqtlL/fqFWxxpWNsq11hR+bcxkJnU5LUi28j4Z87YKZ84YXZWK0Jzhb+TUGA==
X-Gm-Message-State: AOJu0YwsHk8KJUCESUfZR16vdnd4PXTrGqem62gwZX0s92SBxH8mex6i
	r72+fhqZ57V2z3sbHdfS+taqp7jx2sQYkEsBUP8Vb4gU0dT00wzNfa5FDX7Yk0g=
X-Google-Smtp-Source: AGHT+IELWjx7Y8HIxG6WyFhnBSr1BKM5sU+vXt+klI+TtVjCaf6vuxsuQwKEGym2wy6qsQGEN59ayw==
X-Received: by 2002:a05:6512:1391:b0:51d:68fb:5d73 with SMTP id 2adb3069b0e04-52bb9f6897cmr1958075e87.8.1717760508853;
        Fri, 07 Jun 2024 04:41:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41e20f7sm502386e87.41.2024.06.07.04.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:41:47 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:41:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v4 09/11] misc: fastrpc: Fix remote heap alloc and free
 user request
Message-ID: <4vwahy5pb74an2nebp643s2doacbrslrsitolzksmmjnv4lxxu@vub4gpex5fcs>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-10-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606165939.12950-10-quic_ekangupt@quicinc.com>

On Thu, Jun 06, 2024 at 10:29:29PM +0530, Ekansh Gupta wrote:
> A static PD daemon process can request for remote heap allocation
> which will allocate memory and change the ownership if the VMID
> information were defined. This allocations are currently getting
> added to fl mmaps list which could get freed when there is any
> daemon kill. There is no way to request for freeing of this memory
> also. Add changes to maintain the remote heap allocation in the

Simpler. 'Maintain foo'

> static PD specific structure and add method to free the memory
> on user request.

Should this be split into two patches? 'foo and bar' suggests that.

> 
> Fixes: 532ad70c6d44 ("misc: fastrpc: Add mmap request assigning for static PD pool")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 129 +++++++++++++++++++++++++++++++----------
>  1 file changed, 98 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 68c1595446d5..32f2e6f625ed 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -210,6 +210,7 @@ struct fastrpc_buf {
>  	struct dma_buf *dmabuf;
>  	struct device *dev;
>  	void *virt;
> +	u32 flag;
>  	u64 phys;
>  	u64 size;
>  	/* Lock for dma buf attachments */
> @@ -1924,29 +1925,54 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  	return 0;
>  }
>  
> -static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
> +static int fastrpc_req_munmap_dsp(struct fastrpc_user *fl, uintptr_t raddr, u64 size)
>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
>  	struct fastrpc_munmap_req_msg req_msg;
> -	struct device *dev = fl->sctx->dev;
>  	int err;
>  	u32 sc;
>  
>  	req_msg.pgid = fl->tgid;
> -	req_msg.size = buf->size;
> -	req_msg.vaddr = buf->raddr;
> +	req_msg.size = size;
> +	req_msg.vaddr = raddr;
>  
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
> -
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
>  				      &args[0]);
> +
> +	return err;
> +}
> +
> +static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
> +{
> +	struct device *dev = fl->sctx->dev;
> +	int err;
> +
> +	err = fastrpc_req_munmap_dsp(fl, buf->raddr, buf->size);
>  	if (!err) {
> +		if (buf->flag == ADSP_MMAP_REMOTE_HEAP_ADDR) {
> +			if (fl->cctx->vmcount) {
> +				u64 src_perms = 0;
> +				struct qcom_scm_vmperm dst_perms;
> +				u32 i;
> +
> +				for (i = 0; i < fl->cctx->vmcount; i++)
> +					src_perms |= BIT(fl->cctx->vmperms[i].vmid);
> +
> +				dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +				dst_perms.perm = QCOM_SCM_PERM_RWX;
> +				err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
> +								&src_perms, &dst_perms, 1);
> +				if (err) {
> +					dev_err(dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
> +						buf->phys, buf->size, err);
> +					return err;
> +				}

It looks like this is too nested. Consider refactoring this code. For
example, extract the function that you have c&p'ed.

> +			}
> +		}
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
> -		spin_lock(&fl->lock);
> -		list_del(&buf->node);
> -		spin_unlock(&fl->lock);
>  		fastrpc_buf_free(buf);
>  	} else {
>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
> @@ -1960,6 +1986,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>  	struct fastrpc_req_munmap req;
>  	struct device *dev = fl->sctx->dev;
> +	int err = 0;

Why =0 is necessary?

>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
> @@ -1968,18 +1995,45 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
>  		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
>  			buf = iter;
> +			list_del(&buf->node);
>  			break;
>  		}
>  	}
>  	spin_unlock(&fl->lock);
>  
> -	if (!buf) {
> -		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
> -			req.vaddrout, req.size);
> -		return -EINVAL;
> +	if (buf) {
> +		err = fastrpc_req_munmap_impl(fl, buf);
> +		if (err) {
> +			spin_lock(&fl->lock);
> +			list_add_tail(&buf->node, &fl->mmaps);
> +			spin_unlock(&fl->lock);
> +		}
> +		return err;
>  	}
>  
> -	return fastrpc_req_munmap_impl(fl, buf);
> +	spin_lock(&fl->lock);
> +	if (fl->spd) {
> +		list_for_each_entry_safe(iter, b, &fl->spd->rmaps, node) {
> +			if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
> +				buf = iter;
> +				list_del(&buf->node);
> +				break;
> +			}
> +		}
> +	}
> +	spin_unlock(&fl->lock);
> +	if (buf) {
> +		err = fastrpc_req_munmap_impl(fl, buf);
> +		if (err) {
> +			spin_lock(&fl->lock);
> +			list_add_tail(&buf->node, &fl->spd->rmaps);
> +			spin_unlock(&fl->lock);
> +		}
> +		return err;
> +	}
> +	dev_err(dev, "buffer not found addr 0x%09lx, len 0x%08llx\n",
> +			req.vaddrout, req.size);

Can this be triggered by the user? If so, it's dev_dbg() at best.

> +	return -EINVAL;
>  }
>  
>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> @@ -2008,15 +2062,34 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  		return -EINVAL;
>  	}
>  
> -	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
> +		if (!fl->spd || !fl->spd->ispdup) {
> +			dev_err(dev, "remote heap request supported only for active static PD\n");
> +			return -EINVAL;
> +		}
>  		err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
> -	else
> +	} else {
>  		err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
> +	}
>  
>  	if (err) {
>  		dev_err(dev, "failed to allocate buffer\n");
>  		return err;
>  	}
> +	buf->flag = req.flags;
> +
> +	/* Add memory to static PD pool, protection through hypervisor */
> +	if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && fl->cctx->vmcount) {
> +		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
> +
> +		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
> +			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
> +		if (err) {
> +			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
> +					buf->phys, buf->size, err);

misaligned

> +			goto err_invoke;
> +		}
> +	}
>  
>  	req_msg.pgid = fl->tgid;
>  	req_msg.flags = req.flags;
> @@ -2049,26 +2122,16 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	/* let the client know the address to use */
>  	req.vaddrout = rsp_msg.vaddr;
>  
> -	/* Add memory to static PD pool, protection thru hypervisor */
> -	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
> -		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
> -
> -		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
> -			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
> -		if (err) {
> -			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d",
> -					buf->phys, buf->size, err);
> -			goto err_assign;
> -		}
> -	}
> -
>  	spin_lock(&fl->lock);
> -	list_add_tail(&buf->node, &fl->mmaps);
> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
> +		list_add_tail(&buf->node, &fl->spd->rmaps);
> +	else
> +		list_add_tail(&buf->node, &fl->mmaps);
>  	spin_unlock(&fl->lock);
>  
>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>  		err = -EFAULT;
> -		goto err_assign;
> +		goto err_copy;
>  	}
>  
>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
> @@ -2076,8 +2139,12 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  
>  	return 0;
>  
> -err_assign:
> +err_copy:
> +	spin_lock(&fl->lock);
> +	list_del(&buf->node);
> +	spin_unlock(&fl->lock);
>  	fastrpc_req_munmap_impl(fl, buf);
> +	buf = NULL;
>  err_invoke:
>  	fastrpc_buf_free(buf);
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

