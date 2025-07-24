Return-Path: <linux-arm-msm+bounces-66428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52967B10223
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4016FAA1A6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 07:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02E823E350;
	Thu, 24 Jul 2025 07:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zh2SsGns"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB6D1FDE09
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753343119; cv=none; b=qaQ9offP38c3G8ygiMG8McciU9KtIf+P5F6/oulMyGeBkXsbQVtN8mEKAIm0tTpoAqixRHWZ+eqP5PMeI73HNkEIwYHmwYo9Q0ejOzP5hS6l9Tx7dLKh3uvULp9B0lBdlfP8xggIbNaYL9mLDd3TCNxUAePymbQb9QQ/Fbg6Jrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753343119; c=relaxed/simple;
	bh=AP3zgH1Nqn7tJA2K6pKR5f5J9I8lQYldylhzWfqJmyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcHXBYfrNsVRZ/WwtCFJOGiaQcO2eBG3JpKg+H2arj2wTnO07g9b2sBrD1Vhi+U8y6StRW7OTXX0c18enThWGNrqjcp6XFsDt1DYyGCxBZPuUjFtm5ktpDZtTDjG27G40gM94KSjuOqI8tqW0pvU5TiphxInlojnTjfDzZc9kX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zh2SsGns; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acb5ec407b1so107189366b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 00:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753343116; x=1753947916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2vV2M1bsYJIVHm7EjRSWQZf5QaQ36BKAfq31S/kJ3UE=;
        b=Zh2SsGnsMVirsRUjrDSUAcNfytfJCscCJS0b8mZvjLifwGZLVG8hN7nFLnvd4HJlXG
         +nGH3NK3JuTdWhf2PZsCgJFPYyN8lMEx67/MBCBiBQQZJUunTnz4+hRXQBwQ9onR32AF
         Puqu4z/1W2Y/Jjh/odKsd+nVVCoAfBf+4/PEFKWu8ZUlej1opBdkslkqi87GE4ayZI+X
         YPGLAqWAyeY+GHjfOy/3CZO5qi5hCdEve77z/lZj9vSsRGVcq7RuevC+FJJBpNLyy/63
         nJxQEYthyXfLa+UsEQBNjQIcUG5kCuP7PRfaWRMPDvBHsyUUPbGVWCVnXPH8A0SHScXn
         85Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753343116; x=1753947916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vV2M1bsYJIVHm7EjRSWQZf5QaQ36BKAfq31S/kJ3UE=;
        b=as6iO7TjJcz+BX+ykQGZaEOnGdUpAZtFiHjZY+wQA7Xpoenjg+L0Wb6NStB4h6tVP9
         2O4IUG7kzMi5z8L2642/dQkRYRLfzY6ZCxGVka6zx9pclQRvVpEq8beRKYFDP8S8BpbJ
         1yLx1vXKqPGvjjYYyCOLZP0QE5bbpc0bGZbUkdKoNd0PxHBuql+tPMtlqp8TSHOwYHV8
         ZiA7gii96VTvqwgyW1DnGq2GRQr3zu5xabAD5fYzM8t1FHfRK6RPWJSVHbtH3Y1AYnAg
         NVjbl8DIB+dAewdcq19cm7f8Psyz6S/k1TUXF5nDaG3a7l3Yo7E1H+FDBx0qYmLiMqAY
         U+DA==
X-Forwarded-Encrypted: i=1; AJvYcCWSCa9ecz1tmL1u2q9nOFk5Baf4oMeRsXkRp9lsteIIPINW0FQFfRcYWIHhUz9eSr5nynureMI/qRoPM0dN@vger.kernel.org
X-Gm-Message-State: AOJu0YxPFbfzL5+Ucqr8LVBtgJt0fJlXEGmSXNidDt4zpQcXWg8imZaw
	I+NaD2/KwUGdUtMrIYcRdiGkrmfok/T3qYJVsKcF0BkBVtOUV6514VHpejH51Me0kWU=
X-Gm-Gg: ASbGnct2tLMNfjvOaVux5YdQ4zRaG5SSA0lEV8mA3qWZ4F8iKO5qJBBnOy4OlY7Kh5m
	s5SIcJ7HqOd65VfIdQftDUPjk2JgRCdTnaxiquWgqqrfyficN2awEBBapQJrvyB0IyotKAzd5IP
	1kcr92PfTqL2BarJICJjn9XqDnsnxeU/jI2UoXXHR/sh5ayuQE7SjiXhbPR7OQyw2OYF4wsC9/o
	OUkt+kgcvBbKsa3XITGHgTijR5DV47HPzFzodP3uXnhKMU5qmxkU9fl0MdZEmcdkMOjBlHOo7Xz
	bdM92B4sGool5O4x5HnumNCQhzD1QknR8nevh5pU7JBAoIv0ypCQilq851Bud5gHQNRq2nOu+UY
	tPS+gY2J/iW+SrGD2ubnOpcBOvXdmiejFxQ==
