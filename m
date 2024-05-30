Return-Path: <linux-arm-msm+bounces-21091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC3F8D4A07
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 13:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4179228152D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 11:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA0D169AC5;
	Thu, 30 May 2024 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqiic8Xa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D286F2F1
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717067074; cv=none; b=Uui+sSdb+r+76oik/NDCLwN9TDxVvb5Pb6ym6mIXtC6Moq50AFSFvZYEaHA/9mE2Yh6pSJBQd+mnnTNXyS3BvTVdUanQ5MFnwQBwzF6S2vjmQ7u/B9FqvYDlHaI348clF8HJgn0aW3mKbNiZw6bY7Yb99PO8u8bIh5rxGwIqdRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717067074; c=relaxed/simple;
	bh=j8t1IDHBfbZrDTk0a3VFZXXPA3Q6Ry6baCh8GrC4Is8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTJ0O8Tc4etHx6GAOSwSLuS3RLCkPvtPbD/DYSABoWD2GXZlCVu+hQEUUyaGF8aSbisFSVBVoMAJROR4Z1dYK3Qg6hcCCD/ilTIqWGxUKIF0Q72USWBkh5wTrnIe5gd/InOYkcBJX2iXmmB6e1WONW1tefW8GsuKLIi/aNHSITU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aqiic8Xa; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52b03d66861so772294e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 04:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717067070; x=1717671870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u35KwFFrk5otVU6exhXdwQqr/XhSn0MEkEW/FOP8hLs=;
        b=aqiic8XavNu6/w46GjLUn8PYE0yLVZ/iwXkImZ4mE9eVcnb6alSjmc25z9F4fX4gvs
         WfzHLTViGa7F9wkVRC6k4rtMB27xlKurMV7/NQh0V8zrWFlsaSstIvD2grEiZrz4NNs5
         JVaMpHosjSopGTDGPJ/1rASE3Q7Sb4A0eRIZkyUSilIVzW93Y8IceCSfo9Fq3hJuT26M
         9LXHF8Ohx6IQ4f58bGPoCzpOniYm90N4w3qhI85l5jD07Mi2XxyR+T+zHfEQwTtr9io4
         F61D/S3U5OLvPLBEZD4my4AaoXNwZNf3m+3l4EagGcj4ZwGjSghOS0dOTQr57wcGz/uv
         H2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717067070; x=1717671870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u35KwFFrk5otVU6exhXdwQqr/XhSn0MEkEW/FOP8hLs=;
        b=lenkjSgS5flvDgAXAqMlS7F1CPWIjIbI3RQVEhAai59qH7+RC3jVgIszC+Otfd9NjJ
         5YzHSZ2SRSS2Hl7rJ4LGrYYmGGl6xdBy6zShcBA/ojlV/hUZHk5NAWGu+hByc+YKwzOK
         Q8OSDf3tA+EqQxtqAFV0ERuDy7z5mp0YCy8YBhqKP29MEkpHcCgwWyJjLjfwdUR3d4ou
         uHQy5bbgIy+Lo6eaz29pvMEIfJO8yn0e16Sbe/72UxdJi54wjaKQ/KgRlw9+PxwQDdmq
         nwWERr8PyCnipucqVpwX0BDZHmjM2GbVaSoib2ZISX7XIu/kUhSyCNINJu/rj9wo+f5j
         djSw==
X-Forwarded-Encrypted: i=1; AJvYcCVZagEYy+Ekk+Yb/DlI0xvnSm5dxJ4WoN4JtjIzPlNRYfHbjs3MRooRLoXtKt/DY51l41peI2w0TST6MDzGIS6iI16YYsR8Vs2+QpA/dQ==
X-Gm-Message-State: AOJu0YwQx+eYZ0mtqQPz5ou87CwhEtw3Tq9Lwfqp4G6EEBFuWmlcCo/t
	IgecPZD17VPs2fFxo77dKNv0UP41qW979ZtQtXhivR4g2hTqblYKwhZAyKoExsM=
X-Google-Smtp-Source: AGHT+IF20XZbUvVbqHSV/GBfRHJt80+Y8KA3UFuBgRiW25g7u3wcu1LTN5dHypLI//emGT4W8aigKg==
X-Received: by 2002:ac2:5608:0:b0:523:aeaa:7df1 with SMTP id 2adb3069b0e04-52b7d434dcdmr951664e87.34.1717067070327;
        Thu, 30 May 2024 04:04:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529a62f301dsm1275583e87.188.2024.05.30.04.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:04:29 -0700 (PDT)
