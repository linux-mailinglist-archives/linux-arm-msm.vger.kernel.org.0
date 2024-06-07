Return-Path: <linux-arm-msm+bounces-22057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E1900291
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3897C28AEBA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87CBC18F2E4;
	Fri,  7 Jun 2024 11:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sRwZOdMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9AC1527A4
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 11:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760805; cv=none; b=VvTCyThZSdGZo8ph3STmNfXJr9YTGHA7wEjcH2XXatgF/OPyLGvFCs4VBK/pd38CX2+mazfbcjD7KR2RtOuyHdJnHh7k/pSc0li4rAo8bCf+YVIx3q2gXj+jHWkryVub+/Dbl64GqcLCNU++nIF6yqLjNZM0fonfqLkr+xIcW08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760805; c=relaxed/simple;
	bh=vGYxCl8GhEjo7aBFCGoMrrcVy9k+50wGJU2FCIWlVKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n39g8/qOEF2BDHkRfdHnVLABmUCCUVbqcAOHi6ipfx9OFghjN1KZPMelza5rib1zAW3udS3jSbbvcHjwuf98cW/mra61sL3XfuUxHOy/ISLnUxRXAQSlvpqvkvCVPDjX1n61IBxn4bRfPPxOw5t/1U3GO7pFszVqIY/lQvE01Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRwZOdMS; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52bbdc237f0so632828e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 04:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717760802; x=1718365602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CUo/YSczk2Nyul9jpd4YNh6gCc1zxDtFM6huYK5JuxA=;
        b=sRwZOdMS8iKtLslt69viwEBkBCHECjUKVv2hcwEVDylhlU6nET8OS7gwqjzkYuXCDf
         WJvGaRZyv8WhfWmpCLt8R5LgHM6gqLTvU4tDnkgLmn5YaM7n5pUo/QeHk02XSa+GYbm2
         jRfrAeck4BAsFChe0evVJJA9og/s3lx0Ilye0WrUA+y7R2HB8GuaEqdTFp0zEZXF8zqD
         oO+qnpyv5CQOah0EtCr+bezfCpq7/wXUOlt+mi33r563mG1VkiHLVbLTAhOL+plX/aSx
         yLwpkdjN/ecB4116/SU6HUNC3Tyq361mvGdMsu9pVTlywMoULS7OPfXjWC4TkCn0091V
         sonA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717760802; x=1718365602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUo/YSczk2Nyul9jpd4YNh6gCc1zxDtFM6huYK5JuxA=;
        b=qwmR4hI7iql/TtLImuxePUr80jSc16qEbqkelA3BxcySvoTr6f+3Fgeu82sNlF1c1w
         Su4RrqdsMLMbAALhXxi/Si+YfW3LOtEIJ8pBr3K90H7IsfoMRTgrMkZpadi7kF7FZ+3V
         cYks/Ukvi6WRkMxq+jgAC2TBJYg68nH/B6FAxyCJTuobklHLBujuY83Vw2+hBOniwaAJ
         axvQ+IwPrbFXyCPHrI/oq0GPFWhIpnPcfNQtNd5EVSOHOu7YfEOuW42zdDkzgh0H/Swy
         74M6TSjyjRlcYVh2/48V27L8Plo6BY5j9kYm+l4YGQAFok1DGHw4nH3AwLbUTqZiSe0A
         8G1g==
X-Forwarded-Encrypted: i=1; AJvYcCXpZo2UFlBYnjO9Bt6YMJWSHfXKplOuqCRoFEij/SyHA2PJMWNChp+4WyLAVxguHaUoR4H/W93uO205rlQtHEfn2fW0UDJmU5ceuRgKIQ==
X-Gm-Message-State: AOJu0YwHmm6COY7pwiySR+OLQ1OtK0qDnnoNToCFquDiZCgL/7yRmsbm
	SqQ973iThvUXL4kWUibVxGxhR7+h7zUYCVBvwPf8rLCpEExuvtzG9z7I2SDIwIQ=
X-Google-Smtp-Source: AGHT+IFYOXxG2sZJjkRufHuz/UALTmdhRiqiszeoU2cb1WTHtJFP6AB08E691SvhcBZCJbn4dsefuw==
X-Received: by 2002:a05:6512:3ae:b0:52b:8c88:2d73 with SMTP id 2adb3069b0e04-52bb9fc944amr1779886e87.52.1717760801702;
        Fri, 07 Jun 2024 04:46:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41ee260sm510066e87.68.2024.06.07.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:46:41 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:46:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v4 10/11] misc: fastrpc: Fix unsigned PD support
