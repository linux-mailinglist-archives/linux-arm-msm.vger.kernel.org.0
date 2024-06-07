Return-Path: <linux-arm-msm+bounces-22053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 970DA900244
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 980601C220EA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACED188CC0;
	Fri,  7 Jun 2024 11:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dSa5D7Id"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BB118733D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 11:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760161; cv=none; b=oomuMHcl04P0pHpBUJHxEAVTtESv2sqxaByL7kbn9JVu9jtwRI4owwBPwTqmOjJgvIIuAUR7/Wt9a0clqmNMtjLTL4tdR1YMhGDtcFxI6JpS3NFcuOfVLvIugXl3x3zC11IJ7AIdRm9Kxy3Rz+38V05NA2aOg4X0OylhAM8NruY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760161; c=relaxed/simple;
	bh=eBEctrNUyEClxD2W6RimZTw78rdqoYyFacmBE5J+XHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKvHM/O1oYXA3WLyP2n3posEu0OkKtDNDinuEVn+6aGS63DQ1e72KYBv/GAzlvsT1WgBGPDzZonvh++Pj6LwH4f7R/WqWwUduQq/W9YOnXQgnA9+tvTM1ZCVWSd3Lmhf9RD71RN8iyGMg1UNHbcqCWlr7DI4rUIKigzhu6ZZFyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dSa5D7Id; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b919d214cso1955951e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 04:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717760157; x=1718364957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TVtD+zV7wnja7KGiO0Z7oOp05pY2Z3I36kzwWL8xPYo=;
        b=dSa5D7IdF/L8OUqGQ+IbTHljaPHi6Bv6CVyLb9DK9ipxhRBfGHwq23WR8PuVSSk8YU
         lI5i1GYephqgHd4HBJgzn6BD/+SNEjeUwOBwOFFCGPOCqU4HZ4hbwBbXoDyBuCqSPRm4
         po6966bHtOgEFoPIjHyhDQXyoYLf6ysr0LzPeak+EJIZdyO80gax1I/9eBjw+pePkw6B
         BpmBNW+16zn9bJIMz14t54fFGkxdN28iWHLeO9xQpl1a9jM61V1XlVxoBdVuCbKk1xw5
         YZ51yqL1oxtt5kWj8UKB5WjHWtHrn0wFT0K+SoSR04jXTBelrRj5opIIiebb9vIwMar/
         gwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717760157; x=1718364957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVtD+zV7wnja7KGiO0Z7oOp05pY2Z3I36kzwWL8xPYo=;
        b=Jn0tUrbbDsGDQyysd/WkYQjr4HUSNiZiuvNfZZZuvhVq8h2MlNAn5rrMmOkd7iD8wA
         cJFGGLG9At7Uhbx/wza4wdkxqLbemy8eD7d6UBJZ/Co7IN/6Yhxd3vxt4zHvOE4PgTiv
         LJhpD5QBOZN3mQ/CXdxZvNvmVvWctNOw5XcKJs90HyzwzYVpgIMVvznh38a4BYLOiQCI
         e3PzKNKJ/d4vhAvzAwYATa6y0+AvaY0gwfHaiaT006gUWPbyrgsRvLx1zoBDVr7le4wE
         kCZ+k77i3UNDBSYY1iHyTTXupyxbuNRqtki1rW9X+7WSvugBVgEILrcslrJdLfuco1ak
         oAIg==
X-Forwarded-Encrypted: i=1; AJvYcCXjqUNua2jfjaMH2kEzqNiL0oVOa+SLXDSL7CvEy+f4mLcoZT1Q1Va9O977b1MXUgwGJ5NgEuKJC/Vee7aMYodffqp10htNNccwGmBLnQ==
X-Gm-Message-State: AOJu0YzLyE3PNKrtrsAf3nro7pAVpaeDhmP08/PIX13Ix7eW2TPHTJcy
	JqDTNy5jFGd3rXd6LkN3bWBmHzXoPMIeyBMP2y1YRApyB2t881cACz6o7PWPqL4=
X-Google-Smtp-Source: AGHT+IFay9IRU13Xph94NG/GDPSxNsa55Pz5Mda/K1oTl0miD68iqz/9fkFC83ciGPGzpfoDwIe63g==
X-Received: by 2002:a05:6512:34d4:b0:52b:8843:b084 with SMTP id 2adb3069b0e04-52bb9fc95a6mr1306467e87.47.1717760157125;
        Fri, 07 Jun 2024 04:35:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb423e1c0sm508994e87.230.2024.06.07.04.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:35:56 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:35:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v4 07/11] misc: fastrpc: Redesign remote heap management
