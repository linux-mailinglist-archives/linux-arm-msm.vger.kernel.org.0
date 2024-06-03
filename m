Return-Path: <linux-arm-msm+bounces-21474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBB08D8058
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 12:53:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758BF281CC7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 10:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97D9839FD;
	Mon,  3 Jun 2024 10:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A8IoTd8c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888177109
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717412010; cv=none; b=IaitTlSTirRCycCI0vU//muvimfvqxrTAaG06FxK6//80f0j3gFdoxEKv2GBcABsrhUkkQfF4ZMRh2PlAtTLiX7N7yv6+p/CjeENovgmCcISEfAy/1XiiZ8sxcYNadcU+8EsrAd3TrHZtn6qmtWkPBNbFlfdPhusyRfywQwZvX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717412010; c=relaxed/simple;
	bh=US8/l6GXafYtCE4uYPr8wJq/FBX4ibcTG40y7Z0uKf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Quas2dsk1W6aleba82I33BHQTRIJmMIFEClmFuxQGXr9Wm1Cdhl9st4YO4WYx6zi8oFwh51sbE2dr6iT6kc7u8qVAaEqMFavnS2bHVfOgprrtfEMeepw9cUYMNYsszzU74ky7HH1n3W0kJw1o3tPmUx/6g/fWG4/x3nGibosxgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A8IoTd8c; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-a63036f2daaso465154866b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 03:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717412007; x=1718016807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hwzveekuWwk2XlalkFz95t9+01SJnCPbZOtZsqrbFNo=;
        b=A8IoTd8c56921hl6ESrikMld/27LxmcKVrbKcYyeiP0tLChqEEWtB5E97gyhUtavFy
         LBxm7LcpnCMS9UJoFj4bYg59j9xHG5J2WuweIZAIupSHOzxHk/V1ZJKV9JgmbuwPXS2T
         wolKmbsJYwZ9Sp5SqzDeWeOPRuoUYeGWQNT3f2Waj13x2KS5aNF1D5b3+1nP+ud9dj5W
         BE7vEjuOT6bE/+PghBQRcXw+aP/lRwzvP1t3gy7QVMDIbe0NPnuHa9V6PTtPTFOvJ9ca
         Gc6O0qzPhmkKSdZVWQhq2oG7lO61168voai1K3RGyCBwXB7nWYp4x02xtfegJltIli4b
         FhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717412007; x=1718016807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hwzveekuWwk2XlalkFz95t9+01SJnCPbZOtZsqrbFNo=;
        b=KpmPvUmGwwOjynKOBffTDpBLBdXTPn5cPRT8feX3mYUpzxXWpN2ci/3osN41jHlf5W
         dtEgOaDDSdyTWK6ctpWsu0LFJFskkUiBMAX7lIZXEfkmwoRfQ4xoASpIweYKRtAHLH16
         CtgNupdMoUBpxRPWXuca8ZvNavtgWfqczandhnoaq8i/3RDAjgiFuSRBTEGaxv+1Bboh
         vGD67hZOZ87qBf+RmpTZHMf+qRF/bNBi6MjRcXIcDgUzUzw4cD8JP/EKfwq3Orz1au7t
         qTOShXWY+VXg4jRu3Q17G7J9UWvPMuNI8AaJkwaiVfGG5dFS0Dx3fo8ykYpQmrBRYpUj
         hr1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUwwqspsRSlkqsY3FUv4kWMHmeJP42MLNhJJAkLtgr0/l+jKQ1ycz/YTKiZfcnQ3yZKCFFlh1Uv9DCamdJK51yBEzGOsANup8YLhmsN6w==
X-Gm-Message-State: AOJu0Yysig+hPopQObywoZ9qcapmpUw8vs+gq2cgYO55PZXpQ1kIFMYg
	/ig0tZDUihR+h28Xw5DZ9a5yyyw+VTPG5xDU6abK01tSbqFk3SDfRNO7L07SltQ=
