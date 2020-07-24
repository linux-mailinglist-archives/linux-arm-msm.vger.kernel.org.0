Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9A122CF14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 22:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgGXUKE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 16:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726639AbgGXUKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 16:10:04 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FA1C0619E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:10:04 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n5so5972522pgf.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MYlWBMpt4rf/LkTlxo7eahrrfbk1ItswPIyWr91nPXE=;
        b=uQ0bZJAeKzBUM6OQB0/tZJZBOK3x0iuSMsjaxvC0dzDpG6idewEShnSTOQE41hhQt+
         DSrRmCANcFP6kteBGuPHws5Ml17f9pb+/IYBBHtS+cRt9EFecD61OzdPTQUYf0YXfyGN
         t00qkX3ScR8LRHQqxpMuCXcXJw0aiMBATg6ZKPLaQLcoH2EOYcyM12TPZDaG4lKTXduL
         oAjjtGOEdoFQyI+EFFMTipFfTtO5wivyziMkA9ZvSF+iSsPcVscRQxp5/tOCQ9Lyhcm3
         X2oOMtAVajv7qVbZZ43L2LEaZAn1KROaKXYpOY8KcvlGpILDskAJriCckH70JRXpQRRG
         rYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MYlWBMpt4rf/LkTlxo7eahrrfbk1ItswPIyWr91nPXE=;
        b=eo5Mv0A3D00/dTpr3w17a46IwYXVroExlCkJAa6Z1mYCJOCd//BrGcA5ZDfV1coOei
         ryFQmHOHh5n9UVjpThR/Ue/YQ0aJy9oyiz+nlswxrliMNXB1s8hImVLiQLvidIeLPn5/
         OjLgpHLj6vB5a6+8q8IoShaEzuZJ5Qu5DhhkoWh7PUbIt+vuMvLz44tiflrICnv1cpen
         bHN12AHtRye6rqTIJhgN/JZ1cNr30KwPpy1MwQoFl2ZBxyXdaf93X2It5Z36dttrBiHz
         Ur1iWtSfF5mpgRMmPSDH2nZCrDt8n/lBn2eJauJ8YoDV6UZ2xkZUyaDOI7Lpy+7tjeEx
         pHDg==
X-Gm-Message-State: AOAM5314wEeQq3bHbY6gxiqF3/M8aOh6hUnmRDSo1Udvtv/m7vGJampj
        WVqMfclJrZY1O7DfhwIuu9HsPdbLHdA=
X-Google-Smtp-Source: ABdhPJyLHceqQccncPeANqvRAYUJzK7QQRCQSVLw7sMumqK7F7T/rn/SAMkLc6l1y7CNRpy9I2Hexg==
X-Received: by 2002:a63:d74c:: with SMTP id w12mr3792328pgi.260.1595621403680;
        Fri, 24 Jul 2020 13:10:03 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w1sm6825609pfc.55.2020.07.24.13.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 13:10:02 -0700 (PDT)
Date:   Fri, 24 Jul 2020 13:06:24 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     ohad@wizery.com, agross@kernel.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: kill IPA notify code
Message-ID: <20200724200624.GC63496@builder.lan>
References: <20200724181142.13581-1-elder@linaro.org>
 <20200724181142.13581-3-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200724181142.13581-3-elder@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 24 Jul 11:11 PDT 2020, Alex Elder wrote:

