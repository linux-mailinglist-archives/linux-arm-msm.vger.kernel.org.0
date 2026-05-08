Return-Path: <linux-arm-msm+bounces-106623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNkcD8y0/WkXhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:02:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFDF4F4B06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 585853094AF1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA9CA37AA92;
	Fri,  8 May 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O7Ldkjyt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1359374E7F
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778234234; cv=none; b=TgLZsQkkQC1EqlDil1bI7EKR9G1YjFwpYNtn+iTeOBkZr919CXbMKBYxrQJZlWe9yJQ1oMxdnJ+bPlF8d06ZZkQCqC4SdOppL80OyTN/WXO98VPWCb+eQ3fMfS+KUMdQykQvqdYnvbvVYh56mUXqwUOAwtLaD3O+oWVtdBJCqrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778234234; c=relaxed/simple;
	bh=uq6NS3wkYlm6qGia6wNpM+lK5EwUdE7ZVNCYhl3zVL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4+xKH2HJpvklqxQAhTAxElokAdgEA2HeoTnPQYfqJgkpTZyQo20IZLh6acDaFEqRqcaKCU60FGleMUPLn81CQHbdBRWPnLMkmOXGPvlEfrSsgzywwfJBFXlVYspsruiZt8CNPcbADfmqnvlLykLuCMYk2Rhmj+SCIknXp/fBS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O7Ldkjyt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso13443595e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778234231; x=1778839031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KRgaW4hIJFOF/lN2ojaR0wBglA4GTBFExa+lpIIRN6g=;
        b=O7LdkjytGTItJmqe4ZWSlYf8u0zrsvLPQt2yIpSzNvZh0Ko31QgYhKx+rf8zlCm1Fu
         9GGO5f5cNmo4yILIlWpjVhadSGRU9O6HXc8Aeb7W31C7B6DhHg266EgXaOT23dCLwAm5
         VFP8SAX9KHXSDNR5vahrhi16fWjovo6G+OVoC40BWc6X3VQtNwvfch7xxsPhkWIwzCj6
         rdf41Cv16Vv5NhgB7V2NsXCvS5++IG3JhiUM8FrV6XWPztGWBirBdlcLGaWJh3rjbErT
         Qy1cDJARgzOd8U3fVUeVAQ9QaWISspGYMtAhdVdxbPYPG0GjrAruBpOLNhbFK/saPO2f
         jZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778234231; x=1778839031;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRgaW4hIJFOF/lN2ojaR0wBglA4GTBFExa+lpIIRN6g=;
        b=IbC3XzNFkt8dpxAmXpcxVvUMbG/TqbSjxKKJrUQ9jSCH6gRKqrt+nSTl0QpGTxW/g0
         PhnQXjk0fJLGBdNWa/uPQC23SbinDjw9BYE7AG3wc39ceeZVtyT+eo4/BYL+o6f04ii1
         hLRL9G5d09I06pkmsqMWzqrONLNRuXWAkUPEnh+SuNQ3bhAD86nFjcQX1LKUoa9beSXL
         QLP+b1q0kJX0C7i3k1Pg5opFaM0DdMNVt5dqyE+WViThUGLQvI69+FxI1NtGHFs2eTjI
         1LpzmVlyBbneyWbUIep5upix7uVl27IUxORu8iUxraJ12T0I2o2eEhKD42mEfhWKYNd7
         Cjxg==
X-Forwarded-Encrypted: i=1; AFNElJ8Yg+JhesItB7lpcFu/qi0pyJGT28I6ER5N4IYBoTsBNtsQu85GJ8UG52gLwIJcyi0cm678ZMTJ/5vLTr4J@vger.kernel.org
X-Gm-Message-State: AOJu0YwNt7osw+mrLrE8ZG25tVmKgVrRQ+OAcMV2pBP3r/lqqti5zQGB
	yavbh5pCgNiKjO4/m341Nl2N1P/acaHcDCTd2vobV7OOdkUU2SNNiKWGK5X1D0OqgWEmU8Ublpc
	buDsd
