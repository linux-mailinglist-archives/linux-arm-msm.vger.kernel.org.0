Return-Path: <linux-arm-msm+bounces-23270-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0082490F687
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 20:53:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9598B1F24659
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 18:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705FC158853;
	Wed, 19 Jun 2024 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ju4oL1tG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD66B157E88
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 18:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718823208; cv=none; b=AZWp63yIBme2r6yWMgWWgGCIm3OYdlo+3oUJLCJNu6Wvg5j+hKkkGarg2oeWVdHb9LkOIgnqiBQBisJGY7thVWiBiVOHfBMiuX4MW+aaXRcja8yjdjgdhDBcSRLFDEdpsjSz4bBi9/E+zMT1WV3jH8nB8yBAlqNo0pgq0i9caHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718823208; c=relaxed/simple;
	bh=6ztxlcGn2AnKYupDKfTVBswsDooklpeALUwz5Hks6k0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BM0/5+7b1RbIGfuVTKCnjo6mqk7RcuhGgYBec9Aw8ovpH6+aZv1EkGuRemqmy1zEZmQzA+cu1tVa5h0UALSyx6qbOvZD13n2s4nPaVy7rLho4ukkE6PQb1b0HL6bY8WtxtwxYF+E8aaM0fAJTrt3MpthpJy4DjnC0URm/wjzbRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ju4oL1tG; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a6f11a2d18aso7315666b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 11:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718823205; x=1719428005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P7VU9/vkRDVLt9/hPKpilxcIBRsUkpFlhfPUk5mASuY=;
        b=ju4oL1tG+Q8KokKWJKgP2UH/tFWgy4Ze323w6PSgbhKNA2LGHii9nJYph1YS6w18TU
         oQHr4ZdbNlwRZlPeG9kZLUfPtwupZ42Vqjl9vLuZL7jTosKUlMoP2I5IPbCz7qzDfj79
         xba02wdRMVZ6POa4e0C16F5fm13X57gg2IqPIOHfSpIXf7g1RakrYHu0P+DaRcghsIaA
         bdJAstYpzM7S48UuPxwDiU3dN6XNWo2CY1CBPCr9VEGCV2eXCjmah6RMDRIQRngw4hKK
         qttdEGG+mSrc6GWNbYuNGTaFhaEUBiI9fYxpU87L4CxXyNEcPtzcfQ4CUD4oPK+6Gk/P
         Notg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718823205; x=1719428005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7VU9/vkRDVLt9/hPKpilxcIBRsUkpFlhfPUk5mASuY=;
        b=atvK8AMS6YElQLambTP1W4Levkg1j/gTQlIsc/0WyTn1SaLM6ecGLK0gxipCLspChq
         jWKKFjJP0mLObcw7xATGFpEHjjGotes5fY+xbmctN3Qn0dbaop15ad20jk/G6Y4ChWf0
         JIjC5Of6mEZDcWRlpKFFpwiLd0uMCPYDf03jsbidAm+aWYGE2jWKkrVyolFRx+xBm7Uu
         tYOYlI/hb6PyezQzhvZ9/Gl8oiR43xndZFfhbOpgWCxtHxgIq1SxOqWBEdajkT3+X4OH
         iKuLeBmZlYbEgWxPIEubBLzLU1KePZxIrebl0J8cVfe5ArCzJ4WosB/OJNkNzjB9v+r7
         v89g==
X-Gm-Message-State: AOJu0Yy4mmpWvCGxmhjpbu1jid65SAWR4+xDBeHCbxLGVNTFZO/k7dpM
	o4bh+RxoEBxpGZHryahb5pviHVUAluQA/FFG1Pv2so3aQ4+9eCVg7N3u6IEaHyMw3jOHUh5iM6Z
	zDVI=
X-Google-Smtp-Source: AGHT+IGEsELbvieDunRcJVYAsix732u6ngRuAFNR/W1C2IjEg6EVXJ5enNfrAmSOVV7DyNRmLm/IRA==
X-Received: by 2002:a17:907:c5cd:b0:a6f:aef4:a28 with SMTP id a640c23a62f3a-a6faef40a8emr176598266b.65.1718823204545;
        Wed, 19 Jun 2024 11:53:24 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4dba:9578:7545:6874? ([2a00:f41:9028:9df3:4dba:9578:7545:6874])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56ecdd4dsm697972266b.140.2024.06.19.11.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 11:53:24 -0700 (PDT)
Message-ID: <b8338dba-f7b7-4124-8fb3-8171284e71ce@linaro.org>
Date: Wed, 19 Jun 2024 20:53:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p-ride-r3: add new board file
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240619183255.34107-1-brgl@bgdev.pl>
 <20240619183255.34107-3-brgl@bgdev.pl>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240619183255.34107-3-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/19/24 20:32, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Revision 3 of the sa8775p-ride board uses a different PHY for the two
> ethernet ports and supports 2.5G speed. Create a new file for the board
> reflecting the changes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/Makefile            |  1 +
>   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts | 42 ++++++++++++++++++++
>   2 files changed, 43 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 0c1cebd16649..916fbdbf5631 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -112,6 +112,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride-r3.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
> new file mode 100644
> index 000000000000..d7f0a25c1fc4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023, Linaro Limited
> + */
> +
> +/dts-v1/;
> +
> +#include "sa8775p-ride.dtsi"

The board compatible (and name) should probably differ

Konrad

