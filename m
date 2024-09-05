Return-Path: <linux-arm-msm+bounces-30899-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C4096D8B3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 470E31F228CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB5519D07B;
	Thu,  5 Sep 2024 12:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="brn/mRag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0DF19CC02
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725539695; cv=none; b=hefp0iwra7hvYxr681G53A/tSwzG0hD8oGpM9L/wSvq2zIxjM1qhB1iHVvs1TN8qa5Njmb6CLPGlnGFApclfuq+7SmwwRNi+3jtMgZ+bhPzGxHp7CQkgkTQQ/SL4CLaBJ/MjlTT21R7JXsv0OqP2a1YwBoWIAvj/963LaW+l+R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725539695; c=relaxed/simple;
	bh=o1BYVeXYd+Exw1Pko8Ju87ReVDQeiUoI/T/lA26YbDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n0F/A2cZfSaZutgOKG1w0mGbwnfevcWVpayo+HqkRytSwlKlbu0IMyaca8YUozvrbMJK6FzcPKydRJcN1jjK4W2ElfiAnTljLxItDEpvwckt9HL2i1Oz4mMKm991SwXrpi+baiG0CcKaji6mymgazem7ILBJ930qY7d++1YKiyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=brn/mRag; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so102503766b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 05:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725539690; x=1726144490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYteC50roaclv1enHFvpxn794KpAlBuHzUkfSWTmPbA=;
        b=brn/mRagZITICxL/Hdsg8PXX/d31jYg/rL0GB0igbSDoA41IUoPr6rFci+BrxbYF36
         57eVejQH+ljl6wsxCcKUPyxZs3yq7Hlh5ZCjOXY9EvzLDFktF8P6adWSGSbkJO+sOUj8
         KI8RN0nlDTGbhSnd6hUwzqwf5kO1f+Pp9i6mwUB36dMCwF72e9Ke+g5wX+RCtXAZHzd6
         U1q3+STjJyi6Nughjnrd+uTU5GUwDlI0140b0Njo8rzeqG1G4MMPDkFAYITiJj3tb+el
         VuOIT8X+57ZypeFn6FKa3G4LTYmFkCg8b+fc5ZvJnlmngUZxEWkPsPa8L50Kzn99X615
         LqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725539690; x=1726144490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYteC50roaclv1enHFvpxn794KpAlBuHzUkfSWTmPbA=;
        b=JhNHl666i5QpfYUjQrvaZHDk/zHPO7Ltr27oPP9+uHktWDw+uzNGfmZT2PTT7iNiZ6
         LZCwbFi0swYOOCVJ1bOkL09aBGkCuP/5Y1z9wsxhxyhMHWqM4TtLOr2tDsIoSDlbnJAy
         go6gZEoYX5pdgt8yISJoKIt8ULcKCb4BqcSvKUvfZw9kQBxPlpCs0k13h3VSQvPhnqio
         0tm0YzAMxmA3x8D6FtV4D2cy55dxUJyeV6vg59fyUhrjb7kLWvV7ei0GLcNuryufJMDN
         P86SXdH/GeO8gGkYO6M0pffOTp44j1zySA+bShhaFU78YgWoPnuztQJ3Qx0DbF1IADKU
         R57w==
X-Forwarded-Encrypted: i=1; AJvYcCVjaE7ddC8sKPSr+mFI6JcMHkfIGJv9DCdcgvGsOU0aSGU13d5A8ZZizO9YS7g26i3SUVWxuwm/9gbDw5Bi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2wLJ72qx/AWd2k1NE1NwOn2Mh4Itn7+BrscP7zJdnWgFT6Iwj
	rV77WwdJTMAMTqmEaUGKyGBqC7nUax0JI/JECVfxoZ2e+fnTv86ITqB3T05cJbE=
X-Google-Smtp-Source: AGHT+IGpUC3PlcHdPXyRu7Bo/T/CFmwmTWaQN26GGApAbAiz6u4OpkNRyvIBnPIWXzM5OIpJsvajVg==
X-Received: by 2002:a17:907:e20b:b0:a77:db36:1ccf with SMTP id a640c23a62f3a-a8a3f49a1c4mr514691966b.42.1725539689941;
        Thu, 05 Sep 2024 05:34:49 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a6204793asm131915866b.84.2024.09.05.05.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 05:34:49 -0700 (PDT)
Message-ID: <3b578b1b-53d5-4f2d-a2b8-8483a4051a24@linaro.org>
Date: Thu, 5 Sep 2024 13:34:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/29] media: iris: implement boot sequence of the
 firmware