Message-ID: <rqnxu5ga5bauwmyrsncy5fxkrjduvhavtjqcxvy6bzb565ci35@32pvlalsuij2>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-11-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606165939.12950-11-quic_ekangupt@quicinc.com>

On Thu, Jun 06, 2024 at 10:29:30PM +0530, Ekansh Gupta wrote:
> Unsigned PDs are sandboxed DSP processes used to offload computation
> workloads to the DSP. Unsigned PD have less privileges in terms of
> DSP resource access as compared to Signed PD.
> 
> Unsigned PD requires more initial memory to spawn. Also most of the
> memory request are allocated from user space. Current initial memory
> size is not sufficient and mapping request for user space allocated
> buffer is not supported. This results in failure of unsigned PD offload
> request. Add changes to fix initial memory size and user space allocated
> buffer mapping support.

You can guess my comment here.

> 
> Fixes: 7f1f481263c3 ("misc: fastrpc: check before loading process to the DSP")

And here.

> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 180 ++++++++++++++++++++++++++++++-----------
>  1 file changed, 133 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 32f2e6f625ed..5ffb6098ac38 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -40,7 +40,7 @@
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
> -#define INIT_FILELEN_MAX (2 * 1024 * 1024)
> +#define INIT_FILELEN_MAX (5 * 1024 * 1024)

So, there are two things being fixed here. One is the insufficient
memory size, another one is the mmap request. Separate commits, please.

>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
>  
> @@ -327,6 +327,7 @@ struct fastrpc_user {
>  	int tgid;
>  	int pd;
>  	bool is_secure_dev;
> +	bool is_unsigned_pd;
>  	char *servloc_name;
>  	/* Lock for lists */
>  	spinlock_t lock;
> @@ -1488,7 +1489,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  		u32 siglen;
>  	} inbuf;
>  	u32 sc;
> -	bool unsigned_module = false;
>  
>  	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
>  	if (!args)
> @@ -1500,9 +1500,9 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  	}
>  
>  	if (init.attrs & FASTRPC_MODE_UNSIGNED_MODULE)
> -		unsigned_module = true;
> +		fl->is_unsigned_pd = true;
>  
> -	if (is_session_rejected(fl, unsigned_module)) {
> +	if (is_session_rejected(fl, fl->is_unsigned_pd)) {
>  		err = -ECONNREFUSED;
>  		goto err;
>  	}
> @@ -1985,6 +1985,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
>  	struct fastrpc_req_munmap req;
> +	struct fastrpc_map *map = NULL, *iterm, *m;
>  	struct device *dev = fl->sctx->dev;
>  	int err = 0;
>  
> @@ -2031,34 +2032,75 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
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
> +		dev_dbg(dev, "buffer not found addr 0x%09llx, len 0x%08llx\n",
>  			req.vaddrout, req.size);
> -	return -EINVAL;
> +		return -EINVAL;
> +	}
> +
> +	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> +	if (err)
> +		dev_dbg(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);

Which error? The message is useless.

> +	else
> +		fastrpc_map_put(map);

Should the fl->lock be still held here? Can the map be modified
concurrently?

