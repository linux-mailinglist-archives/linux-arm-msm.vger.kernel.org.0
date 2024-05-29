Return-Path: <linux-arm-msm+bounces-20933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B24688D369A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6956C28552D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 12:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8471142E68;
	Wed, 29 May 2024 12:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PkmqmOEa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC11E17DE23
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716986602; cv=none; b=TFm+VrXBmiNyjOlalEc1NJmoOMfEByq7meQRXiMcEoQolBTlaCIb0Co3RbzCTIbUK6dQPQjGDLM65jCR4OHCLMCqfchNk82BX5UHgFKlgdIXHFaNMi6tRCWihL6c3BXuT/kqKruQHl9iA+ry+sjYfLZN6c/uj81H2ZI80ThkU2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716986602; c=relaxed/simple;
	bh=RI/KHPMoNUrQf8ygGfydOURq3V3LjYl0gBVOaErJZv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UZbhjXq5l/19C2PUyT0bJ3xxyu/fjFMaMuX3nE1KGk4gC/ep+7biKa/w6MyE4BCPB1Fnbb0fBTYkG4+jSJrjjNyXyegZnUPdyh45YkimRvVD0jGQwvZ0ShcOJg6zpLoQa3EhswqBJz6KPx4FQp7hszd3ZdsTGfauVoTLoBGe834=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PkmqmOEa; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2e73359b900so21094201fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 05:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716986599; x=1717591399; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xRaF42bp/ars4L7DH1F1o4MdsEox9mNdyC9JhweFwSc=;
        b=PkmqmOEam66tAWzmiMD0RI3xnc548PzbJEs65mwu3ilvY5mGs5SN1Y3LeT+z//klI3
         9vR1B1PohSasG59EIWNoCkembPhYjSS8FDPhaBSJCdUWn8COrvQufa2fJcI291OEYknI
         6TF6D9DD/rDga/MM35LMJbyjrgEijPxdXE8JYpk8hVmTHt+hOalzd/xjE3y4BhxW4g2c
         JUy5AzxFB1f1twVb/PyBuUQ7xl/nTNxKVFJJ1GzpBbQsGVfXCxm9KgV/qEAJu6K8jNOl
         VmeAdarUp7EW0Xa73JOUYREFFSaVrQAdYsP4nPuA+tLHInPcuvxdtBvlo4MazmduJlLI
         /hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716986599; x=1717591399;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRaF42bp/ars4L7DH1F1o4MdsEox9mNdyC9JhweFwSc=;
        b=SnhgQhBoPUmMJ9EX9um8RO8UVU30Z+ERxIMJ9oiG8FaeL5dxdHZpdtOybU4L0lL7KY
         2lRBwvNkuwYEpdEF0OijjDfsvyXe67TzWnMgpMqVJC4yExjJfjj//5FsnWbSnMQcN0oI
         cvyjWUxl7jH79Yq6IfsDIB0p2CLM//YCSJ3qfwQh5eso7Kn6VtzeD2w23cmNE69MJX6E
         TEzhoMYiWGFS3zfz2MtMpOji4vh3WO0W9W5iMJp6/gjqcOPiTpEG1tKonYEnJCa902tZ
         K0up8RTXoJD4+1GW5tsM3KyRukuaU1Bs25Fx4wk8SUQmhm0t8KNBTjXlJGm4nZ+bq+I9
         fEaA==
X-Forwarded-Encrypted: i=1; AJvYcCUp4KJpqfkq66WQ53XUd1ekSIGWu40td7lc+2XpXnl11xljCGfTtWeaP8dYouASKf6izlnhcI+nzLct1KEKzYJO6Jz+nw8XIs4QEtzQ0w==
X-Gm-Message-State: AOJu0YwCkytKgbGMAcrotqpLVRDR9CEOAAmecoibZ4kFFyRp0wVzea0Y
	j/HpfR6sWlWlbNnY7YEGi7t2YjwoZrUwPt5sWo+h6H/hDM3MnqvZVNVQq6Z7fpbakaEtCSJab0Q
	l
X-Google-Smtp-Source: AGHT+IECCJJE2HqL0X+/vjqAWoUZYO/ModSWoesop1MKD+vGhezQ/8LnAllv2sz5JiF0ICvlEjzjpw==
X-Received: by 2002:a2e:97cc:0:b0:2dc:f188:a073 with SMTP id 38308e7fff4ca-2e95b2871a3mr111308941fa.35.1716986598951;
        Wed, 29 May 2024 05:43:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea53ab0bfdsm2198141fa.23.2024.05.29.05.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 05:43:18 -0700 (PDT)
