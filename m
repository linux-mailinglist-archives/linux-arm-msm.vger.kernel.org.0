Return-Path: <linux-arm-msm+bounces-66427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9CFB10220
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:42:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E580B1C87363
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 07:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C474425C6F1;
	Thu, 24 Jul 2025 07:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o8G82sJq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D9425A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753342944; cv=none; b=jbm/y+z+C3Aa8Grbk+RtCnUNQJDXSV6CLRcZh3wmwPDw0Nk9pH3Hav6axX822HziMYxbanUeboMUkkTtIHDiC7hMN4qu2HDQLuTVTre1SM+gKf+HSbxQmt7RR1m30x7IoVdawUAMqHcH7IE8qVATBcDBOiKy4d0AcI9Uf836k+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753342944; c=relaxed/simple;
	bh=DdDwmx8wf8fH5xjJ93XBJQhgS6uw1I6CUObsXO8sXw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GK9zrzsBuA5ykFF0zGsxc7lUwLiKzNEKtE+j2Arce2EUPQy4dWQyuB4xKybmjO3icLoyHN16axGnImNYYqPE40TucG97tbF+gpYZII/qbN3HfzJYeS5MJiPtpFX10Ow/wjDxRFSSU2an2j82gFJmfTA9B5PHUDFDu3M2D3LDqo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o8G82sJq; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so103068166b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 00:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753342941; x=1753947741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CgE7JUNLN02T2vSIlKw5mIrqO2vBgfGrhxplFGxM99E=;
        b=o8G82sJqk1pdfZ0sIm7JJB29nlR0o5J+mV1kpcvxpjQ+BbMYMmSaaWAkXWgEv+oE/Y
         wemj3PhQ5JwlKkaR6d/LeNLKaV309JA9Ikxxj0ufNcnkeyet5rmKan303EriduIrTG0G
         h8wcbPWOqJlt84t5gPuMetqWy+a9yeCwjvC3YKmVFJy2WIM+IziegF0COF8Vac8Em/Bj
         1S2SahRLhpjYmWwkU/loegyCUfeokBM6ckemJ3WrLU0l9hGYFl1DIVngSIanFFMYliYH
         o9BMqZRtav+R+UxNKTMVGY50kMfdr6yiqqSEdUD7XeYWZYP38OVnkpcC9oQIhTyf4PdQ
         d4Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753342941; x=1753947741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgE7JUNLN02T2vSIlKw5mIrqO2vBgfGrhxplFGxM99E=;
        b=t0q1QRV0qeqDbMO+8+KDiEMG2SgZRb8qN61gzfggQ1aWBmDexB18Fn/oei/RCK49aw
         OoyJo/D8Y+dB+RcWxix/c6OabeNG5+rYiVjI5PggNGyt8GyffPQFgugM0swEjw56WWBF
         uRStCd+OcP+nkPGE9hy0h7SaevYFKE86eFPc5hts40sdHs5aYKa4P2yj7e8ZDDOAx5Iy
         4MlcJpK2fQAShtbqMkBg9ycor5mkJRwfWAnx1hjNtf+RtaP0fddaXx00yZsFhWk1INb3
         ARXN9wt95+vWDRsglUB/6p/Nhurn/U2crSqwyUua/ltNTq5/AEdBI/Mxs93us8nd4B+H
         sJYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL6dObXzpOK5/gO9O6NNBIoJ6TS9dGS75LYElxXHojQ+UqHu0NYv0PMCbBt+v3bnaib4ReSqGfuJ2yDBVE@vger.kernel.org
X-Gm-Message-State: AOJu0YxL6mieW0QQvsUy+mZxVqolzoZKLxpc4pKTI4HeYa0EkeIGR41N
	bnVDvkbbAUfY/j8f5/kypVceDtAziX0CFbUMq5JVXME1ns+lze5EZZZUStTi2f/q4TU=
X-Gm-Gg: ASbGnctRwXkbnIwJKP6CibiXwzDypMc+fYrjXsEe52YdTB8/KRxrUZN+omJzUvQz44Y
	BHAqQKCp4Bf2zgYGGilgLv8uoLHbfLWv1xEwSUguoYDG6AAGH0wNoTa4pPOFePH1H6D0RyDo+VK
	RWITCv7+HcUkkzYhiyn4px7BfyIv2gUHSIPRrSaIfo+hCRwLwGeU64s3MsGCUyZWfqNgrNU3AlD
	sfgB5gdtypAXpFoBWcQ1RdZhQe5QNqNwKiWsSbVq3dYFQ4PVzYb9Pq4iHMT0YctAHNWEVDK1WBf
	cNQ3aMGhNxnjhQpelo1HfN54gTXZ6heZXi8HL5NbzpojQJn/So2bUGiWtgg10l2q3/f+NtpwycY
	5Llt967z/zV5ZNMqVma0nlP3fSIj9fmCDDQ==
X-Google-Smtp-Source: AGHT+IGeNjiweYf8TJOBcF5sXIb4zxJmd8JjHkZIbNQn5igDg+urUk9/v99tFBFNcy9+hK6+sVS/HQ==
X-Received: by 2002:a17:907:da1:b0:ae3:5be2:d9e8 with SMTP id a640c23a62f3a-af2f6b05139mr590442366b.18.1753342941248;
        Thu, 24 Jul 2025 00:42:21 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:706f:1fb4:134c:465d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47ff3f607sm71621366b.127.2025.07.24.00.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 00:42:20 -0700 (PDT)
Date: Thu, 24 Jul 2025 09:42:19 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/23] arm64: dts: qcom: msm8916: use dedicated
 elite-audio dtsi
Message-ID: <aIHj27uJG18afnLc@linaro.org>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-16-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723222737.35561-16-srinivas.kandagatla@oss.qualcomm.com>

On Wed, Jul 23, 2025 at 11:27:29PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
> This move removes duplication.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8916-audio.dtsi  |  5 +++
>  arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi |  1 +
>  arch/arm64/boot/dts/qcom/msm8916.dtsi        | 44 --------------------
>  3 files changed, 6 insertions(+), 44 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-audio.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-audio.dtsi b/arch/arm64/boot/dts/qcom/msm8916-audio.dtsi
> new file mode 100644
> index 000000000000..fe17bc28e825
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8916-audio.dtsi
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#include "elite-audio.dtsi"

I don't think this will work. elite-audio.dtsi contains

	qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";

for all the APR service nodes, but the ADSP firmware on MSM8916 doesn't
have support for this as far as I know. This will likely prevent all the
drivers from probing.

The definition below doesn't use "qcom,protection-domain".

> diff --git a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
> index b1a7eafbee31..c0a48692c100 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
> @@ -9,6 +9,7 @@
>   */
>  
>  #include "msm8916.dtsi"
> +#include "msm8916-audio.dtsi"
>  #include "pm8916.dtsi"
>  
>  &camss {
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index b50c7e6e0bfc..6d9807adc618 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -1997,51 +1997,7 @@ smd-edge {
>  				label = "hexagon";
>  
>  				apr: apr {
> -					compatible = "qcom,apr-v2";
>  					qcom,smd-channels = "apr_audio_svc";
> -					qcom,domain = <APR_DOMAIN_ADSP>;
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -					status = "disabled";

status = "disabled" got lost in the conversion. This is needed on DB410c
to prevent crashes when probing the broken APR services in the GPS-only
ADSP firmware.

Instead of disabling APR by default, you could move the status =
"disabled" to apq8016-sbc. I think that would also be fine.

Thanks,
Stephan

