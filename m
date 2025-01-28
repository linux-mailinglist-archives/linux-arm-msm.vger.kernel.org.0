Return-Path: <linux-arm-msm+bounces-46383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA89A20A01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 12:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E0391883520
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C371A2388;
	Tue, 28 Jan 2025 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="guFtvIeG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D248819AA56
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 11:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738065356; cv=none; b=qssmXS0a55WINW5hKqn+1mO+dgo+qy++bRYSC1exmOKwMIUO1VzLDbs7xlGQGOrnLM0scDxVokAwrJDnI8KhgKzyZrsBjL/7zx/ZsRN/EvYNzuxiKqqbNgNiKexjJd3NEoX1WgfgDRh/iOe0LZbAhWo2+sXAVtnPWALIw8ivbFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738065356; c=relaxed/simple;
	bh=TVJohnIE7XYTgO4Zculp6caadDqgxguvz19Y+s61Op4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f5gskuiOvL2JjVG+VsGIg018h+aUDYyWLsgzqnkSG8YGF3QxrvjmiuptIbXy1Du1Wqxff8tcmQEcQ2GV3w9cOzH0ERtz4dVasAnylSs+R+o4QWm3IM7NMXmu3pfWGYlzFxS/LncDC/1wDXr2Pw685n3mwDzWGvT0C8hjqRCUWzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=guFtvIeG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-437a92d7b96so56641465e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 03:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738065353; x=1738670153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLXaRDqxo+mIH84hjRiHW1wB2c5SwAr+CdumW+V6OgA=;
        b=guFtvIeGUMiPD4+UMu2n0t95yHuBp1eQCyQOgOAv90eHju3FSicn12/6rp6rqRjqov
         votVC304P96r0UaChnltbpzxlw21OkCYv0U56b5ckhI/xpQEkeTzDWKDZSvEV0N2jEy2
         ICssD4z057zI24Xi21x6WLAQHN1QEMXsW+EkFiIQdvFAZJGP1n4GoP+Ib2fvjSRfaK6z
         pODJy74T8oFfV21pdV2noJWbks2ey7hwcW1bx6C2UdHZwa5pP4cHAJmwqEwIL7xd/C+V
         A/hFI6ta8cZvigrg7LZ/mmvjuKVSQ4hKMLeih5/Q3u1sLmcu/PVfMs/V4g8OhgnijOrE
         1z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065353; x=1738670153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLXaRDqxo+mIH84hjRiHW1wB2c5SwAr+CdumW+V6OgA=;
        b=UVuY37mJqYoZ858VMlYUlQor8H5wbF8IOBfYWfw2qi8cNCm9vt8JnIbl+tNllDtU5E
         Ax+On/s/NpqoWP6sqqK6gfroEKB7YSOzZrwYhYpWLk/LEwLfEq7/qGhPOvjh4QGpqJ5N
         UGyVlEpUbe1uD99LkSrOzbOujmZoD3nK3SEc5Dg23NbckNSAWGj8Mey+w/BYchUuxjNT
         ZZFoddO1nXS3ZYMVyDDL9wtRuYBWRV5Xl+iJ7dh64Zbe5rS4G1U8sADJQv2LOB61U+Ro
         iXFC26/43cmbTkvoWdQ7ihnJWkERYeHQUlZCGY1LdKNRYPX9jMfA97bu0QiP8SFF939W
         y7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/yTU3TbBj6FXkixDFCIY5L94HaTOqnZmxALYlhbdWgHmzx3eGD5/iYdPPvz3wvowjQU3jInR5fc5LGNXf@vger.kernel.org
X-Gm-Message-State: AOJu0YywHUIXENcJskacnOl7Box4BeehfD/umf1Vi5AnCI03eNaRMzfw
	M+GOzUfm1B72DK8fPkmwmx1kXXjTUeGRGWLmNv94AvO/V8hw0U6uOfsunmpi984=
