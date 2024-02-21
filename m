Return-Path: <linux-arm-msm+bounces-12034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B86F085D803
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 13:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20C9AB23258
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 12:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1490969942;
	Wed, 21 Feb 2024 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IMbIAvvx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC5B6930C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 12:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708519148; cv=none; b=HmrP654kp/G4IQGbBHof9YfR1KK0S6CUbaSAAyxjWDtnNdljd8MpTHfP3qOrMR7i+FzQT4SQ9clLqlPwPLhKoOlE0Kg5HWtNcWX45a5kdOauLJ7tz06lxieA6FKGmRislJnJEyKV6RvpzSDhALnTDfmZFNwz3XSkaAw+4Tmi2yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708519148; c=relaxed/simple;
	bh=TnCYrVlMAEj4JGct0x0C+MCjGej53rLLfJWT8uFiK1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcHt1DSyo++EzNk2gINCmqwqQPX+7SxbFXINXYtHG4d7exo0BiEI/htr7uYpz9N/TKqfrejrcXDmP05+RyJ6tYpvuIjIWT+Qnhuj3/aY1gpR8f8uqVOrbcGcTmHQCDozT7b4Cq9ZiwcJSOSYAEiSSQgLPYA6WsylVspqLyGXGPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IMbIAvvx; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5129cdae3c6so725954e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 04:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708519143; x=1709123943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYeuyppugLflRNVzH8TAb7o8jn2ofICIvCXSssHvo4c=;
        b=IMbIAvvxny+YZCa/pnJSrDalL4/F8lGMq4C+RmUNOD983ohfKWSlohT1q3cmbhMIlV
         /HORdh1RJEwN7KLnO4xLAQShL7HqjzHf2Glf4F/VSz9oT29R6DAuyHn96hWTQ+FmEcTp
         V330YGg5Aj7gxLdhff4eQWt9LHNdwbEPaXe+kLmIXxdnxg2axOLkFKMji1I/VzIb2DBZ
         VItuzPM2/LO0j6+M3crZJp2d4S3gt8qZMjMphrRt5iJgfG0GxC/jCBcQcBJOLfP8EiF+
         MYs6opY95GGhcqAWxNY+1NioPHZw/XKVD6aZ6oVwlefpDTGng0Vk04nt/OErjIVMRd20
         zIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708519143; x=1709123943;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYeuyppugLflRNVzH8TAb7o8jn2ofICIvCXSssHvo4c=;
        b=O/XuVVYx4Kd67UeA/FPF1rT3Yp48d/ooMKiERXKpd8+AVFW4MErhxkFtozFX32YAvn
         SlA9zcYsafYKgkWxh6BCNGX1dgQSh8NyUNE7Y8FARHMxxY2o4Wj7eA8RCVDBF1KuxaR8
         xJER3B8zE4LjDyeQp73bpPt8RmOiXQ6Wu2r4j3wF8Fs/ajsdGecB88xZ5oilb9sfmdld
         78epH7EHQhGF8nGWpp1KfqZQMJ212xg5w4J4rJbreNb4YGegqfFB4aDtQwr7y0m5J/tB
         Yw/vMQ8mGTcWI+SkqK0ufCT5XF752Pm8+xucRZyrc3jimYPDu7wsLc7Y/P5e9Y2ID2mx
         Bi3w==
X-Gm-Message-State: AOJu0Yxm/Q80CuyklIi/Zyj5oSoGhNqaBqtxAxHGEjzfYZJyMCDCcxiQ
	rsYjFzJ+ZDiZjLxMiPEup8pKhrLxTeMKtSIUIps36qAs5x68FjLuvQFAtn/QhRk=
X-Google-Smtp-Source: AGHT+IHDtSjnXmA0nn9poXI5T8J6HgDj54PdBjMLPUp030yba5bI4wq0rDdcM0l2f+N8J7SKjb69Nw==
X-Received: by 2002:ac2:5a4e:0:b0:512:d86c:42d1 with SMTP id r14-20020ac25a4e000000b00512d86c42d1mr68316lfn.45.1708519143522;
        Wed, 21 Feb 2024 04:39:03 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id bp25-20020a056512159900b0051148f220ccsm1631678lfb.285.2024.02.21.04.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 04:39:03 -0800 (PST)
Message-ID: <9d6c617a-bc3a-47c4-a988-b41b804d8cfe@linaro.org>
Date: Wed, 21 Feb 2024 13:39:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/21] arm64: dts: qcom: sc8280xp: Add PCIe bridge node
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240221-pcie-qcom-bridge-dts-v1-0-6c6df0f9450d@linaro.org>
 <20240221-pcie-qcom-bridge-dts-v1-9-6c6df0f9450d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240221-pcie-qcom-bridge-dts-v1-9-6c6df0f9450d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2024 04:41, Manivannan Sadhasivam wrote:
> On Qcom SoCs, the PCIe host bridge is connected to a single PCIe bridge
> for each controller instance. Hence, add a node to represent the bridge.
> 
> While at it, let's remove the bridge properties from board dts as they are
> now redundant.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  8 -----
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 40 ++++++++++++++++++++++
>  2 files changed, 40 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index def3976bd5bb..f0a0115e08fa 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -733,14 +733,6 @@ &pcie4 {
>  	status = "okay";
>  
>  	pcie@0 {
> -		device_type = "pci";
> -		reg = <0x0 0x0 0x0 0x0 0x0>;
> -		#address-cells = <3>;
> -		#size-cells = <2>;
> -		ranges;
> -
> -		bus-range = <0x01 0xff>;
> -
>  		wifi@0 {

This doesn't seem right, pleas use a label

Konrad