Date: Thu, 30 May 2024 14:04:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v3 4/9] misc: fastrpc: Add static PD restart support
Message-ID: <alobvljd7dshv5z6lvnnuolete45s7jhdhz56by4yav5gfxzxk@u64suvcwxdze>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-5-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530102032.27179-5-quic_ekangupt@quicinc.com>

On Thu, May 30, 2024 at 03:50:22PM +0530, Ekansh Gupta wrote:
> Static PDs on the audio and sensor domains are expected to support
> PD restart. The kernel resource handling for the PDs are expected
> to be handled by fastrpc driver. For this, there is a requirement
> of PD service locator to get the event notifications for static PD
> services. Also when events are received, the driver needs to handle
> based on PD states. Added changes to add service locator for audio
> and sensor domain static PDs and handle the PD restart sequence.

Let me repeat a comment from v2:

Please see Documentation/process/submitting-patches.rst for a suggested
language.

Please extend the commit message with the description of why sensors and
audio are handled in a different way.

> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/Kconfig   |   2 +
>  drivers/misc/fastrpc.c | 205 ++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 195 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index faf983680040..e2d83cd085b5 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -280,8 +280,10 @@ config QCOM_FASTRPC
>  	tristate "Qualcomm FastRPC"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on RPMSG
> +	depends on NET
>  	select DMA_SHARED_BUFFER
>  	select QCOM_SCM
> +	select QCOM_PDR_HELPERS
>  	help
>  	  Provides a communication mechanism that allows for clients to
>  	  make remote method invocations across processor boundary to
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 3e1ab58038ed..d115860fc356 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -22,6 +22,7 @@
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
>  #include <linux/of_reserved_mem.h>
> +#include <linux/soc/qcom/pdr.h>
>  
>  #define ADSP_DOMAIN_ID (0)
>  #define MDSP_DOMAIN_ID (1)
> @@ -29,6 +30,7 @@
>  #define CDSP_DOMAIN_ID (3)
>  #define FASTRPC_DEV_MAX		4 /* adsp, mdsp, slpi, cdsp*/
>  #define FASTRPC_MAX_SESSIONS	14
> +#define FASTRPC_MAX_SPD		4
>  #define FASTRPC_MAX_VMIDS	16
>  #define FASTRPC_ALIGN		128
>  #define FASTRPC_MAX_FDLIST	16
> @@ -105,6 +107,18 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +#define AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME   "audio_pdr_adsp"
> +#define AUDIO_PDR_ADSP_SERVICE_NAME              "avs/audio"
> +#define ADSP_AUDIOPD_NAME                        "msm/adsp/audio_pd"
> +
> +#define SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME   "sensors_pdr_adsp"
> +#define SENSORS_PDR_ADSP_SERVICE_NAME              "tms/servreg"
> +#define ADSP_SENSORPD_NAME                       "msm/adsp/sensor_pd"
> +
> +#define SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME "sensors_pdr_slpi"
> +#define SENSORS_PDR_SLPI_SERVICE_NAME            SENSORS_PDR_ADSP_SERVICE_NAME
> +#define SLPI_SENSORPD_NAME                       "msm/slpi/sensor_pd"
> +
>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>  						"sdsp", "cdsp"};
>  struct fastrpc_phy_page {
> @@ -259,6 +273,15 @@ struct fastrpc_session_ctx {
>  	bool valid;
>  };
>  
> +struct fastrpc_static_pd {
> +	char *servloc_name;
> +	char *spdname;
> +	void *pdrhandle;
> +	struct fastrpc_channel_ctx *cctx;
> +	struct fastrpc_user *fl;
> +	bool ispdup;
> +};
> +
>  struct fastrpc_channel_ctx {
>  	int domain_id;
>  	int sesscount;
> @@ -266,6 +289,7 @@ struct fastrpc_channel_ctx {
>  	struct qcom_scm_vmperm vmperms[FASTRPC_MAX_VMIDS];
>  	struct rpmsg_device *rpdev;
>  	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
> +	struct fastrpc_static_pd spd[FASTRPC_MAX_SPD];
>  	spinlock_t lock;
>  	struct idr ctx_idr;
>  	struct list_head users;
> @@ -297,10 +321,12 @@ struct fastrpc_user {
>  	struct fastrpc_channel_ctx *cctx;
>  	struct fastrpc_session_ctx *sctx;
>  	struct fastrpc_buf *init_mem;
> +	struct fastrpc_static_pd *spd;
>  
>  	int tgid;
>  	int pd;
>  	bool is_secure_dev;
> +	char *servloc_name;
>  	/* Lock for lists */
>  	spinlock_t lock;
>  	/* lock for allocations */
> @@ -1230,12 +1256,33 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>  	return false;
>  }
>  
> +static struct fastrpc_static_pd *fastrpc_get_spd_session(
> +				struct fastrpc_user *fl)
> +{
> +	int i;
> +	struct fastrpc_static_pd *spd = NULL;
> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
> +
> +	for (i = 0; i < FASTRPC_MAX_SPD ; i++) {
> +		if (!cctx->spd[i].servloc_name)
> +			continue;
> +		if (!strcmp(fl->servloc_name, cctx->spd[i].servloc_name)) {
> +			spd = &cctx->spd[i];
> +			spd->fl = fl;
> +			break;
> +		}
> +	}
> +
> +	return spd;
> +}
> +
>  static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  					      char __user *argp)
>  {
>  	struct fastrpc_init_create_static init;
>  	struct fastrpc_invoke_args *args;
>  	struct fastrpc_phy_page pages[1];
> +	struct fastrpc_static_pd *spd = NULL;
>  	char *name;
>  	int err;
>  	struct {
> @@ -1270,6 +1317,19 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		goto err_name;
>  	}
>  
> +	fl->servloc_name = AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME;
> +
> +	spd = fastrpc_get_spd_session(fl);
> +	if (!spd) {
> +		err = -EUSERS;
> +		goto err_name;
> +	}
> +
> +	if (!spd->ispdup) {
> +		err = -ENOTCONN;
> +		goto err_name;
> +	}
> +	fl->spd = spd;
>  	if (!fl->cctx->remote_heap) {
>  		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>  						&fl->cctx->remote_heap);
> @@ -1645,6 +1705,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>  {
>  	struct fastrpc_invoke_args args[1];
> +	struct fastrpc_static_pd *spd = NULL;
>  	int tgid = fl->tgid;
>  	u32 sc;
>  
> @@ -1654,6 +1715,22 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>  	fl->pd = pd;
>  
> +	if (pd == SENSORS_PD) {
> +		if (fl->cctx->domain_id == ADSP_DOMAIN_ID)
> +			fl->servloc_name = SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME;
> +		else if (fl->cctx->domain_id == SDSP_DOMAIN_ID)
> +			fl->servloc_name = SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME;
> +
> +		spd = fastrpc_get_spd_session(fl);
> +		if (!spd)
> +			return -EUSERS;
> +
> +		if (!spd->ispdup)
> +			return -ENOTCONN;
> +
> +		fl->spd = spd;
> +	}
> +
>  	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>  				       sc, &args[0]);
>  }
> @@ -2129,6 +2206,64 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>  	return err;
>  }
>  
> +static void fastrpc_notify_users(struct fastrpc_user *user)
> +{
> +	struct fastrpc_invoke_ctx *ctx;
> +
> +	spin_lock(&user->lock);
> +	list_for_each_entry(ctx, &user->pending, node) {
> +		ctx->retval = -EPIPE;
> +		complete(&ctx->work);
> +	}
> +	spin_unlock(&user->lock);
> +}
> +
> +static void fastrpc_notify_pdr_drivers(struct fastrpc_channel_ctx *cctx,
> +		char *servloc_name)
> +{
> +	struct fastrpc_user *fl;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&cctx->lock, flags);
> +	list_for_each_entry(fl, &cctx->users, user) {
> +		if (fl->servloc_name && !strcmp(servloc_name, fl->servloc_name))
> +			fastrpc_notify_users(fl);
> +	}
> +	spin_unlock_irqrestore(&cctx->lock, flags);
> +}
> +
> +static void fastrpc_pdr_cb(int state, char *service_path, void *priv)
> +{
> +	struct fastrpc_static_pd *spd = (struct fastrpc_static_pd *)priv;
> +	struct fastrpc_channel_ctx *cctx;
> +
> +	if (!spd)
> +		return;
> +
> +	cctx = spd->cctx;
> +	switch (state) {
> +	case SERVREG_SERVICE_STATE_DOWN:
> +		dev_info(&cctx->rpdev->dev,
> +			"%s: %s (%s) is down for PDR on %s\n",
> +			__func__, spd->spdname,
> +			spd->servloc_name,
> +			domains[cctx->domain_id]);
> +		spd->ispdup = false;
> +		fastrpc_notify_pdr_drivers(cctx, spd->servloc_name);
> +		break;
> +	case SERVREG_SERVICE_STATE_UP:
> +		dev_info(&cctx->rpdev->dev,
> +			"%s: %s (%s) is up for PDR on %s\n",
> +			__func__, spd->spdname,
> +			spd->servloc_name,
> +			domains[cctx->domain_id]);
> +		spd->ispdup = true;
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  static const struct file_operations fastrpc_fops = {
>  	.open = fastrpc_device_open,
>  	.release = fastrpc_device_release,
> @@ -2248,6 +2383,39 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>  	return err;
>  }
>  
> +static int fastrpc_setup_service_locator(struct fastrpc_channel_ctx *cctx, char *client_name,
> +			char *service_name, char *service_path, int domain, int spd_session)
> +{
> +	int err = 0;
> +	struct pdr_handle *handle = NULL;
> +	struct pdr_service *service = NULL;
> +
> +	/* Register the service locator's callback function */
> +	handle = pdr_handle_alloc(fastrpc_pdr_cb, &cctx->spd[spd_session]);
> +	if (IS_ERR(handle)) {
> +		err = PTR_ERR(handle);
> +		goto bail;
> +	}
> +	cctx->spd[spd_session].pdrhandle = handle;
> +	cctx->spd[spd_session].servloc_name = client_name;
> +	cctx->spd[spd_session].spdname = service_path;
> +	cctx->spd[spd_session].cctx = cctx;
> +	service = pdr_add_lookup(handle, service_name, service_path);
> +	if (IS_ERR(service)) {
> +		err = PTR_ERR(service);
> +		goto bail;
> +	}
> +	pr_info("fastrpc: %s: pdr_add_lookup enabled for %s (%s, %s)\n",
> +		__func__, service_name, client_name, service_path);
> +
> +bail:
> +	if (err) {
> +		pr_warn("fastrpc: %s: failed for %s (%s, %s)with err %d\n",
> +				__func__, service_name, client_name, service_path, err);
> +	}
> +	return err;
> +}
> +
>  static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  {
>  	struct device *rdev = &rpdev->dev;
> @@ -2326,6 +2494,25 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		goto fdev_error;
>  	}
>  
> +	if (domain_id == ADSP_DOMAIN_ID) {
> +		err = fastrpc_setup_service_locator(data, AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME,
> +			AUDIO_PDR_ADSP_SERVICE_NAME, ADSP_AUDIOPD_NAME, domain_id, 0);
> +		if (err)
> +			goto populate_error;
> +
> +		err = fastrpc_setup_service_locator(data,
> +			SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME,
> +			SENSORS_PDR_ADSP_SERVICE_NAME, ADSP_SENSORPD_NAME, domain_id, 1);
> +		if (err)
> +			goto populate_error;
> +	} else if (domain_id == SDSP_DOMAIN_ID) {
> +		err = fastrpc_setup_service_locator(data,
> +			SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME,
> +			SENSORS_PDR_SLPI_SERVICE_NAME, SLPI_SENSORPD_NAME, domain_id, 0);
> +		if (err)
> +			goto populate_error;
> +	}
> +
>  	kref_init(&data->refcount);
>  
>  	dev_set_drvdata(&rpdev->dev, data);
> @@ -2355,24 +2542,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	return err;
>  }
>  
> -static void fastrpc_notify_users(struct fastrpc_user *user)
> -{
> -	struct fastrpc_invoke_ctx *ctx;
> -
> -	spin_lock(&user->lock);
> -	list_for_each_entry(ctx, &user->pending, node) {
> -		ctx->retval = -EPIPE;
> -		complete(&ctx->work);
> -	}
> -	spin_unlock(&user->lock);
> -}
> -
>  static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  {
>  	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
>  	struct fastrpc_buf *buf, *b;
>  	struct fastrpc_user *user;
>  	unsigned long flags;
> +	int i;
>  
>  	/* No invocations past this point */
>  	spin_lock_irqsave(&cctx->lock, flags);
> @@ -2393,6 +2569,11 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	if (cctx->remote_heap)
>  		fastrpc_buf_free(cctx->remote_heap);
>  
> +	for (i = 0; i < FASTRPC_MAX_SPD; i++) {
> +		if (cctx->spd[i].pdrhandle)
> +			pdr_handle_release(cctx->spd[i].pdrhandle);
> +	}
> +
>  	of_platform_depopulate(&rpdev->dev);
>  
>  	fastrpc_channel_ctx_put(cctx);
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

