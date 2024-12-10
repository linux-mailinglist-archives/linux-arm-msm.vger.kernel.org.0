Return-Path: <linux-arm-msm+bounces-41354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CED59EBAE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 21:37:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AD6F18864D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 20:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A44DE227576;
	Tue, 10 Dec 2024 20:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LuabywJN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D78227595
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 20:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733863025; cv=none; b=TbcEWdImI+z/c05PGo2DYkUWsdekbDIqAfAdXqKG1ktJwXRW2JU03Qo7pmF6vBby88SU9UFR2JGBn/J6WuPiIaxLjdmf9ncFhc4NgZTjyCPSOnvPckgSt2mtPmcRmq3LIwRMWUWZN9qXMV9Mr0NMK1jXVMD//kK7NZY40nW1kSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733863025; c=relaxed/simple;
	bh=0fQX49mSHPQYrzA8Z31PEJhbNQ8oFJAfOm9cbO8QOh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYl5+F7G7uVftgPLZShgGHmWQ7YX4CxEjzNmbR6yQxB3HDCEtppymVNTIIt/ecQgYAMzmfFky8YvYY1npwHPxprnJdd6O1K+WMbnJ06VdZm5iijg5euP6dNrtxnz9BpBuqt7WtiYf8t+WoCjOZHSOA26nWBVRDGirwJyMtnVPUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LuabywJN; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa689a37dd4so504362666b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 12:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733863022; x=1734467822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zn4VZjCebgcs43D4JwNn5+c65Hi6gGT2rIBjaMw3GPQ=;
        b=LuabywJN8jBkE/zSeMixqqnREhLRL/DAC9oGA2N6BEDh6Nbu+LLmD2pj8R1vRaZiLu
         JrVfnJR0gCfqNB+Y21fm+0FORNBncEuPb2yqYr3lFuH7EIXHEOdEO/o2hdb6cLSo9F9K
         zVKUYNVs5PeifzUnmz6prTLwStUMvhF3PCeVZlXhTv4WivMOcofDgMBO0iF8EXV5fRl8
         FkksjkpYJNZXebcJoAoIOWj3dyZ9zdwrUV9yoUxpcy515pisHmcA5uM8Sn0E36wCeEj3
         6esjjrJg1Kd59pElCyGtAwQVIRfDBtRnLc052DzqHsE8wIaRbq9+BHMGTWRo5K5/EfOb
         XBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733863022; x=1734467822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zn4VZjCebgcs43D4JwNn5+c65Hi6gGT2rIBjaMw3GPQ=;
        b=RNaLPguLcDb7zQkJrVG0xCnYMpbWZ39xdZgo5InU0Jajqgfu4g42sPCH9rQr1H9Zpf
         yRxKbSmzIOn6zqvKENQXNVfgOIrAkOoCuEAFbxoNH5NbuRTCc+YpWa5tEAFBNDs9WJxT
         5Pnzn4ixcmIdkNEiFQFd7wNj1vrzX+t78egNcgjuFGrNalfTpT4UcwK1Fg7Nlic3ODTc
         O71eig/NJghnP/4Dwg0ktWrONjTJcV6IOharKPe6uZEX+6DcvNLm760Yu2OUPrQ6NO8V
         ookje3YxdUn/uXhbC4fkKV2OUKSikn767AbqSaP18bIQ8OcuGDI4qT/3i59Rc8eZq3Jm
         ofhg==
X-Forwarded-Encrypted: i=1; AJvYcCUUNPDDboTb76SxPDrwjYIt/klUBCAGbI06fZKWp5WDi+xntzc8zgQTB3lZj27frLy9TU3RpftZfcf52FU/@vger.kernel.org
X-Gm-Message-State: AOJu0YyZVi1nFALYQerucYIhLNzYkmj9sspPskvu+AJJVTbC9/MmJcUx
	nmHwW/76skXP7FTS2MNNHoRPG+e+HqwDuMaOkC+yMG+mDDzqf/HY7mqWgeDK4ePPkP2kmkikFeA
	5+nZGjX+bt2djRxBY0eIt2dR343QWu5KDCqtLZg==
X-Gm-Gg: ASbGncv3c3NvrQdodYqTcsX/jAfior9ApTTpvlN68MPYj6Ff8Bu5WDLM36watqYak27
	tRJ5iSbVYDPwRrdQx7P2uNG2VkvAzWwihpO4=
X-Google-Smtp-Source: AGHT+IGWUXD7IWZ/eeOLyw9PNNJAuQCg5LPrjaY10z82+Km24i2uSdLaLZdXA6A5BFJA17MApH7HCIysDMV+DYBFD2w=
X-Received: by 2002:a17:907:7703:b0:aa6:74a9:ce6e with SMTP id
 a640c23a62f3a-aa6b1179ab6mr16738566b.16.1733863021774; Tue, 10 Dec 2024
 12:37:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
In-Reply-To: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Tue, 10 Dec 2024 21:36:51 +0100
Message-ID: <CAEvtbuubfZq2jtoUesrmitStAyXy3HJXqvdYQYO=BA8L-1eHTA@mail.gmail.com>
Subject: Re: [PATCH v8 00/28] Qualcomm iris video decoder driver
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Vedang Nagar <quic_vnagar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Dikshita,

On Tue, 10 Dec 2024 at 12:05, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Introduce support for Qualcomm new video acceleration hardware i.e.
> iris, used for video stream decoding.
>
> Iris is a multi pipe based hardware that offloads video stream decoding
> from the application processor (AP). It supports H.264 decoding. The AP
> communicates with hardware through a well defined protocol, called as
> host firmware interface (HFI), which provides fine-grained and
> asynchronous control over individual hardware features.
>
> This driver implements upgraded HFI gen2 to communicate with firmware.
> It supports SM8550 which is based out of HFI gen 2. It also supports
> SM8250 which is based out of HFI gen1.
>
> This driver comes with below capabilities:
> - V4L2 complaint video driver with M2M and STREAMING capability.
> - Supports H264 decoder.
>
> This driver comes with below features:
> - Centralized resource management.
> - Centralized management of core and instance states.
> - Defines platform specific capabilities and features. As a results, it
>   provides a single point of control to enable/disable a given feature
>   depending on specific platform capabilities.
> - Handles various video recommended sequences, like DRC, Drain, Seek,
>   EOS.
> - Implements asynchronous communication with hardware to achieve better
>   experience in low latency usecases.
> - Output and capture planes are controlled independently. Thereby
>   providing a way to reconfigure individual plane.
> - Native hardware support of LAST flag which is mandatory to align with
>   port reconfiguration and DRAIN sequence as per V4L guidelines.

[...]

>
> To: Vikash Garodia <quic_vgarodia@quicinc.com>
> To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
> Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Cc: Jianhua Lu <lujianhua000@gmail.com>
> Cc: Stefan Schmidt <stefan.schmidt@linaro.org>
> Cc: linux-media@vger.kernel.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>

With my few pending questions and remarks taken into account you can add my

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell
XPS 13 9345)
Reviewed-by: Stefan Schmidt <stefan.schmidt@linaro.org>

for the full series.

regards
Stefan Schmidt

