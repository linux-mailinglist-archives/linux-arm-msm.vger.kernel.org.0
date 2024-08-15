Return-Path: <linux-arm-msm+bounces-28627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B04952ECE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 15:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7D64B27C8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 13:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB5A19DF9A;
	Thu, 15 Aug 2024 13:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qieAn9XT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE54619DF60
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 13:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723727343; cv=none; b=g/CAlplJDiRHJMu7qT6A8om9olwa3feiwRkSDQxiLqier1Yk6zczUYLFOHX6Y6OhPqAcFChn1uGJuuSUuggIuXrt973/74Q6ot69lUn1giT5MXCugd/RZHv8N8kTEbWqwE5X8CyqZS9SS8WAXB4IRXaSclWlVlNm/scFREe3cvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723727343; c=relaxed/simple;
	bh=ZNiq2dS7G8t+fkB7QAgvHsxKjUH2MxNcZXjk9gsTVRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bECpuqIaFOCCouFHhY4rPxDRsLQS1d3SvtGYJvhmtTl2SOTE7tOoSSbeCj0Ay48m0GsX6OU9nbo//KrQKr5A+2s1G/kjFiwxJyqvIItOf06ZXVv3NectEwE8hGJqJkV0mWb5Evo3Tbxp36n6m/JU7x1XJglZUIg6vD7J2V95hzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qieAn9XT; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53212e0aa92so980833e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 06:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723727340; x=1724332140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TNY1eM+k8dVypAWpZEMkyA4Ex7FP/CU7h/TDaorYfbM=;
        b=qieAn9XTOcFXLy1q6ngbr8ohGiyMYSkbbgYITEVXOjgodlaX70MEymEn/xwYRhEKtC
         7nnvEBibVEMeIzW3anm0ti3i7mr28qu30gHUZhSfhJIJ3tvQpJfCeC9xHJUrcOPIGL0z
         sOjCyltVwivnlhKZzVXQbhga9dRWMukWZAH1IZxg/PFqaJVIbGUNYuXtpyy25Jjds9h0
         zXC54Q+/4mz1oydMbtXvtELsdo9Ex1LLphiQ1BsClC7lJrM0NOSF6yRc0GBXsPbUKyc8
         N3sxOcuAPNb6b6VPpy5RWlfz4lGGOSD9eJLoyneUjs4nO6D2D2cC30JOPUb3g1Xl69Qv
         Vm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723727340; x=1724332140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TNY1eM+k8dVypAWpZEMkyA4Ex7FP/CU7h/TDaorYfbM=;
        b=WvJNqsEQGCnTVUw5cbDcDF8UwL/zwoPnELTMBwzQyc77BJXBJmo1Pg4bNTmu2BrDyc
         J1PB2YIPWQLds0LAMoMkdH0atlcsj7XyKqumVz5yGY9W0RXnx7mwUKVbAN6YHC8f8VG9
         cmkCR+ywB36pIDEmimUpaRKKH9i/1EJuIvt0L5iK8KpR0seBhjN2yZxESyaIU6YIZqVT
         VCSoTjHEDJ16zhfMetwRK5cudkaK/kqXAXcC1BhL4tHLcEePV5PYm/aj+OOUhNkqQBCA
         bMmazpc4M6x733lzrD6bBf7mf6tUNN0UJqkdunD6Ed/exDdA5LE7ohvGTnQ7U9yLtpaN
         y7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Z6TYxYf2ArRQ5ssKZwM2iri6WS5XjdTdS7YASlUDz18oUG8crcIoAEuWd+LdwK4+RgTtM9/IeCB03n/saMIDevC5yseMb25rVO21MA==
X-Gm-Message-State: AOJu0YyJ4lF/HzoKE9pAsWxrZWlS4rL5CrdnPvpAbBZZjMxzoIOroyXY
	7I3xyfjNJ6sGBM/qvd/CN02NcGqrw5cFZO2eENNohZgpLzOBOCTb33ztne6sdYruTNqqwLVKh/z
	Vxfw=