Message-ID: <vwnjuqjdworjbjd2ys5sohaurl3ag3jtf4qert6l2hdg3gsjyu@nv62f6tdv2mz>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-8-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606165939.12950-8-quic_ekangupt@quicinc.com>

On Thu, Jun 06, 2024 at 10:29:27PM +0530, Ekansh Gupta wrote:
> Current remote heap design is adding the memory to channel context
> but here is also a possibility of audio daemon requesting new remote
> heap memory using map ioctl. For this purpose, it's much easier to
> maintain these types of static PD specific remote heap allocations
> as a list. This remote heap memory is only getting freed during
> rpmsg remove but it is also needed to be freed when static PD is
> shutting down as this memory will no longed be used by static PDs.

> For daemon kill cases where audio PD is still alive, the init IOCTL
> will again take the same address and size to DSP which DSP would try
> to map again which would result in mapping failure the PD might
> already be using the memory. In Daemon kill cases, the address and
> size is needed to be sent as zero and DSP will skip mapping in this
> case.

Are these two sentences describing the same usecase or two different
cases?

> Add changes to manage remote heap in a way that it can be added
> and removed as per needed and the information is sent as zero in daemon
> kill cases.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 94 +++++++++++++++++++++++++++++++++---------
>  1 file changed, 75 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7ee8bb3a9a6f..3686b2d34741 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -274,6 +274,7 @@ struct fastrpc_session_ctx {
>  };
>  
>  struct fastrpc_static_pd {
> +	struct list_head rmaps;
>  	char *servloc_name;
>  	char *spdname;
>  	void *pdrhandle;
> @@ -299,7 +300,6 @@ struct fastrpc_channel_ctx {
>  	u32 dsp_attributes[FASTRPC_MAX_DSP_ATTRIBUTES];
>  	struct fastrpc_device *secure_fdevice;
>  	struct fastrpc_device *fdevice;
> -	struct fastrpc_buf *remote_heap;
>  	struct list_head invoke_interrupted_mmaps;
>  	bool secure;
>  	bool unsigned_support;
> @@ -1256,6 +1256,53 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>  	return false;
>  }
>  
> +static void fastrpc_mmap_remove_pdr(struct fastrpc_static_pd *spd)

This isn't removing pdr.

> +{
> +	struct fastrpc_buf *buf, *b;
> +	struct fastrpc_channel_ctx *cctx;
> +	int err;
> +
> +	if (!spd || !spd->fl)
> +		return;

Any protection against concurrent spd->fl modification?

> +
> +	cctx = spd->cctx;
> +
> +	spin_lock(&spd->fl->lock);
> +	list_for_each_entry_safe(buf, b, &spd->rmaps, node) {
> +		list_del(&buf->node);
> +		spin_unlock(&spd->fl->lock);
> +		if (cctx->vmcount) {
> +			u64 src_perms = 0;
> +			struct qcom_scm_vmperm dst_perms;
> +			u32 i;
> +
> +			for (i = 0; i < cctx->vmcount; i++)
> +				src_perms |= BIT(cctx->vmperms[i].vmid);
> +
> +			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
> +			dst_perms.perm = QCOM_SCM_PERM_RWX;
> +			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
> +				&src_perms, &dst_perms, 1);
> +			if (err) {
> +				pr_err("%s: Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
> +					__func__, buf->phys, buf->size, err);

dev_err, no __func__

> +				return;
> +			}
> +		}
> +		fastrpc_buf_free(buf);
> +		spin_lock(&spd->fl->lock);
> +	}
> +	spin_unlock(&spd->fl->lock);
> +}
> +
> +static void fastrpc_mmap_remove_ssr(struct fastrpc_channel_ctx *cctx)

SSR?

