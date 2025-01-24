Return-Path: <linux-arm-msm+bounces-46079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C39CA1B499
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED1453AB8D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AAE21A953;
	Fri, 24 Jan 2025 11:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U7FmWY+L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455BC23B0
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717489; cv=none; b=h/m25CVDVFibFz/iW2zjlFKSC71gaEWNfLJD6wjcukRCEdogcpyxr9WzYLCNOIWDRLd1yYVfkeC9B0An8tvkG9XztVSv+K2Qd7dki5V1sCGnnLKe09GXTEEtMCFWL5Ss5M2Ht8Nlop3YQwIWevPxZOM4pHSw8Puh5rzxLeuA8KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717489; c=relaxed/simple;
	bh=T77o10XTx9CxIgLZenUyPw8caNMGGg9q3IEtg0qKC1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+jsCeWDgxgj65K44W+W4oLGMojRO+6wtB9UnKqUWQmnCFparAmqUZZRKVo9pGMV56G0QF6AyUMwQz5WO185Y156PqsjjqWpEs2eBi3Om/vZkI0G4uroUOUolFOlu25+YTVrwz+QvLDKUG1/y/M48pJmOT7drQ+85ptzMyTDFXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U7FmWY+L; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30737db1aa9so18503451fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 03:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737717484; x=1738322284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T0llOVDAU4gsmmjbiErKgwKuDgcLmaYcrMGcHc3GCiQ=;
        b=U7FmWY+LEqln8D9bLw0ileicGt18EuqnljDOQAYwV12tf8kCltWIzteOl6xL07XocY
         uCHjo7uDE17te39xLhcveBaFL+ccG3OG8v+ILwssoA7//x0OwUNmTkBpW+xW0bcVSc/V
         bm5kIZ0A/FKwjzu/6aPg9vIyI1Raes4vG/mAAIEH0/0CP/Xqrr4OTViS/FhdpJeVeplx
         L2SMfPvRVfrba2akLmz4UZ35N8il7pC0AmecCuOLnsqsPWPrU3jUplP2PADRP1YuaNsI
         DWtChRkOIu/AvxnhbJo0pdkh6an1ln+0RY9StPiSs5pxM2L1TkIXk9hUBnEvooir0FxY
         Y2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717484; x=1738322284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0llOVDAU4gsmmjbiErKgwKuDgcLmaYcrMGcHc3GCiQ=;
        b=wlRdSBc+9CTrgM7uJW22W1izWTk3WD6GvkY7Ibxw9WKdBdr/752adb5li20EOjBROg
         PuB30XEiPAwO5IDjIuVxzO931i+0dxKQOIgcWlzsyepobOF4zLBH7oddckjZAy211qrd
         Z5Hn/2+gIXWKEiQ4Lh3dyQaFO7WzVlw8gC65QEtrIR6IlG1igRWMY8wyoTYH/4C9iDdo
         Oy1dSuO4HPNZGG2qAl3Xc5QTLrps2JdDuW85tRiPY+ZtoPJ2v90B16+LftuRJ4LEu7Zo
         Dyl66uGXzLQAoq6qIGSpRJ1KCplRjrJSivGwlLEU6iZbwPme9jaQSsrf3Dc0rbsyjYxV
         8GsA==
X-Forwarded-Encrypted: i=1; AJvYcCXteMh2YDiwiRijL9kPDT70QYCOW7tHeOoXOTiuFdHKfE9z/6iJOBth4LI8URSKuhOSRdseWYL5//XPsCKh@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0Mr/E/CrvQ+UUNoD0e7ciSfC1wLOk95rV0V+lhSdZtWdJ+P65
	QnfOR5VpB9BXybtj8hoMO+nPWu8j0KOpjgLrHknMX7xk4zjcPCS9Iezn0VKkHUk=
X-Gm-Gg: ASbGncs6tjHVsQ8r8KiiCZIWBlkUHDkC7G9IbYC630rbfj0HNii0cYFvRuhEE8D0H9y
	px7dFFC3uhj/Y1ET6Eeuavfxa5WyDZ/GDI3I3b91Vnpa50KdMuxnXaCYpSE6YRbttRahh8aq4Jo
	3pC89Ig59K4X5t5OOVCcg0YjkBIqFScGkOKOYEKoEityoblARWTN5sHnuY0Gr4HPqJ598m9LeJg
	BUTObiazPbk105884piZUmjl6VJFPzgbbFHyq8J5kAG5ytetPQug7aYHeKi5nSb5SiLpHfUNkDg
	Rnd5BIFYRvTyxfNolIuxwshJJMLgF4PONbTb2UAneZ2Ld5BSnGvMCjg/egk/
X-Google-Smtp-Source: AGHT+IEvnA4WjUqgAID/Sz4S55WqtF4SuOXbwQGAlWGJct+SYEIXS3XgIZ7BKsiqifM+MoW/qS4z4g==
X-Received: by 2002:ac2:4e0e:0:b0:53e:2f9d:6a73 with SMTP id 2adb3069b0e04-5439c1c60e7mr11960921e87.0.1737717484311;
        Fri, 24 Jan 2025 03:18:04 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c836845fsm257580e87.141.2025.01.24.03.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:18:03 -0800 (PST)
Date: Fri, 24 Jan 2025 13:18:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org, 
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
	quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
Subject: Re: [PATCH v2 2/8] dt-bindings: i2c: qcom,i2c-geni: Add support for
 selecting data transfer mode
Message-ID: <r4zfoaub3dwkirdbsolbl56xxa7ax5eusb2256c7ezlyl2s3vh@hit4g5cpzijw>
References: <20250124105309.295769-1-quic_vdadhani@quicinc.com>
 <20250124105309.295769-3-quic_vdadhani@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124105309.295769-3-quic_vdadhani@quicinc.com>

On Fri, Jan 24, 2025 at 04:23:03PM +0530, Viken Dadhaniya wrote:
> Data transfer mode is fixed by TrustZone (TZ), which currently restricts
> developers from modifying the transfer mode from the APPS side.
> 
> Document the 'qcom,xfer-mode' properties to select the data transfer mode,
> either GPI DMA (Generic Packet Interface) or non-GPI mode (PIO/CPU DMA).
> 
> I2C controller can operate in one of two modes based on the
> 'qcom,xfer-mode' property, and the firmware is loaded accordingly.

Is it possible to load the firmware after it being loaded by TZ? Is it
possible to change the mode at runtime too?

> 
> Co-developed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---
> 
> v1 -> v2:
> 
> - Drop 'qcom,load-firmware' property and add 'firmware-name' property in
>   qup common driver.
> - Update commit log.
> 
> v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-2-quic_vdadhani@quicinc.com/
> ---
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml        | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> index 9f66a3bb1f80..68e4bf0c84d1 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-geni-qcom.yaml
> @@ -66,6 +66,12 @@ properties:
>    required-opps:
>      maxItems: 1
>  
> +  qcom,xfer-mode:
> +    description: Set the value to 1 for non-GPI (FIFO/CPU DMA) mode and 3 for GPI DMA mode.
> +      The default mode is FIFO.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 3]
> +
>  required:
>    - compatible
>    - interrupts
> @@ -142,5 +148,6 @@ examples:
>          interconnect-names = "qup-core", "qup-config", "qup-memory";
>          power-domains = <&rpmhpd SC7180_CX>;
>          required-opps = <&rpmhpd_opp_low_svs>;
> +        qcom,xfer-mode = <1>;

What does <1> mean? Please provide corresponding defines.

>      };
>  ...
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