X-Gm-Gg: AeBDiet6iK+OkFusU+ks8PQ0XbaT0msG9XkPaIQrWkqB1KojrRAp5x/mN+VJHLHn9EW
	CBhRuT/UNZ5L3mRCwqmtd5mF29JU0gZ8URqDneuiAbwumP8EsjtsBTtOnsoyzfvNiCXojOOKG21
	4OmBmrt3t1w/WlAKAtdGkAfzRkJ0cTQCZ1E/KGpaZxuJSTCnSgdIr3p4c7TaZDejbN7anJBDzCR
	4YzHmeFfWxPxZvH1DFs4JZ5Ycfdop9r1XE+i31Eg3szUZxgUyCuIaK8xYAy3AY2Wpaas9qnBIR3
	sxTKqve1aYPhOjOazrFZ78RsvcdePGCC8acuIvwpLq9tIEkcItPCbbhGhKJGkZ+Rn1/sq3Gv+iO
	1FAEpZ1urYQAe1X43YzDwBTZKaWCLCM61SNCxDccOgIrZPFERwtLmwmk6OYjv2IeeawqpoMowcO
	lQqRYVSQc3xBAIQ4bU16cL3Yyl/zAwr0YKXVV2oW0SMSg+/w==
X-Received: by 2002:a05:600c:4617:b0:48a:5970:1fe1 with SMTP id 5b1f17b1804b1-48e51e0bb17mr106102845e9.4.1778234231006;
        Fri, 08 May 2026 02:57:11 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.20.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68f5104esm32511305e9.12.2026.05.08.02.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 02:57:10 -0700 (PDT)
Message-ID: <3c46545a-64e3-49f9-a2db-7de154e92daa@linaro.org>
Date: Fri, 8 May 2026 10:57:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] media: qcom: camss: Add camss-isp-bufq helper
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 kieran.bingham@ideasonboard.com, johannes.goede@oss.qualcomm.com
References: <20260508-camss-isp-ope-v3-0-bb1055274603@oss.qualcomm.com>
 <20260508-camss-isp-ope-v3-4-bb1055274603@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260508-camss-isp-ope-v3-4-bb1055274603@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9BFDF4F4B06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-106623-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:mid,linaro.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 07/05/2026 23:49, Loic Poulain wrote:
> Add a per-queue ready-buffer FIFO helper for CAMSS offline ISP drivers.
> camss_isp_bufq provides N spinlock-protected FIFO lists of ready vb2
> buffers, one per queue index. This can help multi-queues management
> and synchronization in ISP context.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/Kconfig          |  14 +++
>   drivers/media/platform/qcom/camss/Makefile         |   5 +
>   drivers/media/platform/qcom/camss/camss-isp-bufq.c | 101 +++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-isp-bufq.h | 122 +++++++++++++++++++++
>   4 files changed, 242 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/platform/qcom/camss/Kconfig
> index 4eda48cb1adf049a7fb6cb59b9da3c0870fe57f4..d77482f3f5eadc65856806b9b237d65ea484f267 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,3 +7,17 @@ config VIDEO_QCOM_CAMSS
>   	select VIDEO_V4L2_SUBDEV_API
>   	select VIDEOBUF2_DMA_SG
>   	select V4L2_FWNODE
> +
> +config VIDEO_QCOM_CAMSS_ISP

I think this config option should be dropped entirely.