X-Google-Smtp-Source: AGHT+IGwe4Q3nu3IhSTKnCBpW/4vXT9ThIlel0mtDkpm+QeIwUzhtbSv5LxEVE5c0VKGaNUOFtSFlQ==
X-Received: by 2002:a17:906:1f07:b0:a65:19f1:6e50 with SMTP id a640c23a62f3a-a6821f52ca3mr569236966b.50.1717412006760;
        Mon, 03 Jun 2024 03:53:26 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8090? ([2a02:8109:aa0d:be00::8090])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a691a8f98ffsm90520266b.123.2024.06.03.03.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 03:53:26 -0700 (PDT)
Message-ID: <f0dbb385-6aea-4721-92fa-a1f560fc7c5a@linaro.org>
Date: Mon, 3 Jun 2024 12:53:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] misc: fastrpc: Add static PD restart support
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240530102032.27179-1-quic_ekangupt@quicinc.com>
 <20240530102032.27179-5-quic_ekangupt@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240530102032.27179-5-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ekansh,

On 30/05/2024 12:20, Ekansh Gupta wrote:
> Static PDs on the audio and sensor domains are expected to support
> PD restart. The kernel resource handling for the PDs are expected
> to be handled by fastrpc driver. For this, there is a requirement
> of PD service locator to get the event notifications for static PD
> services. Also when events are received, the driver needs to handle
> based on PD states. Added changes to add service locator for audio
> and sensor domain static PDs and handle the PD restart sequence.

Thanks for the patch, I wanted to bring up a larger issue which I've 
been noticing with the fastrpc driver.

This file is now >2.5k LOC, and to my knowledge it features:

* Two different memory mapping/unmapping interfaces to the DSP (three if 
you count dmabufs!)
* Different branching codepaths for static vs dynamic processes (with 
totally different lifetimes).
* Over 8 structs just for state management, with the largest being >1500 
bytes
* Zero context for which code paths are relevant for which contexts

Your series is a combination of bug fixes and cleanup which span most of 
the file -- suggesting that the state management is also spread all ove 
rthe file. Even for someone with some familiarity with the driver these 
patches are really non-trivial to review (patch 5 being a good example 
of this), while in addition you introduce new features like this in 
patch. This doesn't make for a coherent story for reviewers.

On top of that, there is very minimal, if any comments in this hugely 
complex code, and seemingly zero consideration for how to model state or 
the lifetime of objects.

Finally, there is next-to-no public documentation or easily obtained 
(and used) userspace for this driver. Certainly nothing that I could use 
to offer a Tested-by on your patches.

I am not the maintainer, so while it's not my place, I want to offer 
some suggestions here:

1. Split the fastrpc driver up into more bite-size chunks which can 
actually be reasoned about (I would start by splitting the 
implementation details out from the business logic, and then further 
abstracting out the static PD support, PDR, etc. Just the "invoke" 
mechanism should be in it's own file with it's own state...).

2. Add detailed documentation explaining fastrpc from at least a high 
level (ideally with lower level and driver details too), and code 
comments (where relevant).

3. Release (and maintain) a reference tool(s) that can be used to 
validate the driver and better understand proposed new features (you 
could take inspiration from https://gitlab.com/flamingradian/sensh/).

A mechanism to test at least parts of this driver without needing a DSP 
on the other end would likely help a lot here, but that's obviously a 
much larger scope.

Please let me know your thoughts.

Kind Regards,
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>   drivers/misc/Kconfig   |   2 +
>   drivers/misc/fastrpc.c | 205 ++++++++++++++++++++++++++++++++++++++---
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
> index 3e1ab58038ed..d115860fc356 100644
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
>   	/* Lock for lists */
>   	spinlock_t lock;
>   	/* lock for allocations */
> @@ -1230,12 +1256,33 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
>   	return false;
>   }
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

