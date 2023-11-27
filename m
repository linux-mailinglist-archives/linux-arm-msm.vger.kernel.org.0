Return-Path: <linux-arm-msm+bounces-2128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6DF7FA4D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 018C6280194
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A5D328CA;
	Mon, 27 Nov 2023 15:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0hTYSHe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A969C189
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:35:16 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54af61f2a40so4056382a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 07:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701099315; x=1701704115; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BeRSQ2NgtW3CkQnVCOjk3/1p7m2vsB5QkdRb/jJ4L0=;
        b=A0hTYSHeruUv+N7EBseMCwPBRzYqq7imTey1wS8oqS9jesEbO6z5NwSJZEMoQFKsoU
         kEwpc7MUGwM85dT2oz3bSbPbyPPg9S6MNXEjL5055oLOZPvM2FoKrnoINGBUWdiDZ980
         pQCxJVUEsSHz8yXGvWJJ8p1qJf54G1B9AKF8Ay+ZRt/XNrXIoWQzUfeeSrqM1aA8JGrM
         2Awkyu0+ZPynZHLW2+a2c42aRv9iTI+efuimIJvXQyyYndPWHcWRrRdCXrBwoXqnqhow
         Ab9fbjdj3YZ/85a8VSDsNenZVnZXOzhYzaItrmcrbuTvUMc3MrB2NuiZaLE79Muu/5CA
         PYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701099315; x=1701704115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5BeRSQ2NgtW3CkQnVCOjk3/1p7m2vsB5QkdRb/jJ4L0=;
        b=f8TN9ubikK+iu/7wU1my1HHKub8t67LHnOJy/A44VigTrUrxw89LJY3lZi56LQKTpY
         Me1Pi6awBjxCHGEqF8p/XCZ3lOCam2ycVokXNQLz8c50qV7hqMST6ce3PIEKW/w4R+dU
         WOL41ElOOq19Apq23i/s04p2gxuDKeHqD6MboGClEQTKX+mpjWvqz/ZJjUbl7AzUYaeT
         lDpO5DCilCmHh2lrngVLdON+Et/EP1Tlm2ibJFUeGxgx49JArvPlpSSv4ykg1luYSgpr
         phAVd47YCo2zqP5CTHjD67BGUQVh8UiSgBY0NQWWW/O0vyul2NVzuLBWyM9GRYcG5bAF
         C7/Q==
X-Gm-Message-State: AOJu0YyZcZcK58w7c7G2Sg173IkPz1fnBM2MziGytDarOaGr3VvsjOH+
	zJFCRonpgPwE/GB0x5WBIEqgFZYmgvE2gK0as/c=
X-Google-Smtp-Source: AGHT+IHOX/xkrK1RJFK21Ya6CH7VkQg6wVP1hQ5nJKlX8lT4H9axnaQBUp5u5Co0kTJ/p5w37pduug==
X-Received: by 2002:a05:6402:78e:b0:54a:f8d9:8026 with SMTP id d14-20020a056402078e00b0054af8d98026mr7906465edy.12.1701099315088;
        Mon, 27 Nov 2023 07:35:15 -0800 (PST)
Received: from [192.168.201.100] (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id h9-20020a056402280900b0054aeece37cesm4370406ede.52.2023.11.27.07.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 07:35:14 -0800 (PST)
Message-ID: <ec4b7dfa-6fcf-4ccc-8857-d99573349599@linaro.org>
Date: Mon, 27 Nov 2023 16:35:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: add ACTLR data and support for
 SC7280
Content-Language: en-US
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>, will@kernel.org,
 robin.murphy@arm.com, joro@8bytes.org, dmitry.baryshkov@linaro.org,
 a39.skl@gmail.com, quic_bjorande@quicinc.com, mani@kernel.org,
 quic_eberman@quicinc.com, robdclark@chromium.org,
 u.kleine-koenig@pengutronix.de, robh@kernel.org, vladimir.oltean@nxp.com,
 quic_pkondeti@quicinc.com, quic_molvera@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 qipl.kernel.upstream@quicinc.com
References: <20231127145412.3981-1-quic_bibekkum@quicinc.com>
 <20231127145412.3981-4-quic_bibekkum@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231127145412.3981-4-quic_bibekkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.11.2023 15:54, Bibek Kumar Patro wrote:
> Add ACTLR data table for SC7280 along with support for
> same including SC7280 specific implementation operations.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 25 +++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 247eaa194129..f0ad09f9a974 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -27,6 +27,20 @@ struct actlr_config {
>  #define CPRE			BIT(1)		/* Enable context caching in the prefetch buffer */
>  #define CMTLB			BIT(0)		/* Enable context caching in the macro TLB */
> 
> +static const struct actlr_config sc7280_apps_actlr_cfg[] = {
> +	{ 0x0800, 0x24E1, PREFETCH_DISABLE | CMTLB },
hex should be lowercase

> +	{ 0x2000, 0x0163, PREFETCH_DISABLE | CMTLB },
> +	{ 0x2080, 0x0461, PREFETCH_DISABLE | CMTLB },
> +	{ 0x2100, 0x0161, PREFETCH_DISABLE | CMTLB },
> +	{ 0x0900, 0x0407, PREFETCH_SHALLOW | CPRE | CMTLB },
> +	{ 0x2180, 0x0027, PREFETCH_SHALLOW | CPRE | CMTLB },
> +	{ 0x1000, 0x07ff, PREFETCH_DEEP | CPRE | CMTLB },
> +};
Any reason this list is so much smaller than 8550's? Is it complete?

Konrad