X-Google-Smtp-Source: AGHT+IE+mnCIG8BYgBw5oHWVA2VHQioa6RNCWwiCufSDfkzDIzHQOepsTOsLlr6E2Nlerb9pp9JkZg==
X-Received: by 2002:a05:6512:1292:b0:530:e228:7799 with SMTP id 2adb3069b0e04-532edbcaab6mr3519137e87.58.1723727339644;
        Thu, 15 Aug 2024 06:08:59 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::e7e1? ([2a02:8109:aa0d:be00::e7e1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396dfddsm99761266b.214.2024.08.15.06.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 06:08:59 -0700 (PDT)
Message-ID: <f341e9e9-3da6-4029-9892-90e6ec856544@linaro.org>
Date: Thu, 15 Aug 2024 15:08:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/16] Add cmd descriptor support
To: Md Sadre Alam <quic_mdalam@quicinc.com>, vkoul@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, thara.gopinath@gmail.com,
 herbert@gondor.apana.org.au, davem@davemloft.net, gustavoars@kernel.org,
 u.kleine-koenig@pengutronix.de, kees@kernel.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
 quic_utiwari@quicinc.com
References: <20240815085725.2740390-1-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240815085725.2740390-1-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

A note for future patches, please scope your cover letter subject:

"dmaengine: qcom: bam_dma: add cmd descriptor support"

On 15/08/2024 10:57, Md Sadre Alam wrote:
> This series of patches will add command descriptor
> support to read/write crypto engine register via
> BAM/DMA
> 
> We need this support because if there is multiple EE's
> (Execution Environment) accessing the same CE then there
> will be race condition. To avoid this race condition
> BAM HW hsving LOC/UNLOCK feature on BAM pipes and this
> LOCK/UNLOCK will be set via command descriptor only.
> 
> Since each EE's having their dedicated BAM pipe, BAM allows
> Locking and Unlocking on BAM pipe. So if one EE's requesting
> for CE5 access then that EE's first has to LOCK the BAM pipe
> while setting LOCK bit on command descriptor and then access
> it. After finishing the request EE's has to UNLOCK the BAM pipe
> so in this way we race condition will not happen.
> 
> tested with "tcrypt.ko" and "kcapi" tool.
> 
> Need help to test these all the patches on msm platform

DT changes here are only for a few IPQ platforms, please explain in the 
cover letter if this is some IPQ specific feature which doesn't exist on 
other platforms, or if you're only enabling it on IPQ.

Some broad strokes testing instructions (at the very least) and 
requirements (testing on what hardware?) aren't made obvious at all here.

Kind regards,
> 
> v2:
>   * Addressed all the comments from v1
>   * Added the dt-binding
>   * Added locking/unlocking mechanism in bam driver
> 
> v1:
>   * https://lore.kernel.org/lkml/20231214114239.2635325-1-quic_mdalam@quicinc.com/
>   * Initial set of patches for cmd descriptor support
> 
> Md Sadre Alam (16):
>    dt-bindings: dma: qcom,bam: Add bam pipe lock
>    dmaengine: qcom: bam_dma: add bam_pipe_lock dt property
>    dmaengine: qcom: bam_dma: add LOCK & UNLOCK flag support
>    crypto: qce - Add support for crypto address read
>    crypto: qce - Add bam dma support for crypto register r/w
>    crypto: qce - Convert register r/w for skcipher via BAM/DMA
>    crypto: qce - Convert register r/w for sha via BAM/DMA
>    crypto: qce - Convert register r/w for aead via BAM/DMA
>    crypto: qce - Add LOCK and UNLOCK flag support
>    crypto: qce - Add support for lock aquire,lock release api.
>    crypto: qce - Add support for lock/unlock in skcipher
>    crypto: qce - Add support for lock/unlock in sha
>    crypto: qce - Add support for lock/unlock in aead
>    arm64: dts: qcom: ipq9574: enable bam pipe locking/unlocking
>    arm64: dts: qcom: ipq8074: enable bam pipe locking/unlocking
>    arm64: dts: qcom: ipq6018: enable bam pipe locking/unlocking
> 
>   .../devicetree/bindings/dma/qcom,bam-dma.yaml |   8 +
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi         |   1 +
>   arch/arm64/boot/dts/qcom/ipq8074.dtsi         |   1 +
>   arch/arm64/boot/dts/qcom/ipq9574.dtsi         |   1 +
>   drivers/crypto/qce/aead.c                     |   4 +
>   drivers/crypto/qce/common.c                   | 142 +++++++----
>   drivers/crypto/qce/core.c                     |  13 +-
>   drivers/crypto/qce/core.h                     |  12 +
>   drivers/crypto/qce/dma.c                      | 232 ++++++++++++++++++
>   drivers/crypto/qce/dma.h                      |  26 +-
>   drivers/crypto/qce/sha.c                      |   4 +
>   drivers/crypto/qce/skcipher.c                 |   4 +
>   drivers/dma/qcom/bam_dma.c                    |  14 +-
>   include/linux/dmaengine.h                     |   6 +
>   14 files changed, 424 insertions(+), 44 deletions(-)
> 

-- 
// Caleb (they/them)

