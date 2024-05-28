Return-Path: <linux-arm-msm+bounces-20752-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D412A8D1BA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AC4D2842C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A064F16D31F;
	Tue, 28 May 2024 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YaKwJSpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0B116ABC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900764; cv=none; b=NizwA/luQRo/0SscwoE5XhppIwmO3OjW/UCDlFChi5IaPGL/534T8KteREM74lnq/C8TRmtD2C6h8V/XuLGZGjj90Z8fv0C8o4Eber9RBcHSywI7SPdwtyH3JODLPxCfn0RCmp4qEHcHagoMLpx72UWhVd75yfF+3jHZiMyFsFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900764; c=relaxed/simple;
	bh=A4abQn4kVgiDXLd1AZj3AKY53MdNAupc35RVCQy1dic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvPNwlCrO24EPzUxeItYJVpC4vkpbKFNIx/4WbR3D3KRyHMTW253Qxl3eQksSvPE6Qud5wQUP/N7qz6OJPBKEihmsxIIcPQR6vgvV8ua5eHbIlrHGyisYOCXRXZEsH+hZ9n44gt+b9IZGf4X4g588598MF4p07QgdB3ntg22/Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YaKwJSpV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52742fdd363so903075e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 05:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716900760; x=1717505560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wB/wjlbqtzodELxc2TMpE8q2DYVAWK5JGhZtWqIB69k=;
        b=YaKwJSpVWsy4lVZ78cM5lh3XjH6nxqA5RGoqtgNGIrDbIVfw3S4Q1yT6v2G/9R2CWp
         j2RR7PfVdnDwkX4qNvTBO8qJt3K2g7KrNuudOhSNleeHjNX+9EFQJMCwcb4lScCPRKj5
         5nY/HuXU0JdJYu2UjQp2kI5V9Yp/TWlf4R7tJg0XX6OGZUFtlKedYZgFuIdRdQ+za8t2
         Ytazzl7s5ifcx5qALGZxfBGQdYRuujtbazAu35pVYvepeZTaot9rzmklWyopDpUpmh72
         TTKS24CUlI+fFy0urbv08i/X0UonjckVt3rGDsN9I34sgL4H87y4DR7Rjz5Azmh+lIZT
         b/IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716900760; x=1717505560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wB/wjlbqtzodELxc2TMpE8q2DYVAWK5JGhZtWqIB69k=;
        b=e5qlP0NE/gOfsSoCoMVhN9xg9UIqugdRPr5q2nU1AgrLaomd7oDWp52mcX/TrPenAR
         4ids7sHaPmL143Bw/Fh63POyA2iQBfOrhCkvDN1sfGDeXy8DaT02ARzUyjZWyKbd7SOb
         ZzI7fBec1KeQLTSNvGqipjiwCuSi+fJN3GdFEyCxoEBuW0rAmNyfn54PmhMaLPkkqsPP
         yY2X3smIvUtLQ2rbIWwzHwJbJW4tXBgwATpocVMdWyxrRN6yTMBehI+wJkEWrzM3Ob9L
         A20gUYYQzEBqGl9jQma9noeTKrrD2W08+AlAAeop+/rQTsEvQ1xUscdGYWxL1ISkl3S1
         uMqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxg5TelAd/eeZT0/VwxCUWAbkpE5Gy4hdBvwyIxupf+ESIAtZ09uku7QCU/ucTSNc05sh7PkDbOiALc659gS1u3lXuYGK+bkV7Mmffxg==
X-Gm-Message-State: AOJu0Yzsd9KDLVXpQ5qYvMrRaIm6b2THd+g9apX2O+ljTlsnUnoMGOol
	GxH48dK17vUs/CUiaJYUytX9IvHOGyXGpExkPma0hvuEDP/hAtsfuc8WGk/9po8=
