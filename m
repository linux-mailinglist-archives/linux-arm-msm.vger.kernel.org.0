Return-Path: <linux-arm-msm+bounces-22049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7535A900213
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77D661C21127
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4048186E2E;
	Fri,  7 Jun 2024 11:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHaae78X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9956B15B127
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 11:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717759538; cv=none; b=TB25enVZX5dnhHncCdPSKQzc0LFyJhKYvU2ETAUx6ambjz/ZAQCs3DRw2lSYyNAWqn83U5zIJa2SXeffo0sEXEDWmhGr9x7Dfl+Wf7EUXLxZWKV9SE7f7l6xuX3MYlqEx9SFb5+IQRHC+gMUr4GDugSNA+OcdngTTZCry81mp1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717759538; c=relaxed/simple;
	bh=0dwefQbi3vHoDPXMSmdFmIpAhIBzReyw15B5pWoYCko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/yWgTK/9nSC58ts203Rm0iKauHxguEBAL3MDnw/Ffb6jmKWJQkuEYAe2MyW6LsJfFw7rTtou9cxKN+9j5TlFk72fNDIegH9wNKMx1D30oL9xs2N/XGIOEn2eTbQJN4xW1KSC2dfNSBCVcMY92GOohCrD581stk2NN3bwVN7Qcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHaae78X; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5295eb47b48so2531237e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 04:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717759535; x=1718364335; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gDV7FC3fED8EtD119C3VF+F1krLIkHo9TJRRgWrz+HA=;
        b=lHaae78X0BOMoXZ6dDHXr8Mawyb4Sz523Uwm1v4cuTrykZBgNznbcQi88eo7ll71yA
         OKvCbQS3fxtrf7jI+KLvhhKxMuTcAlcmbzXQOPSg/O82EOi2QkodeqNjaTJUCGfb3tHf
         LG1SJhzU7f1jCiyqaQwyPw2x91xSzUH6/V9DuSxuFeHAkQoYpTBgAcwHPhLLX2rhv/6T
         AGsqjYfuNxeN8aFR7mPyxPOtva6iXjGq+8R+af/qrCipDKDsm5B19/Xxcy1qafVBVAdg
         6G7xAoWWFfC0FNQVYiWlS9uqylmCsfDVRPVnKNWAShsoaFGNvBjaB75CtBAZKs6gVpwh
         aqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717759535; x=1718364335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDV7FC3fED8EtD119C3VF+F1krLIkHo9TJRRgWrz+HA=;
        b=MW+CAQgjpuAvOyrLWw/uY3ZEIAGiVYgW/Hj570tV/FT+rbdOTU9p0Z7UqRVmlBEhK9
         AXHEF5cJa1fJtKt8EIXEnV1NtFxpiiUQCTNXVUTJdJ/b7gXu+jNBCpGAmt8QzL3NcR80
         uqmVNKrxXE/3zwsc1y3sGdPbRiHmTiPoQKeKtfBI2dWJtp8KEaTFmIcCR1ye1V/SkYrP
         XsyyUbgKLWbpZ424jSlrzwlN+HCV5hAOYMCwY+NalTuNh1aj3F/9DEPzxCuHTWSeTMK/
         R6DEmwN5Y8IXhrwIFJQx/5pktG9r7eWA2/9AsvtXJneqKtBU5dk4W91k3aRbMb82ooAl
         l5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWFK1z9B7b6Skg5cyzVHgmE5svbNhGK3aPLb8DVS5Ya6IcDYxll480Swj9hX/WX5AAp5LRD/uagZtF6ny1AnIve+LSn3S2mcN1ou3o/6w==
X-Gm-Message-State: AOJu0YzpaffTT9jTFMwrctLnV35PTqkgIPnIGl39WbYXN46l97+8Aq4y
	zq0peAZswER9LZ+0Ly5loqc55tIqoIN3EfvUdiHvUVhH8lg+IYpYO/N2W/kmOU8=
X-Google-Smtp-Source: AGHT+IFzldKkXV2QaHQ5k5Foh0p9izwPvnCk0zHblClA6XVKZAaw6XKqhthpRFFbSkSQxMHCIa4EJQ==
X-Received: by 2002:a19:6457:0:b0:52b:8255:71cf with SMTP id 2adb3069b0e04-52bb9fcc59emr1392243e87.47.1717759534602;
        Fri, 07 Jun 2024 04:25:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb434dda8sm503028e87.300.2024.06.07.04.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:25:34 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:25:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v4 05/11] misc: fastrpc: Add static PD restart support
Message-ID: <wsdk6i6wp5ahxs3oykwabtxfkqc3fytvaguchkl4imd43r2lv6@mq2ejnbwmpmo>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-6-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606165939.12950-6-quic_ekangupt@quicinc.com>

On Thu, Jun 06, 2024 at 10:29:25PM +0530, Ekansh Gupta wrote:
> Static PDs are created on DSPs to support specific use cases like Audio
> and Sensors. The static PDs uses any CPU requirements like file
> operations or memory need with the help of a daemon running on the CPU.

What do you mean by 'CPU requirements' here?

> Audio and sensors daemons attaches to audio PD and sensors PD on DSP.

attach

> Audio PD expects some CMA memory for dynamic loading purpose which is
> allocated and sent to DSP in fastrpc_init_create_static_process call.

A pointer to audio daemon would be helpful. We don't have such a thing
in the normal Linux operation cycle.

> For sensor daemon, the expectation is just to attach to sensors PD and
> take up any requests made by the PD(like file operations etc.).
> 
> Static PDs run on the audio and sensor supporting subsystem which can
> be ADSP or SDSP. They are expected to support PD restart. There are some
> CPU resources like buffers etc. for static PDs which are expected to be
> cleaned up by fastrpc driver during PDR scenario. For this, there is a

Why are they cleaned by fastrpc driver and not by the userspace daemon
itself? Userspace can also subscribe to PDR notifications and handle
restarts on its own.

> requirement of PD service locator to get the event notifications for
> static PD services. Also when events are received, the driver needs to
> handle based on PD states.

To handle what? And why?

> 
> PDR handling is required for static PD only. There are no static PD
> supported on MDSP or CDSP hence no PDR handling is required. PDR is also
> not required for root_pd as if root_pd is shutting down, that basically
> suggests that the remoteproc itself is shutting down which is handled
> with rpmsg functionalities(probe and remove).
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
> index abdd35b7c3ad..13e368279765 100644
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

is_pd_up

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

Single line, please

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

Should there be a protection for spd->fl being overwritten / overtaken?
How should it be handled by the driver?

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

"Too many users" ?

> +		goto err_name;
> +	}
> +
> +	if (!spd->ispdup) {

This is racy. What if the domain restarts right after this line?

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

Too noisy. Is it really dev_info()? Or dev_warn? There should be no need
for __func__.

> +		spd->ispdup = false;
> +		fastrpc_notify_pdr_drivers(cctx, spd->servloc_name);
> +		break;
> +	case SERVREG_SERVICE_STATE_UP:
> +		dev_info(&cctx->rpdev->dev,
> +			"%s: %s (%s) is up for PDR on %s\n",
> +			__func__, spd->spdname,
> +			spd->servloc_name,
> +			domains[cctx->domain_id]);

Same comment here.

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

Definitely too noisy. Drop __func__ everywhere. Use dev_dbg instead.

> +
> +bail:
> +	if (err) {
> +		pr_warn("fastrpc: %s: failed for %s (%s, %s)with err %d\n",
> +				__func__, service_name, client_name, service_path, err);

dev_warn, drop brackets, align properly. Did you run this through checkpatch.pl --strict?

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

