Return-Path: <linux-arm-msm+bounces-39195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AD79D96B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 12:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CB6228A5ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 11:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49FC61CEEBE;
	Tue, 26 Nov 2024 11:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BzTTd4ZU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B651CEAD4
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 11:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732622100; cv=none; b=iYBN0MZfh7Bbdl7Vsx0E2UfS+wXa9beeKw64MVrTOdpjPtxj4592LaPavsB9DmHf7lBDK97uI11bo6eRNq9QnLO5oB7Alo2kN9md80XIifGDV51d7tnGZstaAq8DM7kQIeyp4teZranWhvRe9Z+OOiFAzPc1UqOxpkDfAtLexYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732622100; c=relaxed/simple;
	bh=OyR1cjFe4D0ygF2xs39ZVl8/TK35NmG554zz2iOHzYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qS0hLHbwHlV3lUN2nWykeaEy0BgthLt+m7M/RbYX+S1/6d+huuV7uFG76LQsq4ePhzMNA8YufxRl3Ss65hWiQZTcHGYVFncs6z/DSxgu4laOCh4OwbX6ZVZlZ9YRkQXuMW/NdL4kiwID9EjDu9IcK2erblwgY5+K6A05isx/ruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BzTTd4ZU; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53dd668c5easo4072951e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 03:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732622095; x=1733226895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U9neqLISga2bW2owg+smL65QWoZZ/0O0GLrxXWRBoLY=;
        b=BzTTd4ZUAH3QY4Z0YzF1EQVQ4yZkwB4jaY50mQpNZbhIfMonPlyLBTcv2Pt3E8kWkt
         a38Sk55xwjViG2nZwXEk5oRM5JqhrD+ETYD5OEVUAP3npbKWOedETaV/n+QqQWioM8tu
         1CT8ph6s4y1/pjUdDiE9NVhzoF8gETPjBLUrlYy1dSMzJUJmvKWpfCsTfnDfGfPCQBLy
         7TNZNHEsjOJNl6phUMpEmNvx9Vg0WtwH8Jo8K1xBaghc0S8Sg7G5yWkVnApZgBPmteYc
         quenRXw+vj14zk3A7BQbd8W2j/K9ImmcHLYhFjCOMwWoteknojUHDxWLhuUWgT8/hLzc
         URsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732622095; x=1733226895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9neqLISga2bW2owg+smL65QWoZZ/0O0GLrxXWRBoLY=;
        b=QhsNZb/RTe7nrCxV2l6h0T35EcjLfZB3NnXUlJdzik2iUSIdO4PRqJDNokYoGw3Z7r
         5M9EPm1EsrKXBVPDquD9Bju8OCDL0+tMBjxUmFQsD3JZp+UdMv/myGUvHspem6cMmfG5
         k12oBQFPsSqpOhyXc5ckNaDr9V/+Q2M8CjClurcDssEWz1VWYieS5ZhK69ZmABorLI2i
         VCuK9s9aOCTRM26bct1XnLaNZuilGIeK0CGKo/eHwHpAAA6Sk5EdTvZ9GqVAfyS7emqQ
         jB7WtNqMqjFi2yzWQKbLbRjF4IKxzZEHaqSKshLDw7/m7DZtW7snbr6G+UiRor32+EwG
         gNXg==
X-Forwarded-Encrypted: i=1; AJvYcCVzqNbmHcbNNIf/fbXsSn0AEVkGLYJCUyhi8Y/g5+afkakL3Jr8pcSjMYv9Pigq6MzlVnuM6PU+YaqECDsN@vger.kernel.org
X-Gm-Message-State: AOJu0YxeyqmTicf3H1YhJThKezqA39bseEjw+QzSQDwzxNtZ5WKUDiV7
	ZA9RsnpGT3gCgWxBXNpTy08Yr5cGUg7oQLoHR3SG9s19x+SgQfwurMvED8fx/a4=
X-Gm-Gg: ASbGncsTEqI5GsdTdH+cnvJOoZGA0KxUL6Z2VoVYic1rUA3dKpDdtTmQlj54E9N/snw
	Pq0PFWI9pVsn8g3nvYpvG75/rBiigHCRUp4VnApsjOLjB0NHPfMcSk9aoTtXoTZ2gCqbLDWkR+p
	ATsHZJlMEXAxh+j14omIwnbKoEJ0r0y1LRu1WtqR8UnZal0MZv2fNnQ3mLodrU98H7uOZYkqyfZ
	76J2k3dCZqwPdq3H2TDumy5KyuTYbLVr9grxaNM+2tOoEJWWAj6uxNLW+6PCP/3FCFCS2TYIzvG
	48BhxTfyvpgZIHvC8qC7H7/qqKmlmw==
X-Google-Smtp-Source: AGHT+IG0V26vk89CsLjvavbiVM/v4vuiVcKzCLGpdwHvHq4r4wUzQXrx6I1/iI0TyUMnNp6k2v8UMQ==
X-Received: by 2002:a05:6512:3ba5:b0:53d:e840:5b61 with SMTP id 2adb3069b0e04-53de8800237mr829915e87.3.1732622095492;
        Tue, 26 Nov 2024 03:54:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53de7e0a20esm307231e87.280.2024.11.26.03.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 03:54:55 -0800 (PST)
Date: Tue, 26 Nov 2024 13:54:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tingguo Cheng <quic_tingguoc@quicinc.com>
Cc: quic_fenglinw@quicinc.com, quic_tingweiz@quicinc.com, 
	kernel@quicinc.com, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8300-ride: Enable PMIC
 peripherals
Message-ID: <hk3tkj3nka4kslq5nwvu4xj7yzydgdtz3fru2cazy67z3qortb@4c3uxktl36jo>
References: <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-0-28af84cb86f8@quicinc.com>
 <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-2-28af84cb86f8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126-adds-spmi-pmic-peripherals-for-qcs8300-v1-2-28af84cb86f8@quicinc.com>

On Tue, Nov 26, 2024 at 05:35:06PM +0800, Tingguo Cheng wrote:
> Enable PMIC and PMIC peripherals for qcs8300-ride board. The qcs8
> 300-ride uses 2 pmics(pmm8620au:0,pmm8650au:1) on the board, which
> are variants of pmm8654au used on sa8775p/qcs9100 -ride(4x pmics).
> 
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> index 7eed19a694c39dbe791afb6a991db65acb37e597..9447efb9cd01654b74ec4c18dec58b1956ffe710 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  #include "qcs8300.dtsi"
> +#include "sa8775p-pmics.dtsi"
>  / {
>  	model = "Qualcomm Technologies, Inc. QCS8300 Ride";
>  	compatible = "qcom,qcs8300-ride", "qcom,qcs8300";
> @@ -223,6 +224,28 @@ &gcc {
>  		 <0>;
>  };
>  
> +&pmm8654au_0_pon_resin{

Missing space between the curve bracket (here and in all other entries).

> +	linux,code = <KEY_VOLUMEDOWN>;
> +
> +	status = "okay";
> +};
> +
> +&pmm8654au_2{
> +	status = "disabled";
> +};
> +
> +&pmm8654au_2_thermal{
> +	status = "disabled";

Does it work this way?

> +};
> +
> +&pmm8654au_3{
> +	status = "disabled";
> +};
> +
> +&pmm8654au_3_thermal{
> +	status = "disabled";
> +};
> +
>  &qupv3_id_0 {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