To: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-8-c5fdbbe65e70@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240827-iris_v3-v3-8-c5fdbbe65e70@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/08/2024 11:05, Dikshita Agarwal via B4 Relay wrote:
> From: Dikshita Agarwal <quic_dikshita@quicinc.com>
> 
> Set memory region to firmware and implement boot sequence.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/Makefile          |  1 +
>   drivers/media/platform/qcom/iris/iris_core.c       |  7 ++
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   .../platform/qcom/iris/iris_platform_sm8550.c      |  3 +
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 87 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.h | 13 ++++
>   6 files changed, 112 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index ddd4c994a0b9..95f4e92fe085 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -8,5 +8,6 @@ iris-objs += iris_core.o \
>                iris_probe.o \
>                iris_resources.o \
>                iris_vidc.o \
> +             iris_vpu_common.o \
>   
>   obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 8c7d53c57086..5ad66ac113ae 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -6,6 +6,7 @@
>   #include "iris_core.h"
>   #include "iris_firmware.h"
>   #include "iris_state.h"
> +#include "iris_vpu_common.h"
>   
>   void iris_core_deinit(struct iris_core *core)
>   {
> @@ -39,10 +40,16 @@ int iris_core_init(struct iris_core *core)
>   	if (ret)
>   		goto error_queue_deinit;
>   
> +	ret = iris_vpu_boot_firmware(core);
> +	if (ret)
> +		goto error_unload_fw;
> +
>   	mutex_unlock(&core->lock);
>   
>   	return 0;
>   
> +error_unload_fw:
> +	iris_fw_unload(core);
>   error_queue_deinit:
>   	iris_hfi_queues_deinit(core);
>   error:
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 9c919367f9d7..47fdebd8135c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -45,6 +45,7 @@ struct iris_platform_data {
>   	const char *fwname;
>   	u32 pas_id;
>   	struct tz_cp_config *tz_cp_config_data;
> +	u32 core_arch;
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index 1bb34c3e6e18..a559e095fefc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -8,6 +8,8 @@
>   #include "iris_platform_common.h"
>   #include "iris_resources.h"
>   
> +#define VIDEO_ARCH_LX 1
> +
>   static const struct icc_info sm8550_icc_table[] = {
>   	{ "cpu-cfg",    1000, 1000     },
>   	{ "video-mem",  1000, 15000000 },
> @@ -48,4 +50,5 @@ struct iris_platform_data sm8550_data = {
>   	.fwname = "qcom/vpu/vpu30_p4.mbn",
>   	.pas_id = IRIS_PAS_ID,
>   	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.core_arch = VIDEO_ARCH_LX,
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> new file mode 100644
> index 000000000000..df87b1b719a9
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -0,0 +1,87 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/iopoll.h>
> +
> +#include "iris_core.h"
> +#include "iris_vpu_common.h"
> +
> +#define CPU_BASE_OFFS				0x000A0000
> +
> +#define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
> +
> +#define CTRL_INIT				(CPU_CS_BASE_OFFS + 0x48)
> +#define CTRL_STATUS				(CPU_CS_BASE_OFFS + 0x4C)
> +
> +#define CTRL_ERROR_STATUS__M			0xfe
> +
> +#define QTBL_INFO				(CPU_CS_BASE_OFFS + 0x50)
> +#define QTBL_ADDR				(CPU_CS_BASE_OFFS + 0x54)
> +#define CPU_CS_SCIACMDARG3			(CPU_CS_BASE_OFFS + 0x58)
> +#define SFR_ADDR				(CPU_CS_BASE_OFFS + 0x5C)
> +#define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
> +#define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
> +
> +#define CPU_CS_H2XSOFTINTEN			(CPU_CS_BASE_OFFS + 0x148)
> +#define CPU_CS_X2RPMH				(CPU_CS_BASE_OFFS + 0x168)
> +
> +static void iris_vpu_setup_ucregion_memory_map(struct iris_core *core)
> +{
> +	u32 queue_size, value;
> +
> +	/* Iris hardware requires 4K queue alignment */
> +	queue_size = ALIGN(sizeof(struct iris_hfi_queue_table_header) +
> +		(IFACEQ_QUEUE_SIZE * IFACEQ_NUMQ), SZ_4K);
> +
> +	value = (u32)core->iface_q_table_daddr;
> +	writel(value, core->reg_base + UC_REGION_ADDR);
> +
> +	/* Iris hardware requires 1M queue alignment */
> +	value = ALIGN(SFR_SIZE + queue_size, SZ_1M);
> +	writel(value, core->reg_base + UC_REGION_SIZE);
> +
> +	value = (u32)core->iface_q_table_daddr;
> +	writel(value, core->reg_base + QTBL_ADDR);
> +
> +	writel(0x01, core->reg_base + QTBL_INFO);

A general comment I have is instead of writing hard-coded values to 
registers we should define at a minimum the bit-fields we use if not the 
entire set of bits-fields for the register.

The only exception to this is when we don't know what those values are - 
for example receiving a magic write sequence for a camera sensor.

In this case though we have full access to enumerate the register 
bit-fields.

Without looking at the register descriptions I guess this bit is an 
enable or a startup bit =>

#define QTBL_INFO_EN BIT(0)

I'll not go through this series reiterating this comment but, it 
certainly applies to any bit-field/register in the same => please define 
at least the bits used if not the full set of bits for register writes 
instead of using magic numbers.

---
bod