X-Google-Smtp-Source: AGHT+IFijw0lqcVR4WsFwNrg9Gb0NVLG1ojV8ScODxlCI+fUdBQd7peAavM3hm1+XhQVbj7U3PL3QA==
X-Received: by 2002:a05:6512:1309:b0:522:297f:cb06 with SMTP id 2adb3069b0e04-529651988b4mr8122972e87.32.1716900760367;
        Tue, 28 May 2024 05:52:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529b7360d1fsm390968e87.157.2024.05.28.05.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 05:52:40 -0700 (PDT)
Date: Tue, 28 May 2024 15:52:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v2 6/8] misc: fastrpc: Add support for unsigned PD
Message-ID: <jqz3xnsxkolrjod3h4e745jsuvwifw3bafyabl5ari7wrw2ium@4lol5ghrf5fy>
References: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
 <20240528112956.5979-7-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528112956.5979-7-quic_ekangupt@quicinc.com>

On Tue, May 28, 2024 at 04:59:52PM +0530, Ekansh Gupta wrote:
> Unsigned PDs are sandboxed DSP processes used to offload computation
> workloads to the DSP. Unsigned PD have less privileges in terms of
> DSP resource access as compared to Signed PD.
> 
> Unsigned PD requires more initial memory to spawn. Also most of
> the memory request are allocated from userspace. Add support for
> unsigned PD by increasing init memory size and handling mapping
> request for cases other than DSP heap grow requests.

The patch shows that FASTRPC_MODE_UNSIGNED_MODULE was already supported.
So probably the patch isn't adding support, it is fixing something. In
such a case, please fix commit message.

> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 227 ++++++++++++++++++++++++++---------------
>  1 file changed, 147 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1c0e5d050fd4..23dd20c22f6d 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -40,7 +40,7 @@
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
> -#define INIT_FILELEN_MAX (2 * 1024 * 1024)
> +#define INIT_FILELEN_MAX (5 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>  
> @@ -119,6 +119,11 @@
>  #define SENSORS_PDR_SLPI_SERVICE_NAME            SENSORS_PDR_ADSP_SERVICE_NAME
>  #define SLPI_SENSORPD_NAME                       "msm/slpi/sensor_pd"
>  
> +enum fastrpc_userpd_type {
> +	SIGNED_PD			= 1,
> +	UNSIGNED_PD			= 2,

If the PD is either signed or unsigned, it's better to use bool instead.

> +};
> +
>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>  						"sdsp", "cdsp"};
>  struct fastrpc_phy_page {
> @@ -326,6 +331,7 @@ struct fastrpc_user {
>  	int tgid;
>  	int pd;
>  	bool is_secure_dev;
> +	enum fastrpc_userpd_type userpd_type;
>  	char *servloc_name;
>  	/* Lock for lists */
>  	spinlock_t lock;
> @@ -1515,7 +1521,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  		u32 siglen;
>  	} inbuf;
>  	u32 sc;
> -	bool unsigned_module = false;
>  
>  	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
>  	if (!args)
> @@ -1527,9 +1532,10 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  	}
>  
>  	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
> -		unsigned_module = true;
> +		fl->userpd_type = UNSIGNED_PD;
>  
> -	if (is_session_rejected(fl, unsigned_module)) {
> +
> +	if (is_session_rejected(fl, !(fl->userpd_type == SIGNED_PD))) {

Even if it is a enum, fl->userpd_type != SIGNED_PD is easier to
understand.

>  		err = -ECONNREFUSED;
>  		goto err;
>  	}
> @@ -1742,6 +1748,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  	fl->tgid = current->tgid;
>  	fl->cctx = cctx;
>  	fl->is_secure_dev = fdevice->secure;
> +	fl->userpd_type = SIGNED_PD;
>  
>  	fl->sctx = fastrpc_session_alloc(cctx);
>  	if (!fl->sctx) {
> @@ -2029,6 +2036,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>  	struct fastrpc_req_munmap req;
> +	struct fastrpc_map *map = NULL, *iterm, *m;
>  	struct device *dev = fl->sctx->dev;
>  	int err = 0;
>  
> @@ -2075,76 +2083,49 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  		}
>  		return err;
>  	}
> -	dev_err(dev, "buffer not found addr 0x%09lx, len 0x%08llx\n",
> +	spin_lock(&fl->lock);
> +	list_for_each_entry_safe(iterm, m, &fl->maps, node) {
> +		if (iterm->raddr == req.vaddrout) {
> +			map = iterm;
> +			break;
> +		}
> +	}
> +	spin_unlock(&fl->lock);
> +	if (!map) {
> +		dev_err(dev, "buffer not found addr 0x%09llx, len 0x%08llx\n",
>  			req.vaddrout, req.size);
> -	return -EINVAL;
> -}
> +		return -EINVAL;
> +	}
>  
> +	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> +	if (err)
> +		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);