> +{
> +	int i;
> +
> +	for (i = 0; i < FASTRPC_MAX_SPD; i++)
> +		fastrpc_mmap_remove_pdr(&cctx->spd[i]);
> +}
> +
>  static struct fastrpc_static_pd *fastrpc_get_spd_session(
>  				struct fastrpc_user *fl)
>  {
> @@ -1282,7 +1329,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	struct fastrpc_init_create_static init;
>  	struct fastrpc_invoke_args *args;
>  	struct fastrpc_phy_page pages[1];
> +	struct fastrpc_buf *buf = NULL;
>  	struct fastrpc_static_pd *spd = NULL;
> +	u64 phys = 0, size = 0;
>  	char *name;
>  	int err;
>  	struct {
> @@ -1330,23 +1379,23 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		goto err_name;
>  	}
>  	fl->spd = spd;
> -	if (!fl->cctx->remote_heap) {
> -		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
> -						&fl->cctx->remote_heap);
> +	if (list_empty(&spd->rmaps)) {
> +		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen, &buf);
>  		if (err)
>  			goto err_name;
>  
> +		phys = buf->phys;
> +		size = buf->size;
>  		/* Map if we have any heap VMIDs associated with this ADSP Static Process. */
>  		if (fl->cctx->vmcount) {
>  			u64 src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -			err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
> -							(u64)fl->cctx->remote_heap->size,
> -							&src_perms,
> -							fl->cctx->vmperms, fl->cctx->vmcount);
> +			err = qcom_scm_assign_mem(phys, (u64)size,
> +						&src_perms,
> +						fl->cctx->vmperms, fl->cctx->vmcount);
>  			if (err) {
>  				dev_err(fl->sctx->dev, "Failed to assign memory with phys 0x%llx size 0x%llx err %d\n",
> -					fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
> +					phys, size, err);
>  				goto err_map;
>  			}
>  		}
> @@ -1365,8 +1414,8 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[1].length = inbuf.namelen;
>  	args[1].fd = -1;
>  
> -	pages[0].addr = fl->cctx->remote_heap->phys;
> -	pages[0].size = fl->cctx->remote_heap->size;
> +	pages[0].addr = phys;
> +	pages[0].size = size;
>  
>  	args[2].ptr = (u64)(uintptr_t) pages;
>  	args[2].length = sizeof(*pages);
> @@ -1382,6 +1431,12 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	kfree(args);
>  	kfree(name);
>  
> +	if (buf) {
> +		spin_lock(&fl->lock);
> +		list_add_tail(&buf->node, &spd->rmaps);
> +		spin_unlock(&fl->lock);
> +	}
> +
>  	return 0;
>  err_invoke:
>  	if (fl->cctx->vmcount) {
> @@ -1394,15 +1449,15 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  
>  		dst_perms.vmid = QCOM_SCM_VMID_HLOS;
>  		dst_perms.perm = QCOM_SCM_PERM_RWX;
> -		err = qcom_scm_assign_mem(fl->cctx->remote_heap->phys,
> -						(u64)fl->cctx->remote_heap->size,
> -						&src_perms, &dst_perms, 1);
> +		err = qcom_scm_assign_mem(phys, (u64)size,

Why do you need to convert to u64?

> +					&src_perms, &dst_perms, 1);

Maybe it can fit into a single line?

>  		if (err)
>  			dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
> -				fl->cctx->remote_heap->phys, fl->cctx->remote_heap->size, err);
> +				phys, size, err);
>  	}
>  err_map:
> -	fastrpc_buf_free(fl->cctx->remote_heap);
> +	if (buf)
> +		fastrpc_buf_free(buf);
>  err_name:
>  	kfree(name);
>  err:
> @@ -2250,6 +2305,7 @@ static void fastrpc_pdr_cb(int state, char *service_path, void *priv)
>  			spd->servloc_name,
>  			domains[cctx->domain_id]);
>  		spd->ispdup = false;
> +		fastrpc_mmap_remove_pdr(spd);
>  		fastrpc_notify_pdr_drivers(cctx, spd->servloc_name);
>  		break;
>  	case SERVREG_SERVICE_STATE_UP:
> @@ -2401,6 +2457,7 @@ static int fastrpc_setup_service_locator(struct fastrpc_channel_ctx *cctx, char
>  	cctx->spd[spd_session].servloc_name = client_name;
>  	cctx->spd[spd_session].spdname = service_path;
>  	cctx->spd[spd_session].cctx = cctx;
> +	INIT_LIST_HEAD(&cctx->spd[spd_session].rmaps);
>  	service = pdr_add_lookup(handle, service_name, service_path);
>  	if (IS_ERR(service)) {
>  		err = PTR_ERR(service);
> @@ -2567,9 +2624,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
>  		list_del(&buf->node);
>  
> -	if (cctx->remote_heap)
> -		fastrpc_buf_free(cctx->remote_heap);
> -
>  	for (i = 0; i < FASTRPC_MAX_SPD; i++) {
>  		if (cctx->spd[i].pdrhandle)
>  			pdr_handle_release(cctx->spd[i].pdrhandle);
> @@ -2577,6 +2631,8 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  
>  	of_platform_depopulate(&rpdev->dev);
>  
> +	fastrpc_mmap_remove_ssr(cctx);
> +
>  	fastrpc_channel_ctx_put(cctx);
>  }
>  
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

