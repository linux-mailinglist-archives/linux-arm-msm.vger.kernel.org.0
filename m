Return-Path: <linux-arm-msm+bounces-53642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AABA826E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 16:01:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C9F98A42A0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 13:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7EA264627;
	Wed,  9 Apr 2025 13:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DWToxUgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99442263C71
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207123; cv=none; b=HUPcwaHOpXsTRwRLVtZ85eryb/vWGaL4amLq+ZLE7oGddwKuDslnv4eaTQaEDMTWcT0ZANyg4rAhFdcF4wvFK0+UV8UmgqoTk7qYfhqrG/vv5343YsGMf3+Hv4uV4KJz+YDN/iOV8oeilyQhjRksojOkRemK7OTBs61XBPqhaaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207123; c=relaxed/simple;
	bh=t/S97uM0OQzmLF1RsSm3zSU9KoV3Eb8EMj9maBmFYT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RuwbUU1JVbNkTkO3oftssLE0J8LiWH0dC9oSUSIKk61ICSZmoD9KdpfAughzNLYUB6TBhGte+9eVJmfeiZt/6CzflsyN5YJoWFs6QV4hZjDgn0bU87F1ubHR4pcOIRhkoOOmDCOVHZKJIKZPIaUsaQWNgqZxu/z0Csj9VXxegRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DWToxUgi; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c266c1389so4915823f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744207119; x=1744811919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Azu3AUAQUy2/C9fS6Ba25nQGoxL9rV4VIY4SgkwNTA=;
        b=DWToxUgiR+18kCPRp41F6mZiPkpUj8CNiieboDZw7bXfwJA2qJ75YyxQryfK2/Zy/Z
         qpjJSIgbCAreVBFstI/FZ6ErJbCrGpElEi5/ADia3utkjXyG5txqCnLOi2df4rBE+epQ
         k5TvH9sUOdR7bm+ttD4s0T2osWzOExGAndq8QVVfpB5BjYbQb5aj3exdBjPufSqFNMpG
         5Vd7YihIWrG5NmX6WZ+zzkgdMmIx9/euw6UqrSU2gc+SM0EXZRcCiYQmvIklG0YUPEYg
         q1vQJjjX8hZd8wMPUxh7g0lqCxWUDumsXXLmYJoiInFYtOFln3BHJcPEs4vupAHc0WQJ
         jBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207119; x=1744811919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Azu3AUAQUy2/C9fS6Ba25nQGoxL9rV4VIY4SgkwNTA=;
        b=ZPuYoeaHFDrg8Q0Bc8YborpDuqfY+TzX53L8NP6PM/EJPWapTxDDA4g5RpS6dk3nXo
         RO9ro++F/gIZ/8h75cz5IvFbxJXUVaXF8/lnk0lmrkVVwVDMGCUvMkr+uYlslCyJm327
         yXMrNX1q8eGKEvWkN86lsiytcES+2Itgx2iweNNOTtTMD/pNDhyTPl6Kl/mZBhT07o0G
         /Ex2rMr8zCHgaHhGg2w75oZhT95mOD271fnQiuTviedXaDpyW4wjFPH/XlmTHgNYh/xs
         xhJ/viBB113JsrRlWoT7z6EwLtvRIiIHEEqpvzd2SeulhyO7GZnkeKUCoXcC6yh9SX3t
         C3lA==
X-Forwarded-Encrypted: i=1; AJvYcCVeqmgl3nzQ5p/zjJW5br/d1ty9T3Cif6h8r04ownWO2inuCuRvE5KA5b6s45dwTe6CKQZ7AMcVuPpmu2Qu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq0DNQC3Enz6D9uO+ZASLV5DbO2ImFvIq7oEYOwDdzzlJw0iAN
	guzP6KYRi0BEFI6ylGFcyg8CIb5bufgZYjHKDquh7j/LzgoHXWsFL0aDj5EjyIw=
X-Gm-Gg: ASbGncvEXGA54Br4MtE7xZca+TZDY15c1v1VOh6aEhnR2cKhUACr1jUmZBge8dy/whQ
	VrqAftgIHLtsB/VWoeHIrSc6m7wyFmc78mM0LLWpBF74aJ5/5R2zQ3ZkND7xkW+aeHa5DfBEAd2
	Mwd4SustTVXxs13QOFacF2vRIK+2UwwL5b8QR0GCQf57/P4PIiAwjSwTUAJhqSVhllL91XlWCUd
	dKPjZsPOgnHS1QIWBon0hccvlwLVTWEZQ2nAa7IrrZwjYp6og4qMogue+DEa7MlQtiaTP7tcKQm
	NkigoWA3y0zRbdoiU7pvjxJAwYdRVGorIQ+uD9ukT7X8pDdL1W4dNX66uVfIHZXfnJpliIYa4j9
	BTh3Tfg==
X-Google-Smtp-Source: AGHT+IHCLRyj5tGrglz7jGGJhi77SKkVODo7Bo744HBiNUOuH1yjjm2d3tWnAZzawQD4MlZx8yyBRA==
X-Received: by 2002:a05:6000:1ac7:b0:391:23de:b19a with SMTP id ffacd0b85a97d-39d87ac48c4mr2967406f8f.31.1744207118882;
        Wed, 09 Apr 2025 06:58:38 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5d82sm17370525e9.37.2025.04.09.06.58.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 06:58:38 -0700 (PDT)
Message-ID: <48eb2db1-094c-41e2-be93-e713e67f8cb7@linaro.org>
Date: Wed, 9 Apr 2025 14:58:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] media: qcom: iris: add support for SM8650
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2025 16:24, Neil Armstrong wrote:
> Add support for the IRIS accelerator for the SM8650
> platform, which uses the iris33 hardware.
> 
> The vpu33 requires a different reset & poweroff sequence
> in order to properly get out of runtime suspend.
> 
> Based on the downstream implementation at:
> - https://git.codelinaro.org/clo/la/platform/vendor/opensource/video-driver/
>    branch video-kernel.lnx.4.0.r4-rel
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v3:
> - Collected review tags
> - Removed bulky reset_controller ops
> - Removed iris_vpu_power_off_controller split
> - Link to v2: https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org
> 
> Changes in v2:
> - Collected bindings review
> - Reworked rest handling by adding a secondary optional table to be used by controller poweroff
> - Reworked power_off_controller to be reused and extended by vpu33 support
> - Removed useless and unneeded vpu33 init
> - Moved vpu33 into vpu3x files to reuse code from vpu3
> - Moved sm8650 data table into sm8550
> - Link to v1: https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org
> 
> ---
> Neil Armstrong (5):
>        dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
>        media: platform: qcom/iris: add power_off_controller to vpu_ops
>        media: platform: qcom/iris: introduce optional controller_rst_tbl
>        media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
>        media: platform: qcom/iris: add sm8650 support
> 
>   .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
>   drivers/media/platform/qcom/iris/Makefile          |   2 +-
>   drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>   .../platform/qcom/iris/iris_platform_common.h      |   3 +
>   .../platform/qcom/iris/iris_platform_sm8550.c      |  64 +++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
>   drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
>   drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
>   drivers/media/platform/qcom/iris/iris_vpu3x.c      | 277 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
>   drivers/media/platform/qcom/iris/iris_vpu_common.h |   5 +
>   11 files changed, 413 insertions(+), 142 deletions(-)
> ---
> base-commit: 0d6ed9e013fcc33da9676ed870454d2a014a5aee
> change-id: 20250225-topic-sm8x50-iris-v10-a219b8a8b477
> 
> Best regards,

For the series

Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell 
Inspiron14p

---
bod

