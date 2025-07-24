Return-Path: <linux-arm-msm+bounces-66425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B19BB10210
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:38:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4B574E5EE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 07:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6438917332C;
	Thu, 24 Jul 2025 07:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cVog1w1L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4FE20C488
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 07:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753342700; cv=none; b=TYP0JWLr+NMWgYjCOvMjU82wvMyPLTadTiCavY0fNcTVZbaEOjQJYynbMkUfUeNyLECkYvDcaSJWSKb1+rzSi5vxB0B9IU32QWpLT58ihQXeysj/IeZf0DxWvA7UNRaAr5QEMGmBGdiyIW+Yl0SrFnS8d9SgMsIdQ0f8tE0QCsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753342700; c=relaxed/simple;
	bh=XMo5wVnP/DHvbksMe66IGloTgufAjU7VBz1qtOl7914=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QY7udqv9CKMSxbl9o7M5+uhBBZB7w7u0JlNg7VZfm3pH5Kaah7bQaASUdc9lv2j3YrMARTHRJDh3KaYj2092hNwMiyQsDBbCucZJzxr4JNC75ohNM4KwFXBATiEKSLsuzDiKG0L7PctU+llsvXW/jmgT4877M+EOo/CSpxmdaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cVog1w1L; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso1293201a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 00:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753342697; x=1753947497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uLS0cyVXvF9oWhEwcV+HClOdOr+8tl26dQR02w38alo=;
        b=cVog1w1LCkwPNESDAwKVkW13L66WAzQsjqkFGHjtUDf8IRdpLjCHh+HuIcOJuJAnUI
         opJZlPGeaEiNvnde1mZs7HXIZMgtszdTH/3hcwCUgY1d6var20r+9zrcB1lwtfLGermS
         dYFMqM+EjmATnDj25tD95z5QcLP5e43anA/D0osfe43bQ9c4Mh8ydQ23kRRqndvVh7dh
         OPqmRQwxK3eDsIOP4pkmkVvsrRzNw2KKXhhY0k4LwF+ZiIlfJdvwpYblfz7WnzaB4082
         +i4u6kK+MqM5XaAQhDjg4WbesTr577P6/07BjDvrJZNAze/hbSu7bfkeLXi5SzgJ1kMs
         WZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753342697; x=1753947497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uLS0cyVXvF9oWhEwcV+HClOdOr+8tl26dQR02w38alo=;
        b=CXyOppyJOjxasAH+oSmc+SpR+VJ6MvrugaiIEH/guqiR31w58jaVRaB3M76b5IVlyR
         z5NhQ5O++tA6I8A3at44ZYTrVw/UcxPcffefwLSBym3xQxQ7R9RDQD/pOE0+H41CGbh8
         EF/pCBYN1uGSOtLdOX3KR5uKhYKeUT/Tqjhdri7eByBJn0rMSzuGE9lnqgIYHffQSqi/
         mCroTMkShoevftAEcYZ2cM1SbiAbJ+sJ/rRQnM6vtraDR4iTD/2QMoInAbngkQkubEp4
         kndOhFegg+if++SSORBs5nubJQOFVYSWVpuSgf32QlBbqHtGX7j+dLk9Mj2IOFtup5fQ
         bjEw==
X-Forwarded-Encrypted: i=1; AJvYcCUWv/QhW/sWKpwQLo18BBlqJkQ6Gj3FQsDIGmvGQHdfq65m36pJvo0FfebXh9z6CXUKF01DSCOan+XcbWT3@vger.kernel.org
X-Gm-Message-State: AOJu0YycfciUluzkTkzyA7/I/XvKoGvDhuSUKMQcGcyy6d0NJjvzPFqz
	kkG4+0JIPybbq1Pnq2uxHoRG1TosXT4pmeVI0XyqnkMFPl1RvD8TzcbrZqUIEZb73dk=
X-Gm-Gg: ASbGncukrMSqxUUij8fpULm6iE1SFcomsmXbd/AeEYvBBaV1UoZqXISdsmc5UxhDszH
	tPRBmCZ8/tFnic5LHVPPmNhddKpFPOVsUOcaRWXXQDrmn0UDLHGZ/PbpdV+yhj5HyQMuVimNdax
	deYJmg6yr30IJqCpfiRTybPC0muNI5hvM83wzAPuNhPzxPQP2tNfJAbAqw3s4mP/CMApV5WAVpM
	O6R6Q9TrWHIbo3lJI+DnaaJxzo2x2yHjUmX2SeCQbIdmdK7ZheIUFdBMM737MF1OZogk6UBvoCg
	gbUc4t6c7FRg+LfnwEPpUqnwtrPmAPDSQCd0fOPcM2/PQQB4e2KQVY8dwlcwkusiYK5OKHoEoMJ
	hTVticFb+wxuSAmHCZToyAHdkXY2u8qYvMw==
X-Google-Smtp-Source: AGHT+IGduq9hDBYSNTPiUUK+/gg52xU7/5h42fk0D1bb1J2d+0Yxz9hXxWmGJGWnFnoN5N9AKY4J7g==
X-Received: by 2002:a17:906:9fc4:b0:ae6:ae75:4ff6 with SMTP id a640c23a62f3a-af2f9281dd1mr561122266b.52.1753342696807;
        Thu, 24 Jul 2025 00:38:16 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:706f:1fb4:134c:465d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47ff42b60sm69731366b.132.2025.07.24.00.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 00:38:16 -0700 (PDT)
Date: Thu, 24 Jul 2025 09:38:14 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/23] arm64: dts: qcom: sc7180: use dedicated
 elite-audio dtsi
Message-ID: <aIHi5uPxAtYARc7O@linaro.org>
References: <20250723222737.35561-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250723222737.35561-14-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723222737.35561-14-srinivas.kandagatla@oss.qualcomm.com>

On Wed, Jul 23, 2025 at 11:27:27PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Make use of elite-audio.dtsi and remove the gpr nodes from SoC dtsi.
> This move removes duplication.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/sc7180-acer-aspire1.dts     |  1 +
>  arch/arm64/boot/dts/qcom/sc7180-audio.dtsi    |  8 +++
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts       |  1 +
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |  1 +
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          | 56 +------------------
>  arch/arm64/boot/dts/qcom/sm7125.dtsi          |  1 +
>  6 files changed, 13 insertions(+), 55 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-audio.dtsi
> 
> [...]
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-audio.dtsi b/arch/arm64/boot/dts/qcom/sc7180-audio.dtsi
> new file mode 100644
> index 000000000000..d6d41ba93195
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-audio.dtsi
> @@ -0,0 +1,8 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +#include "elite-audio.dtsi"
> +&q6asmdai{
> +	iommus = <&apps_smmu 0x1001 0x0>;
> +};
> [...]
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 74ab321d3333..0e267b9fdefc 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -13,6 +13,7 @@
>  #include <dt-bindings/sound/sc7180-lpass.h>
>  
>  #include "sc7180.dtsi"
> +#include "sc7180-audio.dtsi"
>  #include "sc7180-firmware-tfa.dtsi"
>  /* PMICs depend on spmi_bus label and so must come after sc7180.dtsi */
>  #include "pm6150.dtsi"

ChromeOS on SC7180 uses ADSP bypass, so explicitly including
elite-audio.dtsi for Trogdor is a bit unexpected. It doesn't use those
nodes at all.

Thanks,
Stephan

