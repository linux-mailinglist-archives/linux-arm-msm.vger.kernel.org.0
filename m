Return-Path: <linux-arm-msm+bounces-19479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F67B8BF839
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 10:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90B571C212DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 08:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5ABC3F8F0;
	Wed,  8 May 2024 08:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BCVIhN5w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D2C3FBBD
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 08:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715155995; cv=none; b=QgvEVESZxdFK+ioJLGdAL++JjbrAeNEjsdfrQHCUeKyrGbB49u2ukE/NLgVa0lHP1k1TfHvrz8GY7XZX9UnIuxhQ9tk1lPJT1YL+0BeCPcOlR5f0JX4diEi4+CdOx5NaDGnZTM1TgbBdOyWAwCRXn3CS2X0MVSaH+cKlpdsDzfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715155995; c=relaxed/simple;
	bh=4PVm2LyYfgqp37dC83Q9wyTFTyUznQflMCTahRI//js=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RQkzd860ybenI6355LtR7eXUWmmXk6zwdagkCz1FgyrTFNjbe9XvDp7XaILHIAmKTuMqgzl6r9ZAVHjc7wgRBJ/5oFCUXMhkai+K1PAWpg1oGR+Ctbd1GXeVm4VaCV1dQrHZE99U6YSmc+7ez4lSEtDeGwNJ0CvDM9eYQnHZjX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BCVIhN5w; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de46b113a5dso4078035276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 01:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715155993; x=1715760793; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=puLE1Zg7Tugm85ah5txGvDIp6d9WRoi8iEtayWchHKs=;
        b=BCVIhN5wlrZvJLMIFiPSptCWElAXyIZw6uqQgyur1+HsUX2wKt50c6TyV5HZ+amxAc
         7SIHS+FzRzbPvNb2qcffEbqDU03ONdqPQnI0tVyDI88nwz1jdI5ybrqndgwWd/Sr1KPR
         jspk5zmoNI8VZ1z0fuO2QAfmCZondkfJXomD3qpFu1ZvRSxGrkP1ajIJInhgFA0XPEWc
         3W+d/AxljfZ71oUgPvq3V6xo/YalDaE7uarpI0K62qIwfwxVVcjZOxqVBhCsoFntEDW5
         GHMJ8gjLCcg+YgMrlHYqvOjWsw4hO1UwhW5Oaskkz/I5R286nQDzlXwAZ8gPrK1oimVN
         DBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715155993; x=1715760793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puLE1Zg7Tugm85ah5txGvDIp6d9WRoi8iEtayWchHKs=;
        b=s2/mcVt2X8URWMItAnuobbPzFrTmD26K/9YQW/0P/GTUzYKbW7r/h1oboM9nNZTHFS
         K2JoKMqAZ0UGAYLf/zqAXu/KZ+jRFq9X0ClnPm58FEM4dtbw8/bKR2IxEvaYQTmnkEor
         WYciv32uP7eSrvXK/ZgtneSwcuEzh3uLFg0u1j0zw63b7UMg+fzuuW5AKpaeN7sqpTtN
         dBKPw4nD1ytACLxtzeeIHxcEyRMqm+ASYDX4r6P9a8MuwRmUrpmtVqyiL7tYxR98p5Xv
         jja2YHt4aMXOmHp3CdTEFp4lMaFqv6N5J9pjRLnLQYV8eYztjm+CgER1FllbsRfzdRO3
         /d5A==
X-Forwarded-Encrypted: i=1; AJvYcCV+hLsemFJGoadFZW/Nqi7D6ZILC4T5zPJibSNhdYjfcizzHVWrsbbwfs2T0M/fsLVBMTshWBgIi29LE9S3DndU21DyHEZK10Vg3G7BIw==
X-Gm-Message-State: AOJu0YwTRzYNojESirPIgnlmyUPqyPKP4cLh+mIGEfuBd773CJ0/Nsaf
	1qiqju5AhaB3heDYKiMBWcN6FWLwbJChSXh0ncDh/rNhP2C3Mk2id0IN5Z4n4F/Ht4WU5FxJukw
	2Jnr6o62QJ3dB4JtkWt/gCSY0udBO+8Z4KuuxHg==
X-Google-Smtp-Source: AGHT+IGiGE5GHUo5l/95wVUKEmw86j/q2tCCfdaBRCiX6QhdkAu1EGGSOCWnLkMYiuAqFqLivwHuIgoneeJYpP7/ivs=
X-Received: by 2002:a25:8f88:0:b0:dd1:48c9:53f3 with SMTP id
 3f1490d57ef6-debb9e4f729mr1819039276.60.1715155993253; Wed, 08 May 2024
 01:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
 <20240507163045.28450-1-quic_vvalluru@quicinc.com> <a32fa81d-bd70-4dfa-b512-e2adce4f8c35@linaro.org>
 <9a48b0a8-d1d7-8e2d-dafa-47e136a46c99@quicinc.com> <2f810036-1832-42ef-b896-e9470f469029@linaro.org>
In-Reply-To: <2f810036-1832-42ef-b896-e9470f469029@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 8 May 2024 11:13:02 +0300
Message-ID: <CAA8EJpqG7k2+eEyndzrGgF4YqSOhD-kKfaj93PLhitcku1B6tw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>, andersson@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, konrad.dybcio@linaro.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_nankam@quicinc.com, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2024 at 10:38, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/05/2024 21:20, Abhinav Kumar wrote:
> >
> >
> > On 5/7/2024 9:35 AM, Krzysztof Kozlowski wrote:
> >> On 07/05/2024 18:30, Venkata Prahlad Valluru wrote:
> >>> Rb3Gen2 has a lt9611uxc DSI-to-HDMI bridge on i2c0, with
> >>> reset gpio from pm7250b gpio2 and irq gpio from tlmm gpio24.
> >>> Bridge supplies are Vdd connected to input supply directly
> >>> and vcc to L11c. Enable HDMI output, bridge and corresponding
> >>> DSI output.
> >>>
> >>> Signed-off-by: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
> >>> ---
> >>> v3: - Updated commit text
> >>>      - Arranged nodes in alphabetical order
> >>>      - Fixed signoff
> >>>      - Fixed drive strength for lt9611_irq_pin
> >>>      - Removed 'label' from hdmi-connector, which is optional
> >>
> >> Please respond to each Bjorn comment and explain how did you implement it...
> >>
> >
> > Yes, agreed. Even though it seems like you mostly just agreed to mine
> > and Bjorn's suggestions and decided to implement all those in v3 , it
> > would have been better to explicitly ack them or tell why you agreed or
> > what went wrong that you had not done it in v2 itself to close the loop.
>
> The problem is that one or more were ignored... By responding to each of
> them, I hope they will be finally read and understood instead of
> repeating the same mistake three times.

I found a mistake that was repeated two times. This leaves me
wondering which mistake was repeated three times.


-- 
With best wishes
Dmitry

