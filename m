Return-Path: <linux-arm-msm+bounces-73560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E7B5778D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 13:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 094D5189DD3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 11:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87EA52FFDE8;
	Mon, 15 Sep 2025 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZ4cQqEy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A827D2FC013
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 11:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757934159; cv=none; b=sudpzHNtzBqqJ89KQEjmC7/aRQKau9+dUbT/uIdKutfUPFIofOxxvCtbr6cfDxOM21SW4y3TvDT7dQ9q+8lM3pIzmCb4pQFg3//UOoMEqINDGFXwDpSWNfEb25QfP+Bt7cnEn3JvGiUuim6cNGSWbE3ClFZijA3/fsCO/sI9kCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757934159; c=relaxed/simple;
	bh=iKMAgW0jQTDxBTsxxTn3NzLbmR5UC1qx3JVqLTQyo7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPUn10MA2TkOoy3Kez2dnU8Imk/c3Q1s1pnBC5xLgusKuyO5et89jdl0z5lCj83PiCTYZ3ZkpiALJag65ZakqhrSECXbTxpzNzGARf5DgXtvmAYWYeJnKHDcLvwqzbTimEmZcfqYuloQsm0HklCdzLt2xVNXSTDUFcaQj416jiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XZ4cQqEy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45ed646b656so32209515e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Sep 2025 04:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757934156; x=1758538956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXVKXBL0yz+l6XWANTUIZ7DjyjmDmj0eECvduqIUxgA=;
        b=XZ4cQqEyHD6x/t5/XpLJ1HnQFMrIlWoQUkHNrcm9EGLe9JlwsPergrwjPgM6caH/Qo
         gpNHmGXsOWij6FKjwIhbe5BUxeQEGWwTiveDzUyCa8zP4L3tceBz1AudclNBiGkRydE5
         kt698gaEZrbkX0mij9WX+nML1t5PVbPBatxRyazfZ7WRICd+6q7b7ca78Oiax/CvNAUy
         G67bpaj91zIccIzoh0AXdeWQ86UQpYdKyC6oSlAE79YeEj6dtXJU8aMB+0GGitIf+3Js
         nOGRfjuljdoXC4VbMseIw6CWfWNOoy+J8/x5ueAIB7/4vw1IE/Shhti+mIglDs11uCSa
         ZRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757934156; x=1758538956;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXVKXBL0yz+l6XWANTUIZ7DjyjmDmj0eECvduqIUxgA=;
        b=XAWitFzliaeKl5NWdYwci4/wwKPzmNDWO3HFsQ8JxKPBZJyz0nuoNRLK+XQhz2E3/N
         S5G6wxH3gByIjp47XFlY2lZZGl5CvsKECzA7L/iuOgYTe6dqqN7Plw2FOmdVaQsGoudN
         0XCw6D61qYIVpXrTsnicY4Tx5O4IjswfqEavy4CbqM41c9vjRX/jdQgdl9+znJVym5tu
         4pUmvxetZNRHrB3YDmzZAUidAmuueNFJ3jtzToLKP/qq8GxRhzvVIUK8ZQhKKPphMRDy
         q8BCHII+/80UfPMO7K9LJcj2pz7i5Org7kVuh+7/lwfAEeMVqvT5xFfXivTVlGldBoUU
         OVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCX33WXtMTfi8eMdqnDrs4YJ73+nG0VS0gnWYcb/4+30LckL0ADMxLdboRK8zEcXNSGHYZtxBuQsghat7KuF@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc5BPSy0BebaLMCogtjuWCZ22o7MLoNQlPKWLhFZaKlfPu+Rpi
	CkJz4Exmr2Z3bF68lrjfTThuym2f8/av3p/gbzoauHiQfpgVh3TFkYXwoNDF1Dm2btU=