> +
> +	return err;
>  }
>  
> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
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
> +	req_msg.pgid = fl->tgid;
> +	req_msg.flags = flag;
> +	req_msg.vaddr = vaddrin;
> +	req_msg.num = sizeof(pages);
>  
> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
> -		dev_err(dev, "flag not supported 0x%x\n", req.flags);
> +	args[0].ptr = (u64) (uintptr_t) &req_msg;
> +	args[0].length = sizeof(req_msg);
>  
> -		return -EINVAL;
> +	pages.addr = phys;
> +	pages.size = size;
> +
> +	args[1].ptr = (u64) (uintptr_t) &pages;
> +	args[1].length = sizeof(pages);
> +	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> +					  &args[0]);
> +
> +	if (err) {
> +		dev_err(fl->sctx->dev, "mmap error (len 0x%08llx)\n", size);
> +		return err;
>  	}
> +	*raddr = rsp_msg.vaddr;
> +
> +	return err;
> +}
> +
> +static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
> +			struct fastrpc_req_mmap req, char __user *argp)
> +{
> +	struct device *dev = fl->sctx->dev;
> +	struct fastrpc_buf *buf = NULL;
> +	u64 raddr = 0;
> +	int err;
>  
>  	if (req.vaddrin) {
> -		dev_err(dev, "adding user allocated pages is not supported\n");
> +		dev_err(dev, "adding user allocated pages is not supported for signed PD\n");

Drop, less chance of users spamming the dmesg.

>  		return -EINVAL;
>  	}
>  
> @@ -2091,36 +2133,16 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  		}
>  	}
>  
> -	req_msg.pgid = fl->tgid;
> -	req_msg.flags = req.flags;
> -	req_msg.vaddr = req.vaddrin;
> -	req_msg.num = sizeof(pages);
> -
> -	args[0].ptr = (u64) (uintptr_t) &req_msg;
> -	args[0].length = sizeof(req_msg);
> -
> -	pages.addr = buf->phys;
> -	pages.size = buf->size;
> -
> -	args[1].ptr = (u64) (uintptr_t) &pages;
> -	args[1].length = sizeof(pages);
> -
> -	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
> -	args[2].length = sizeof(rsp_msg);
> -
> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> -				      &args[0]);
> -	if (err) {
> -		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
> +	err = fastrpc_req_map_dsp(fl, buf->phys, buf->size, buf->flag,
> +				req.vaddrin, &raddr);
> +	if (err)
>  		goto err_invoke;
> -	}
>  
>  	/* update the buffer to be able to deallocate the memory on the DSP */
> -	buf->raddr = (uintptr_t) rsp_msg.vaddr;
> +	buf->raddr = (uintptr_t) raddr;
>  
>  	/* let the client know the address to use */
> -	req.vaddrout = rsp_msg.vaddr;
> +	req.vaddrout = raddr;
>  
>  	spin_lock(&fl->lock);
>  	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)
> @@ -2129,16 +2151,14 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  		list_add_tail(&buf->node, &fl->mmaps);
>  	spin_unlock(&fl->lock);
>  
> +	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
> +		buf->raddr, buf->size);
> +
>  	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
>  		err = -EFAULT;
>  		goto err_copy;
>  	}
> -
> -	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
> -		buf->raddr, buf->size);
> -
>  	return 0;
> -
>  err_copy:
>  	spin_lock(&fl->lock);
>  	list_del(&buf->node);
> @@ -2146,11 +2166,77 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	fastrpc_req_munmap_impl(fl, buf);
>  	buf = NULL;
>  err_invoke:
> -	fastrpc_buf_free(buf);
> +	if (buf)
> +		fastrpc_buf_free(buf);
> +
> +	return err;
> +}
> +
> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
> +			struct fastrpc_req_mmap req, char __user *argp)
> +{
> +	struct fastrpc_map *map = NULL;
> +	struct device *dev = fl->sctx->dev;
> +	u64 raddr = 0;
> +	int err;
> +
> +	if ((req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && fl->is_unsigned_pd) {
> +		dev_err(dev, "secure memory allocation is not supported in unsigned PD\n");
> +		return -EINVAL;
> +	}
> +	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
> +	if (err) {
> +		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
> +		return err;
> +	}
> +
> +	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
> +				req.vaddrin, &raddr);
> +	if (err)
> +		goto err_invoke;
> +
> +	/* update the buffer to be able to deallocate the memory on the DSP */
> +	map->raddr = (uintptr_t) raddr;
> +
> +	/* let the client know the address to use */
> +	req.vaddrout = raddr;
> +	dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
> +		map->raddr, map->size);
> +
> +	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
> +		err = -EFAULT;
> +		goto err_copy;
> +	}
> +	return 0;
> +err_copy:
> +	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> +err_invoke:
> +	fastrpc_map_put(map);
>  
>  	return err;
>  }
>  
> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_req_mmap req;
> +	int err;
> +
> +	if (copy_from_user(&req, argp, sizeof(req)))
> +		return -EFAULT;
> +
> +	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
> +	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) && !fl->is_unsigned_pd) {
> +		err = fastrpc_req_buf_alloc(fl, req, argp);
> +		if (err)
> +			return err;
> +	} else {
> +		err = fastrpc_req_map_create(fl, req, argp);
> +		if (err)
> +			return err;
> +	}
> +	return 0;
> +}
> +
>  static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

