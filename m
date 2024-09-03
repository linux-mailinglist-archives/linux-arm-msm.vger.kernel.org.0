Return-Path: <linux-arm-msm+bounces-30533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDD096A028
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 16:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4635E1C2338C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 14:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37DE54BD8;
	Tue,  3 Sep 2024 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j/CA3hm7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490F74AEE5
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373019; cv=none; b=BMrPLH2k4Bg1DVl3MVhrw7nKtgCw2TVkm0It8FqJY1SnGcvx5yr0NVPuatJkQTaixCClO4YQG9J5jlygCIYBE+572EbrBym+Irz1TSOqTNl+hnjaJnqg3Q1MJm8IJ9P9rZByihM5slDbME2jI2VCqv8iVbIOhchrHpuvuIksMbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373019; c=relaxed/simple;
	bh=FWMUP2m74xm6bc1hvk2IvfKnjTaie0b6M5Gtja/k/po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOeqT2EuNJs36ZVMDO9JFzcO3n1BT+oux47U2PM+yRDodsxePJA7bPm1AI4vqdTsPpSuPg1WuVO5TPwdLKTj2+i4I2gex+y1Yq0UOb0+PMHneCeH0up9d3MEnHC5I7TW00HWlT1yqAo9D910UaZuZZXB6ZdqJtxu+B2nC6HFwLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j/CA3hm7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f50966c478so57345111fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 07:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725373016; x=1725977816; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EL9ZXgA6LtBR16HzKqqfDvZ1a5cPUdZeJqNvfrQ2soA=;
        b=j/CA3hm76cIKJwv9nfmN/XgIUhEe6sGbPb/qYJJJvtWbR83wWVuEMo8RlGF83T7N9M
         tgoQ1YCAiyKirPEVJlHDzyNjbZRLhZxtI+ucWrAGWk9mhLjbH2dsR8sP+iHhgyYdSBJM
         4DnCqdsLYE/HkRbc7Z6409SYTIWMs0nm3CZ7ADorxvXD56Jd3fwmd3/WdcqVC4JwYptM
         He1B4QUok1XzbLmFaqMUhQVPpjU1GDInvprolMkxjhIAxsNc5SyAmfTJXoClpG/p2Ee7
         eyDbMCQ1cumhq5gxb5CYY+UAXWj8vcgRg7lKH4t+1qZ3nuXYOc3G3RwO/Sb3bE4eni/E
         BlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725373016; x=1725977816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EL9ZXgA6LtBR16HzKqqfDvZ1a5cPUdZeJqNvfrQ2soA=;
        b=JZHGy6i7WgCo8VlI4ZH0cyEfPRjOb3eM4ExCk4xTmiOApfihe0TUlA2Oc9h7pzYfCW
         RyfPfsTrEjO1GKL8IZDXVYFv/T/v7qL3sN5KUxg7j7i/GWVJSz0SmlQ47C69Tg6dchX7
         wGrp1bOLup9HfVHndihXhz159D3Duj/VjpGfRH6rlbYoEJlvtNDurQTo7Of93S6NyC7/
         /X/oO+waGFAvNKVOLGirq/rq3MPJtyk9H5RbwUPHXl67Ahgb1owEbrShY1pNbupf01cL
         IGVlUiqNLDyarF/4EqATYyeC980WcwICivWVyIoQA0AyXCBfyAZfNLCwGTryTWJzXcr1
         ip1g==
X-Forwarded-Encrypted: i=1; AJvYcCXT609WInSN5c0bjztYZwC8eDpf86vX9eiJ/gILG/mD2hcXeO51nBd1wdDJBTvHTHdHUP5TRpu0uIaI0RdF@vger.kernel.org
X-Gm-Message-State: AOJu0YysD1NZeqwjGZiQzVmVpbUk8YVknpScVGClARSJ51dJ7T1LckQB
	m3xw2YvPMN3J7L1vYayUdK4xm39z/9EyPG8Z0d/pldz8I2YzemuYnYm1wPkvPZM=
X-Google-Smtp-Source: AGHT+IGHOzyEGoVumYP3kpXpooA/pzQcALYbbDevhxibgr+iN62bHnaA56pBIgLuBDcerJ31G7mLPw==
X-Received: by 2002:a05:651c:544:b0:2ef:2f37:345b with SMTP id 38308e7fff4ca-2f61e0a514emr96863661fa.30.1725373015795;
        Tue, 03 Sep 2024 07:16:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed23ecsm22669941fa.13.2024.09.03.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 07:16:55 -0700 (PDT)
Date: Tue, 3 Sep 2024 17:16:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
Message-ID: <sjb7rmha3qvcoofyhoemwwnhmls3wnm66rwufmdbahlz4smyqw@iq6vimeayuea>
References: <20240903093629.16242-1-brgl@bgdev.pl>
 <20240903093629.16242-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903093629.16242-2-brgl@bgdev.pl>

On Tue, Sep 03, 2024 at 11:36:26AM GMT, Bartosz Golaszewski wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add nodes for the WCN6855 PMU, the WLAN module and relevant regulators
> and pin functions to fully describe how the wifi is actually wired on
> this platform.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> [Bartosz:
>   - write the commit message,
>   - rebase Konrad's commit,
>   - fix one of the supplies' name]
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 109 ++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> index 6020582b0a59..ec6bed8395b1 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
> @@ -260,6 +271,67 @@ usb1_sbu_mux: endpoint {
>  			};
>  		};
>  	};
> +
> +	wcn6855-pmu {
> +		compatible = "qcom,wcn6855-pmu";
> +
> +		pinctrl-0 = <&wlan_en>;
> +		pinctrl-names = "default";
> +
> +		wlan-enable-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
> +		bt-enable-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;

Nit: bt-enable-gpios should probably go to the next patch too.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> +
> +		vddio-supply = <&vreg_s10b>;
> +		vddaon-supply = <&vreg_s12b>;
> +		vddpmu-supply = <&vreg_s12b>;
> +		vddrfa0p95-supply = <&vreg_s12b>;
> +		vddrfa1p3-supply = <&vreg_s11b>;
> +		vddrfa1p9-supply = <&vreg_s1c>;
> +		vddpcie1p3-supply = <&vreg_s11b>;
> +		vddpcie1p9-supply = <&vreg_s1c>;
> +

-- 
With best wishes
Dmitry

