Return-Path: <linux-arm-msm+bounces-14808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5B8886A58
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 11:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BFD7B260E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 10:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB96C1E522;
	Fri, 22 Mar 2024 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EDd8JIZ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FC33D961
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 10:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711103483; cv=none; b=ny/3YcEbrH8m6o7XxNBHy86E323nVnOV4BmE+STrisVnvok/ovsx4AM8xa+YBPBi8j0sSpTP9tvJcOu+R692zzzOSyvw+KcHVZP0dLA5A8FElkkwtefWXuDrBZyZMuUSMiRafB1c5g6lgb8NVAzJul2Kc5b6UjQkZEbPOV+mrbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711103483; c=relaxed/simple;
	bh=1yqsyEAyrbQEKMO+oY3gj7fVZXoAvDp07LGSjGWG+cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZOp3bvkeh+Rasq7FdbrqxR+carr/+A5zDqWZi3IO0t9x/IZqrPH0J94/y8JG7kL6tv0i7JbHG1jpCUM3Cjuamt0V3aZZkr5vaoa+dE87P8jP5s+vMvruSOlD3/zK/bx79WVC0Lo9LTNrR1GCjqDiVviWR+mezsOZlU0mAGqsYzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EDd8JIZ/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33ecb04e018so1160522f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 03:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711103480; x=1711708280; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sEcFM3t3rGGDrrs+wuw2zDXHWzgkXtTmhLNSeATLAvk=;
        b=EDd8JIZ/ZjhQC1y97lTkWBOymL7GIFTHdQdCowTzSjDziNHFjpuecRQt3TOIwjNbKa
         fKEYrgHIHo+oqu46ecu+2CyvyI6PI8YFk5HogBYbwJyNjSBzjtb3z5xgf8kydq4Wfy5r
         99CsjaoR8OHuFbUjf4AKmkPpqTH+7DEQOIug23jIhClHAP0wgSUZhOCat2psXOpPTXCH
         9RyrPO8m62h+toTEU0JCUGJPkl7va47cbBNiauiQ36sigFCAgIWRNwB52xjAeKNjOlby
         wuFHZ0TGbuXnJPdWAplkg8Bk7Utc+Kn3LxIy3Y7qi3oHGBxhe6VUOiQkk5NHe7qq7QYX
         aKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711103480; x=1711708280;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sEcFM3t3rGGDrrs+wuw2zDXHWzgkXtTmhLNSeATLAvk=;
        b=JT2azxcOe8cCPvEKmGpbGOUM0jWZS4UExbmA+0rjgxFjr9orxwVNjt96f5YLxZgSW0
         B3cUcsGbTzyiBN3lNCiEeLufGOrMWFrhPk3v17IAc2py/cGHEsVNyT48Hff0L9egI/Pd
         k81LXC2K/Mfk2C/AL64hSD8ePR6chw+3FBgu+HJs1gJiY+XPaNDT5VDXJBazhBrIGnF8
         Zn9V7+WFsU+wwt6x/qhhzVGZmOxvL4VLRaBlBIRQaE9BhMp4WhsKAD4iV+9STYjwIV9r
         sEQUB0F6DX//9laJR2H5E3wlVQGpdvGmnBp/U/AkM0PUflFv10Ho5VZUXcjiFSIxp3fz
         KXXw==
X-Forwarded-Encrypted: i=1; AJvYcCV1A+RdX+0YHslXE2tfMA0OglLsFIcQ5Nj9vSy+lnDBx/sT8jy41SCb03fAXhW8fLIxsgmIBPW1xhs4zAJW0x5P9He2qw4dmFhC+6nTZQ==
X-Gm-Message-State: AOJu0YxMXwaiW+lGjA/EAHQYWUFrd4p936fBJLHgzzDVbUH0iX7ebV+/
	S92pZ2c8Vx1DB+gxDa8gQQ1up8RUTkBctCbzrtE5eKUVCkRRelU1NUskikqIBAw=
X-Google-Smtp-Source: AGHT+IFLWeyHAKmJFDuY1LyMfeP1uoswUUuBKiCoUA5Ty/5Z3a1YZV4wAVHf2fG9BBV8WWxxQGLgrw==
X-Received: by 2002:adf:e2cc:0:b0:33e:cf33:bb1a with SMTP id d12-20020adfe2cc000000b0033ecf33bb1amr1518380wrj.12.1711103480298;
        Fri, 22 Mar 2024 03:31:20 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d60cf000000b0033cf4e47496sm1759496wrt.51.2024.03.22.03.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 03:31:20 -0700 (PDT)
Message-ID: <72b68358-6621-46d0-a0f5-b48fdbc54678@linaro.org>
Date: Fri, 22 Mar 2024 10:31:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: pm7250b: Add node for PMIC VBUS
 booster
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240322-fp4-tcpm-v1-0-c5644099d57b@fairphone.com>
 <20240322-fp4-tcpm-v1-3-c5644099d57b@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240322-fp4-tcpm-v1-3-c5644099d57b@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/03/2024 08:01, Luca Weiss wrote:
> Add the required DTS node for the USB VBUS output regulator, which is
> available on PM7250B. This will provide the VBUS source to connected
> peripherals.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   arch/arm64/boot/dts/qcom/pm7250b.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> index 3bf7cf5d1700..91a046b3529c 100644
> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> @@ -45,6 +45,12 @@ pmic@PM7250B_SID {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> +		pm7250b_vbus: usb-vbus-regulator@1100 {
> +			compatible = "qcom,pm7250b-vbus-reg", "qcom,pm8150b-vbus-reg";
> +			status = "disabled";
> +			reg = <0x1100>;
> +		};
> +
>   		pm7250b_temp: temp-alarm@2400 {
>   			compatible = "qcom,spmi-temp-alarm";
>   			reg = <0x2400>;
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

