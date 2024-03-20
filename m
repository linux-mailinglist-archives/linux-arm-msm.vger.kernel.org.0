Return-Path: <linux-arm-msm+bounces-14671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BF1881546
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 17:12:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B20E11C22C42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 16:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C435474D;
	Wed, 20 Mar 2024 16:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZWeTSntZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2714F1E5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710951161; cv=none; b=kRy6olryDXNonHZnRJV1wof/0PnvRkyvqXLy+Wq6IdsX170d1/8JaPHJQItZxkKFAnVsVmyHVKwFw9lusv4d0Des19Dta4QdhD3rmH10oquwdfipt3u1ykH5M2QX8TqaFG/NG/he9Utc1aQpBrpw3octcU/a1Erpy+Tcg6PyTjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710951161; c=relaxed/simple;
	bh=91XMpLG2akQ92yHfsX86vnzQBDTtg0DrCMSJa/o9yO4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pjga8P1/fAtG9EUIryupn20IZxYwXdZS1Tsk0HGQ0NNe1CeInyWALlq7w+d9YgPA4uHfjQEDmeMY7fAqES7HWoW6jYDAQZnDzFsKjjijlh3H1j5UJ7ioo5vU7gKGrgBVHToDjDlvkfScHmWRRIHXZTQPy1cXqUU/m5ubtxn9glE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZWeTSntZ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4146db7e5a0so5540585e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710951157; x=1711555957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHaerxnf+Io0STbXSxPOeYL0uihrNa0TldEwjw3BQgY=;
        b=ZWeTSntZ3C9eDoRi9NgKZjAgmPAHzY6+rinN5GPISYIEw6hya3n6aW1P3tRR6a6qAb
         FRdCwz87hnV52HKD2YHOwiOekplp/BjbBReBHjx7y8eYpcmnZKu/kwaGNelMbeRY52Ga
         sfoeBvpFsutZ1PfyjoVEkr/xAbcTnhUzywvxzv2MW/siM+SFwOkx0WBiejUhLzLcgH2m
         /2dCengCm6jP/WSwS5NTTCENZ0z/zt6QKT0qSQNTZ68lYXEczyxn9QgIbCbbKPk+LR12
         5+Sb0khCuRE/8lE3IofBAxOQzjMBNq2rIzJ7SXTvyVAuna/9koHt7z9G4ex38xcKcUYl
         pjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951157; x=1711555957;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHaerxnf+Io0STbXSxPOeYL0uihrNa0TldEwjw3BQgY=;
        b=m5R9H748TCvga2Xw0AdODOUngkBl9xIu2sxkq5EmbTav9p6Tn0ts3x37IiZ5RlUnKL
         BTWqqfzN4mb84shI/tFxkF74yFBrBtYkqaeTS89P1UroqCG5hUocfuwjzHoSjvgM/7PK
         5UfvsFpMFFd+3FPiCr62DPy31T7MtKyXm0Jir3UuNCOPFUDHmKsIvOceG39PO50thXrg
         +Tlprus4QehnFmQ0essBeElQmfok23JcKdygAUNziV92kWfRx/g9jLstT5WgdxiojMcC
         C6e4T0UmZXdHiYoeOVmNraJZ1253Bq/AfMGrKVHNHX0FWZkYsZW/6wI8+0DJG4oFqc4v
         mULw==
X-Forwarded-Encrypted: i=1; AJvYcCXKzwXc66ttn9XtyDVi+ujxVjHZhfhTR9AosJi9JjJJUDxY5szTBzKyfCsFlhqhrQ1m5d4OofiRxBPDNHj0LFLpZ6z4zmaJ3Yk51yubag==
X-Gm-Message-State: AOJu0YweOV7i7kZDD/fsa2zjcnlFuft/16O/lQhjdMx4VdekJtFZoyLC
	PFp9Ky+/RQUeINuqkqY/Xw1fgfF6eluATkj4++BuG4L3gC49RXgyG2SFFpGUHm0=