X-Gm-Gg: ASbGncvYa1bjUOiesNoHhW/SBxQYnkjqWTbvw48BldJ78Pkkwboj24bvaMx6oGQtu0X
	BeW5xOyL0nMjO78zE82oOVmI9jH5a8nQ9TTYKwDtodaQeF0JMXhgXckCBF2MB2/IOUrZOzQNRQn
	TVChYSM2ImLITBYOSyyr2g5RqymvNIGR1mDYff71dzxN3xXhd79I8hoqOF0NS0RgKfnG361tVOM
	JRguE1nuVazQ/QwyCkYvsSuCKtpS/NNqjEKVMveJuRDMzPT1VHQ9awhNEUS1YEajvjN7UifYzCb
	f9Migj8pUgihfoSW0BpjWxBGJg==
X-Google-Smtp-Source: AGHT+IFARZscANUjyT1VVjHj9FJwPk0o4/Th44Oh6jzNuT8s/RE6rZZ0WJ9ZR9mNGMKADe5Y64JxbA==
X-Received: by 2002:a05:600c:3d05:b0:436:469f:2210 with SMTP id 5b1f17b1804b1-438af40851bmr234818545e9.1.1738065353123;
        Tue, 28 Jan 2025 03:55:53 -0800 (PST)
Received: from [192.168.68.163] ([145.224.65.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4fa599sm174728255e9.7.2025.01.28.03.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:55:52 -0800 (PST)
Message-ID: <44bd0d5e-a232-49c3-ba2f-e63e2f2c99be@linaro.org>
Date: Tue, 28 Jan 2025 11:55:51 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] Coresight: Add Coresight TMC Control Unit driver
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250124072537.1801030-1-quic_jiegan@quicinc.com>
 <20250124072537.1801030-6-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250124072537.1801030-6-quic_jiegan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/01/2025 7:25 am, Jie Gan wrote:
> The Coresight TMC Control Unit hosts miscellaneous configuration registers
> which control various features related to TMC ETR sink.
> 
> Based on the trace ID, which is programmed in the related CTCU ATID
> register of a specific ETR, trace data with that trace ID gets into
> the ETR buffer, while other trace data gets dropped.
> 
> Enabling source device sets one bit of the ATID register based on
> source device's trace ID.
> Disabling source device resets the bit according to the source
> device's trace ID.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/Kconfig          |  12 +
>   drivers/hwtracing/coresight/Makefile         |   1 +
>   drivers/hwtracing/coresight/coresight-ctcu.c | 276 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu.h |  30 ++
>   include/linux/coresight.h                    |   3 +-
>   5 files changed, 321 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
 >

[...]

> +/*
> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
> + *
> + * Returns 0 indicates success. None-zero result means failure.
> + */
> +static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *cs_path,
> +				bool enable)
> +{
> +	struct coresight_device *sink = coresight_get_sink(cs_path->path);
> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	u8 trace_id = cs_path->trace_id;
> +	int port_num;
> +
> +	if ((sink == NULL) || !IS_VALID_CS_TRACE_ID(trace_id) || IS_ERR_OR_NULL(drvdata)) {
> +		dev_err(&csdev->dev, "Invalid parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	port_num = ctcu_get_active_port(sink, csdev);
> +	if (port_num < 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * Skip the disable session if more than one TPDM device that
> +	 * connected to the same TPDA device has been enabled.
> +	 */
> +	if (enable)
> +		atomic_inc(&drvdata->traceid_refcnt[port_num][trace_id]);
> +	else {
> +		if (atomic_dec_return(&drvdata->traceid_refcnt[port_num][trace_id]) > 0) {
> +			dev_dbg(&csdev->dev, "Skip the disable session\n");
> +			return 0;
> +		}
> +	}
> +
> +	dev_dbg(&csdev->dev, "traceid is %d\n", cs_path->trace_id);
> +
> +	return __ctcu_set_etr_traceid(csdev, trace_id, port_num, enable);

Hi Jie,

Using atomic_dec_return() here doesn't prevent __ctcu_set_etr_traceid() 
from running concurrent enable and disables. Once you pass the 
atomic_dec_return() a second call to enable it will mess it up.

I think you need a spinlock around the whole thing and then the 
refcounts don't need to be atomics.


