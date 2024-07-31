Return-Path: <linux-arm-msm+bounces-27590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29591943948
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 01:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9F84B258D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 23:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583ED16DC07;
	Wed, 31 Jul 2024 23:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M9IMll/j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF3316DC02
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 23:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722467625; cv=none; b=gbRyjHneKebcyXtI6HGkmJ2ufE2K9olGnO7mOEIL+KUsGJx9sZ59FdxSIkTJMFDusJ58rfM6GUzVfVXaSQRbRbTXlj/DUSwKoaA3Uz3iFO9CMHeVhori8wQLMi2Ah0HIWPLSwjDcC2+T6LXk2aJMU2Gg5qbz4ESTkbacRfepMyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722467625; c=relaxed/simple;
	bh=VyJpcTQ4QOnZkSwkJW7Hc93Gms/6UVZFKZBOeAtTHFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XA0asQDNr7W72ziVn/AI9aHko8xm0d0V4CcbddtHaygU1Q200P0oQ8oeLopebdAQ4Hrrmom9+NPNirWu7vQzkNKHncGnNU3qFYmi5lRfOru3AfIQOqjcxZJKPOCR2eNxyAhVVU3QqJ20X8qN9lPS1J6Tny12bt6eoBs8xX1tW3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M9IMll/j; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52ef9bc3a64so1016847e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2024 16:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722467622; x=1723072422; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nm0Xwjt+29MOSwfuccAriuqumY0vc7/Lx87pSACSnGc=;
        b=M9IMll/jhPcIZZErPZUpVobxjMykBy655FwYzYC4W5LWZUk7PWfoRBQhGAxhprX3hc
         f+TeZpitKM3qF4Yh27tdTJAI/oHN9gz17bvQYxLr6aYkcJzaXiTYHR3SyiFMyWioPfDI
         vCItZY+P4s3Y6KzOx8pcEBOUt07eBNDFoCOQrSrZ7ItirxWRXRdVta74+88jDV8pWEMy
         FFYZyQH6OLPiwLtpQTd0isbuITqh/RO+cqSL0FdwYR54iTw7UndKBs/G+hm2tR5Zv4Be
         sBwXaAy584eXtwwE+B1Vrw3OWAGb4pT3oDnws6gwN7RiZZDgl1f9pLiSPkDLjPgdGm3J
         on7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722467622; x=1723072422;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nm0Xwjt+29MOSwfuccAriuqumY0vc7/Lx87pSACSnGc=;
        b=km5xXCWFZz64bvrJb3rHUgQl4+nfVMP2XSwOicTHL0VeIvBtMipSNExj9ju68fQHyc
         DgQsROhD14rBMH5Cj5GSC+12+cg481sAjx8boWaxWH9TKhziFTJ8uwo6Jy5GXCg9SO9x
         g2/JGL6e69ngTpkaCydei+0JBMvMhCR2mP38lHpwpjZMGl1zE55AW3qTdRKoYuDcy07M
         +F+G8L3jJMFy3f3GMe+RyCKr9mPLtEz5NZ+SF/+0foJ8AayOrZu9qMl4rgIQC3Gj7ZDH
         orJUcAm+2QbSWqdDXQpA8yLixVsbb0+Ze+iZyrTBC/oTh8/Zc/m2+JRjn52AudFTg14x
         hLtw==
X-Gm-Message-State: AOJu0YxXLyWtCtADvHgfz9k8pSqC0LjnhRyogvCArwPjpZFBunXLZKa+
	TL7qKkYq+1nwUwwrU0o18xHuhCQZgkCddLtadHEXITE04HxFtOBWX5N15f09qfA=
X-Google-Smtp-Source: AGHT+IFtA548ZKHz41CyPsrXPin66nMAe94DZLZT2aDUq+/ZTHUGdm+iBpDTOUKzJpBgPlCMMKm6xw==
X-Received: by 2002:a05:6512:3d86:b0:52e:ccf4:c222 with SMTP id 2adb3069b0e04-530b6210ef1mr134150e87.9.1722467621495;
        Wed, 31 Jul 2024 16:13:41 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530abeefd04sm671995e87.121.2024.07.31.16.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 16:13:41 -0700 (PDT)
Message-ID: <e306073d-b0ba-495e-a19f-d433c74f6666@linaro.org>
Date: Thu, 1 Aug 2024 02:13:40 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] dt-bindings: clock: qcom,sm8450-videocc: Add SM8475
 VIDEOCC bindings
Content-Language: en-US
To: Danila Tikhonov <danila@jiaxyga.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
 vkoul@kernel.org, quic_jkona@quicinc.com, dmitry.baryshkov@linaro.org,
 konradybcio@kernel.org, quic_tdas@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org
References: <20240731175919.20333-1-danila@jiaxyga.com>
 <20240731175919.20333-8-danila@jiaxyga.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20240731175919.20333-8-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/24 20:59, Danila Tikhonov wrote:
> Add SM8475 VIDEOCC bindings, which are simply a symlink to the SM8450
> bindings. Update the documentation with the new compatible.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>   .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml          | 2 ++
>   include/dt-bindings/clock/qcom,sm8475-videocc.h                 | 1 +
>   2 files changed, 3 insertions(+)
>   create mode 120000 include/dt-bindings/clock/qcom,sm8475-videocc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index b2792b4bb554..9186d2ee87f8 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -16,12 +16,14 @@ description: |
>   
>     See also:
>       include/dt-bindings/clock/qcom,sm8450-videocc.h
> +    include/dt-bindings/clock/qcom,sm8475-videocc.h
>       include/dt-bindings/clock/qcom,sm8650-videocc.h

Won't be needed.

>   properties:
>     compatible:
>       enum:
>         - qcom,sm8450-videocc
> +      - qcom,sm8475-videocc
>         - qcom,sm8550-videocc
>         - qcom,sm8650-videocc
>   
> diff --git a/include/dt-bindings/clock/qcom,sm8475-videocc.h b/include/dt-bindings/clock/qcom,sm8475-videocc.h
> new file mode 120000
> index 000000000000..231cd153052c
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,sm8475-videocc.h
> @@ -0,0 +1 @@
> +qcom,sm8450-videocc.h
> \ No newline at end of file

Please remove the added symlink.

--
Best wishes,
Vladimir

