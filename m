Return-Path: <linux-arm-msm+bounces-10920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E5A8536F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 18:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 262B91F28CAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 17:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D1D5FDA5;
	Tue, 13 Feb 2024 17:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HiYNNylG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7446D5FEFF
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 17:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707844465; cv=none; b=RZcD13KWPtT8/JLM1li1CBVRIF0fQT+aHUThQsKlv/9HzvFNzUXsVu/7nB9N+iRM0gQtrJnqa5y4KMIhSInsj/ol9F0jQU6QUzYBaI5aRPrtWcpGRPwN8Z9WEEmi2+RjpHB4gLgPHYSg0UpjgYB5tsD+qPHGRDOBtqTnflGytO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707844465; c=relaxed/simple;
	bh=tcxnntMDjTGlm2TP7peUr1fDpFlSE77ShltMlTMyXiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMvomLasDLa8Ld/bMNEnGve2JbvbEoZDeUwOpIFmbsgoNJPq9vLmZjbbT8nViMSL89kyDZ6J7bonN+nCs8mllgSlJ0/LiZfxxgTOlBfaO/Z3wG2MTcFqxqADTuM4ujaJOizG/6fVMrnG7V975gG6PD2ygkWlGdnmrF25IiIomjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HiYNNylG; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-59a31c14100so1854164eaf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 09:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707844462; x=1708449262; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wWYkFPfiCpaWEvWgISX+b5xO2e9ZobwEg3qfP5joRSo=;
        b=HiYNNylG+RRAT2fGdy72pPtEyHPBotR8t1/69viOKDmqvuu+Z8o1vRHqrFGKQpVr8a
         PvmFOLWeozDe9/vHDYwFEH1lcE5yDn5HStf54xcCx/sTivVj23gJCUacNHfFv6hrrPD/
         nCYu8qWa0zik9aRZ58Qf1/LJyRTT03k9es5gUaRTX4mfNcjR75q/wD2+fZHwZmxonSHW
         YxiPOA6J+wH4XAY3PbLm/LxBPmFqhpsU728BGO1QfxJDGhThc6z5lWIMrt79fXApzOdp
         6cOhdgujkdoTSfWsnlJlbcNXE7W9E6SYSpEVQGPSHOWdAcqP+t+r0i8Uu29iQtyIQ+8j
         tvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707844462; x=1708449262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWYkFPfiCpaWEvWgISX+b5xO2e9ZobwEg3qfP5joRSo=;
        b=g9ylqq6JDLetsYkZW7hVCVmYp8cmvNZeEcPuxOd1QuTQFO8+2qrUDioBbJXqb8m+fJ
         KXf7b7rso9wIFwTQHB8HamX8+H9M2T0nTR66ziTixjeD7A9dmUkBKIbmhOTx2IU6ngJx
         pBUkCZ29C3xYN9t7+eLs/75WL0v15XkvrA8Df3RLmLIw33ILBEf9PbZov+2rU+8rXdY3
         V5rk2Nq7tvyeGxHLrHoJZ7+3xM7Quwv+e+qBXjdfXo1FZBo2OtqtxGp4k1ukYyvDULIY
         4wKAjS2LCTjhDvPdPpjxwqvRSR7XqAk8UeaUjV1zzn4G45iAc8AlNCYDlCzsw/s/vaZ1
         l7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWvd4FZ6xYUsHzi2iZ7gIob3vSj1C+Qcdq0fmAPfqdwHEghDxod1quEf3UZzdpetkWoz7+mB6Oxik3Ih0tO2sTnHmNrLRQtc4uRh+hEjQ==
X-Gm-Message-State: AOJu0YzW7Qa+kEyH+24C+QMa7W4dWN4xTOubWzbFGWfYSJE4/NGLD80H
	WGIkPYvEFbLW4K56Tkt/0sR3pG92EKgmJN6QODl+N/1ju4LotgdBVdrF9nyBTw==
X-Google-Smtp-Source: AGHT+IEOxWREUBGC0f7j04zpR6Kvian2c+B0Gtj/AEmJlX+piv4UW9N3HlTOkwOh7O/jFM0uKb3VXg==
X-Received: by 2002:a05:6358:7e81:b0:17a:f91c:825b with SMTP id o1-20020a0563587e8100b0017af91c825bmr1386833rwn.5.1707844462506;
        Tue, 13 Feb 2024 09:14:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTTgBUbmGTHDb4FXx248cvObvI7tZiwQlGpHHld8LDVzYO0A6bzBrbXY7aB/TCOYqiejrdehcIGzPl0LXiSw3+2M+8wY+txYKFiWGQRtz+NpuYPssTeVaNTKgKmMfNIoYYZVpCDq9DAdhZjqm8ssH+Yr2NrvAcfbPZox7yQ3T9CT2joEIM1Ycslj7tko93MRssT+7TJC+ZYXpPD8Q8ZYprEXVlzNeT/NcGEmBKa3hkXihCDYiIyq/fEMeSBREgjqOhxdL3Wz5YIxYi6ziPkrM4Lt4OZOuQV9109eOfh836hsBqAAPNU2NRKn/Uf/Y=
Received: from thinkpad ([103.246.195.75])
        by smtp.gmail.com with ESMTPSA id fa12-20020a056a002d0c00b006e0f6e6c014sm1826010pfb.84.2024.02.13.09.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 09:14:21 -0800 (PST)
Date: Tue, 13 Feb 2024 22:44:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Anton Bambura <jenneron@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: sc8180x-lenovo-flex-5g: fix GPU
 firmware path
Message-ID: <20240213171416.GB30092@thinkpad>
References: <20240203191200.99185-1-jenneron@postmarketos.org>
 <20240203191200.99185-2-jenneron@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240203191200.99185-2-jenneron@postmarketos.org>

On Sat, Feb 03, 2024 at 09:11:55PM +0200, Anton Bambura wrote:
> Fix GPU firmware path so it uses model-specific directory.
> 
> Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> index 0c22f3efec20..49b740c54674 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
> @@ -350,7 +350,7 @@ &gpu {
>  
>  	zap-shader {
>  		memory-region = <&gpu_mem>;
> -		firmware-name = "qcom/sc8180x/qcdxkmsuc8180.mbn";
> +		firmware-name = "qcom/sc8180x/LENOVO/82AK/qcdxkmsuc8180.mbn";

Where is the firmware located for this device? I couldn't find it in
linux-firmware [1].

- Mani

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/qcom

>  	};
>  };
>  
> -- 
> 2.42.0
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