X-Google-Smtp-Source: AGHT+IGUmqwc0fjYKojLrdrN0jIAX9AbIj172jwSl+A63IlFH6oYl/Bmn8K+Tv5YFkUwdiy9Xj10ig==
X-Received: by 2002:a05:600c:4fc8:b0:414:6172:8366 with SMTP id o8-20020a05600c4fc800b0041461728366mr5260918wmq.15.1710951157618;
        Wed, 20 Mar 2024 09:12:37 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id by19-20020a056000099300b0034174875850sm7821180wrb.70.2024.03.20.09.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 09:12:37 -0700 (PDT)
Message-ID: <bbbb5983-f870-48ce-ab7d-c424266e78d9@linaro.org>
Date: Wed, 20 Mar 2024 16:12:36 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: qcom: camss: Add CSID gen3 driver
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konrad.dybcio@linaro.org,
 mchehab@kernel.org, quic_yon@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
References: <20240320141136.26827-1-quic_depengs@quicinc.com>
 <20240320141136.26827-6-quic_depengs@quicinc.com>
 <b542f9a1-2053-4431-832e-5510e8d8220e@linaro.org>
In-Reply-To: <b542f9a1-2053-4431-832e-5510e8d8220e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/03/2024 15:40, Bryan O'Donoghue wrote:
> +static const struct csid_format csid_formats[] = {
> +    {
> +        MEDIA_BUS_FMT_UYVY8_1X16,
> +        DATA_TYPE_YUV422_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        2,
> +    },
> +    {
> +        MEDIA_BUS_FMT_VYUY8_1X16,
> +        DATA_TYPE_YUV422_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        2,
> +    },
> +    {
> +        MEDIA_BUS_FMT_YUYV8_1X16,
> +        DATA_TYPE_YUV422_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        2,
> +    },
> +    {
> +        MEDIA_BUS_FMT_YVYU8_1X16,
> +        DATA_TYPE_YUV422_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        2,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SBGGR8_1X8,
> +        DATA_TYPE_RAW_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGBRG8_1X8,
> +        DATA_TYPE_RAW_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGRBG8_1X8,
> +        DATA_TYPE_RAW_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SRGGB8_1X8,
> +        DATA_TYPE_RAW_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SBGGR10_1X10,
> +        DATA_TYPE_RAW_10BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +        10,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGBRG10_1X10,
> +        DATA_TYPE_RAW_10BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +        10,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGRBG10_1X10,
> +        DATA_TYPE_RAW_10BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +        10,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SRGGB10_1X10,
> +        DATA_TYPE_RAW_10BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +        10,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_Y8_1X8,
> +        DATA_TYPE_RAW_8BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_8_BIT,
> +        8,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_Y10_1X10,
> +        DATA_TYPE_RAW_10BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_10_BIT,
> +        10,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SBGGR12_1X12,
> +        DATA_TYPE_RAW_12BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +        12,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGBRG12_1X12,
> +        DATA_TYPE_RAW_12BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +        12,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGRBG12_1X12,
> +        DATA_TYPE_RAW_12BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +        12,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SRGGB12_1X12,
> +        DATA_TYPE_RAW_12BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_12_BIT,
> +        12,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SBGGR14_1X14,
> +        DATA_TYPE_RAW_14BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +        14,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGBRG14_1X14,
> +        DATA_TYPE_RAW_14BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +        14,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SGRBG14_1X14,
> +        DATA_TYPE_RAW_14BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +        14,
> +        1,
> +    },
> +    {
> +        MEDIA_BUS_FMT_SRGGB14_1X14,
> +        DATA_TYPE_RAW_14BIT,
> +        DECODE_FORMAT_UNCOMPRESSED_14_BIT,
> +        14,
> +        1,
> +    },
> +};

Also please consider including/reviewing Gjorgji's patchset which 
reworks the declaration of resources.

https://lore.kernel.org/lkml/20240319173935.481-4-quic_grosikop@quicinc.com/T/

---
bod

