Return-Path: <linux-arm-msm+bounces-36126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352699B2A18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 09:23:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D841C214E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 08:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D488016FF45;
	Mon, 28 Oct 2024 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Np38qnw5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E54190692
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730103817; cv=none; b=odtMnPYunEDbxdG605AChsZKC2zeMs/jHnGW4oHWs7m2+SF2h2y2O/BmJI7gRdj1G7RK5Y5Vfo8+VUYUonfFiod7Hp/smfh4fnFVYlmnphoObh3qfiFqkXLMlqHpiiaZ9MrI/yLzTuxxCUIaX6N1uO2t+3XgEM4QVi+KBEzTNsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730103817; c=relaxed/simple;
	bh=/d+2IkSJCNwNIupVTrTEHcvMojPg0UGDOxZl2Lce5ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kaQOWLrGFURpJMOA6Fensjk9u3QTY92BiigcKq/ruPkVgras0VQKrITugR3nrKcVWfD1mjTBcspPQ9OY9o/MyNMPKBoWxwDJkWcpUiERJLOK+1EYU+xogB/VSUnw0sieGZBeL1KQ/VtvL2PxisM1EuqpIMFgxPojJZthQXjlX+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Np38qnw5; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb49510250so38100431fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 01:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730103814; x=1730708614; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GUoMe7Gw0VEvJOuEYm6YZ2LWFp8oPbVLGHudNKpQpt8=;
        b=Np38qnw5XBLvrNJIh9ho4hUEpUUgNw0XxofnA+YJaCviM+t5KyjTFcQHjk4ME07mcv
         Xs4o+5+FwhrmwIb+703IxUYxgJDcuVp1pIllAF1sTq3Zt7mKV08m9EV44bOf8eUfywsr
         l/U0qFZKF3ASgtQ0aaLHgwRN4s7HuWr6sVbqtibdlt8TFzm6616CYCOZmwlyiTsh4DZS
         /fL1wJiMEjs+dKNxHsBJNfjpm7nP6fRM/sS+Co5Cv+05h5wkEW4ENGDksOgqlhhFj101
         lZlPVcLvadNmRKrFvxAhZwFapQR4oZcONejlBpd+e/T6GN5xFnm9p+Cj9nev7C87E676
         IvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730103814; x=1730708614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUoMe7Gw0VEvJOuEYm6YZ2LWFp8oPbVLGHudNKpQpt8=;
        b=MY318M5HvUd8sfuthSW84Z/E6/3AMu2SA55H22DxzxwHlYi2qMu4yEjvcJynDMQlEA
         /TKsO+xFAIoHIlPi4xHWJGFh6eb5TfrtN6npLQkpScPrLZ5chQBgAw620AM5uRD9wfeH
         pAHDt+wxQ4E78sD2/6y1K5zja3x6K8S+3/2E20QWPvBYEwGofYzXnlT9p8xs0BMFTCrM
         p9O7iDX5J7Ci3KjGjkv+xs26oCEpQyiMjNihqhx/6jK5CitXaxKcg1VKHcDFe2lGiwPt
         rJGM/2uPZWhrnN8itVuPglIsIvAZXoX12U6u2SOtfazr54ulg+NHML9T3S/V4SONCwtF
         8RyA==
X-Forwarded-Encrypted: i=1; AJvYcCUrRVCyYmzjoQPRSjULdq3SKN4C9Uov/s+CLpiFPvX0PVFC4A8bz8duJ5RWTjDAMUzLS1eu854iLqNA9pGN@vger.kernel.org
X-Gm-Message-State: AOJu0YxswcdREe8ydZt0yN2Ub1PKEsYO/rbv+fmZE3Re3SDk/v6QwpjX
	ma3wldSeexHOIn4e5dUsz+sBuOPmJyu6gIXdzODap3r8h3iaaxyEW5UV4MiuvGQ=
X-Google-Smtp-Source: AGHT+IEhxspZK5wru21G6gRgmfpfz8XSi40k3sCmsCihw73y8CtFR9K4gZ8rSF+ukjO3fUGagpJSmQ==
X-Received: by 2002:a05:6512:2304:b0:53a:aea:a9e1 with SMTP id 2adb3069b0e04-53b34a1afd9mr3321756e87.54.1730103813913;
        Mon, 28 Oct 2024 01:23:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1af4e2sm1004236e87.170.2024.10.28.01.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:23:33 -0700 (PDT)
Date: Mon, 28 Oct 2024 10:23:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: quic_fenglinw@quicinc.com, quic_tingweiz@quicinc.com, 
	kernel@quicinc.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: Enable PMIC
 peripherals
Message-ID: <j4ggfrynyoriseef5r5x6uwgo6cespll2np7uitc64yagoa6pz@r3ro2cpqrrry>
References: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-0-f0778572ee41@quicinc.com>
 <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-2-f0778572ee41@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-adds-spmi-pmic-peripherals-for-qcs615-v3-2-f0778572ee41@quicinc.com>

On Mon, Oct 28, 2024 at 04:03:25PM +0800, Tingguo Cheng wrote:
> Enable PMIC and PMIC peripherals for qcs615-ride board.
> 
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index ee6cab3924a6d71f29934a8debba3a832882abdd..37358f080827bbe4484c14c5f159e813810c2119 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -6,6 +6,7 @@
>  
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "qcs615.dtsi"
> +#include "pm8150.dtsi"
>  / {
>  	model = "Qualcomm Technologies, Inc. QCS615 Ride";
>  	compatible = "qcom,qcs615-ride", "qcom,qcs615";
> @@ -210,6 +211,20 @@ &rpmhcc {
>  	clocks = <&xo_board_clk>;
>  };
>  
> +&pon {
> +	/delete-property/ mode-bootloader;
> +	/delete-property/ mode-recovery;

Why?

> +};
> +
> +&pon_pwrkey {
> +	status = "okay";
> +};
> +
> +&pon_resin {
> +	linux,code = <KEY_VOLUMEDOWN>;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