> The IPA code now uses the generic remoteproc SSR notification
> mechanism.  This makes the original IPA notification code unused
> and unnecessary, so get rid of it.
> 
> This is effectively a revert of commit d7f5f3c89c1a ("remoteproc:
> add IPA notification to q6v5 driver").
> 
> Signed-off-by: Alex Elder <elder@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/Kconfig                    |  4 -
>  drivers/remoteproc/Makefile                   |  1 -
>  drivers/remoteproc/qcom_q6v5_ipa_notify.c     | 85 -------------------
>  drivers/remoteproc/qcom_q6v5_mss.c            | 38 ---------
>  .../linux/remoteproc/qcom_q6v5_ipa_notify.h   | 82 ------------------
>  5 files changed, 210 deletions(-)
>  delete mode 100644 drivers/remoteproc/qcom_q6v5_ipa_notify.c
>  delete mode 100644 include/linux/remoteproc/qcom_q6v5_ipa_notify.h
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 3e8d5d1a2b9ee..45f1f1e728823 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -154,7 +154,6 @@ config QCOM_Q6V5_MSS
>  	select QCOM_MDT_LOADER
>  	select QCOM_PIL_INFO
>  	select QCOM_Q6V5_COMMON
> -	select QCOM_Q6V5_IPA_NOTIFY
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
>  	help
> @@ -196,9 +195,6 @@ config QCOM_Q6V5_WCSS
>  	  Say y here to support the Qualcomm Peripheral Image Loader for the
>  	  Hexagon V5 based WCSS remote processors.
>  
> -config QCOM_Q6V5_IPA_NOTIFY
> -	tristate
> -
>  config QCOM_SYSMON
>  	tristate "Qualcomm sysmon driver"
>  	depends on RPMSG
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
> index a4c1397d63673..8c056920b4006 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -24,7 +24,6 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
>  obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
>  obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
>  obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
> -obj-$(CONFIG_QCOM_Q6V5_IPA_NOTIFY)	+= qcom_q6v5_ipa_notify.o
>  obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
>  obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>  qcom_wcnss_pil-y			+= qcom_wcnss.o
> diff --git a/drivers/remoteproc/qcom_q6v5_ipa_notify.c b/drivers/remoteproc/qcom_q6v5_ipa_notify.c
> deleted file mode 100644
> index e1c10a128bfdb..0000000000000
> --- a/drivers/remoteproc/qcom_q6v5_ipa_notify.c
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -
> -/*
> - * Qualcomm IPA notification subdev support
> - *
> - * Copyright (C) 2019 Linaro Ltd.
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/remoteproc.h>
> -#include <linux/remoteproc/qcom_q6v5_ipa_notify.h>
> -
> -static void
> -ipa_notify_common(struct rproc_subdev *subdev, enum qcom_rproc_event event)
> -{
> -	struct qcom_rproc_ipa_notify *ipa_notify;
> -	qcom_ipa_notify_t notify;
> -
> -	ipa_notify = container_of(subdev, struct qcom_rproc_ipa_notify, subdev);
> -	notify = ipa_notify->notify;
> -	if (notify)
> -		notify(ipa_notify->data, event);
> -}
> -
> -static int ipa_notify_prepare(struct rproc_subdev *subdev)
> -{
> -	ipa_notify_common(subdev, MODEM_STARTING);
> -
> -	return 0;
> -}
> -
> -static int ipa_notify_start(struct rproc_subdev *subdev)
> -{
> -	ipa_notify_common(subdev, MODEM_RUNNING);
> -
> -	return 0;
> -}
> -
> -static void ipa_notify_stop(struct rproc_subdev *subdev, bool crashed)
> -
> -{
> -	ipa_notify_common(subdev, crashed ? MODEM_CRASHED : MODEM_STOPPING);
> -}
> -
> -static void ipa_notify_unprepare(struct rproc_subdev *subdev)
> -{
> -	ipa_notify_common(subdev, MODEM_OFFLINE);
> -}
> -
> -static void ipa_notify_removing(struct rproc_subdev *subdev)
> -{
> -	ipa_notify_common(subdev, MODEM_REMOVING);
> -}
> -
> -/* Register the IPA notification subdevice with the Q6V5 MSS remoteproc */
> -void qcom_add_ipa_notify_subdev(struct rproc *rproc,
> -		struct qcom_rproc_ipa_notify *ipa_notify)
> -{
> -	ipa_notify->notify = NULL;
> -	ipa_notify->data = NULL;
> -	ipa_notify->subdev.prepare = ipa_notify_prepare;
> -	ipa_notify->subdev.start = ipa_notify_start;
> -	ipa_notify->subdev.stop = ipa_notify_stop;
> -	ipa_notify->subdev.unprepare = ipa_notify_unprepare;
> -
> -	rproc_add_subdev(rproc, &ipa_notify->subdev);
> -}
> -EXPORT_SYMBOL_GPL(qcom_add_ipa_notify_subdev);
> -
> -/* Remove the IPA notification subdevice */
> -void qcom_remove_ipa_notify_subdev(struct rproc *rproc,
> -		struct qcom_rproc_ipa_notify *ipa_notify)
> -{
> -	struct rproc_subdev *subdev = &ipa_notify->subdev;
> -
> -	ipa_notify_removing(subdev);
> -
> -	rproc_remove_subdev(rproc, subdev);
> -	ipa_notify->notify = NULL;	/* Make it obvious */
> -}
> -EXPORT_SYMBOL_GPL(qcom_remove_ipa_notify_subdev);
> -
> -MODULE_LICENSE("GPL v2");
> -MODULE_DESCRIPTION("Qualcomm IPA notification remoteproc subdev");
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 718acebae777f..eb2a0d7dea1c7 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -23,7 +23,6 @@
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/remoteproc.h>
> -#include "linux/remoteproc/qcom_q6v5_ipa_notify.h"
>  #include <linux/reset.h>
>  #include <linux/soc/qcom/mdt_loader.h>
>  #include <linux/iopoll.h>
> @@ -199,7 +198,6 @@ struct q6v5 {
>  	struct qcom_rproc_glink glink_subdev;
>  	struct qcom_rproc_subdev smd_subdev;
>  	struct qcom_rproc_ssr ssr_subdev;
> -	struct qcom_rproc_ipa_notify ipa_notify_subdev;
>  	struct qcom_sysmon *sysmon;
>  	bool need_mem_protection;
>  	bool has_alt_reset;
> @@ -1585,39 +1583,6 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
>  	return 0;
>  }
>  
> -#if IS_ENABLED(CONFIG_QCOM_Q6V5_IPA_NOTIFY)
> -
> -/* Register IPA notification function */
> -int qcom_register_ipa_notify(struct rproc *rproc, qcom_ipa_notify_t notify,
> -			     void *data)
> -{
> -	struct qcom_rproc_ipa_notify *ipa_notify;
> -	struct q6v5 *qproc = rproc->priv;
> -
> -	if (!notify)
> -		return -EINVAL;
> -
> -	ipa_notify = &qproc->ipa_notify_subdev;
> -	if (ipa_notify->notify)
> -		return -EBUSY;
> -
> -	ipa_notify->notify = notify;
> -	ipa_notify->data = data;
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(qcom_register_ipa_notify);
> -
> -/* Deregister IPA notification function */
> -void qcom_deregister_ipa_notify(struct rproc *rproc)
> -{
> -	struct q6v5 *qproc = rproc->priv;
> -
> -	qproc->ipa_notify_subdev.notify = NULL;
> -}
> -EXPORT_SYMBOL_GPL(qcom_deregister_ipa_notify);
> -#endif /* !IS_ENABLED(CONFIG_QCOM_Q6V5_IPA_NOTIFY) */
> -
>  static int q6v5_probe(struct platform_device *pdev)
>  {
>  	const struct rproc_hexagon_res *desc;
> @@ -1744,7 +1709,6 @@ static int q6v5_probe(struct platform_device *pdev)
>  	qcom_add_glink_subdev(rproc, &qproc->glink_subdev, "mpss");
>  	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
>  	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
> -	qcom_add_ipa_notify_subdev(rproc, &qproc->ipa_notify_subdev);
>  	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12);
>  	if (IS_ERR(qproc->sysmon)) {
>  		ret = PTR_ERR(qproc->sysmon);
> @@ -1760,7 +1724,6 @@ static int q6v5_probe(struct platform_device *pdev)
>  remove_sysmon_subdev:
>  	qcom_remove_sysmon_subdev(qproc->sysmon);
>  remove_subdevs:
> -	qcom_remove_ipa_notify_subdev(qproc->rproc, &qproc->ipa_notify_subdev);
>  	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
>  	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
>  	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
> @@ -1782,7 +1745,6 @@ static int q6v5_remove(struct platform_device *pdev)
>  	rproc_del(rproc);
>  
>  	qcom_remove_sysmon_subdev(qproc->sysmon);
> -	qcom_remove_ipa_notify_subdev(rproc, &qproc->ipa_notify_subdev);
>  	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
>  	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
>  	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
> diff --git a/include/linux/remoteproc/qcom_q6v5_ipa_notify.h b/include/linux/remoteproc/qcom_q6v5_ipa_notify.h
> deleted file mode 100644
> index 0820edc0ab7df..0000000000000
> --- a/include/linux/remoteproc/qcom_q6v5_ipa_notify.h
> +++ /dev/null
> @@ -1,82 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -
> -/* Copyright (C) 2019 Linaro Ltd. */
> -
> -#ifndef __QCOM_Q6V5_IPA_NOTIFY_H__
> -#define __QCOM_Q6V5_IPA_NOTIFY_H__
> -
> -#if IS_ENABLED(CONFIG_QCOM_Q6V5_IPA_NOTIFY)
> -
> -#include <linux/remoteproc.h>
> -
> -enum qcom_rproc_event {
> -	MODEM_STARTING	= 0,	/* Modem is about to be started */
> -	MODEM_RUNNING	= 1,	/* Startup complete; modem is operational */
> -	MODEM_STOPPING	= 2,	/* Modem is about to shut down */
> -	MODEM_CRASHED	= 3,	/* Modem has crashed (implies stopping) */
> -	MODEM_OFFLINE	= 4,	/* Modem is now offline */
> -	MODEM_REMOVING	= 5,	/* Modem is about to be removed */
> -};
> -
> -typedef void (*qcom_ipa_notify_t)(void *data, enum qcom_rproc_event event);
> -
> -struct qcom_rproc_ipa_notify {
> -	struct rproc_subdev subdev;
> -
> -	qcom_ipa_notify_t notify;
> -	void *data;
> -};
> -
> -/**
> - * qcom_add_ipa_notify_subdev() - Register IPA notification subdevice
> - * @rproc:	rproc handle
> - * @ipa_notify:	IPA notification subdevice handle
> - *
> - * Register the @ipa_notify subdevice with the @rproc so modem events
> - * can be sent to IPA when they occur.
> - *
> - * This is defined in "qcom_q6v5_ipa_notify.c".
> - */
> -void qcom_add_ipa_notify_subdev(struct rproc *rproc,
> -		struct qcom_rproc_ipa_notify *ipa_notify);
> -
> -/**
> - * qcom_remove_ipa_notify_subdev() - Remove IPA SSR subdevice
> - * @rproc:	rproc handle
> - * @ipa_notify:	IPA notification subdevice handle
> - *
> - * This is defined in "qcom_q6v5_ipa_notify.c".
> - */
> -void qcom_remove_ipa_notify_subdev(struct rproc *rproc,
> -		struct qcom_rproc_ipa_notify *ipa_notify);
> -
> -/**
> - * qcom_register_ipa_notify() - Register IPA notification function
> - * @rproc:	Remote processor handle
> - * @notify:	Non-null IPA notification callback function pointer
> - * @data:	Data supplied to IPA notification callback function
> - *
> - * @Return: 0 if successful, or a negative error code otherwise
> - *
> - * This is defined in "qcom_q6v5_mss.c".
> - */
> -int qcom_register_ipa_notify(struct rproc *rproc, qcom_ipa_notify_t notify,
> -			     void *data);
> -/**
> - * qcom_deregister_ipa_notify() - Deregister IPA notification function
> - * @rproc:	Remote processor handle
> - *
> - * This is defined in "qcom_q6v5_mss.c".
> - */
> -void qcom_deregister_ipa_notify(struct rproc *rproc);
> -
> -#else /* !IS_ENABLED(CONFIG_QCOM_Q6V5_IPA_NOTIFY) */
> -
> -struct qcom_rproc_ipa_notify { /* empty */ };
> -
> -#define qcom_add_ipa_notify_subdev(rproc, ipa_notify)		/* no-op */
> -#define qcom_remove_ipa_notify_subdev(rproc, ipa_notify)	/* no-op */
> -
> -#endif /* !IS_ENABLED(CONFIG_QCOM_Q6V5_IPA_NOTIFY) */
> -
> -#endif /* !__QCOM_Q6V5_IPA_NOTIFY_H__ */
> -- 
> 2.20.1
> 