X-Gm-Gg: ASbGncvoFU/ixT9JhXMSQ275J9yB21wPEI5Zu+l6ao+n0rWuqJQeyECtIxX1t0rZMUM
	XzuLC74BTOdoLQFplS4i+IgAfFwo4IkvR1QaoF207ZZLj6yh3wtgMhd+ln3gT/cdKJebENKRDEf
	XAbk17UmHcK3CFMYYdvTZBjD8mOW+iZ1bT4wKp/yAjVP0WiTp7kDnATX9JCRHvdtsgz5coBYcWs
	LmesgnIG6QkN4B+dSbW5IaXS800HdD2ff/U/pU2OmtVv4j/a4RxFYRbzT4EjE6SBnM7Su6wIq7C
	/Dp9v7MNY8vdrRxn5ThbkTrDq5dMlj2Pl2LBUJpUIU6gI8OzR2urWUJD8pndF9QxLnWhZPewGPg
	lo46xtwihh/EppxcGgOQmCpDTUjyd1pSkhd6M/zalqqnMnIGmX0dB7tYZhr8rhs1o18fyoniAxD
	ZHdyTFxa+szD6OgrtxZRo=
X-Google-Smtp-Source: AGHT+IFJ2l0baeyUrazrw5RINbL47twbhaJDHL/xHhmxwbAzaNs77RYQey961ZxCrNsm4Oc2tjkp3A==
X-Received: by 2002:a05:600c:8b4b:b0:45f:27fb:8017 with SMTP id 5b1f17b1804b1-45f284e67cdmr67539695e9.5.1757934156029;
        Mon, 15 Sep 2025 04:02:36 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e037d638dsm168083065e9.22.2025.09.15.04.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 04:02:35 -0700 (PDT)
Message-ID: <85b6de36-4f0a-41f4-a803-77355d5da3af@linaro.org>
Date: Mon, 15 Sep 2025 12:02:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] arm64: dts: qcom: x1-el2: Disable IRIS for now
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Anthony Ruhier <aruhier@mailbox.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>
References: <20250915-x1e-iris-dt-v2-0-1f928de08fd4@linaro.org>
 <20250915-x1e-iris-dt-v2-3-1f928de08fd4@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250915-x1e-iris-dt-v2-3-1f928de08fd4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/09/2025 11:06, Stephan Gerhold wrote:
> The reset and IOMMU management for remoteprocs like IRIS is implemented in
> the hypervisor for older targets such as X1E [1]. When booting Linux/KVM
> directly in EL2, this functionality is missing and the PAS interface
> normally used by IRIS to boot the video firmware is not working.
> 
> The Venus driver supports starting the video firmware without using the PAS
> interface. The same code also works for X1E when using KVM. However, for
> the new IRIS dt-bindings it was decided to avoid using the dummy
> "video-firmware" node in the device tree to describe the IOMMU [2].
> Discussion is still ongoing how to describe this properly [3].
> 
> To avoid regressions when running using KVM, add a TODO in x1-el2.dtso for
> now and disable IRIS even when it was enabled by the board.
> 
> [1]: https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> [2]: https://lore.kernel.org/r/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/
> [3]: https://lore.kernel.org/r/20250819165447.4149674-12-mukesh.ojha@oss.qualcomm.com/
> 
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/x1-el2.dtso | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1-el2.dtso b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> index 380441deca65d1b443962fbe6151f4aadd918383..2d1c9151cf1b4aca79f7ad67328ffc3c721b9dc3 100644
> --- a/arch/arm64/boot/dts/qcom/x1-el2.dtso
> +++ b/arch/arm64/boot/dts/qcom/x1-el2.dtso
> @@ -12,6 +12,11 @@ &gpu_zap_shader {
>   	status = "disabled";
>   };
>   
> +&iris {
> +	/* TODO: Add video-firmware iommus to start IRIS from EL2 */
> +	status = "disabled";
> +};
> +
>   /*
>    * When running under Gunyah, this IOMMU is controlled by the firmware,
>    * however when we take ownership of it in EL2, we need to configure
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

