Return-Path: <linux-arm-msm+bounces-13435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F9873088
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 09:20:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D02E4B21C9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5C15D474;
	Wed,  6 Mar 2024 08:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qZMxQRxZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F45CDE8
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709713205; cv=none; b=TqQ4SrV+q69CVizVS70HVq80xO76bmKh4r0vKub71FjaWh6Gl1EOYB8G1kz8Vl6JjLabPJZaZ5680DSOQZrFeV8my7f1TjR3Oe9O7KsNOUg/8X5aZEwlCHDhcchq9qEg7DZIMkn1CVVl9Rx74vd8FThDz+/+B2L3/dlpcEiSdgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709713205; c=relaxed/simple;
	bh=eOXVyxGTQKrr0a/9S0g0Hrk5vw/Jn0sNrPViExOVtVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHysuRjoH8z2uyw1iu1K16Rxysd0HgsHn6q0hPT6wzVZlk/ycZ+sf2OECb1kK6i7iST2WXcL/7U8Pi9wcPeEBAUzGK3Py03RvaPgx6HdLntFOpgs68O+3dMv5eh8Dm4f6jSYUi9tozA2F7e4Z3ETPJpjFXHYL2WcqIz//Jz3mMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qZMxQRxZ; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6093e067220so62276727b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 00:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713203; x=1710318003; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uZBC76fSENwy+KneqSdW8FRSfPWe31aQehHnjGJ1/Zs=;
        b=qZMxQRxZVf5ajm3d9RwRzJ8sZwVHluZ+yFozJFYQdC56hQHzVU7AMsVvtjvMd1Y3IN
         wFXGy6porYIm+B3F6dTvUDElq/L0vcz+sezeYH+d1To01FPxc/EjHuPmxJQwPZFzvZAb
         KPFbHh1+DRs6m2Z2Yo2c+z7aK3sh/ztMu9cUvCBzauRo40scXhn2IM3g1D3U5PmMjSQ0
         SPlSmQ2pAXGGw3u8aHUsmx28n502LUb9sjzmhHj6z0VP/moNZPt84OvGeXtUhAEZk/i7
         NRMCN147gUVlljMpqAE6NaMpJ1mn5oWVBdnLwTtZs/oXBUcSXGoo+zkFp3PNMkKK+ZMt
         kiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713203; x=1710318003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZBC76fSENwy+KneqSdW8FRSfPWe31aQehHnjGJ1/Zs=;
        b=a4sC1YLioBDkz6ho+xCZbVyD5u24mDLUixIDuAHmkeWo8yy9VV3RA6EL/A4VtoCgHR
         K+EqTUwFTTTFIp981Vkq7vThfa5y3D0eSYEqsgB/8BUh8uzIDAZiO6eS79ZGn0/bkIu0
         DKnDycEBIr5Bk23wC+GpfsGF8bPPYaGISVNRF8KyOAOAytqVuEwzaBNMEx4C1sBwNfiv
         QGQCHuI/uguuUo8wuCjhJ4yPGwDZ0PI1+kBvkMTxl/p5hEH9KO7w3UQGuD4wNiuRTA4r
         m24/UOcK8Nrh18AMKjmvkbO7MUCaFzkQYzsmlK9U8m4Uwpxou1IVWCPvH6PQlaR2NqJP
         4KTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6jIYQ+6Fjl1ADD9gfmORTdcep0bgtaNW2eB2I9euoo6V2aDHQVUImC2TtaPU6PCIjAT+el5JYaYNF4gD2SsBv9epPBwbznYoahKRJ7g==
X-Gm-Message-State: AOJu0YyPYkxV+PYhSqhcg00PoO+LMN/IigFmR/uWtdq8q1pqbZ4vfFxQ
	CbFYaM6sCJicsSe2fSiHZYMJFO2tak0HeSQMLZcnKAS3ITNj9Gw/uQ3eZocnoJY3ZwRnPdQfFXo
	xF9rlrswLvO1gkz26MFzGs1jYcnFDolLH20cznA==
X-Google-Smtp-Source: AGHT+IHmSEq4j6J3wCtEWvd0nDZ+HJhTa6lo6OjGsJL8RlcpCjZPLN6kBAKWI2pyqgguTpS58xSFj4shg2VyfA6Y9G8=
X-Received: by 2002:a25:9d88:0:b0:dcb:aa26:50fe with SMTP id
 v8-20020a259d88000000b00dcbaa2650femr11041610ybp.15.1709713203375; Wed, 06
 Mar 2024 00:20:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306-castor-changes-v1-0-2286eaf85fff@z3ntu.xyz> <20240306-castor-changes-v1-4-2286eaf85fff@z3ntu.xyz>
In-Reply-To: <20240306-castor-changes-v1-4-2286eaf85fff@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 10:19:52 +0200
Message-ID: <CAA8EJpqBHoGj0Brfiu8GQbxBKfB=v0-x=udMTE8wqVbO-rRjXQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: dts: qcom: msm8974pro-castor: Add
 debounce-interval for keys
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 01:26, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Set the debounce-interval for the GPIO keys.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 ++
>  1 file changed, 2 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

