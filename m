Return-Path: <linux-arm-msm+bounces-19306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3BA8BE119
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 13:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C45F9283F59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 11:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26FC215253F;
	Tue,  7 May 2024 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qBl2uF0W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B43E15216D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 May 2024 11:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715081997; cv=none; b=KOlHT43Rar78YGEgHiBK8fHaWUbOP/laDVUbo/FVAGBXvBK3YlBUMpqJPgqrtDizTLPwf/L94jBiIPDp6Ha4lwUGmwQcGVz5NCbslg2mxbUb4bRpOfZwLiG9CCx1RBwllmkoHdVTlX6XhsDf6URj7YBPs/Ae9xTmz4s/lEncIqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715081997; c=relaxed/simple;
	bh=P5uLisXOuxBxifYghRn6YmN4fZZN3pN3vNnX6Ki7prY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbSgIEIUadqRjlroL8C1a4J8l/he9+o8vvAe1yjGEF7R0QKildOA64v6tibbcoRBLcnofP05RkhA04qYYf8omcSaBREJV04KCl7H4VDimBU8IQndosjUl5j3Nx+3aF/pqB0/Q5XEOdxmqhVqouXuMpVCvsSLk3WwMwvEYpAOZxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qBl2uF0W; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f29e80800so3307531e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 May 2024 04:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715081993; x=1715686793; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQc6eSsksX0o7pSNc/57Q6qum3aXB90lj21OWn/LIWY=;
        b=qBl2uF0WstfrsnI66bWBcYYLteYrKMeECLMfRN0cVEbGHN/21bu6ZKH3pvJAMyYcor
         CVO61eJNiKr/XKrooMSobCkEpoot+bSKxqCrtcMktry012Q2X9qxK5jBcHLcvH3MmwXB
         bPcRm62JetchpjOySjTa9VdZTADrvrRARmDvdv/Yv2JyUQV+J3ljkO6GOA3i4SYHKWhG
         x/3HBjhvctbz2TsGoHBN6gkf/vgPZAniue7F5dIEwMRm7/G5THlv/xHTPP5c2wEak3eS
         689TmALkXfpEIz7sHoqyzKkC3JesMbCD5W0BkImfnT30yud3fLyD2SNi8AcjkXJLS0JH
         CRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715081993; x=1715686793;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQc6eSsksX0o7pSNc/57Q6qum3aXB90lj21OWn/LIWY=;
        b=GGeBBl5OQrenFVu5tgA0rpW13oiaYDZUzJjTLLSso56ZVwhpTRaf/7xmuB1+5d4yP/
         OalG0snMBnxQZC75ba3io+U4A5ceLSsiBKxnGkvWcQRUqP/HnOEV2Inrq7RC1IxsIrb3
         mGoj2JKQGCOsrnHrr+y9R+t7G7/oKUcrahd2gJBmiFIB/Ymldz85H3IhDFSd0qGvTq0Q
         T1oQd76pceOFgdzHgK2PaKzQB86Z+bjcujtr1pZBEIxKIg6UElZ2PhidAEPz97Ot3u+F
         cxYZmYh++xUcxQi/nLCXi5wpSVTFCAnXVAWBe/HQuv74ObNqalkqvqIElLwqfwN0tRva
         p7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCX31LDWr4iL5Wg/PznITcVHnLt4UwN/VvSpgctOgk+F0hLTcpeBPZPenQ4yYC69GMi7Lxx29w+R/Zj2AHmQR/CtQcqd6dE5S09wMtoKNg==
X-Gm-Message-State: AOJu0YyhIKYQD5T6shA79vZrtBYGRkg9/2aUay7xAj57nO6xMSGhZFit
	djY5kzpQNj8t56BcNK3+KKPaNCGf5DAzTH1zFescDNpwU7LtCQkivwFbE+A5jydFHK0J+H48LXX
	RMks=
X-Google-Smtp-Source: AGHT+IEQl+GcEsxQFRjcV6Q20fwLgSVV2rorfeOoqBlHfFGwibG/eWjdLeSZi4NLB5VFWaqx9bzyBg==
X-Received: by 2002:ac2:434f:0:b0:51e:f68b:cc69 with SMTP id o15-20020ac2434f000000b0051ef68bcc69mr7614847lfl.5.1715081992635;
        Tue, 07 May 2024 04:39:52 -0700 (PDT)