X-Google-Smtp-Source: AGHT+IGqk1fJgK3rWOc4Ks4tE3xn2mUJPMG6yF9MSruD3tjslLFEJpd4P2YhrhCZJbVOnLv7scDCDQ==
X-Received: by 2002:a17:907:2d12:b0:ae0:bee7:ad7c with SMTP id a640c23a62f3a-af2f8d4fb14mr600672466b.46.1753343115955;
        Thu, 24 Jul 2025 00:45:15 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:706f:1fb4:134c:465d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6e769sm73922266b.45.2025.07.24.00.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 00:45:15 -0700 (PDT)
Date: Thu, 24 Jul 2025 09:45:13 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 19/23] arm64: dts: qcom: msm8953: use dedicated
 elite-audio dtsi
Message-ID: <aIHkicKQq0vy5U7o@linaro.org>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-20-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723222737.35561-20-srinivas.kandagatla@oss.qualcomm.com>

On Wed, Jul 23, 2025 at 11:27:33PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Make use of elite-audio.dtsi and remove the arp nodes from SoC dtsi.
> This move removes duplication.
> Also msm8953 SoC level dtsi has q6asm-dai definations that should be
> part of the board level dts, so clean this up as part of this patch.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8953-audio.dtsi |  5 ++
>  arch/arm64/boot/dts/qcom/msm8953.dtsi       | 78 +--------------------
>  2 files changed, 6 insertions(+), 77 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8953-audio.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-audio.dtsi b/arch/arm64/boot/dts/qcom/msm8953-audio.dtsi
> new file mode 100644
> index 000000000000..fe17bc28e825
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8953-audio.dtsi
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#include "elite-audio.dtsi"
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 273e79fb7569..aaf179c2eb53 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -2015,84 +2015,8 @@ smd-edge {
>  				qcom,smd-edge = <1>;
>  				qcom,remote-pid = <2>;
>  
> -				apr {
> -					compatible = "qcom,apr-v2";
> +				apr: apr {
>  					qcom,smd-channels = "apr_audio_svc";
> -					qcom,domain = <APR_DOMAIN_ADSP>;
> -					#address-cells = <1>;
> -					#size-cells = <0>;
> -
> -					q6core: service@3 {
> -						reg = <APR_SVC_ADSP_CORE>;
> -						compatible = "qcom,q6core";
> -					};
> -
> -					q6afe: service@4 {
> -						compatible = "qcom,q6afe";
> -						reg = <APR_SVC_AFE>;
> -						q6afedai: dais {
> -							compatible = "qcom,q6afe-dais";
> -							#address-cells = <1>;
> -							#size-cells = <0>;
> -							#sound-dai-cells = <1>;
> -
> -							dai@16 {
> -								reg = <PRIMARY_MI2S_RX>;
> -								qcom,sd-lines = <0 1>;
> -							};
> -							dai@20 {
> -								reg = <TERTIARY_MI2S_TX>;
> -								qcom,sd-lines = <0 1>;
> -							};
> -							dai@127 {
> -								reg = <QUINARY_MI2S_RX>;
> -								qcom,sd-lines = <0>;
> -							};

I don't think these belong into the SoC dtsi, but elite-audio.dtsi
doesn't have the backend DAI definitions / sd-lines, so removing these
will likely break audio.

> -						};
> -
> -						q6afecc: clock-controller {
> -							compatible = "qcom,q6afe-clocks";
> -							#clock-cells = <2>;
> -						};
> -					};
> -
> -					q6asm: service@7 {
> -						compatible = "qcom,q6asm";
> -						reg = <APR_SVC_ASM>;
> -						q6asmdai: dais {
> -							compatible = "qcom,q6asm-dais";
> -							#address-cells = <1>;
> -							#size-cells = <0>;
> -							#sound-dai-cells = <1>;
> -
> -							dai@0 {
> -								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
> -								direction = <Q6ASM_DAI_RX>;
> -							};
> -							dai@1 {
> -								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
> -								direction = <Q6ASM_DAI_TX>;
> -							};
> -							dai@2 {
> -								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
> -								direction = <Q6ASM_DAI_RX>;
> -							};
> -							dai@3 {
> -								reg = <MSM_FRONTEND_DAI_MULTIMEDIA4>;
> -								direction = <Q6ASM_DAI_RX>;
> -								is-compress-dai;

Same here for the compress DAI.

Stephan