Date: Wed, 29 May 2024 15:43:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v2 4/8] misc: fastrpc: Add static PD restart support
Message-ID: <f5dq3boqfbs4zl7d27j26sqj63jharn6ux7vbgsfgz5i75g4v5@nmela43ftlfq>
References: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
 <20240528112956.5979-5-quic_ekangupt@quicinc.com>
 <wovshpnle7jvl7yc7spxixb46o7p4l3y4hmehjjpcjwh4jma74@k6kjzjx5di6m>
 <51facf80-2490-4533-8ba1-584769e1ca79@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51facf80-2490-4533-8ba1-584769e1ca79@quicinc.com>

On Wed, May 29, 2024 at 04:41:51PM +0530, Ekansh Gupta wrote:
> 
> On 5/28/2024 6:03 PM, Dmitry Baryshkov wrote:
> > On Tue, May 28, 2024 at 04:59:50PM +0530, Ekansh Gupta wrote:
> > > Static PDs on the audio and sensor domains are expected to support
> > > PD restart. The kernel resource handling for the PDs are expected
> > > to be handled by fastrpc driver. For this, there is a requirement
> > > of PD service locator to get the event notifications for static PD
> > > services. Also when events are received, the driver needs to handle
> > > based on PD states. Added changes to add service locator for audio
> > > and sensor domain static PDs and handle the PD restart sequence.
> > > 
> > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > ---
> > >   drivers/misc/Kconfig   |   2 +
> > >   drivers/misc/fastrpc.c | 205 ++++++++++++++++++++++++++++++++++++++---
> > >   2 files changed, 195 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > > index faf983680040..e2d83cd085b5 100644
> > > --- a/drivers/misc/Kconfig
> > > +++ b/drivers/misc/Kconfig
> > > @@ -280,8 +280,10 @@ config QCOM_FASTRPC
> > >   	tristate "Qualcomm FastRPC"
> > >   	depends on ARCH_QCOM || COMPILE_TEST
> > >   	depends on RPMSG
> > > +	depends on NET
> > >   	select DMA_SHARED_BUFFER
> > >   	select QCOM_SCM
> > > +	select QCOM_PDR_HELPERS
> > >   	help
> > >   	  Provides a communication mechanism that allows for clients to
> > >   	  make remote method invocations across processor boundary to
> > > diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> > > index 6556c63c4ad7..7796b743cc45 100644
> > > --- a/drivers/misc/fastrpc.c
> > > +++ b/drivers/misc/fastrpc.c
> > > @@ -22,6 +22,7 @@
> > >   #include <linux/firmware/qcom/qcom_scm.h>
> > >   #include <uapi/misc/fastrpc.h>
> > >   #include <linux/of_reserved_mem.h>
> > > +#include <linux/soc/qcom/pdr.h>
> > >   #define ADSP_DOMAIN_ID (0)
> > >   #define MDSP_DOMAIN_ID (1)
> > > @@ -29,6 +30,7 @@
> > >   #define CDSP_DOMAIN_ID (3)
> > >   #define FASTRPC_DEV_MAX		4 /* adsp, mdsp, slpi, cdsp*/
> > >   #define FASTRPC_MAX_SESSIONS	14
> > > +#define FASTRPC_MAX_SPD		4
> > >   #define FASTRPC_MAX_VMIDS	16
> > >   #define FASTRPC_ALIGN		128
> > >   #define FASTRPC_MAX_FDLIST	16
> > > @@ -105,6 +107,18 @@
> > >   #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
> > > +#define AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME   "audio_pdr_adsp"
> > > +#define AUDIO_PDR_ADSP_SERVICE_NAME              "avs/audio"
> > > +#define ADSP_AUDIOPD_NAME                        "msm/adsp/audio_pd"
> > > +
> > > +#define SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME   "sensors_pdr_adsp"
> > > +#define SENSORS_PDR_ADSP_SERVICE_NAME              "tms/servreg"
> > > +#define ADSP_SENSORPD_NAME                       "msm/adsp/sensor_pd"
> > > +
> > > +#define SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME "sensors_pdr_slpi"
> > > +#define SENSORS_PDR_SLPI_SERVICE_NAME            SENSORS_PDR_ADSP_SERVICE_NAME
> > > +#define SLPI_SENSORPD_NAME                       "msm/slpi/sensor_pd"
> > > +
> > >   static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
> > >   						"sdsp", "cdsp"};
> > >   struct fastrpc_phy_page {
> > > @@ -258,6 +272,15 @@ struct fastrpc_session_ctx {
> > >   	bool valid;
> > >   };
> > > +struct fastrpc_static_pd {
> > > +	char *servloc_name;
> > > +	char *spdname;
> > > +	void *pdrhandle;
> > > +	struct fastrpc_channel_ctx *cctx;
> > > +	struct fastrpc_user *fl;
> > > +	bool ispdup;
> > > +};
> > > +
> > >   struct fastrpc_channel_ctx {
> > >   	int domain_id;
> > >   	int sesscount;
> > > @@ -265,6 +288,7 @@ struct fastrpc_channel_ctx {
> > >   	struct qcom_scm_vmperm vmperms[FASTRPC_MAX_VMIDS];
> > >   	struct rpmsg_device *rpdev;
> > >   	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
> > > +	struct fastrpc_static_pd spd[FASTRPC_MAX_SPD];
> > >   	spinlock_t lock;
> > >   	struct idr ctx_idr;
> > >   	struct list_head users;
> > > @@ -296,10 +320,12 @@ struct fastrpc_user {
> > >   	struct fastrpc_channel_ctx *cctx;
> > >   	struct fastrpc_session_ctx *sctx;
> > >   	struct fastrpc_buf *init_mem;
> > > +	struct fastrpc_static_pd *spd;
> > >   	int tgid;
> > >   	int pd;
> > >   	bool is_secure_dev;
> > > +	char *servloc_name;
> > >   	/* Lock for lists */
> > >   	spinlock_t lock;
> > >   	/* lock for allocations */
> > > @@ -1257,12 +1283,33 @@ static bool is_session_rejected(struct fastrpc_user *fl, bool unsigned_pd_reques
> > >   	return false;
> > >   }
> > > +static struct fastrpc_static_pd *fastrpc_get_spd_session(
> > > +				struct fastrpc_user *fl)
> > > +{
> > > +	int i;
> > > +	struct fastrpc_static_pd *spd = NULL;
> > > +	struct fastrpc_channel_ctx *cctx = fl->cctx;
> > > +
> > > +	for (i = 0; i < FASTRPC_MAX_SPD ; i++) {
> > > +		if (!cctx->spd[i].servloc_name)
> > > +			continue;
> > > +		if (!strcmp(fl->servloc_name, cctx->spd[i].servloc_name)) {
> > > +			spd = &cctx->spd[i];
> > > +			spd->fl = fl;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	return spd;
> > > +}
> > > +
> > >   static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> > >   					      char __user *argp)
> > >   {
> > >   	struct fastrpc_init_create_static init;
> > >   	struct fastrpc_invoke_args *args;
> > >   	struct fastrpc_phy_page pages[1];
> > > +	struct fastrpc_static_pd *spd = NULL;
> > >   	char *name;
> > >   	int err;
> > >   	struct {
> > > @@ -1297,6 +1344,19 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> > >   		goto err_name;
> > >   	}
> > > +	fl->servloc_name = AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME;
> > Why are the audio and sensors sessions handled at different places?
> > What about the MDSP or CDSP restarts?
> 
> Thanks for reviewing the patches, Dmitry. The remote methods for audio and
> sensors PD attach are different and that is why both are handled in
> different places.

In which way are they different?

> As for MDSP and CDSP, no static PDs are supported, hence,

Should we still notify userspace if we get a PDR message for
msm/cdsp/root_pd? Or for msm/modem/root_pd?

> there is no requirement to handle static PD restarts there. Please let me
> know if you have any other queries. --Ekansh
> 
> > 
> > > +
> > > +	spd = fastrpc_get_spd_session(fl);
> > > +	if (!spd) {
> > > +		err = -EUSERS;
> > > +		goto err_name;
> > > +	}
> > > +
> > > +	if (!spd->ispdup) {
> > > +		err = -ENOTCONN;
> > > +		goto err_name;
> > > +	}
> > > +	fl->spd = spd;
> > >   	if (!fl->cctx->remote_heap) {
> > >   		err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
> > >   						&fl->cctx->remote_heap);
> > > @@ -1688,6 +1748,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
> > >   static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
> > >   {
> > >   	struct fastrpc_invoke_args args[1];
> > > +	struct fastrpc_static_pd *spd = NULL;
> > >   	int tgid = fl->tgid;
> > >   	u32 sc;
> > > @@ -1697,6 +1758,22 @@ static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
> > >   	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
> > >   	fl->pd = pd;
> > > +	if (pd == SENSORS_PD) {
> > > +		if (fl->cctx->domain_id == ADSP_DOMAIN_ID)
> > > +			fl->servloc_name = SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME;
> > > +		else if (fl->cctx->domain_id == SDSP_DOMAIN_ID)
> > > +			fl->servloc_name = SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME;
> > > +
> > > +		spd = fastrpc_get_spd_session(fl);
> > > +		if (!spd)
> > > +			return -EUSERS;
> > > +
> > > +		if (!spd->ispdup)
> > > +			return -ENOTCONN;
> > > +
> > > +		fl->spd = spd;
> > > +	}
> > > +
> > >   	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> > >   				       sc, &args[0]);
> > >   }
> > > @@ -2172,6 +2249,64 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
> > >   	return err;
> > >   }
> > > +static void fastrpc_notify_users(struct fastrpc_user *user)
> > > +{
> > > +	struct fastrpc_invoke_ctx *ctx;
> > > +
> > > +	spin_lock(&user->lock);
> > > +	list_for_each_entry(ctx, &user->pending, node) {
> > > +		ctx->retval = -EPIPE;
> > > +		complete(&ctx->work);
> > > +	}
> > > +	spin_unlock(&user->lock);
> > > +}
> > > +
> > > +static void fastrpc_notify_pdr_drivers(struct fastrpc_channel_ctx *cctx,
> > > +		char *servloc_name)
> > > +{
> > > +	struct fastrpc_user *fl;
> > > +	unsigned long flags;
> > > +
> > > +	spin_lock_irqsave(&cctx->lock, flags);
> > > +	list_for_each_entry(fl, &cctx->users, user) {
> > > +		if (fl->servloc_name && !strcmp(servloc_name, fl->servloc_name))
> > > +			fastrpc_notify_users(fl);
> > > +	}
> > > +	spin_unlock_irqrestore(&cctx->lock, flags);
> > > +}
> > > +
> > > +static void fastrpc_pdr_cb(int state, char *service_path, void *priv)
> > > +{
> > > +	struct fastrpc_static_pd *spd = (struct fastrpc_static_pd *)priv;
> > > +	struct fastrpc_channel_ctx *cctx;
> > > +
> > > +	if (!spd)
> > > +		return;
> > > +
> > > +	cctx = spd->cctx;
> > > +	switch (state) {
> > > +	case SERVREG_SERVICE_STATE_DOWN:
> > > +		dev_info(&cctx->rpdev->dev,
> > > +			"%s: %s (%s) is down for PDR on %s\n",
> > > +			__func__, spd->spdname,
> > > +			spd->servloc_name,
> > > +			domains[cctx->domain_id]);
> > > +		spd->ispdup = false;
> > > +		fastrpc_notify_pdr_drivers(cctx, spd->servloc_name);
> > > +		break;
> > > +	case SERVREG_SERVICE_STATE_UP:
> > > +		dev_info(&cctx->rpdev->dev,
> > > +			"%s: %s (%s) is up for PDR on %s\n",
> > > +			__func__, spd->spdname,
> > > +			spd->servloc_name,
> > > +			domains[cctx->domain_id]);
> > > +		spd->ispdup = true;
> > > +		break;
> > > +	default:
> > > +		break;
> > > +	}
> > > +}
> > > +
> > >   static const struct file_operations fastrpc_fops = {
> > >   	.open = fastrpc_device_open,
> > >   	.release = fastrpc_device_release,
> > > @@ -2291,6 +2426,39 @@ static int fastrpc_device_register(struct device *dev, struct fastrpc_channel_ct
> > >   	return err;
> > >   }
> > > +static int fastrpc_setup_service_locator(struct fastrpc_channel_ctx *cctx, char *client_name,
> > > +			char *service_name, char *service_path, int domain, int spd_session)
> > > +{
> > > +	int err = 0;
> > > +	struct pdr_handle *handle = NULL;
> > > +	struct pdr_service *service = NULL;
> > > +
> > > +	/* Register the service locator's callback function */
> > > +	handle = pdr_handle_alloc(fastrpc_pdr_cb, &cctx->spd[spd_session]);
> > > +	if (IS_ERR(handle)) {
> > > +		err = PTR_ERR(handle);
> > > +		goto bail;
> > > +	}
> > > +	cctx->spd[spd_session].pdrhandle = handle;
> > > +	cctx->spd[spd_session].servloc_name = client_name;
> > > +	cctx->spd[spd_session].spdname = service_path;
> > > +	cctx->spd[spd_session].cctx = cctx;
> > > +	service = pdr_add_lookup(handle, service_name, service_path);
> > > +	if (IS_ERR(service)) {
> > > +		err = PTR_ERR(service);
> > > +		goto bail;
> > > +	}
> > > +	pr_info("fastrpc: %s: pdr_add_lookup enabled for %s (%s, %s)\n",
> > > +		__func__, service_name, client_name, service_path);
> > > +
> > > +bail:
> > > +	if (err) {
> > > +		pr_warn("fastrpc: %s: failed for %s (%s, %s)with err %d\n",
> > > +				__func__, service_name, client_name, service_path, err);
> > > +	}
> > > +	return err;
> > > +}
> > > +
> > >   static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> > >   {
> > >   	struct device *rdev = &rpdev->dev;
> > > @@ -2369,6 +2537,25 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> > >   		goto fdev_error;
> > >   	}
> > > +	if (domain_id == ADSP_DOMAIN_ID) {
> > > +		err = fastrpc_setup_service_locator(data, AUDIO_PDR_SERVICE_LOCATION_CLIENT_NAME,
> > > +			AUDIO_PDR_ADSP_SERVICE_NAME, ADSP_AUDIOPD_NAME, domain_id, 0);
> > > +		if (err)
> > > +			goto populate_error;
> > > +
> > > +		err = fastrpc_setup_service_locator(data,
> > > +			SENSORS_PDR_ADSP_SERVICE_LOCATION_CLIENT_NAME,
> > > +			SENSORS_PDR_ADSP_SERVICE_NAME, ADSP_SENSORPD_NAME, domain_id, 1);
> > > +		if (err)
> > > +			goto populate_error;
> > > +	} else if (domain_id == SDSP_DOMAIN_ID) {
> > > +		err = fastrpc_setup_service_locator(data,
> > > +			SENSORS_PDR_SLPI_SERVICE_LOCATION_CLIENT_NAME,
> > > +			SENSORS_PDR_SLPI_SERVICE_NAME, SLPI_SENSORPD_NAME, domain_id, 0);
> > > +		if (err)
> > > +			goto populate_error;
> > > +	}
> > > +
> > >   	kref_init(&data->refcount);
> > >   	dev_set_drvdata(&rpdev->dev, data);
> > > @@ -2397,23 +2584,12 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
> > >   	return err;
> > >   }
> > > -static void fastrpc_notify_users(struct fastrpc_user *user)
> > > -{
> > > -	struct fastrpc_invoke_ctx *ctx;
> > > -
> > > -	spin_lock(&user->lock);
> > > -	list_for_each_entry(ctx, &user->pending, node) {
> > > -		ctx->retval = -EPIPE;
> > > -		complete(&ctx->work);
> > > -	}
> > > -	spin_unlock(&user->lock);
> > > -}
> > > -
> > >   static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
> > >   {
> > >   	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
> > >   	struct fastrpc_user *user;
> > >   	unsigned long flags;
> > > +	int i;
> > >   	/* No invocations past this point */
> > >   	spin_lock_irqsave(&cctx->lock, flags);
> > > @@ -2431,6 +2607,11 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
> > >   	if (cctx->remote_heap)
> > >   		fastrpc_buf_free(cctx->remote_heap);
> > > +	for (i = 0; i < FASTRPC_MAX_SPD; i++) {
> > > +		if (cctx->spd[i].pdrhandle)
> > > +			pdr_handle_release(cctx->spd[i].pdrhandle);
> > > +	}
> > > +
> > >   	of_platform_depopulate(&rpdev->dev);
> > >   	fastrpc_channel_ctx_put(cctx);
> > > -- 
> > > 2.43.0
> > > 

-- 
With best wishes
Dmitry

