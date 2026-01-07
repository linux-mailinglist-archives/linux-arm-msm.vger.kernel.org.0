Return-Path: <linux-arm-msm+bounces-87775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1D7CFC086
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 05:59:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B185B303DAA0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 04:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD9F257830;
	Wed,  7 Jan 2026 04:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k4uJpw0n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E1124E4A8
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 04:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767761967; cv=none; b=QXgu1Z488hyk9h/s8E8YsfBPMJ6XGIbAym5BIYYb0RI+RvwLx5OFhBO1ADqQeea+aPa5WX6+JO/TfbqVq46vVHt1mKirQw8riDtpsJ4EwnvMZwd4Sloac47y34cwtYjR5O5Pp8tBaZHzrjWU5vZ4jUYcgmwj6oBrihQCP4ySKic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767761967; c=relaxed/simple;
	bh=8ayjC1pw1QgU/U+6p7ezCG4vcZstIeW4+HvogWqFNdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bkKaiA2yDchL3hZ8/orUSbpbz+u2n2T2CcHPLwu2Dt8Y5lgYzUY0wTtMHjn/NTFKjctki6WgLh60GOwiYCVdP75gdbitABFetfJ795ke6CXKN287Sjj5hJl1/o7eqQrIQhtgk91i9eDfLSMi9KkbHMNboHinnnRZbJcPeKqxGfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k4uJpw0n; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-382fbded00fso1139751fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 20:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767761962; x=1768366762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpaDww3Ahj2lTPiIw3h+P4X6jy6j4Poz5P8K1VBVmPo=;
        b=k4uJpw0n8AkhYVl2GjBKdNuOLcZ5Ds7p9Sft8uCncZfZBRFLjLOyCp4B47E1XDZ1Dy
         nzefpzQZGFfIibASL00vHAHcyXqpKjAKEFUuKuGO8h3VNNiIo0wrkZctHGmPEkKLqNAi
         4nbMcVqs9aB2+G6Ft1EdAKo7ke3tzTr1RnRBtCByZhEFHJxas+2M1rNixXbeF9HkJK6C
         V0J9b2gYm71QKfPyisOaY7tk1pL2Qx9/2skvZJLMQi/M65OJp0SplbIbeSZWcEGjx7bO
         5cR6CsMFQdEGY9cBGeopSP8i/GTWxjLVJl8uHdAkkrjX8KWUNjWrUIDcGOfc9QyQerX0
         O6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767761962; x=1768366762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpaDww3Ahj2lTPiIw3h+P4X6jy6j4Poz5P8K1VBVmPo=;
        b=P/cU61qMbZ2aoFGqCGU8/CzPkgELw7QIVOoOawf9ATcsPFwFML6rdGcEK5+hNUnrz5
         hvEMuhjsBaNh8WuoCHq/Md8MlEj9kx8WkFIUBjXnNlQ5mknGST0HK8u9TpyCZfGM+ieW
         EIb8sVMN59HaU+xtx4UOSxLcH4ge3Q3sWZytaZvhxksHBTcmBBLnbewoTx/y7nstgf7J
         y3H3bgMJRYEFJFOis6uB/0kn5tv6SDUiagoD/XF3jz4D7TVQYvzzCmWFCIyNmG7I0hAz
         5eW7ZMh1f6jhoO5dU2iz6sGPY7vO70j7+78JNB2Uh9YHjhSPH2dnuuNmAz9H4wJ3S9og
         o4gg==
X-Forwarded-Encrypted: i=1; AJvYcCVuWEn4QR2d0uTPcsBa0j4nIRq9zGgckt59ZW1W1u0F0Yup6RkrdxiWdlUcn64CFkJnvKe/bNGS6M4E1yAb@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+zjrrUDQtifpSdDvC4YZCGfcfCk5c8TvYRI8dzP610O7IWNlZ
	fcpcUj/pMgdgRL9Ns80ColwYo2AVEiFpdDs0L+mT5bVZaM/zuc9YT5VVxHV9FoXYJUA=
