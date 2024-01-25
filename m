Return-Path: <linux-arm-msm+bounces-8261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBA783C37F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E2E41F25D56
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9282C4F880;
	Thu, 25 Jan 2024 13:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OV4eAlWQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F08A4F8A6
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706188830; cv=none; b=NSYaAQL/fyKGk/UFu7Cd+ekacd0CxVmLBnZRlFiBjZzEr1qmGFcPoiC2/avxPuKiIvlkBE0u2clr3H5hz8cbGD8M3fxad6QziB5pkPzMGPKM04/1mGbPWXiDpNuzSQOm+xTgsLdUDNlsuboInaKFRUzSPGQLxkDxrLgcPaKb6OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706188830; c=relaxed/simple;
	bh=2CXZJyrp6iFAL52EdLsPOSjvjlG8Sc9qL+jXy8nmaq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyYtjFE8GPOuLAY91mXl/epjVLolK0bWU2z4LeBixG2OraKIh9x7t00JZjTb75if1K2WcFnXA3Q5GOUxJZx74fvRYEie8qdDJ+oR2lER3C0mJ8Kt4nK4zibRI5YLrgMkK3LPgsHAG8ZoMhirSH4cabfnLlGfQFmGrfvxIDZM1qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OV4eAlWQ; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5ff7dd8d7ceso59715927b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 05:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706188828; x=1706793628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/tDYjrG3ipq52LMTw0BWl8QpdFX3vh/NkpzYZn5kvI8=;
        b=OV4eAlWQtnnpl+44dPi7J6QmE0pbkfGrn7za1dLXjbgkcDzEu4iLouie/1ThplPUK9
         c+suiAtBjb/GgjUR04CdzfT/Ao1hjAzEwPRHa4qNUFKDxi87FH5J/t6hMnJAbn5O7Tns
         cAbqLnAZg0SXujqWlRS/XsuAiB3HtdRQjxV7FDsDcy7oHrtbM93EFnBDK01bWcnsAtv8
         idJLEJ6Gjctl4wVM8Mv0V2/2uDTHIIlqfjzqCin6NCfq2Nf09TAH2/XHIUEf552NryN9
         /oyBWWNfl78+7h983jB1+WmNM+TV4eIdfJlVdVVFFAPlHvGHN0SOhvgETLPog0Scz2Is
         s/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706188828; x=1706793628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/tDYjrG3ipq52LMTw0BWl8QpdFX3vh/NkpzYZn5kvI8=;
        b=LXVy5FtawKZQJJcYGngv26OMX5JO8WIygUH+aAREHrXp7PMI9dT/UsI5v2NCR3LtAF
         SBIiREzuiSF2MNoyBqa7KSHSHsbMeI/giIw+6Apqzwm58TNZVyUO5BhHYixaqlKX0GjH
         audsGZA4taHmJZvOiVDSBfYxnM9vDFWAxONhr9vi+Xs3apsmrd4g0MrLVEcA8r77Rpuy
         UafdQq6n2YMyGgvCDETMTnm0jwQZBWKoWp2q2qzUQNuaiB1qR8MFFHlX+vgXoX49uEax
         7sqHKKezFFbbq+QQCwK/T7NkEY7eT6DyuGFuZNbNFiJBbClg65W4JFVLiReQF1r980TK
         Rfrg==
X-Gm-Message-State: AOJu0YwrMXPWo2l+TkHQ+8VTduj33BjX5/gGbZLNA02kAoxEDcLWco6I
	/MK+SLqHNsVmPneOO6pCw1kIiQDsvEIZ3bKWPee7j/nTrpwJpfEDAvorVkxTP5DS6y4HU8qdmWa
	fDW9cFvfa2XT1bF1FoN7jgpekw7VpWKZxXsDGIQ==
X-Google-Smtp-Source: AGHT+IE/kKFnSV92jQGZrCw/siQiblRmVM3ZbROR/NC3wHXCuWovvQn3XOanm79yGEAm93sv5KHZUGzXEC/l5zgL8n4=
X-Received: by 2002:a81:b65b:0:b0:5ff:7dd8:2b4f with SMTP id
 h27-20020a81b65b000000b005ff7dd82b4fmr592216ywk.94.1706188828076; Thu, 25 Jan
 2024 05:20:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org> <20240125130626.390850-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240125130626.390850-3-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Jan 2024 15:20:17 +0200
Message-ID: <CAA8EJpqazduHm1DYwGDLjDupRgLXpP+oJXfpwpVfSnBBeTC+5Q@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8350: describe all PCI MSI interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 15:07, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Each group of MSI interrupts is mapped to the separate host interrupt.
> Describe each of interrupts in the device tree for PCIe hosts.  Not
> tested on hardware.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

