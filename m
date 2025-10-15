Return-Path: <linux-arm-msm+bounces-77334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD26BDD5FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:24:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A14C4F0D59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 08:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 722682F618F;
	Wed, 15 Oct 2025 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UWrYX04b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38332D46B2
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 08:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760516669; cv=none; b=McJHwgBpyE80/4VtgKck7Crkm9OCZnw9Z/V3JbbJYsvQ6D7n8mCVhYeO1JDlbqgcF0hp2f5APzkhvi+LMo/4E1MRCXmw9JaZXAq5IOD4Hw6ugFTXPFCNCRoT0idqEYwFZxcfOJEtSmCmO5XvosoGBDHo8ISk8JLjSRySTW/wLEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760516669; c=relaxed/simple;
	bh=KxWKmiu9Rjq1K6P3jRxYwsFZIUByeyZ59tHsbEg2yjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XiBoKN4EgwEctVTeZruciw3Yn3E1mzdlCAZYRWe4iDnhNIEl9bdSgjygRdsaoKnaOTGUtnoyBm8dEC380ItT9lcjflcdhfRwePgyQjXf8e1/+OCwj0JVfZ2FLHynsSH1QjwtvNJmLP/xn7ooB3LQRwsHRvEssSTuKiXUfJzrEuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UWrYX04b; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b4f323cf89bso1124731466b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 01:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760516663; x=1761121463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TtE/vZEnFRO/O0aDzTmOM5exa4aoLNDYIYIf8N0xWSo=;
        b=UWrYX04bzyITFxVRkRV21xGHmLGQ9ozgyijXXGsaZ6q9eOYagkQovXkZTCq+qrlyI1
         DAD2pPpF7WHyPX/GVm4q4QBf0MR9/P0zu574oi+fzy5mUHsCVpahBeOYfalCftNgoS5S
         7NvUxDi3jJcRQTOlLizX/1W+oQZn9G+qVLztGr6JN4CtpZrqQVsG7gEi67C6m5cw2f4X
         Hp/CgEV8kYdOpFrx2ppjhh718rFr3x4F4J4cNBq+WEGYQ7WCF3Q0lRahC/QvnpD95NEn
         0DJlPXYNUAiUpv/+hVN2zyurfYqaC0FwuKZAJdpKqKSARiFSk4r3ooV0UejoN//fIwSo
         QqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760516663; x=1761121463;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TtE/vZEnFRO/O0aDzTmOM5exa4aoLNDYIYIf8N0xWSo=;
        b=EExNbTt5/ITDoeQUjC3Qsh/NBfl0M+GpCdPSizpfD/330NiVtQnytETxRbYvUb3oCZ
         WMGDWYGSMDJVWd2DesyKs1NN5+n/qmStjYQ5QYe3b9/v0NN44MXSWH7H6UDbUE+/jeMh
         VSjx8EAO7uqtkLQmXx5AeJ7NBXORqJL6hKPVpZ9uZyZN250Hzo/3WdwphIw7fb3/7uNE
         EN45nOOS+gFLvw2+WCQlLGT/pcneq8CZqeHZ18OMrvIe3QjEa77jo2xnBvBMSNvT6pZF
         PY8hPLLR4c9nG/znHKA1juwDCe2vl6mpWI30TyFbbyFUhYHjxl0lSSAD5jnsCOm0hVdK
         jwIA==
X-Forwarded-Encrypted: i=1; AJvYcCV7L1DtzhqfrylJc5Ios1NEzD7hfxIGYeq82iHyhWbqgM12FfuubDcHfaJ41fKXzV19QDF2nd9bYmcRkONe@vger.kernel.org
X-Gm-Message-State: AOJu0YxO8mfJ6cV+/GK2APLNSaW3lJwdTsq6Vzj1BnEAwxdnf3Qdubq2
	7sN5rVzNxPEFrp3hlol0CuH9JyDbMrzWyU6JSt5rvguGDotloamH8vldUPowP4ne+3s=
X-Gm-Gg: ASbGncsMNkPnZFkC68zkuUMkxm7LDcBP5ISCGVhuJCdKC6p7xNi1sbkOa3iZRSb+FlP
	31etvuZc1dCWHWKzuOiqamWXdxk1CB9YPtraHaXNmf2Z3saAiR/gmBN8hfgz9yg779ME+TAxPKM
	zbYefhdQuztuTKFR0t38dBE4pV5sjdnSto9TYiZiOcUagGAoMKng62yV6+2I/X4pc0iPtsPNicE
	smAIpvqppTF6SlkjhqMFsXltZRKoJ1brE2Jiq3JG30QYPipPrs4DgUD6SS+1rkIqXbHCNK66qQ/
	74l8X7pT5SAL9SC4CrK4vfdfH50OsGi76dP47owIv67k9SCoG+PYa+DsdTG1k55GGh4e45hPKU3
	qfh+Pzezyk9neOATqsBSAo1zNp1GToI5sGrqW3MCyE7wvYEZUOJIClJNHWTgDCh7JoxA44ZcuXK
	Nru6YQQwtbN1Ra9tZel7jRSw==
X-Google-Smtp-Source: AGHT+IGevrv/qqYOxvgpm3B6QvO6hWcybEKVbjZIiQDfLWE4gSlzL7mBitr4uu2g2PmlFXgFdhalWg==
X-Received: by 2002:a17:907:934d:b0:b32:8943:7884 with SMTP id a640c23a62f3a-b50abfd6a1fmr2836258966b.45.1760516663245;
        Wed, 15 Oct 2025 01:24:23 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cb9e813acsm169952566b.27.2025.10.15.01.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 01:24:22 -0700 (PDT)
Message-ID: <06043c1b-b261-4469-b897-66e8173588ab@linaro.org>
Date: Wed, 15 Oct 2025 09:24:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Use a macro to specify the initial
 buffer count
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251014-use-marco-to-denote-image-buffer-number-v1-1-f782e4cc622d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2025 03:42, Hangxiang Ma wrote:
> Replace the hardcoded buffer count value with a macro to enable
> operating on these buffers elsewhere in the CAMSS driver based on this
> count. Some of the hardware architectures require deferring the AUP and
> REG update until after the CSID configuration and this macro is expected
> to be useful in such scenarios.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
> This change use a global macro to specify the initial buffer count. It
> meets the requirement that some hardware architectures need to defer the
> AUP and REG update to CSID configuration stage.
> ---
>   drivers/media/platform/qcom/camss/camss-vfe.c | 2 +-
>   drivers/media/platform/qcom/camss/camss.h     | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 09b29ba383f1..2753c2bb6c04 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -541,7 +541,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   
>   	ops->vfe_wm_start(vfe, output->wm_idx[0], line);
>   
> -	for (i = 0; i < 2; i++) {
> +	for (i = 0; i < CAMSS_INIT_BUF_COUNT; i++) {
>   		output->buf[i] = vfe_buf_get_pending(output);
>   		if (!output->buf[i])
>   			break;
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index a70fbc78ccc3..901f84efaf7d 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -41,6 +41,7 @@
>   	(to_camss_index(ptr_module, index)->dev)
>   
>   #define CAMSS_RES_MAX 17
> +#define CAMSS_INIT_BUF_COUNT 2
>   
>   struct camss_subdev_resources {
>   	char *regulators[CAMSS_RES_MAX];
> 
> ---
> base-commit: 59a69ef338920ca6a5bca3ec0e13ce32809cea23
> change-id: 20251012-use-marco-to-denote-image-buffer-number-cbec071b8436
> 
> Best regards,
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

