Return-Path: <linux-arm-msm+bounces-30908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C507096D961
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA5CB1C239C5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E06219AD6C;
	Thu,  5 Sep 2024 12:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ggbh6AQr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DAB1991A1;
	Thu,  5 Sep 2024 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540659; cv=none; b=bRRvojyau0QVAzNFoRTpb9Li32iA1Fdhfp4R2/dwXCxiHZu8xsTZcVqaZPjhWhJQZVX5fI+frA37PKUZzP8KD8KZjUPJJodeg0ZbNVAJgHto/gVniNahc8PdmBe64fq4xq60uBpbewqZ8wzCLAkq7e96LPIk9QwEPuCktOvRS4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540659; c=relaxed/simple;
	bh=3bJXQ5TFk6MHX6XlTBxAbtfrWz++1pomFmu2WzecI7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEVmHlS6kaY2Np/dCkaunTwhCL5j6u6kd9LPxiyd8gr/VA5agja/lllX0roEwIxGa8TpyJ4nN+mwvvYxDPSLQlK+uU4eSfB3VWPfFOiHulPDgCCM1ySLIqOwIl52Je/vEePpvMy7Yjat7yjK/5UTtPhIzS0lGbHCiQWqYHK3aK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ggbh6AQr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53568ffc525so960331e87.0;
        Thu, 05 Sep 2024 05:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725540656; x=1726145456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=smQkwEh3oi8LovVsekW2eY1Pija9c8K31DlJAty2Ygc=;
        b=Ggbh6AQrK1na92HOD2B9VGIP71OuUCnth+I16dgVLL+OblhkzsgebWIIeYeFY22/nF
         NL3vCzjBZRBbGmNKhKo3v/EETFRNQVW41hGHZl7YPw6gcmp2RYRG3gboNuvqYaNBKqOu
         Pp6/Btj5Cm0osRTb9fnYEkmhWhgDzDtfkNZxzuQtz6lap0RqCaPOnY2vIa/uu9Ct+z5N
         lMBmqvlxUqF7imaNWkrzSfljh9nRGOgk+BCiS5RPTb2nKoV73SDq4ei9X64t0jqndtU7
         ynrHVVqOsYuDmR79p950bmMnZ0NZ+HVGSWvKSaURLm362KDqjt6Ti8QveQOK+Iabkyfn
         LcSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540656; x=1726145456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smQkwEh3oi8LovVsekW2eY1Pija9c8K31DlJAty2Ygc=;
        b=vjkFBQeobYiRXuQaYXxZzEnsPQycdqhu8tJdLhbisE03kz5irbB/cGlcLpw1+QxThH
         kX0XMASOtxkwrKi6bde8TA7Nf9lpbDWDp98TP6Lb90Ap3HD2SiwhCG6v0xzqLv7D+8PR
         KzCfBhPKlr6TqxoxnD92pkdlLnOXbKqP+qPUsVzTEq1zTOFekXXJ2P4VpmaCFz09KR/s
         SscuJ6TUdEWbQgmAdi+GDx3I6FvH680hvYO57f0MrdMI+4Imd05CVGscw/o65EFHc1Xq
         qC70L7ymU+EAatyy9s/yx4NzZW+BDHBvZ2fC+hqQhkgVdLPf4xvzS4y0riTf3K/eWehN
         ARBw==
X-Forwarded-Encrypted: i=1; AJvYcCUFEBHO79tKYO1/h47vRWVYrl6gvA7/47XaY950nRDn6moplgfvjUfugyIVxsxPO/19mslq5oneoMTTE2Av@vger.kernel.org, AJvYcCV8+Hu8OURaGWJsOcARe6154NhCVJPnTfH//Lr9sjZ41/iMxRE0WzuSlCVSMxPP5ie5uvTypSCqH85NvrwecA==@vger.kernel.org, AJvYcCXin1LcBD5+sBlUZeKgtc91wr/6GJ5ysPbXUhY/AhQXnY1AIAb4zZKhilir3pbbfboWtKRxD41CyiLJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+OMxW7B1+obEuB1uBL5txNzXUvAGdIFVnu87Ws3W5mD4reul
	NFD283tiHepmYj6/MslrNSuaCQDwzxVk4nPjerTSyIXKJsLu3e8VFzBgESQU
X-Google-Smtp-Source: AGHT+IGYJmcIi3kdEiVpdk8WVDNNUhjB0wUtV+UnfsPg/hVGXeeAUhd/9g28Qpq56lBbCCjVbX3HBg==
X-Received: by 2002:a05:6512:4025:b0:533:4b70:8722 with SMTP id 2adb3069b0e04-53546b033f5mr14685461e87.15.1725540654838;
        Thu, 05 Sep 2024 05:50:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53652bd3dcesm164372e87.10.2024.09.05.05.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:50:54 -0700 (PDT)
Date: Thu, 5 Sep 2024 15:50:53 +0300
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc8280xp-crd: model the PMU of
 the on-board wcn6855
Message-ID: <6vikrqhdnkefzpahhhtz2hpi62jvcwnzclm7touwtnpxdzvgrf@uc7r6a7bbjek>
References: <20240905122023.47251-1-brgl@bgdev.pl>
 <20240905122023.47251-2-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905122023.47251-2-brgl@bgdev.pl>

On Thu, Sep 05, 2024 at 02:20:19PM GMT, Bartosz Golaszewski wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> Add nodes for the WCN6855 PMU, the WLAN module and relevant regulators
> and pin functions to fully describe how the wifi is actually wired on
> this platform.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Konrad Dybcio <konradybcio@kernel.org>
> [Bartosz:
>   - write the commit message,
>   - rebase Konrad's commit,
>   - fix one of the supplies' name]
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 108 ++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> @@ -583,6 +668,23 @@ &pcie4_phy {
>  	status = "okay";
>  };
>  
> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1103";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
> +		vddaon-supply = <&vreg_pmu_aon_0p8>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
> +		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;

As you are going to post another revision, please also add

qcom,ath11k-calibration-variant

> +	};
> +};
> +
>  &pmc8280c_lpg {
>  	status = "okay";
>  };

-- 
With best wishes
Dmitry

