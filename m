Return-Path: <linux-arm-msm+bounces-49615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0CAA4747C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 05:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFD7B3A3DD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 04:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0475217A5A4;
	Thu, 27 Feb 2025 04:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y14zn1GJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6DB28F3
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 04:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740630793; cv=none; b=S6qsd3fP1Nkb6l4XuD1T6ebFQLQRaNaNt3EOU4KZ5RIDRN7d+U7dLDhhZHRQjZCvS8NCdI+CvSFySNdmDwaacbAW2IBB7MfwlHMdS2VK1xZLmla1PUa/19VyqfHPqnQ5PYjHDR0Bw9ZFZ2hJoScbFbPmUwn8WQbxaCEb566tmsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740630793; c=relaxed/simple;
	bh=YtZ5CKgC1l5YAr+QgfvUWGH0Dop2tg9dyuK7ovDLanU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tc0Qla6fLs/FY7al7tRvHmGfDDLQcAfMFSmxEZlePUtlth+6vqM6ePM6Q0MFYEtD+dwFO4Gk3Q4+aWPc9yZ25qHUEb+0KJG+iqzcsaL7q3UUI1Aa8sA7QykiPeb+J8XexmtXDs3fQCByt561g6D0j+cUXd43sQpeP3Z4ABY9tZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y14zn1GJ; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-307c13298eeso6980521fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 20:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740630790; x=1741235590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=obscijDO91Mt88inTL4A7vtLGjjQitrqKYoQVkgXUGk=;
        b=y14zn1GJoYrYvUK/F8WVk8Qx/xlvIciq4I07zgZ2XzH+2lgpK8LxrKuVPz6kyc/sXK
         0TFg1k3e0uuEnbTkssAHm5a3+EpcLDs6IJ9v7eiYVxoJEOEeOaSgmclaPNGtpY72wlhY
         5Rgb4s0jBC4b1u+Qj1ITPUrMzvNTkvasrdWqmApj5Pei7wZr5IfCfdZBuFx0rmIySE/N
         yayS6ikiHsd3HWXTLRnYzTVeRhOywix84SSKF+ICTZVytj4dmJBB0oLyrqmr9VCSQyj7
         9Uj1yccnd3gkfxjAjtWvnUq/GsrhlRJvWCt5VR8Dm1kwznd/9uieDY0QTcCfYMnfuHak
         IHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740630790; x=1741235590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obscijDO91Mt88inTL4A7vtLGjjQitrqKYoQVkgXUGk=;
        b=LgHps9EH44TSJ7xLx23/NPNi5KjV6cM+gA/EQjZsxxnpGpMD5gjJl7uZtRe1UMndY6
         0yFFa38rCjebYcfpuG5QZQScA2nU4cJVkfQHWnR/v6PJbZ8VCXZayccrJyj/dRstP+cG
         gsY77OShuAzzi5VcR4DMjMWAt23z8gT5XWNaXZfX8o7ssn4nfyNUo+OWaMPvLymqU+HR
         QACh+e7AXbGsDRXOlWnQ1hGDqmqhryjs0fdo66Ez8sWnWz4526LvKeLzIaoOF+udpVcU
         sFo2q2fXga9zd27zGADFnyKub9tHz2g6s/AWo8rRcW80debiaUVDt/TQE2v7/BOSpX+j
         LXow==
X-Forwarded-Encrypted: i=1; AJvYcCWJbCEzmwgZKkql5KlJ2E/4WaJCN/5cciAiJam8P2oSHy10DzF7pVWuuQVFQFI/L/B7CSa//y4Ng2Bvc7V+@vger.kernel.org
X-Gm-Message-State: AOJu0YyP9LXYB6M1ZP8BTeeKG3a2eb/TqIcSr0a+RTX1Mthz6CWyFT+5
	r1WVgyjsdmUFbISKu+g5pJqovnro+aJBxQ21Pc3My1fR1i1bPvsaLluHNSBjTWY=
X-Gm-Gg: ASbGncvnYLxWRzKfKyGUTjT+Fn3ATqz22DfcUUFxXVLwjK5X/P5FzPPWKnXoSViMiEq
	HVHXa67suIJ44ApxV3yqPnaR9yVVevO20mqzehteJcQqE3GDhIVqOWv2tLK2XkeQPls6jCarBMW
	5v65Ylds8tAiGY7MOGtXZKUM9t7W4r3vTAIWSS7Np2BdrpLlCq3X794LtHHJNYqQ8/T3bk7eTFl
	8wcqa1xPnU3mPE5VmnuMXjcL1Q0gmGrQCHXyyEXpDfLX2+YRwvDRB7YHRhAFCt1Fbg83ssAVe28
	5X+qN5t3WiKX9IGPxggZiT59eIL4Tn0a1TWoZDZphrh+nFK8va4pGRj26IFWDlje3xLx1qMTHAU
	cC8c+ng==
X-Google-Smtp-Source: AGHT+IHn49HjynasOW0d3PE6ed9GscgrGPeAaHZGAfjQ6cYekzKg6vVVq5xB21jaMu9bNtfIFG8yJw==
X-Received: by 2002:a2e:9d0c:0:b0:308:eabd:297b with SMTP id 38308e7fff4ca-30b8464b31dmr7624621fa.4.1740630790326;
        Wed, 26 Feb 2025 20:33:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30b8685b31fsm610901fa.77.2025.02.26.20.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 20:33:09 -0800 (PST)
Date: Thu, 27 Feb 2025 06:33:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB to
 usb-c-connectors
Message-ID: <nnklm22zfnjiabjsbo7fsdigwx6nbcqjidhzynjyr2aunmk5r2@6m4dj45ddfge>
References: <20250225223038.879614-1-swboyd@chromium.org>
 <20250225223038.879614-3-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225223038.879614-3-swboyd@chromium.org>

On Tue, Feb 25, 2025 at 02:30:37PM -0800, Stephen Boyd wrote:
> Fully describe the USB type-c on sc7180 Trogdor devices. Most Trogdor
> devices have two USB type-c ports (i.e. usb-c-connector nodes), but
> Quackingstick only has one. Also, clamshell devices such as Lazor have a
> USB webcam connected to the USB hub, while detachable devices such as
> Wormdingler don't have a webcam, or a USB type-a connector. Instead they
> have the pogo pins for the detachable keyboard.
> 
> Fully describing the topology like this will let us expose information
> about what devices are connected to which physical USB connector (type-A
> or type-C).
> 
> Cc: <cros-qcom-dts-watchers@chromium.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../dts/qcom/sc7180-trogdor-clamshell.dtsi    |  21 +++
>  .../boot/dts/qcom/sc7180-trogdor-coachz.dtsi  |  47 +++++++
>  .../dts/qcom/sc7180-trogdor-detachable.dtsi   |  16 +++
>  .../dts/qcom/sc7180-trogdor-homestar.dtsi     |  47 +++++++
>  .../dts/qcom/sc7180-trogdor-kingoftown.dts    |  55 ++++++++
>  .../boot/dts/qcom/sc7180-trogdor-lazor.dtsi   |  55 ++++++++
>  .../boot/dts/qcom/sc7180-trogdor-pazquel.dtsi |  55 ++++++++
>  .../boot/dts/qcom/sc7180-trogdor-pompom.dtsi  |  44 +++++++
>  .../qcom/sc7180-trogdor-quackingstick.dtsi    |  31 +++++
>  .../arm64/boot/dts/qcom/sc7180-trogdor-r1.dts |  57 ++++++++-
>  .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  |  47 +++++++
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  | 121 ++++++++++++++++++
>  12 files changed, 594 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

