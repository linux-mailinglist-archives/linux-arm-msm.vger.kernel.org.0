Return-Path: <linux-arm-msm+bounces-29757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 870AE962547
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 12:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B86801C213A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 10:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6BD168C26;
	Wed, 28 Aug 2024 10:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrYfdQ5x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E587C145323;
	Wed, 28 Aug 2024 10:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724842396; cv=none; b=CPvZtvwlS9sOOeio9DLUSuWI/JbwuQCsw3OVeRsRn6ys7Hy1QDeKKXRb/EcCDJn/HTwwca7xR1/IJq7/7JRHxNg+F6EFPzHfti5UUN7w1J3CXUtJqdZFzMwlON1ZFrASa4lLPj25pjvdty965zbeP2feTn4P5YVxy/meGkrRn/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724842396; c=relaxed/simple;
	bh=HtDkjtaxe3miaxMYMdKc7yS5PMEQcFjoZyJk2VNa5qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RsMm99Cp9q23pYqzMh8pfMFoTxjMIjpMKS9AruU9h8UJk3cdNjSD7BPk37Kep20CWY9UuJ8vQoX20I8cVCywhqoXPsC1K4X3m/KGW6VXlbjg3WZeyvZoZlWok2EWc3VaVXeQ3NtVMadJVZCVVRVKf/jbr/Q+zGuIFB4fO6At9rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrYfdQ5x; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f01b8738dso5063621e87.1;
        Wed, 28 Aug 2024 03:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724842393; x=1725447193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P/oO55OLwIlvvWrft7aZlbidsgbt95mQfK88nVF8lCQ=;
        b=SrYfdQ5xlVHjxN3lKF9BaNtlTLPc725MUeaoX3GVnLO8bEhY5b/NUjg1bXDfcNqURS
         W4iukO/5G/tT0oCbVouL0IWmPc0oFx3CAc1JdONWShFHngoGmJR+Yzx1Q6+AH8JUMVp5
         6L/Gxf6C+m7/it9lt9u1bAmYCz77F+FOD6ivO0r0m3JICsjnZB2gpCx3wMYUhlv/NzXG
         LfD0EVwvWMboXHkRtbizvLAuJvaZ5YNPaakvS0kMLc5l/Z3wHY4CmV8jpfTPZbVIUlUv
         CzwJMjoWsCKBUHpA56XyagUgU2CLxS9AibeTAD9ym+qblskvIPsGIUTezmNFx2JcXUX8
         K/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724842393; x=1725447193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P/oO55OLwIlvvWrft7aZlbidsgbt95mQfK88nVF8lCQ=;
        b=rDpmDT07r4jO7js6PQTHLz23mdTqrM+TuGQNOfdq7oZvGrNk7QHR/oqNXbBvE66iSD
         Wb3purojAfudzdWwdDDZSOniyZqqdPm2yEf9hZ3qyA4evgQcW1+lgBGjHTy6k2gAY2Kh
         DultHvJeGer+Mn3ExCu+O+1bjOCJTTMskw7w3Au/tSOhFHU4SoKXLROaL6raDPV51F/x
         8XSVzQcTAUYnp98lgZLBmWXFJ/JXJop4CF2CYbiub/XCAIJWSMqYO+xon5uEOVHvrKYo
         H60zfjDxRCqWaRftpJErx+5QdWonP3BqA8JzibVC1h12oB+eLVxLHVOcp9qB2vpC47pJ
         bYwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtrirS3FUSJE0hKDMr5RsPZjEyYpgHGo2m9f20pxnkj+FVc5wptHKalECuN9yek8EvwYF8ppYReHBiLyPp@vger.kernel.org, AJvYcCXNXZxGjPIlnKO9jrfK32Vod5CBg5und+4Tbm9MlV7xZ7OjAuzep1BV2gFhAKan01y9Li7gHbMdRjab@vger.kernel.org
X-Gm-Message-State: AOJu0YzqEOaTDSaSug6qGF9Tcdm/sAb/WzFsxJrQ3i0O6YQOU+fPxlo8
	KmEDQOueOubS5mwwIdk8/yqfKqZyGjYFRV9qHzBqo2PnM2T1xNDx
X-Google-Smtp-Source: AGHT+IH6mdEjNO8lFcO7gyh2vhdnt9t/44n0EW9WpjQVd0L1g3aWJISkLCKCpMTT1sVFJ9icC9QuHQ==
X-Received: by 2002:a05:6512:224a:b0:533:47ca:9773 with SMTP id 2adb3069b0e04-534387be915mr12265378e87.57.1724842392155;
        Wed, 28 Aug 2024 03:53:12 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5489383sm228017066b.20.2024.08.28.03.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 03:53:11 -0700 (PDT)
Message-ID: <1145f7e2-248d-4170-b7be-db694e37fec4@gmail.com>
Date: Wed, 28 Aug 2024 12:53:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/16] arm64: dts: qcom: sc7180: change labels to
 lower-case
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240828-dts-qcom-label-v1-0-b27b72130247@linaro.org>
 <20240828-dts-qcom-label-v1-3-b27b72130247@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20240828-dts-qcom-label-v1-3-b27b72130247@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2024 9:17 AM, Krzysztof Kozlowski wrote:
> DTS coding style expects labels to be lowercase.  No functional impact.
> Verified with comparing decompiled DTB (dtx_diff and fdtdump+diff).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi  |  84 ++---
>  .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |   8 +-
>  .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |   8 +-
>  .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   8 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               | 344 ++++++++++-----------
>  arch/arm64/boot/dts/qcom/sm7125.dtsi               |  16 +-
>  6 files changed, 234 insertions(+), 234 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi b/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi
> index ee35a454dbf6..f362b6b436ce 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi
> @@ -6,82 +6,82 @@
>   * by Qualcomm firmware.
>   */
>  
> -&CPU0 {
> +&cpu0 {
>  	/delete-property/ power-domains;
>  	/delete-property/ power-domain-names;
>  
> -	cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> -			   &LITTLE_CPU_SLEEP_1
> -			   &CLUSTER_SLEEP_0>;
> +	cpu-idle-states = <&LITTLE_cpu_sleep_0
> +			   &LITTLE_cpu_sleep_1
> +			   &cluster_sleep_0>;

I suppose this wasn't intended

Konrad

