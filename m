Return-Path: <linux-arm-msm+bounces-22079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF283900566
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 15:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 587B81F22A6A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A17A194ACC;
	Fri,  7 Jun 2024 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mV2t9ggA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DC3DDA3
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717767964; cv=none; b=ZyElwKyFBOmk7viUYdbyeydSow7qVp+T++10iS3u7sLGEnN5t0Qm/Aa+8b2RcbuyxkhNDGN8Ab4oBPxmqLWWtqxapiSBH2rOFuGQS518r/JN6nV818UiX7jN1M3SMffZsTVRTPz2pPzdmkeS9ylH0qJDq5w/PKflUjg4WdY5gaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717767964; c=relaxed/simple;
	bh=GWNdn7/W0ksI33kkNZTnRbc69IVKv2dqgrkko6CFvkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p7dyJglZVxi2vV+7mDGHxrihRuCl7fTxaeTfOnxcFeaTAj3xwvg1pYSkLbV/2T7lV4ZCK4QARgWM7xODj6R96XFn0EBS/xuc1VHB6jorVZZVTU63Djh9VKkyoLie9BLD3084rlLvQ7GqTp013CQBpNYI1EfKJG3c9h/Sj2JEre4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mV2t9ggA; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57a1fe63947so2728180a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717767960; x=1718372760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/y6pBcgH6b/cbsT6A6zTZMlyTFzuvKGcUhVsEX7P8Y=;
        b=mV2t9ggAgVHZGqD99hgbxOF6wiF0f4mfZg8L6x/g/R4CkSI+d9DyR0n5IYNO5+UlFo
         ArLJZtdj5WUjHLtYz1hUp7GcIb0DDjD2cTgI2MJNpbkP7UMnH8O3g7iSzcvtZz+2x7dw
         s3aBFlOOHgHos78L03iACVmZr/qmGW0n1KJC9f4Bf2rMH/z7LMRv0yxj5nKsTiq/y0YM
         JJnyzO8oYUjjfgbrE6ePdqhPuZgEHogRKvQJRrSnG+lNP3n0CdOJ9Vkq3fo/hRZNJ8mD
         +E3Yqn4GQ+QgrdWgoILEM1eWJtoSIiXVDtwq8dnsjWYrdGO0KDqvd3l/gZvQGa1TTHbY
         zsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717767960; x=1718372760;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/y6pBcgH6b/cbsT6A6zTZMlyTFzuvKGcUhVsEX7P8Y=;
        b=uhm54Hs5th4vLnVK0ewBcMwKp3hWCjEEfGyg3FnE/VdcdpRxCGxd4+tQfyCKJVzPyV
         0jITS2vQb3FZJrxdJY3gH/xWjwuE8jbpFeDYVvWsviq8zmE0U9PTxF9Kryg08fBjrn5M
         QjTRjLMJK9pkozsxGK4ExzKRiZAS8OcaaguGMauP7roKBS0DVyQLpNJ4nRagSshuctlA
         aI5fqI+lkuQrR68SGxx0CFFalfUxVwnZJwkZAyMDd8t6KeATULQYS8qellkT1Kl518B0
         HTlEH1wXHW0gyH8u0pRv57/P845qPLiv/0sDclOfOnndBSAfKftv1f7CBM/8fhNk7Art
         +pAA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Jg09l8TXbKxKLQvH0ViIfDjY6OnkaDUB0CLSISGE+xYA9Rw8cILQ0TFxXNCJdNRkW/wx9NOfE+5tnLalXvnt0bXTK3v15NoryN2caA==
X-Gm-Message-State: AOJu0Yx4/cDexzeAqcs7IZsYuuZ1+Q6/34WHMEnvbT9y5IsAvNG9TePO
	CvHMNfnUqSgZZU/QgppuzBGZ3kdPjX67fwstRR8I6Ox46Rz67+FBzfxvmQGf5R4=
X-Google-Smtp-Source: AGHT+IHsnlaEt+stFIS8YamBEqIpNqtjafgtKVGoz7dBTkkdaDBl1h5p/u8zir6IgabxmOk0BKklLA==
X-Received: by 2002:a50:9e85:0:b0:57c:5515:307d with SMTP id 4fb4d7f45d1cf-57c5515319dmr1197939a12.38.1717767959933;
        Fri, 07 Jun 2024 06:45:59 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8090? ([2a02:8109:aa0d:be00::8090])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aadf9d280sm2787480a12.9.2024.06.07.06.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 06:45:59 -0700 (PDT)