Received: from [172.30.205.144] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id a14-20020ac25e6e000000b0051f95499c06sm1772483lfr.285.2024.05.07.04.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 04:39:52 -0700 (PDT)
Message-ID: <247e4ce7-1ba2-43b8-8a11-ec70f99a4fc1@linaro.org>
Date: Tue, 7 May 2024 13:39:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] slimbus: qcom-ngd-ctrl: Add stream disable support
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com
References: <20240507063004.21853-1-quic_vdadhani@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240507063004.21853-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/7/24 08:30, Viken Dadhaniya wrote:
> Currently slimbus driver doesn't support stream disable
> callback, it only supports stream enable callback.
> 
> In slimbus usecase, client is switching to new frequency
> with same channel and calling enable stream callback for
> new frequency but DSP subsystem is crashing as we are switching
> to new frequency with same channel without disabling stream
> for older frequency.

This is very difficult to read

but AFAICU comes down to:
"Trying to switch frequencies without closing the channel results
in an attempt to re-enable the channel without a clean shutdown,
which then leads to a crash on the ADSP."

> 
> Ideally, before switching to another frequency, client should
> call disable stream callback and then enable stream for newer frequency.
> 
> Hence add support to disable stream via qcom_slim_ngd_disable_stream().
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
>   drivers/slimbus/qcom-ngd-ctrl.c | 70 +++++++++++++++++++++++++++++++++
>   drivers/slimbus/slimbus.h       | 13 ++++++
>   2 files changed, 83 insertions(+)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index e0b21f0f79c1..d952827d2e12 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0
>   // Copyright (c) 2011-2017, The Linux Foundation. All rights reserved.
>   // Copyright (c) 2018, Linaro Limited
> +// Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   
>   #include <linux/irq.h>
>   #include <linux/kernel.h>
> @@ -1084,6 +1085,74 @@ static int qcom_slim_ngd_enable_stream(struct slim_stream_runtime *rt)
>   	return ret;
>   }
>   
> +static int qcom_slim_ngd_disable_stream(struct slim_stream_runtime *rt)
> +{
> +	struct slim_device *sdev = rt->dev;
> +	struct slim_controller *ctrl = sdev->ctrl;
> +	struct slim_val_inf msg =  {0};
> +	u8 wbuf[SLIM_MSGQ_BUF_LEN];
> +	u8 rbuf[SLIM_MSGQ_BUF_LEN];
> +	struct slim_msg_txn txn = {0,};
{ 0 } is enough

Also, reverse-Christmas-tre, please

> +	int i, ret;
> +
> +	txn.mt = SLIM_MSG_MT_DEST_REFERRED_USER;
> +	txn.dt = SLIM_MSG_DEST_LOGICALADDR;
> +	txn.la = SLIM_LA_MGR;
> +	txn.ec = 0;
> +	txn.msg = &msg;
> +	txn.msg->num_bytes = 0;
> +	txn.msg->wbuf = wbuf;
> +	txn.msg->rbuf = rbuf;
> +
> +	for (i = 0; i < rt->num_ports; i++) {
> +		struct slim_port *port = &rt->ports[i];
> +
> +		if (txn.msg->num_bytes == 0) {
> +			wbuf[txn.msg->num_bytes++] = (u8)(SLIM_CH_REMOVE << 6)
> +							| (sdev->laddr & 0x1f);

Add a #define and use FIELD_PREP

> +
> +			ret = slim_alloc_txn_tid(ctrl, &txn);
> +			if (ret) {
> +				dev_err(&sdev->dev, "Fail to allocate TID\n");
> +				return -ENXIO;
> +			}
> +			wbuf[txn.msg->num_bytes++] = txn.tid;
> +		}
> +		wbuf[txn.msg->num_bytes++] = port->ch.id;
> +	}
> +
> +	txn.mc = SLIM_USR_MC_CHAN_CTRL;
> +	txn.rl = txn.msg->num_bytes + 4;

Why +4?

> +	ret = qcom_slim_ngd_xfer_msg_sync(ctrl, &txn);
> +	if (ret) {
> +		slim_free_txn_tid(ctrl, &txn);
> +		dev_err(&sdev->dev, "TX timed out:MC:0x%x,mt:0x%x ret:%d\n",

Please clean this up, add commas to separate all three prints and a
space after each comma

[...]

>   
> +/*
> + * enum slim_ch_control: Channel control.
> + * Activate will schedule channel and/or group of channels in the TDM frame.
> + * Suspend will keep the schedule but data-transfer won't happen.
> + * Remove will remove the channel/group from the TDM frame.

"will" suggests these are not immediate.

Konrad