> +	tristate "Qualcomm CAMSS ISP common helpers"
> +	depends on VIDEO_DEV
> +	depends on MEDIA_CONTROLLER
> +	select V4L2_ISP
> +	select VIDEOBUF2_CORE
> +	help
> +	  Common helper library for Qualcomm CAMSS offline ISP drivers.
> +	  Provides buffer queue management, job scheduling, MC pipeline
> +	  topology builder, and ISP parameter buffer parsing.
> +
> +	  This module is selected automatically by drivers that need it.
> +
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 5e349b4915130c71dbff90e73102e46dfede1520..bfc05db0eada1d801839ceb8a3b157baae613053 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -29,3 +29,8 @@ qcom-camss-objs += \
>   		camss-format.o \
>   
>   obj-$(CONFIG_VIDEO_QCOM_CAMSS) += qcom-camss.o
> +
> +qcom-camss-isp-objs := camss-isp-bufq.o
> +
> +obj-$(CONFIG_VIDEO_QCOM_CAMSS_ISP) += qcom-camss-isp.o
> +
> diff --git a/drivers/media/platform/qcom/camss/camss-isp-bufq.c b/drivers/media/platform/qcom/camss/camss-isp-bufq.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..b1dcf60afcc63d112eee7bd143f08a7b4aac9a18
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-isp-bufq.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-isp-bufq.c
> + *
> + * CAMSS ISP per-queue ready-buffer FIFO.
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +#include "camss-isp-bufq.h"
> +
> +struct camss_isp_bufq *camss_isp_bufq_init(unsigned int num_queues)
> +{
> +	struct camss_isp_bufq *bufq;
> +	unsigned int i;
> +
> +	bufq = kzalloc(struct_size(bufq, entries, num_queues), GFP_KERNEL);
> +	if (!bufq)
> +		return ERR_PTR(-ENOMEM);
> +
> +	bufq->num_queues = num_queues;
> +
> +	for (i = 0; i < num_queues; i++) {
> +		INIT_LIST_HEAD(&bufq->entries[i].rdy_queue);
> +		spin_lock_init(&bufq->entries[i].rdy_spinlock);
> +	}
> +
> +	return bufq;
> +}
> +EXPORT_SYMBOL_GPL(camss_isp_bufq_init);
> +
> +void camss_isp_bufq_release(struct camss_isp_bufq *bufq)
> +{
> +	kfree(bufq);
> +}
> +EXPORT_SYMBOL_GPL(camss_isp_bufq_release);
> +
> +void camss_isp_bufq_queue(struct camss_isp_bufq *bufq, unsigned int queue_idx,
> +			  struct vb2_v4l2_buffer *vbuf)
> +{
> +	struct camss_isp_buf *buf =
> +		container_of(vbuf, struct camss_isp_buf, vb);
> +	struct camss_isp_bufq_entry *entry = &bufq->entries[queue_idx];
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&entry->rdy_spinlock, flags);
> +	list_add_tail(&buf->list, &entry->rdy_queue);
> +	entry->num_rdy++;
> +	spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
> +}
> +EXPORT_SYMBOL_GPL(camss_isp_bufq_queue);
> +
> +struct vb2_v4l2_buffer *camss_isp_bufq_next(struct camss_isp_bufq *bufq, unsigned int queue_idx)
> +{
> +	struct camss_isp_bufq_entry *entry = &bufq->entries[queue_idx];
> +	struct camss_isp_buf *buf;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&entry->rdy_spinlock, flags);
> +	buf = list_first_entry_or_null(&entry->rdy_queue,
> +				       struct camss_isp_buf, list);
> +	spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
> +
> +	return buf ? &buf->vb : NULL;
> +}
> +EXPORT_SYMBOL_GPL(camss_isp_bufq_next);
> +
> +struct vb2_v4l2_buffer *camss_isp_bufq_remove(struct camss_isp_bufq *bufq, unsigned int queue_idx)
> +{
> +	struct camss_isp_bufq_entry *entry = &bufq->entries[queue_idx];
> +	struct camss_isp_buf *buf;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&entry->rdy_spinlock, flags);
> +	buf = list_first_entry_or_null(&entry->rdy_queue,
> +				       struct camss_isp_buf, list);
> +	if (buf) {
> +		list_del(&buf->list);
> +		entry->num_rdy--;
> +	}
> +	spin_unlock_irqrestore(&entry->rdy_spinlock, flags);
> +
> +	return buf ? &buf->vb : NULL;
> +}
> +EXPORT_SYMBOL_GPL(camss_isp_bufq_remove);
> +
> +void camss_isp_bufq_drain(struct camss_isp_bufq *bufq, unsigned int queue_idx,
> +			  enum vb2_buffer_state state)
> +{
> +	struct vb2_v4l2_buffer *vbuf;
> +
> +	while ((vbuf = camss_isp_bufq_remove(bufq, queue_idx)))
> +		camss_isp_buf_done(vbuf, state);
> +}
> +EXPORT_SYMBOL_GPL(camss_isp_bufq_drain);
> +
> +MODULE_DESCRIPTION("CAMSS ISP per-queue ready-buffer FIFO");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/media/platform/qcom/camss/camss-isp-bufq.h b/drivers/media/platform/qcom/camss/camss-isp-bufq.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..1a8bc7b112a1b039233cfc7be573f1f40fcda7c9
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-isp-bufq.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * camss-isp-bufq.h
> + *
> + * CAMSS ISP per-queue ready-buffer FIFO.
> + *
> + * Provides N spinlock-protected FIFO lists of ready vb2 buffers, one per
> + * queue index.  Drivers call these helpers from their vb2 ops and job
> + * completion paths.
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef CAMSS_ISP_BUFQ_H
> +#define CAMSS_ISP_BUFQ_H
> +
> +#include <linux/list.h>
> +#include <linux/spinlock.h>
> +#include <linux/types.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +/**
> + * struct camss_isp_buf - vb2 buffer wrapper
> + *
> + * Use as vb2_queue.buf_struct_size so buffers can be placed on the
> + * ready lists managed by camss_isp_bufq.
> + *
> + * @vb:   The vb2 V4L2 buffer — must be first.
> + * @list: Entry in the per-queue ready list.
> + */
> +struct camss_isp_buf {
> +	struct vb2_v4l2_buffer	vb;	/* must be first */
> +	struct list_head	list;
> +};
> +
> +/**
> + * struct camss_isp_bufq_entry - per-queue ready-buffer state (opaque)
> + */
> +struct camss_isp_bufq_entry {
> +	struct list_head	rdy_queue;
> +	spinlock_t		rdy_spinlock;
> +	u32			num_rdy;
> +};
> +
> +/**
> + * struct camss_isp_bufq - multi-queue ready-buffer state
> + *
> + * Allocate with camss_isp_bufq_init(), free with camss_isp_bufq_release().
> + *
> + * @num_queues: Number of entries in @entries.
> + * @entries:    Per-queue state; flexible array.
> + */
> +struct camss_isp_bufq {
> +	unsigned int			num_queues;
> +	struct camss_isp_bufq_entry	entries[] __counted_by(num_queues);
> +};
> +
> +/**
> + * camss_isp_bufq_init() - allocate a multi-queue ready-buffer state
> + * @num_queues: number of per-queue FIFO lists to create
> + *
> + * Returns a pointer to the new bufq or ERR_PTR on allocation failure.
> + */
> +struct camss_isp_bufq *camss_isp_bufq_init(unsigned int num_queues);
> +
> +/**
> + * camss_isp_bufq_release() - free a bufq allocated with camss_isp_bufq_init()
> + * @bufq: bufq to free
> + */
> +void camss_isp_bufq_release(struct camss_isp_bufq *bufq);
> +
> +/**
> + * camss_isp_bufq_queue() - append a buffer to the ready list for @queue_idx
> + * @bufq:      target bufq
> + * @queue_idx: queue index (must be < bufq->num_queues)
> + * @vbuf:      buffer to enqueue; must be embedded in a &struct camss_isp_buf
> + */
> +void camss_isp_bufq_queue(struct camss_isp_bufq *bufq, unsigned int queue_idx,
> +			   struct vb2_v4l2_buffer *vbuf);
> +
> +/**
> + * camss_isp_bufq_next() - peek at the head of the ready list without removing
> + * @bufq:      target bufq
> + * @queue_idx: queue index
> + *
> + * Returns the head buffer or NULL if the list is empty.
> + */
> +struct vb2_v4l2_buffer *camss_isp_bufq_next(struct camss_isp_bufq *bufq,
> +					     unsigned int queue_idx);
> +
> +/**
> + * camss_isp_bufq_remove() - dequeue and return the head of the ready list
> + * @bufq:      target bufq
> + * @queue_idx: queue index
> + *
> + * Returns the dequeued buffer or NULL if the list is empty.
> + */
> +struct vb2_v4l2_buffer *camss_isp_bufq_remove(struct camss_isp_bufq *bufq,
> +					       unsigned int queue_idx);
> +
> +/**
> + * camss_isp_bufq_drain() - return all ready buffers with the given state
> + * @bufq:      target bufq
> + * @queue_idx: queue index
> + * @state:     vb2 state to pass to vb2_buffer_done() for each buffer
> + */
> +void camss_isp_bufq_drain(struct camss_isp_bufq *bufq, unsigned int queue_idx,
> +			   enum vb2_buffer_state state);
> +
> +static inline u32 camss_isp_bufq_num_ready(struct camss_isp_bufq *bufq,
> +					    unsigned int queue_idx)
> +{
> +	return bufq->entries[queue_idx].num_rdy;
> +}
> +
> +static inline void camss_isp_buf_done(struct vb2_v4l2_buffer *vbuf,
> +				       enum vb2_buffer_state state)
> +{
> +	vb2_buffer_done(&vbuf->vb2_buf, state);
> +}
> +
> +#endif /* CAMSS_ISP_BUFQ_H */
> 

I honsestly don't think patches 4,5 and 6 are necessary and TBH they 
look at least partially generated to me.

Several LLM patterns abound - em - dash and (parenthetical style) as an 
example.

I just wonder is all of this code really necessary ? You could do all of 
this locking in the OPE itself and save ~200 LOC.

I think in the previous cycle we discussed articulating some of these 
concepts in v4l2 itself - I think you could achieve what you want to do 
here with a struct list_head and a spinlock_t in the OPE driver context.

---
bod