Message-ID: <c007308b-4641-44a5-9e64-fb085cced2b0@linaro.org>
Date: Fri, 7 Jun 2024 15:45:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] misc: fastrpc: Add static PD restart support
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-6-quic_ekangupt@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240606165939.12950-6-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/06/2024 18:59, Ekansh Gupta wrote:
> Static PDs are created on DSPs to support specific use cases like Audio
> and Sensors. The static PDs uses any CPU requirements like file
> operations or memory need with the help of a daemon running on the CPU.
> Audio and sensors daemons attaches to audio PD and sensors PD on DSP.
> Audio PD expects some CMA memory for dynamic loading purpose which is
> allocated and sent to DSP in fastrpc_init_create_static_process call.
> For sensor daemon, the expectation is just to attach to sensors PD and
> take up any requests made by the PD(like file operations etc.).
> 
> Static PDs run on the audio and sensor supporting subsystem which can
> be ADSP or SDSP. They are expected to support PD restart. There are some
> CPU resources like buffers etc. for static PDs which are expected to be
> cleaned up by fastrpc driver during PDR scenario. For this, there is a
> requirement of PD service locator to get the event notifications for
> static PD services. Also when events are received, the driver needs to
> handle based on PD states.
> 
> PDR handling is required for static PD only. There are no static PD
> supported on MDSP or CDSP hence no PDR handling is required. PDR is also
> not required for root_pd as if root_pd is shutting down, that basically
> suggests that the remoteproc itself is shutting down which is handled
> with rpmsg functionalities(probe and remove).
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>   drivers/misc/Kconfig   |   2 +
>   drivers/misc/fastrpc.c | 205 ++++++++++++++++++++++++++++++++++++++---

I think this justifies introducing a new C file. The functionality added 
here should be quite easily abstracted behind a sensible interface.
>   2 files changed, 195 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index faf983680040..e2d83cd085b5 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -280,8 +280,10 @@ config QCOM_FASTRPC
>   	tristate "Qualcomm FastRPC"
>   	depends on ARCH_QCOM || COMPILE_TEST
>   	depends on RPMSG
> +	depends on NET
>   	select DMA_SHARED_BUFFER
>   	select QCOM_SCM
> +	select QCOM_PDR_HELPERS
>   	help
>   	  Provides a communication mechanism that allows for clients to
>   	  make remote method invocations across processor boundary to
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index abdd35b7c3ad..13e368279765 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -22,6 +22,7 @@
>   #include <linux/firmware/qcom/qcom_scm.h>
>   #include <uapi/misc/fastrpc.h>
>   #include <linux/of_reserved_mem.h>
> +#include <linux/soc/qcom/pdr.h>
>   
>   #define ADSP_DOMAIN_ID (0)
>   #define MDSP_DOMAIN_ID (1)
> @@ -29,6 +30,7 @@
>   #define CDSP_DOMAIN_ID (3)
>   #define FASTRPC_DEV_MAX		4 /* adsp, mdsp, slpi, cdsp*/
>   #define FASTRPC_MAX_SESSIONS	14
> +#define FASTRPC_MAX_SPD		4

Why 4? This patch only makes use of two.
>   #define FASTRPC_MAX_VMIDS	16
>   #define FASTRPC_ALIGN		128
>   #define FASTRPC_MAX_FDLIST	16
> @@ -105,6 +107,18 @@
>   
>   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
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

This data should be defined in some const static data struct, not as a 
bunch of macros, then you can actually describe the relationship between 
a domain_id and the fact that the ADSP registers two PDR lookups. See my 
comments in fastrpc_setup_service_locator() and where it's called in probe.

struct fastrpc_pdr_domain {
	const char *servloc_client_name;
	const char *service_name;
	const char *pd_name;
};

