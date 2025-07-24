Return-Path: <linux-arm-msm+bounces-66420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F8EB1019A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C01D71CC692F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 07:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CC55233711;
	Thu, 24 Jul 2025 07:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TRntSL8t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CFB22DA06
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753341823; cv=none; b=DBSUz/0WwQ2Jsxp/C/SCXK/eteflfnj6jm9NZtlG3hqlIEUdh1pAz/iKx3/nZClsF1xQHQrnatM7uipQyn/sXxpgLtaagvgIOoJSvTxmeKgMSE2FYf1tbay3iGXKGlKjDjoFtx+fePZnJwjose15YxjjPiGSqaz5FEQIeXueprA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753341823; c=relaxed/simple;
	bh=6nGhBLrN5DA7nUAfm4ui0pjF3M8jgR8PyNJ6paQnnZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUX8qv7MXWGA4Kkm8QeD79NTiBwV3EKRH9WIUKTKbKrqzvXKq7NT5N6GijXWuherCMwU/BjhsDyZ0FDO/6CipBZDMmbklqlmNyGUI+8CnKpQIxXS5kf9N0q8auuGImdrXuJdJsCOXV7kIGcudebFsZIpPRjFCJ1yzbhfIoHUTA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TRntSL8t; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae6fa02d8feso98402466b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 00:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753341818; x=1753946618; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0IyRqFhbkdETB9+gjPBBcsm9FuFvhp1ffUr7fYiNkiU=;
        b=TRntSL8taFtiDd3IvSfUoMnliRqvXjYTQCRY8CoZ64WS+vxP3hiov0KBwWvZz4rn1T
         ZVCpNpjeq96SJlDpruHyqbhQ4Z/XkETrLMDfEoI8Hycv2PKUD/kwZjA6ql8MZdcNrW9l
         rhzYQiaobcqEKFIqPpEi3ybVddWnmWR+2uLN7tBmv5sIAjgTxbBpD32T+Ev/ybTaws+Z
         DmCriHfgyyd0ckvaLa2URN+ky7PkVIcB2i43fq05NeqmO34vVBoxVnFzlrGJgeB8Z9xQ
         uYKWYTBCVYsp09/1Mag+qMB5gkdClg2kdNOZlJVy5+8iyB5fufm6+66bl7g+4TeaoIBF
         WyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753341818; x=1753946618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IyRqFhbkdETB9+gjPBBcsm9FuFvhp1ffUr7fYiNkiU=;
        b=RY3bZtu71JyF+ytdm/1ofoSxiZHH+8Kc8UKyFxB3t6eUBngR+7AEMyEWP5D5kh5CrB
         0uK0Yayo7nBq9k1Ar74UzqN72zT842eUIBlJ2VvwYlR4vQv8P019OpZpAA9wchdB+7D1
         MxC0noYUpPT99ZWOI0zWNMUY0cnSwYrJI1Fpv8APA/J1I8K/XX7IhXUdkgK6JShPf44k
         cQRGCLGz+Y1OZqZPs/bO2fcExY0WhNmVk1gDhvOl060OMmOijITJ5ramtv2NMVkbV+gr
         1Ox8b26HRg4LUDEiW7NMteK9W8JJzUngM4dDNnm5NaBjQeFUNvph9K6f8BPwCycamd+Q
         1BLw==
X-Forwarded-Encrypted: i=1; AJvYcCW8XiKSEY4d4DcbNt6sRY0yqh3S6f1Xkuar18h66nAQInPosTu3+gq6NwqqEwtDg9G8OVaD6aCSYh7JgBQs@vger.kernel.org
X-Gm-Message-State: AOJu0YyB1Ih+pfwZSse6bFw184cuxNV4rs7Bo+SkCN/SgQDaNBkyeIRM
	RVUQv70rbtSjaBZAMXdfXEAQ3ZcWCDkGMUh5j+WBsza5hKVnyxd6fo5aclX4+CQAkG3A65Liqg8
	YYjE/
X-Gm-Gg: ASbGncuoZrLljBeJ5WwLwLxa8kvW0IIuqbbDj3Sdax0Ad8GOvoLIvfj3bSiIEZU5Sum
	VHmlwrEJajz0YpwaMUMcD6AhP9UvLbAbzNuVwQYOTXqUTmDWqHi4LQwLw6unYFP5VQ0wK911XMl
	uT157nHZP2n2hMe/XXeZhaza6sdLjSzHLQIkGcRFetH5HYvZ85kttcXKAYacoT/8iW4VIteEDMb
	Grm9wTOzpCBa9Chmr6UffnGwq87A97na+UExBztnDRevba30Q0ICAyYk2f2mNIsgkZYny1N9Z2o
	XisSVUlqEsPZUhPvHHil4rlcs68sjJwSgIFwkAlKN0VKeKF2wrfWatC9RyaR8NUDxJ06DnQpIHN
	8BF7KdjnzDpTm37/x4AYKZxao1/iEVGimTFp/YUUQ7yeq
