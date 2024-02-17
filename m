Return-Path: <linux-arm-msm+bounces-11547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A08591AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 19:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6F4CB20F5A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Feb 2024 18:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE24C7E107;
	Sat, 17 Feb 2024 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uJowWFHS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541B07C6F0
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708193889; cv=none; b=AE1vjQwKei6QN8A1DalnBs1wQuAb55WFNsREELpc6YNdM3NlMxw6ub26NwUlKwB2URt9fACwXPb6LH/d62+1aiTIrHnHFVkv/HAevRNi0gE83ZbnFq1mIKCRUMSfvQSfSjx32S25JMuldD4xeMPU8BTCPAH029R+Fks/4UK5Jwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708193889; c=relaxed/simple;
	bh=Qzb3J1w292mYeic6Z5BobktYBhZzdTBYI73MRYlqTkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJRjCKcF5QdZ5sTmrR/q3ddUjZLImTFCqjpTRg31XYf+wtAfdiJur5N8Ype6wy+SF/SlPtLda563tSkbYkPhqze5cpfXP5u/3vxPbqqEL0FcWgr4+SQhvhcIa6ADts8wYg+1OvXpHzybZtq+btQjyldqZVTmBQo3/tG6JDK9s4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uJowWFHS; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-db4364ecd6aso1788694276.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Feb 2024 10:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708193886; x=1708798686; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jbyO0DKsw6wXpJbxjwS7LuEbfeSrnfaky7pY4pa8Iro=;
        b=uJowWFHSJ1P2USUNXbh/zxGJ/QO55sPlMfi/4QkaKQLURCJgqMlbZJnwy2RryLTxWQ
         YrEe9z8OP+yYWARHRuCN+LS2m3hZn85H9SGmP3SLx89Cr+Pp4Hy514hsAoa4UX2Toh/O
         +ojjUSS1DX120V81zQC3xDlKz0CjRiNlEa8urvFtB15hoV0CUZDZMUhkSxkpIpWkiSPf
         EtU5D3Lzj0LKKc6PbmahFHMSxob0NocBjuYZwsi9sohSi4sHXJ2bV1KR6I1JCYrpdfNf
         kYAX/K6/5DL2KeWzlHsg21aAql8CD0uKFlnpplicBGJ/z7c3uv7osJ2cRDQprg5cfQbi
         ViZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708193886; x=1708798686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbyO0DKsw6wXpJbxjwS7LuEbfeSrnfaky7pY4pa8Iro=;
        b=H7GJ1Wuy+b+KbIKsTgqrpwtn3AUHzLqTuMTju8dx6PW970J6AVvK4RorFaRiFSp+o7
         Eu05Vgx2cDKkhh5noqY3EUWLpfKASr+JCcfbTnOzhXfu+4uXpAILkYghb2VY8kyfZrcw
         LIeUJIFxAbQ9vitNeKU58tOtfTjceCf6Q7z5POFB2b7IdM0snx/jJWB3e5LwW2olbTqj
         +cQQrR8Gw5MaXCl4S+Y6q9yLwYKjQrvUnWpAISeAkZNjpkrp0HysTSds+KjGe7jKF3P3
         R6Gb1rFevZ7O/OIA5UbCO4DyqTsWazLqvZWUE5vtDfz/VS55yuasJrcpQO2Lv3H442Es
         XvxA==
X-Forwarded-Encrypted: i=1; AJvYcCV06w/xqdesotzzfWynQszE6WatGjSTxtuIKvXm/o4IIUuiiWNGtY7MAsgXQH++YxKldPCVAQKWX6bznkgb7RyJbCEBptHWfSS6zwLj5w==
X-Gm-Message-State: AOJu0YzKEgKuYZSJCBAZVMDjEttK53OVvheD0azNP5/tUKCorbaK27v1
	ep1tZApmNqAD2WltnaaQbE5/7baJW2WUP7zMCZGX8eacJs2dVZ9v0SN1INF7JYQiRtyZqVNz23C
	h6ZruUqxWQ5zUBk5S2Tu2/sWelupOf3xPKypGmw==
X-Google-Smtp-Source: AGHT+IHR2aw5Fq9+f+b6J2C+oHZ3lJAwIW+/0JnzTfJsNAWuf5xhYkTrzi03iYoBr9x5+9kp7hFsJqSP9BmXYDW/Jdg=
X-Received: by 2002:a25:ac93:0:b0:dcc:2da:e44e with SMTP id
 x19-20020a25ac93000000b00dcc02dae44emr6454894ybi.61.1708193886191; Sat, 17
 Feb 2024 10:18:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217163201.32989-1-danila@jiaxyga.com> <20240217163201.32989-4-danila@jiaxyga.com>
In-Reply-To: <20240217163201.32989-4-danila@jiaxyga.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 17 Feb 2024 20:17:55 +0200
Message-ID: <CAA8EJpqRZiUU8fmGswwvegq3uTR_8RGu4L=LHiT5TRsShQHgWQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm6150: define USB-C related blocks
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, lgirdwood@gmail.com, 
	broonie@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, bryan.odonoghue@linaro.org, gregkh@linuxfoundation.org, 
	quic_wcheng@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 18:32, Danila Tikhonov <danila@jiaxyga.com> wrote:
>
> Define VBUS regulator and the Type-C handling block as present on the
> Quacomm PM6150 PMIC.
>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/pm6150.dtsi | 46 ++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)



-- 
With best wishes
Dmitry

