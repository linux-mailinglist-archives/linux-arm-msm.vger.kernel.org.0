Return-Path: <linux-arm-msm+bounces-46211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1475A1D336
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFEFD3A2D1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 09:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33DA91FCFFC;
	Mon, 27 Jan 2025 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imBng/mE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC92B1FCFD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 09:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737969569; cv=none; b=anONRkZdCRGT7CQBTH671xC2Eceu3RMFEEu2NB5Ka36XEdzzVF50Lzw1xh7hlUZ9Gep1u2BPneajW9RBSm2VGRqGFmF56Ph99kChs3bbCzEpPG5ej9vWAsh7dxTu4i/ApSeHDIr4+p9KDo+EnlkFfuLYlP1D1rF/eWdwvWpoIkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737969569; c=relaxed/simple;
	bh=9/1eFkMbhlyNzQK0zxHdGjdZ45bU6EV3bHiGqfEX/FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mN99UdRzlKEelR100UBpctRji9fhiHMXzo8Ur4Ng4yD80oK47h5vkKwQFXd2ak/lbRIeCxTRcjPJ18pXNwxEdrnL5rQUNzXw0TjOjmrBVzZWPlIFUjk9eRxEKOYxMoarbeDyj7oLH/r+DKcUcAtcpj3O7V4HKaXroQHiMYqm8f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imBng/mE; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab2e308a99bso824441866b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 01:19:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737969564; x=1738574364; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ns14BzOZma5VSqqkVW3NbLI19BCWZa5f2OVnRE8Ni44=;
        b=imBng/mEX8u/CEUAHp397+i/MTeFHQHffShS83TNkL+V1qi/i1LAnH2CN5Wmav/9vM
         Sh8/ZU0t9PpCnQQe5Ero9sfwpys5syi+8iIN7LIsNm1CrILb5mmx3inZxu7oJgH8lukH
         shJVJqwl7V0JdBfYEZtkL4i4qplQWFXmtrstSsMXeRIVLGbqbY8T6gpfA6juSWBi8zQn
         y9KqT+JYYCzvx47uMDg5ifdZHEMZfRqBPmenHjjSrq4Fs66dQnyr+QWF/XLnfPyFarW2
         akt6gQAa3laWhc8P2O4w02ZUt4MLdPBUolz1Iq76MA6yptkFpHA8q7354vucoZ1p8zgA
         3K0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737969564; x=1738574364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns14BzOZma5VSqqkVW3NbLI19BCWZa5f2OVnRE8Ni44=;
        b=H53+4x491BtX37VIABLLgSYdA39n7+/kgv6qOpxrCKq3F7pdDcj87cfzw73kxzmmRm
         kST2nU7+j+lx6h4pb3oDxzkZ57GgchplOjnZ4kQbs48HlYIyt3Pb12lry+gjnqLEGCgg
         JKFQTuXu+qWkEasDNyfhkRQWhU7N2U3ndom7rN45yQdCln1KpZqtna5n68Akx42CxdMz
         kLE9wU8s6+DwNbaQwbZWW5gei1YtH7zVVqC+17pKwX2bn69hm0LjNsWSQHc9sCuJzZlr
         aJWBQcrVvDZza+vXlKXbTdnJCdlArgRi1j8wUXSL0TZMzctCEu1OnIGSCEcpnnEvX637
         OGNw==
X-Forwarded-Encrypted: i=1; AJvYcCVso+eV1XtE7/3owODW0yBnDMiu574xxk+SLhF3pU5uwmMKsR2y1RxUZC51YDYVLDXQEh7lyqQj6fFA9BUF@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMPSUegiOc47BdYCaq6WN907LwbHXrGsxIWrcrbJ6qNznuV+Z
	XlUDgxL4GAj31jFMJS8Zoq0dxdGnUK+Wr2u7OjlxAS6TAuvWNIuJhrRYRTdcP30=
X-Gm-Gg: ASbGncvHlXaacUaRcMr2FEhUo2kjySE/x5p2TjvmZH0NTok4ObY5WKwGcl0eGUt968k
	DTxdFOlI4T1kUZlXkdP2D6CNEFbR02dURfjlZByhXD826DDUv71ROSRWQvHR79LcxrHsSCEG12G
	FGgz9FgmqY9RQSgIXLI+NI2ejUJfIhL4xd/Z7y4pCtJbeeR8lJz84QS6vXjUGKDDl5oCQbd+6nP
	xhiBx31l0ei25sbQFb6Q1lxlrPUBOvaQrXi2qZC2YGvAJblSaBgsoewvENv0e/tcrYD8/aFrKSY
	hDMe5l612QyE4YDQ
X-Google-Smtp-Source: AGHT+IGIbWOkeOIH+HEPI6RlesPzjwtnrNcMXE6wlcMy7kUftKsZDhvi22QvFpKQMEzXkFkXiKQDTw==
X-Received: by 2002:a17:907:72d6:b0:ab3:4d1e:4606 with SMTP id a640c23a62f3a-ab662910720mr1514830366b.3.1737969563971;
        Mon, 27 Jan 2025 01:19:23 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff21:ef30:f64e:7d70:e55f:6da8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e8b01asm541488066b.84.2025.01.27.01.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 01:19:23 -0800 (PST)
Date: Mon, 27 Jan 2025 10:19:21 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Matti =?iso-8859-1?Q?Lehtim=E4ki?= <matti.lehtimaki@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/9] ARM: dts: qcom: msm8226: Add modem remoteproc node
Message-ID: <Z5dPmbZY6h-7LGqS@linaro.org>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-7-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250126-msm8226-modem-v2-7-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:26PM +0100, Luca Weiss wrote:
> Add a node for the modem remoteproc found on MSM8226.
> 
> For the apq8026 smartwatches, delete the modem reserved-memory again
> since they have very little RAM in the first place anyways, and all of
> these devices don't have functional modem firmware anyways - these
> watches don't even have GPS.
> 
> Co-developed-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../boot/dts/qcom/qcom-apq8026-asus-sparrow.dts    |  7 ++
>  .../boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts |  7 ++
>  arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |  7 ++
>  .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |  2 +
>  .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  6 +-
>  arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 80 ++++++++++++++++++++++
>  arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  2 +
>  7 files changed, 109 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> index a2ca456012f1a070afc2805ae71ddbf6f5aac607..816b61ea504ee80d86dd4ccd1a15db687f6a91ff 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
> @@ -9,6 +9,8 @@
>  #include "pm8226.dtsi"
>  
>  /delete-node/ &adsp_region;
> +/delete-node/ &mba_region;
> +/delete-node/ &mpss_region;
>  
>  / {
>  	model = "ASUS ZenWatch 2";
> @@ -82,6 +84,11 @@ bluetooth {
>  	};
>  };
>  
> +/* No (useful) modem on this device */
> +&modem {
> +	/delete-property/ memory-region;
> +};

Rather than putting /delete-node/ and /delete-property/ on all devices
that do not need/use the modem, I think it would be cleaner if you make
the remoteproc related reserved-memory status = "disabled" by default
and enable it only where necessary together with the modem. The &modem
itself is status = "disabled" by default, so it makes sense to use the
same for the reserved memory as well. See e.g. the existing usage of
this pattern for &mpss_mem/&wcnss_mem/&venus_mem/&mba_mem in
msm8916.dtsi. Then you can drop the /delete-property/ here.

It would be even nicer to use the dynamic allocation
(size/alignment/alloc-ranges instead of reg), but I'm skeptical if this
will work properly on such an old platform...

Thanks,
Stephan