X-Google-Smtp-Source: AGHT+IGoRj4xEQVnuuhDhkJ4U07sNs7To6AmXU1yyMNvclDRha0FEWE1smSmNDjqs2kffoiWB7fDbA==
X-Received: by 2002:a17:906:794b:b0:ae6:abe9:4daa with SMTP id a640c23a62f3a-af2f717a556mr684315766b.27.1753341818029;
        Thu, 24 Jul 2025 00:23:38 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:706f:1fb4:134c:465d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47c496e28sm71571766b.1.2025.07.24.00.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 00:23:37 -0700 (PDT)
Date: Thu, 24 Jul 2025 09:23:32 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/23] arm64: dts: qcom: x1e80100: move dsp audio nodes
 to dedicated dts
Message-ID: <aIHfPZaRmTjI7w8D@linaro.org>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723222737.35561-2-srinivas.kandagatla@oss.qualcomm.com>

On Wed, Jul 23, 2025 at 11:27:15PM +0100,
srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> All the device tree nodes for audioreach dsp are duplicated across all
> the SoC dtsi files, Move this to a dedicated dtsi file so to remove some
> duplication, make it consistent across all device trees and also make it
> easy for new SoC's to add audio support.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/audioreach-audio.dtsi | 45 +++++++++++++++++++
>  .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    |  1 +
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi          |  1 +
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts  |  1 +
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   |  1 +
>  .../dts/qcom/x1e80100-asus-vivobook-s15.dts   |  1 +
>  arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi  |  6 +++
>  .../dts/qcom/x1e80100-dell-xps13-9345.dts     |  1 +
>  .../dts/qcom/x1e80100-hp-omnibook-x14.dts     |  1 +
>  .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  1 +
>  .../dts/qcom/x1e80100-microsoft-romulus.dtsi  |  1 +
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts     |  1 +
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi        | 43 ++----------------
>  13 files changed, 64 insertions(+), 40 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/audioreach-audio.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi
> 
> [...]
> diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> index c771fd1d8029..1d8a75fba301 100644
> --- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> +#include "x1e80100-audio.dtsi"
>  #include "x1e80100-pmics.dtsi"
>  
>  / {
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> index c9f0d5052670..19b993fdd17f 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
> +#include "x1e80100-audio.dtsi"
>  #include "x1e80100-pmics.dtsi"
>  
>  / {
> diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> index 2d9627e6c798..6df3ee553bc7 100644
> --- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
> @@ -10,6 +10,7 @@
>  
>  #include "x1e80100.dtsi"
>  #include "x1e80100-pmics.dtsi"
> +#include "x1e80100-audio.dtsi"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. X1E001DE Snapdragon Devkit for Windows";
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index ac1dddf27da3..cf2cf3e520fa 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  #include "x1e80100.dtsi"
> +#include "x1e80100-audio.dtsi"
>  #include "x1e80100-pmics.dtsi"
>  
>  / {
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> index 71b2cc6c392f..82b08350da17 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
> @@ -13,6 +13,7 @@
>  
>  #include "x1e80100.dtsi"
>  #include "x1e80100-pmics.dtsi"
> +#include "x1e80100-audio.dtsi"
>  
>  / {
>  	model = "ASUS Vivobook S 15";
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi
> new file mode 100644
> index 000000000000..e03441bb2a79
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-audio.dtsi
> @@ -0,0 +1,6 @@
> +#include "audioreach-audio.dtsi"
> +
> +&q6apmdai{
> +	iommus = <&apps_smmu 0x1001 0x80>,
> +		 <&apps_smmu 0x1061 0x0>;
> +};

I think you should inline this into x1e80100.dtsi and drop the extra
#include from all the device DTs. x1e80100.dtsi already references
audioreach nodes, so it's not possible to build without including
x1e80100-audio.dtsi anyway:

../arch/arm64/boot/dts/qcom/x1e80100.dtsi:4098.34-4114.5: ERROR (phandle_references): /soc@0/codec@6aa0000: Reference to non-existent node or label "q6prmcc"
../arch/arm64/boot/dts/qcom/x1e80100.dtsi:4320.31-4436.5: ERROR (phandle_references): /soc@0/pinctrl@6e80000: Reference to non-existent node or label "q6prmcc"

Thanks,
Stephan