Less spamming of the dmesg, please. Especially if the user can trigger
it.

> +	else
> +		fastrpc_map_put(map);
>  
> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +	return err;
> +}
> +
> +static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
> +			u64 size, u32 flag, uintptr_t vaddrin, u64 *raddr)
>  {
>  	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
> -	struct fastrpc_buf *buf = NULL;
>  	struct fastrpc_mmap_req_msg req_msg;
>  	struct fastrpc_mmap_rsp_msg rsp_msg;
>  	struct fastrpc_phy_page pages;
> -	struct fastrpc_req_mmap req;
> -	struct device *dev = fl->sctx->dev;
>  	int err;
>  	u32 sc;
>  
> -	if (copy_from_user(&req, argp, sizeof(req)))
> -		return -EFAULT;
> -
> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
> -		dev_err(dev, "flag not supported 0x%x\n", req.flags);
> -
> -		return -EINVAL;
> -	}
> -
> -	if (req.vaddrin) {
> -		dev_err(dev, "adding user allocated pages is not supported\n");
> -		return -EINVAL;
> -	}
> -
> -	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
> -		if (!fl->spd || !fl->spd->ispdup) {
> -			dev_err(dev, "remote heap request supported only for active static PD\n");
> -			return -EINVAL;
> -		}
> -		err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
> -	} else {
> -		err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
> -	}
> -
> -	if (err) {
> -		dev_err(dev, "failed to allocate buffer\n");
> -		return err;
> -	}
> -	buf->flag = req.flags;
> -
> -	/* Add memory to static PD pool, protection through hypervisor */
> -	if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && fl->cctx->vmcount) {
> -		u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
> -
> -		err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
> -			&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
> -		if (err) {
> -			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
> -					buf->phys, buf->size, err);
> -			goto err_invoke;
> -		}
> -	}
>  	req_msg.pgid = fl->tgid;
> -	req_msg.flags = req.flags;
> -	req_msg.vaddr = req.vaddrin;
> +	req_msg.flags = flag;
> +	req_msg.vaddr = vaddrin;
>  	req_msg.num = sizeof(pages);
>  
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
>  
> -	pages.addr = buf->phys;
> -	pages.size = buf->size;
> +	pages.addr = phys;
> +	pages.size = size;
>  
>  	args[1].ptr = (u64) (uintptr_t) &pages;
>  	args[1].length = sizeof(pages);
> @@ -2154,49 +2135,135 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> -				      &args[0]);
> +					  &args[0]);
> +
>  	if (err) {
> -		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
> -		goto err_invoke;
> +		dev_err(fl->sctx->dev, "mmap error (len 0x%08llx)\n", size);
> +		return err;
>  	}
> +	*raddr = rsp_msg.vaddr;
>  
> -	/* update the buffer to be able to deallocate the memory on the DSP */
> -	buf->raddr = (uintptr_t) rsp_msg.vaddr;
> +	return err;
> +}
>  
> -	/* let the client know the address to use */
> -	req.vaddrout = rsp_msg.vaddr;
> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_buf *buf = NULL;
> +	struct fastrpc_req_mmap req;
> +	struct fastrpc_map *map = NULL;
> +	struct device *dev = fl->sctx->dev;
> +	u64 raddr = 0;
> +	int err;
>  
> +	if (copy_from_user(&req, argp, sizeof(req)))
> +		return -EFAULT;
>  
> -	spin_lock(&fl->lock);
> -	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
> -		list_add_tail(&buf->node, &fl->spd->rmaps);
> -	else
> -		list_add_tail(&buf->node, &fl->mmaps);
> -	spin_unlock(&fl->lock);
> +	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
> +			req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && (fl->userpd_type == SIGNED_PD)) {

align to the opening bracket, please.

> +		if (req.vaddrin) {
> +			dev_err(dev, "adding user allocated pages is not supported for signed PD\n");
> +			return -EINVAL;
> +		}
> +
> +		if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
> +			if (!fl->spd || !fl->spd->ispdup) {
> +				dev_err(dev, "remote heap request supported only for active static PD\n");
> +				return -EINVAL;
> +			}
> +			err = fastrpc_remote_heap_alloc(fl, dev, req.size, &buf);
> +		} else {
> +			err = fastrpc_buf_alloc(fl, dev, req.size, &buf);
> +		}
> +
> +		if (err) {
> +			dev_err(dev, "failed to allocate buffer\n");
> +			return err;
> +		}
> +		buf->flag = req.flags;
> +
> +		/* Add memory to static PD pool, protection through hypervisor */
> +		if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && fl->cctx->vmcount) {
> +			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
> +
> +			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
> +				&src_perms, fl->cctx->vmperms, fl->cctx->vmcount);
> +			if (err) {
> +				dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
> +						buf->phys, buf->size, err);
> +				goto err_invoke;
> +			}
> +		}
> +
> +		err = fastrpc_req_map_dsp(fl, buf->phys, buf->size, buf->flag,
> +					req.vaddrin, &raddr);
> +		if (err)
> +			goto err_invoke;
> +
> +		/* update the buffer to be able to deallocate the memory on the DSP */
> +		buf->raddr = (uintptr_t) raddr;
>  
> +		/* let the client know the address to use */
> +		req.vaddrout = raddr;
> +
> +		spin_lock(&fl->lock);
> +		if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
> +			list_add_tail(&buf->node, &fl->spd->rmaps);
> +		else
> +			list_add_tail(&buf->node, &fl->mmaps);
> +		spin_unlock(&fl->lock);
> +		dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
> +			buf->raddr, buf->size);
> +	} else {
> +		if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && (fl->userpd_type != SIGNED_PD)) {
> +			dev_err(dev, "secure memory allocation is not supported in unsigned PD\n");
> +			return -EINVAL;
> +		}
> +		err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
> +		if (err) {
> +			dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
> +			return err;
> +		}
> +
> +		err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
> +					req.vaddrin, &raddr);
> +		if (err)
> +			goto err_invoke;
> +
> +		/* update the buffer to be able to deallocate the memory on the DSP */
> +		map->raddr = (uintptr_t) raddr;
> +
> +		/* let the client know the address to use */
> +		req.vaddrout = raddr;
> +		dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
> +			map->raddr, map->size);
> +	}
>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>  		err = -EFAULT;
>  		goto err_copy;
>  	}
>  
> -	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
> -		buf->raddr, buf->size);
> -
>  	return 0;
>  
>  err_copy:
> -	spin_lock(&fl->lock);
> -	list_del(&buf->node);
> -	spin_unlock(&fl->lock);
> -	fastrpc_req_munmap_impl(fl, buf);
> -	buf = NULL;
> +	if ((req.flags != ADSP_MMAP_ADD_PAGES &&
> +		req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) || fl->userpd_type != SIGNED_PD) {
> +		fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> +	} else {
> +		spin_lock(&fl->lock);
> +		list_del(&buf->node);
> +		spin_unlock(&fl->lock);
> +		fastrpc_req_munmap_impl(fl, buf);
> +		buf = NULL;
> +	}
>  err_invoke:
> -	fastrpc_buf_free(buf);
> +	if (map)
> +		fastrpc_map_put(map);
> +	if (buf)
> +		fastrpc_buf_free(buf);
>  
>  	return err;
>  }
>  
> -
>  static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

