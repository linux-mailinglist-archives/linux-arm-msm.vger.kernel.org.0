Return-Path: <linux-arm-msm+bounces-20478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 990068CF148
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 22:15:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA3B41C20A19
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E5312839A;
	Sat, 25 May 2024 20:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I0jFpuVB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA26938DD8
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 20:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716668110; cv=none; b=d1N7rxfHtGWdSyb7KiJnv6C8RnAaIV7MzJMWngmbyuufAEIIRcDvh94nk260l8HFVK6g3CG6GNAQGRV62pHOz5ZUWMOQdJoIAGYX/E51P/CyEpSLYmkFQqQsMJimHnbr935NFIOb6NX0aMMs9X6TPd5LZKJ7fhzn/hobjcb5JnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716668110; c=relaxed/simple;
	bh=a+2sJsXVsmEzRiG+2OlaEa+uVn+nhz5cWtvRMbWfStY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/hesd9woFIItGT8CjLrquRv/Jdu/bH6Qs3n2HWDXby4D0MXPmvVqIxsLev0uCawwBq0sI3toV3OIPGG4LBcmlrx5/Dup4NvjObd7ywSPcZJiFsbFLjiBQcZa4oGVj9pvYbnVIireKl6Lr9ecuG1MZVHfBFo8jEgunC7cAg7pp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I0jFpuVB; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so86603321fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 13:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716668106; x=1717272906; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=egWjRNm6b0cKfW6TfbtwfyF/4NhODfHU/rXiLN8YUss=;
        b=I0jFpuVBcRLu1egw011pJYlW/3rkNVNeMP9wOzlafSR1R5pj/G5c3JfSSB3WP/reta
         jx+v2ypOuV8qxGXhq0iLt4mYgrZc4nYYmozYYS9XoczkGpMxyHaWmddzDX2hu0uFZ1RX
         bbkZUvGpwTkE1LSIXVYvCFnbzTNTnFcMu5JhCdF33vpTQU2EicTQRtloMsb+pySlL5Dl
         KaZHbxZzrZEzk605vle0dV/cpf3BvulJQS7bqgwZLobPFzE3LBFcbM7GzInYc3gJHJpc
         /8/zUKorkFdIM6SqrmHrGwaqZp7+H+4PSIl6g0/9NQWfvbS5OaASvgN1IFuVePQzpTvK
         xPrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716668106; x=1717272906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egWjRNm6b0cKfW6TfbtwfyF/4NhODfHU/rXiLN8YUss=;
        b=JKX7qv8NubyOCs6xSqRoN2FmEq8n9DEIuyxqhyWU6r0+8YmZyUuinm7eQK7jkIGsLp
         rGWPk83I8rO8r4N2M/I/A3h8ics/Pv5O543ABq/36ZkIHUmSHGGLSoBKYEADHFXNcewP
         lat4t9NzlpyUi+nmO6XQ4hAYwPGf/UqIj/KJf+zhGLLqaPkSuzQ/8K46CKm1nGOTnUTk
         6up0WCdo/NVgY01Zqk64pah1bHgOn8nzlQT5d1H1Fqu4T9VFKKGPZcaI73/bz6LBlbfY
         eopfm24gLulDXVccyl15TjvLzWrLG67EnKhiFhPRjdVEEPs8vRRzP3WaJakkF4E8eRD6
         VOqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFhB46Ign4GwKM4uyshxaNTydamSsTT/FXvrQ2Kf77TlJFHDkvW9Ky4guvfNfKpCJZVa//duOVfO0jkqTo22S0otw5+WaNZA6OZ5Pxeg==
X-Gm-Message-State: AOJu0YxZBtno8/v3EOEO/4BE4mJGmCZoxt96sx2e54sa/Uc0XizbWCKA
	PtL5yc665d0tOFCgqdOnpwjlqvXQjj2p8HgH5Y9JB2AlgoGoJ2rloRvV8TzYInU=
X-Google-Smtp-Source: AGHT+IHiQh33yuCyFRiG6oGt+h+qN4Mxt2GwttIkrQpd6pTLi9+gx2U58NUig8jJLSxwAFcop03z6Q==
X-Received: by 2002:a2e:9b12:0:b0:2df:9c94:150e with SMTP id 38308e7fff4ca-2e95b0bcf56mr31356691fa.25.1716668105844;
        Sat, 25 May 2024 13:15:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdcd234sm8779761fa.99.2024.05.25.13.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:15:05 -0700 (PDT)
Date: Sat, 25 May 2024 23:15:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-usb@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 06/10] arm64: dts: qcom: sc8180x-pmics: Add second
 PMC8180 GPIO
Message-ID: <rajxidory6cviwatbrkrwokm6pjep3bez3cb6goomzjqk5w3f6@3osk2nd6zl6x>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-6-60a904392438@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-usb-mp-v1-6-60a904392438@quicinc.com>

On Sat, May 25, 2024 at 11:03:59AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The SC8180X comes with two PMC8180 PMICs, with the GPIO block being used
> to control VBUS supply of the second USB multiport port.
> 
> Rename the GPIO controller in the first PMC8180 to match the schematics
> and define this second controller.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

