Return-Path: <linux-arm-msm+bounces-13434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CFC873086
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 09:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAE42B265E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7160B5D48E;
	Wed,  6 Mar 2024 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wlieIIjx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EBC5D474
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 08:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709713168; cv=none; b=sKdjoxCuWIdWaYnMgxZzwwzfkYNhymwBapE6c9hOLFDHHjmNUNPIU6k7QCZs5W1euKJJp1osOc+M4xWLz8roZWefaePzDXdlglJbAN3LZYDGhNMVJcjE/LNa0r7cpe6SFzbeV7BhCNY/JMpWWTr5/RGAlLQuww71N5vJfOaedu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709713168; c=relaxed/simple;
	bh=dnIZwZqxXCXcBxKA9fSsUTi+xcmsYC0FICFHX3lYD/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeYZaZlkkTUuM6eQ4WF6Bz2Ch0EKlQ9VTUlT21IezkqRtmjnZRZQJ/7fRym77RrW90SyrIjT7gAGidXFEbUy1z/eT0d/loiosmMJZD8X6YDuHAdnfwd4hbZg/e/Mu+kRW/XXHJkNRULHY4WLXm98epWh6jdcfc5brdIk9XT22ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wlieIIjx; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-60943ad307fso61307497b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Mar 2024 00:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709713166; x=1710317966; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EoKuwXMEvsZ8GzqAgZzSLOfu2yUWrCyM8WtXmP98Z6I=;
        b=wlieIIjxYtJE4k0vhWD9b2MWzWqtDs5YXzKp7XHDH0wDOcWM6tqzrIY6NlGUqd2pyQ
         AKmc3Yqz+WNCGCIfMDpla/AwZ83X9j4/MYEQTgOQlQwHfpIH3FvFDXpu9985EvGQbOnp
         wXLDezXFYoh2r2TIeM8GUKmkRDkERQIjnTHRooXH20G4oNZd2JNAuBuutr69L4A37teG
         Fxl+c/3a26ICJKHV1ofK7h5JIiKcTBD9TN1rX2yZMAX+8ri3fE4Abmar1953ZzIIT9g7
         4ZuL01auyQyVeO68Bwmep5xgxGm2RmDIT44fW0Y7XezxSQGi0lGg2AKSpii8FyJEMyNV
         oPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709713166; x=1710317966;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoKuwXMEvsZ8GzqAgZzSLOfu2yUWrCyM8WtXmP98Z6I=;
        b=m+OnLf5W7fpzkSWFHtGpYB4qqgpp4ORJiDTg7o/dDSEjv/g6VrgGXPaYAA9HD7I7g8
         /WO7iStDQt3QOwKu2TQpdqXjWLsM7QaBT3uskKfvYz5Y1VlfoO2dJXBrhS37tcC2k5yy
         2OULQbGdbTb7I2FBWVYYqVhYV4ZB8CHYXJEPjI1P9TSW35L7yjVq38pLpNpQvXpC23yk
         YaweULhOD57k0+XQC8xUYiXbd2DPtXLHj5ExsXOyKkdWWk10S4lHepv/SVDeUoGEqH+R
         TH9J0rHhPIAhxFyhdLZLeFXmAq6TBQJQzgCMk2W2DWgxz3YLlwZl5d1i+/U/a+gfbH1e
         bUXw==
X-Forwarded-Encrypted: i=1; AJvYcCUJqWKSipU09UlStCFpPdGMA2rHXHsDF++RYgRU33Fzvu1u/OWTVgljCosfGfFgm47nTOdmHb9KdWd6aWiaE22PYjkude7mwwt1cUBvjQ==
X-Gm-Message-State: AOJu0YwO0JFWv4ZZLhw7au/KnZ16eSwt1fnPCpK8+3DSsXpL72LGZ0DM
	kSpXyZmUqjR9CrrjYqxBbSsAgd2YjTqodsouL6vUd6gFnMjZw01iKAaZgIKMFukSdZ62saZJLbr
	xTo3vYEh9+UOeh45MOn626wGDCXhja9GZvxvG4Q==
X-Google-Smtp-Source: AGHT+IElFEojtdTOEWHxvLU4AlUsAf4idoItp77LksSXRcXLDan78ssF5m3Ud++5mk9YINDXssdh1ZVmthJv/1gjt0Q=
X-Received: by 2002:a25:bccc:0:b0:dc7:4776:e31 with SMTP id
 l12-20020a25bccc000000b00dc747760e31mr11485475ybm.24.1709713165691; Wed, 06
 Mar 2024 00:19:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306-castor-changes-v1-0-2286eaf85fff@z3ntu.xyz> <20240306-castor-changes-v1-5-2286eaf85fff@z3ntu.xyz>
In-Reply-To: <20240306-castor-changes-v1-5-2286eaf85fff@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 10:19:14 +0200
Message-ID: <CAA8EJprMWbfYuXPi_6e2HjM0W5y7BocLsCUDDu40=xG7eDwK1g@mail.gmail.com>
Subject: Re: [PATCH 5/5] ARM: dts: qcom: msm8974pro-castor: Rename wifi node name
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 01:18, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Give the wifi node a generic node name 'wifi'.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry

