Return-Path: <linux-arm-msm+bounces-70857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE0B358A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 11:20:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAD72163500
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D930827F011;
	Tue, 26 Aug 2025 09:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EHb1ZsGq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F009F286D50
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 09:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756199884; cv=none; b=mZyoFk9CsFgcWqsMUBzfTZf20DGrxoPqbRXTSsg8K3zGKhAaK4fENook/ayqbqyjIjCr7pm/SmcrC1WI9LfZJ4kyoIs5wMxCFMqSuKtb5dlkE9BnmWXbxmi5u2BVa47MlkgI6nM5ABXqvDAvuZK9JhgdlnZmi4qOhMoTmC8nHRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756199884; c=relaxed/simple;
	bh=qU1FNAvLd80qOQlVY6xxS4NT8YfSf+GBVrPU98hM9wM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQjA4eotRsT/NYCF6xx/HGPsW4+d4sQeLSJHUJrFtOClnkB4+OgpiwncsHI7t51NkCJCBaxjUQtC1Tbpyhu4yG8LtB55I6NX5w47bDQF1lu811qQN+KsvE0ZPTYUjJ8FfRqnQTOZbJP2Y2hUdrWlLQWiuK4FUOGPjN/58ZSsW1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EHb1ZsGq; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3c6412336d4so2188567f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756199881; x=1756804681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bARKiXzA6hGcwZbah7s5OpMlMCRfJH9Ze1dsDZvGjrI=;
        b=EHb1ZsGq+nG7yKedbabfcpe97VSgwZ3z2+XrdotQDz7w7jU9D/8ibhQ32ej9VzZrZe
         I6jBPbI8XEKg6WVYtRh4WUWWp20t2JUSp10B/s4T8ZIE2fj8VnMfdjdTaxNmJx/ICdbc
         mcpqf/KOyeGd1LECtN1lVRiz+YXZ1BKYTn6y3MWvvv/N3Tx56SyijMNNnzgqHqcKYKzG
         JLhegiaoQksqNH6+4jzKvtGBmeEIkGXTaxObYiem/H1AYTL9p2YFdZdm8zmmtO0xJPXZ
         faA/KqqkMUICN5z2yQVsFKRDKzTLvC7+LKoHoZQyA2K3aG0X9EIJ7P6z28rBWBfS22XW
         jeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756199881; x=1756804681;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bARKiXzA6hGcwZbah7s5OpMlMCRfJH9Ze1dsDZvGjrI=;
        b=RFbEolo8ZFtfBhdja7c2W/MTAnCc4qh9qr7rllf7c3vM/eq0IhAn/wGdRGf2bdZp3z
         z0YwJvPY8v0/9hyC+V71G3Hh/glLw0vKXF9ZD/PL9zImQ8f265PD/33n0S4ttkSAo2yu
         gOmBq0b6irV7drVeoCQ1rxjR/kEkr8deEeGooul/jD2yH2IXx4GE0DgCCjjcUOxhjENf
         tBs/qUS1E6GRijpLx20kBRN+WcVt4u21fcy94yZS3lB89YMZY8ywz7ZdnQhcvuysGm4a
         bpcyqtbiHJrHtlCZyivsveEbN9VMC9s/wJSce96LtrcutTQChEujwI9SzDVJipyhaAv8
         WjSg==
X-Forwarded-Encrypted: i=1; AJvYcCU1Gi+IcMG2dCYIm8Vf1I6h/u1IP4DqaOY1Lczn2mzLgdHu/+4VCRmPt/fjAkeyiuv+fY2oENPCrITinH7N@vger.kernel.org
X-Gm-Message-State: AOJu0YySawYIHiMfhPR9GWPrL4KZHloAT5EUpt5U3Kby0eNvB1jkP6ui
	ZYZm7NowyIbpJuFxVrxBmOHelCRT/7QMI8mVeyDweUd2BN13j8WG4J0e+UzsjBOmVVg=
X-Gm-Gg: ASbGncshsLXZ+6PPQc+JZZoPRcTV03I48AIBI2uDoZsH9XN+8kjbtxWGH9eY7axtUbe
	A4epXBDw47cHYruwpjUgAuq7Mi0q42Lng19uxqdAk2c7OVCIorTWjV8gzp3rJKRJpHX7WG3OUml
	nD4HgoDn1Ne07BPTeI7B6H1BZ7Q0eztDBaCatWspZZRun3xvXRm6dG3jH/TkbB6S6Fgt+d5eOT4
	QlGVIHt5vKVx9yHJoc72dosiT3gxokHH/i1NsYdVTdMVnDtWCJFdgAKhPIQ098dB0X7+7zJ6VLh
	09lcPF79Ymv+XMLtqVBd/VfhEnNtI3J172avzJu9F1uzi/EwYJP5K9OKk7kLn61cduwnn8aaiUy
	AIsr5Lck9d2MwP8ppv2atPz3Nr3s=
X-Google-Smtp-Source: AGHT+IGAZEs053vHudyipY3XTEBo1QStAY7/xTMg751YeNtyJEeHMj0XEwwbWsuR8ch7OFkISHSqhw==
X-Received: by 2002:a05:6000:24c7:b0:3c8:1df2:540c with SMTP id ffacd0b85a97d-3c81df25723mr6978339f8f.43.1756199881181;
        Tue, 26 Aug 2025 02:18:01 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b5753ae41sm142300465e9.9.2025.08.26.02.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 02:18:00 -0700 (PDT)
Message-ID: <ef2267d2-a6f4-4f51-be44-687a4074a4d3@linaro.org>
Date: Tue, 26 Aug 2025 10:17:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] coresight: tpda: Add sysfs node for tpda
 cross-trigger configuration
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
 <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26/08/2025 8:01 am, Jie Gan wrote:
> From: Tao Zhang <tao.zhang@oss.qualcomm.com>
> 
> Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
> These registers define the characteristics of cross-trigger packets,
> including generation frequency and flag values.
> 
> Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
> Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../testing/sysfs-bus-coresight-devices-tpda  |  43 ++++
>   drivers/hwtracing/coresight/coresight-tpda.c  | 241 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++
>   3 files changed, 311 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
> 
[...]
> +#define TPDA_FPID_CR		(0x084)
> +
> +/* Cross trigger FREQ packets timestamp bit */
> +#define TPDA_CR_FREQTS		BIT(2)
> +/* Cross trigger FREQ packet request bit */
> +#define TPDA_CR_FRIE		BIT(3)
> +/* Cross trigger FLAG packet request interface bit */
> +#define TPDA_CR_FLRIE		BIT(4)
> +/* Cross trigger synchronization bit */
> +#define TPDA_CR_SRIE		BIT(5)
> +/* Packetize CMB/MCMB traffic bit */
> +#define TPDA_CR_CMBCHANMODE	BIT(20)
> +
>   /* Aggregator port enable bit */
>   #define TPDA_Pn_CR_ENA		BIT(0)
>   /* Aggregator port CMB data set element size bit */
>   #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
>   /* Aggregator port DSB data set element size bit */
>   #define TPDA_Pn_CR_DSBSIZE		BIT(8)
> +/* Mode control bit */
> +#define TPDA_MODE_CTRL			BIT(12)
>   

This one is missing the register name prefix, like TPDA_SYNCR_MODE_CTRL




