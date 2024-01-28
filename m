Return-Path: <linux-arm-msm+bounces-8653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3853583F2AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 02:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E97AF286C33
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jan 2024 01:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED4C186F;
	Sun, 28 Jan 2024 01:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iU3z4Mk8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD3F10F4
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 01:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706403693; cv=none; b=EtgfgBNVTtrGZlfL2Kgy0jX9lTsiPac2aVM0CFYMAniDTJJkYAJJN3zLGcWLVnhh6HM5Y2a/IUrXhBs5ict5a7N9miGB6vlomYHjHG4+hVyjem8Mg1FKwgW4kNOCGBDlKExY+DKi8bPB5p7J3V0Tt873FlYa44rcxbj3rTRM+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706403693; c=relaxed/simple;
	bh=s1ktUUM3CbOPG51ADbCX7yYyhsiSqRrPySzxWGfX3cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kidmhsPcnBHLix43gxXA+q2ZCdRmwosnAwrAsa4J51QgObNCUfUEmgKaL6Q50L0znlnj2zNt2ANpJVGLdsUku9AYX+CN6Sx2UFYB9Y47ZZnBQJjpoBYmwQgCyJhKLyjQz5Utp1Ioj2oz/qocikIm1st0pUsytXVMs+aLL07UUXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iU3z4Mk8; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5ff828b93f0so17625357b3.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jan 2024 17:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706403690; x=1707008490; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Akq4ZUpGAZUPtZ9ZSl7kec9+rWKqnjhKQTKGm0D6B4E=;
        b=iU3z4Mk8LGTYyxCHw/aQclMPmjNBcd6xju8kqXbvDKIjCe792H4H12h8GKYp8Uy8d4
         Rjq5Y/zOfU9cOqx5HHIFFnXUGVZHKKSTb/nNx+JmBdefMcUafRWfu+wK6eUJq41YcY34
         tXVlwMIxzH+6zTm6iifdoo73zlWuLESVF6QHAa1PQLXB9RhUvrFrS3b1NjrZ+ziVn7Oy
         Lc86UxfxxeWlSGWmVPez6uje9gdDop/if/+xXDfjbQKocyrbUEAe1rBcEggCOTDUQypZ
         lZxQspP/3QGzHMRSMW95OSF8g7spAcO6QUOlEgo4ukdymr4uYOPWAYOM8u+sHJCsQcrG
         79ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706403690; x=1707008490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Akq4ZUpGAZUPtZ9ZSl7kec9+rWKqnjhKQTKGm0D6B4E=;
        b=DGTZpW/ufhEa9nCfk89XLC2nNpMGd4x2jntwu2Qitlw433eYpLpBhZR3a9XwlHg7nq
         mRxqj4NlGvxcHCKZcFEENAPIilzz7GDTqcoCqc02jvo5OMv7JCRt3f4Cx3AdpHKFD8LK
         xUockIYqzOc249Qe0aVenQAvhiauW1i7tTWPrUnS63gPIwZMu+urO1cP+iKztaU0eVIr
         WNoMvP1C60s0Muop2ReagYVHYgzKc5lohzw8fhRRQO0JsoBwY5yrTli2Q1D7FzTxVrPm
         ngsybQGk+qIivvfmTLUKPqPnnsHDAkfa54vWp0zV0/u0A3K4lCC97immC1yL6iOu2r+w
         0cFg==
X-Gm-Message-State: AOJu0Yz2LKsH8gwbfQztMjdCUytswbxq1WqY6V/dvU1qU3qrDOuThOCa
	CZgvP8rU529fAfDxLO3mC0u9RzcPwhTVFMaJEHuJ9MH5A21jiZdNBIKF4/4LY3/W5OIln1pnFdt
	gJn2lextNGUwlgSLnnnBrAWNaXuQYjvmM3oQ2vg==
X-Google-Smtp-Source: AGHT+IFYb7HatSQPPLoPjPqnFQmWWbGZoWPVCQcd0gG1UWF2VmrKzHToe0mTzGvGfmkPE6SpfevyHBwphWYYblRQKag=
X-Received: by 2002:a81:6d4a:0:b0:5d7:1941:aa6 with SMTP id
 i71-20020a816d4a000000b005d719410aa6mr2551028ywc.65.1706403689965; Sat, 27
 Jan 2024 17:01:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127232436.2632187-1-quic_gaurkash@quicinc.com> <20240127232436.2632187-16-quic_gaurkash@quicinc.com>
In-Reply-To: <20240127232436.2632187-16-quic_gaurkash@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 28 Jan 2024 03:01:18 +0200
Message-ID: <CAA8EJpr5fLYR1v64-DtjOigkUy3579tx_gwHpFWr9k0GyGajGw@mail.gmail.com>
Subject: Re: [PATCH v4 15/15] arm64: dts: qcom: sm8550: add hwkm support to
 ufs ice
To: Gaurav Kashyap <quic_gaurkash@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	andersson@kernel.org, ebiggers@google.com, neil.armstrong@linaro.org, 
	srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, kernel@quicinc.com, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, quic_omprsing@quicinc.com, 
	quic_nguyenb@quicinc.com, bartosz.golaszewski@linaro.org, 
	konrad.dybcio@linaro.org, ulf.hansson@linaro.org, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, mani@kernel.org, davem@davemloft.net, 
	herbert@gondor.apana.org.au
Content-Type: text/plain; charset="UTF-8"

On Sun, 28 Jan 2024 at 01:28, Gaurav Kashyap <quic_gaurkash@quicinc.com> wrote:
>
> The Inline Crypto Engine (ICE) for UFS/EMMC supports the
> Hardware Key Manager (HWKM) to securely manage storage
> keys. Enable using this hardware on sm8550.
>
> This requires two changes:
> 1. Register size increase: HWKM is an additional piece of hardware
>    sitting alongside ICE, and extends the old ICE's register space.
> 2. Explicitly tell the ICE driver to use HWKM with ICE so that
>    wrapped keys are used in sm8550.
>
> NOTE: Although wrapped keys cannot be independently generated and
> tested on this platform using generate, prepare and import key calls,
> there are non-kernel paths to create wrapped keys, and still use the
> kernel to program them into ICE. Hence, enabling wrapped key support
> on sm8550 too.
>
> Signed-off-by: Gaurav Kashyap <quic_gaurkash@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index ee1ba5a8c8fc..b5b41d0a544c 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1977,7 +1977,8 @@ ufs_mem_hc: ufs@1d84000 {
>                 ice: crypto@1d88000 {
>                         compatible = "qcom,sm8550-inline-crypto-engine",
>                                      "qcom,inline-crypto-engine";
> -                       reg = <0 0x01d88000 0 0x8000>;
> +                       reg = <0 0x01d88000 0 0x10000>;

Does the driver fail gracefully with the old DT size? At least it
should not crash.

> +                       qcom,ice-use-hwkm;
>                         clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;

-- 
With best wishes
Dmitry