X-Gm-Gg: AY/fxX4XBd1fqPerW/dt3UbRwBoZ0zYZ35kPpRcsv/jWnL+jVYdL/c34Kd+9iRtjGca
	Cit+eSCtZLcm0zE5qZiHNGNpAMYOAW5CnRoYF5SzkL1/iSqwr6Wp5RVL/P6p4AXNclJy4lX63QH
	aeRrDBxhyFuhW6l/YLRAydy8qKZgI790rVgpaCRv+ZoglT/j9qDFpgte7Kr0iy9+vy/w4fvMG8d
	6jqpI/G5nBrOEuxi73Bfnk8PI8m3RDoc3Vmddac+cUzzbyHzdsIwVXBydiJm5ylAIKcegVokIzm
	M6gH6QSRedT4lYIyP4WR4azAcvG0U4wMLRM3P+VmIUNwZch6BoubAGQsz4P3QMvBj2NbyD1SVsv
	n0uU5xI7mRDOp2QFRJuDaHdvn9X2jtwWWSLsE+5BetmepM1Y6mxvXB3j3msBdQX20k7Iyd4Bcyo
	VWrhv+I4iniTAGmFt8LoA064fMV5E4ZiJlG329pPumce0J6ghv2C9nS9mT+sefI8BUXcSJcwTNw
	CAa
X-Google-Smtp-Source: AGHT+IFaxz9I7SxHKBSLqa991ssFTR2Wj4rTr7PJ83MaGolYYv4zzgp8G4eV7mqAU7xUX3mc+fdLyg==
X-Received: by 2002:a2e:be8c:0:b0:37f:8b25:a327 with SMTP id 38308e7fff4ca-382ff58718cmr2576611fa.0.1767761961920;
        Tue, 06 Jan 2026 20:59:21 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7c708fsm8961761fa.21.2026.01.06.20.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 20:59:20 -0800 (PST)
Message-ID: <6aa9932c-a0d4-47d4-a884-f25b46ae130c@linaro.org>
Date: Wed, 7 Jan 2026 06:59:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: sdm670: label the camss ports
 instead of endpoints
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Robert Mader <robert.mader@collabora.com>, Bryan O'Donoghue
 <bod@kernel.org>, David Heidelberg <david@ixit.cz>,
 phone-devel@vger.kernel.org
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-4-mailingradian@gmail.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260107043044.92485-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/26 06:30, Richard Acayan wrote:
> Endpoints cannot be pre-defined since dcf6fb89e6f7 ("media: qcom: camss:
> remove a check for unavailable CAMSS endpoint") was applied, probing all
> endpoint nodes and requiring them to have a remote. There is no sensible
> remote in the SoC devicetree because camera sensors are board-specific.
> 
> The ports are meant to be extended by a board devicetree in order to
> define fully configured endpoints and connect the ports to camera
> sensors. For nodes that are only meaningful if extended, labels are
> usually assigned. Label these ports so they can be extended directly.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
>   1 file changed, 3 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index b8a8dcbdfbe3..3eb4eaf7b8d7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1776,28 +1776,16 @@ ports {
>   				#address-cells = <1>;
>   				#size-cells = <0>;
>   
> -				port@0 {
> +				camss_port0: port@0 {
>   					reg = <0>;
> -
> -					camss_endpoint0: endpoint {
> -						status = "disabled";
> -					};
>   				};
>   
> -				port@1 {
> +				camss_port1: port@1 {
>   					reg = <1>;
> -
> -					camss_endpoint1: endpoint {
> -						status = "disabled";
> -					};
>   				};
>   
> -				port@2 {
> +				camss_port2: port@2 {
>   					reg = <2>;
> -
> -					camss_endpoint2: endpoint {
> -						status = "disabled";
> -					};
>   				};
>   			};
>   		};

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

I'd suggest to split this series into two, one for the added driver, another one
for .dts changes with the dependency on the sensor dt binding documentation on
the mailing list.

-- 
Best wishes,
Vladimir