static const struct fastrpc_pdr_domain adsp_pdr_services[] = {
	{
		.servloc_client_name = "audio_pdr_adsp";
		.service_name = "avs/audio";
		.pd_name = "msm/adsp/audio_pd";
	},
	{
		.servloc_client_name = "sensors_pdr_adsp";
		...
};
> +
>   static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>   						"sdsp", "cdsp"};
>   struct fastrpc_phy_page {
> @@ -259,6 +273,15 @@ struct fastrpc_session_ctx {
>   	bool valid;
>   };
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
>   struct fastrpc_channel_ctx {
>   	int domain_id;
>   	int sesscount;
> @@ -266,6 +289,7 @@ struct fastrpc_channel_ctx {
>   	struct qcom_scm_vmperm vmperms[FASTRPC_MAX_VMIDS];
>   	struct rpmsg_device *rpdev;
>   	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
> +	struct fastrpc_static_pd spd[FASTRPC_MAX_SPD];
>   	spinlock_t lock;
>   	struct idr ctx_idr;
>   	struct list_head users;
> @@ -297,10 +321,12 @@ struct fastrpc_user {
>   	struct fastrpc_channel_ctx *cctx;
>   	struct fastrpc_session_ctx *sctx;
>   	struct fastrpc_buf *init_mem;
> +	struct fastrpc_static_pd *spd;
>   
>   	int tgid;
>   	int pd;
>   	bool is_secure_dev;
> +	char *servloc_name;

This is duplicated from spd->servloc_name
>   	/* Lock for lists */
>   	spinlock_t lock;
>   	/* lock for allocations */
> @@ -1230,12 +1256,33 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>   	return false;
>   }
>   
> +static struct fastrpc_static_pd *fastrpc_get_spd_session( > +				struct fastrpc_user *fl)

Every caller of this function has the same handling (checking !spd and 
then !spd->ispdup and returning different errors in each case). Please 
lift this common error handling into this function. While at it, I'd 
propose dropping the opaque *fl pointer and instead passing in the data 
which is actually used. The servloc_name could be looked up from the 
fastrpc_pdr_domain data.

static int fastrpc_pdr_is_up(int pd, int domain_id, struct 		
			     fastrpc_static_pd *spds,
			     struct fastrpc_static_pd *spd)
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
>   static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   					      char __user *argp)
>   {
>   	struct fastrpc_init_create_static init;
>   	struct fastrpc_invoke_args *args;
>   	struct fastrpc_phy_page pages[1];
> +	struct fastrpc_static_pd *spd = NULL;
>   	char *name;
>   	int err;
>   	struct {
> @@ -1270,6 +1317,19 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   		goto err_name;
>   	}
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
>   	if (!fl->cctx->remote_heap) {
>   		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
>   						&fl->cctx->remote_heap);
> @@ -1645,6 +1705,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>   static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>   {
>   	struct fastrpc_invoke_args args[1];
> +	struct fastrpc_static_pd *spd = NULL;
>   	int tgid = fl->tgid;
>   	u32 sc;
>   
> @@ -1654,6 +1715,22 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>   	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>   	fl->pd = pd;
>   
> +	if (pd == SENSORS_PD) {

Why is this only relevant for the sensors pd?
> +		if (fl->cctx->domain_id == ADSP_DOMAIN_ID)
> +			fl->servloc_name = SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME;
> +		else if (fl->cctx->domain_id == SDSP_DOMAIN_ID)
> +			fl->servloc_name = SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME;
What if domain_id isn't either of these? Should this be checked? If not, 
why?

This whole block could be replaced with a call to the 
fastrpc_pdr_is_up() function I proposed.
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
>   	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
>   				       sc, &args[0]);
>   }
> @@ -2129,6 +2206,64 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>   	return err;
>   }
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

dev_dbg
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
>   static const struct file_operations fastrpc_fops = {
>   	.open = fastrpc_device_open,
>   	.release = fastrpc_device_release,
> @@ -2248,6 +2383,39 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
>   	return err;
>   }
>   
> +static int fastrpc_setup_service_locator(struct fastrpc_channel_ctx *cctx, char *client_name,
> +			char *service_name, char *service_path, int domain, int spd_session)

This function should instead take a struct fastrpc_pdr_domain *services 
array.
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
dev_dbg
> +		__func__, service_name, client_name, service_path);
> +
> +bail:
> +	if (err) {
> +		pr_warn("fastrpc: %s: failed for %s (%s, %s)with err %d\n",
dev_err
> +				__func__, service_name, client_name, service_path, err);
> +	}
> +	return err;
> +}
> +
>   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>   {
>   	struct device *rdev = &rpdev->dev;
> @@ -2326,6 +2494,25 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>   		goto fdev_error;
>   	}
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

I assume this is basically a nop on platforms where this service doesn't 
exist? A comment mentioning this would be nice.
> +		if (err)
> +			goto populate_error;
> +	} else if (domain_id == SDSP_DOMAIN_ID) {
> +		err = fastrpc_setup_service_locator(data,
> +			SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME,
> +			SENSORS_PDR_SLPI_SERVICE_NAME, SLPI_SENSORPD_NAME, domain_id, 0);
> +		if (err)
> +			goto populate_error;
> +	}

This block should be moved into the domain_id switch/case which is 
directly above it.

> +
>   	kref_init(&data->refcount);
>   
>   	dev_set_drvdata(&rpdev->dev, data);
> @@ -2355,24 +2542,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>   	return err;
>   }
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
>   static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>   {
>   	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
>   	struct fastrpc_buf *buf, *b;
>   	struct fastrpc_user *user;
>   	unsigned long flags;
> +	int i;
>   
>   	/* No invocations past this point */
>   	spin_lock_irqsave(&cctx->lock, flags);
> @@ -2393,6 +2569,11 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>   	if (cctx->remote_heap)
>   		fastrpc_buf_free(cctx->remote_heap);
>   
> +	for (i = 0; i < FASTRPC_MAX_SPD; i++) {
> +		if (cctx->spd[i].pdrhandle)
> +			pdr_handle_release(cctx->spd[i].pdrhandle);
> +	}
> +
>   	of_platform_depopulate(&rpdev->dev);
>   
>   	fastrpc_channel_ctx_put(cctx);

-- 
// Caleb (they/them)

