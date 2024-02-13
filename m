Return-Path: <linux-arm-msm+bounces-10955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A40685400C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 00:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEC92B27DD2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Feb 2024 23:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5578D63064;
	Tue, 13 Feb 2024 23:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XPz5YI6N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BF9633E9
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 23:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707866664; cv=none; b=izeSOtRaAm8qX6g7m3FWCa5mshBPz3qsjke5D98uihcOI2N5ImxXP04JzOTS6WuO3tY7UY6oAsq0bmioS1RMLmeTU8WTcjWBhNHk21HHodyGzrQtaLTeC9JC5zmaV0/XkDAbVQTm9FMLpnpxIFDxrZA9ZPlZ0ZXJHmQeK4EqLIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707866664; c=relaxed/simple;
	bh=SNOVFhian0wSmfjQUWbhIZH1oLKhGuatN3RQQaM/zI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmZHlZAISo5XbmQ6nsb194V3fo2hLNKEd7GyOK7nl1r0evSqx5Xsp5h0V3OYeN7jRtB/08VxQB71cKFIi4Ecl9iPTwhaE5P1Uy0KoLc1qbIM6sKb25519I8Dg0h/tkAyXx0XXk7IJdbV+wBGn9AiPvrmJgT7SKtpZ0zkxYXItrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XPz5YI6N; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55f50cf2021so6501934a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 15:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707866661; x=1708471461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyzkdDn36VkqM4HUW3/5Yc8FfYXf+Vgri3xwPCVSUsQ=;
        b=XPz5YI6N/I77vsbciRhW2g1UsKS4qyNXAd0B2xg1dn055J79iaGS736+i28ngRiwi0
         bYOkvCFe3nMmzCICR+zjDQGwxbsJ7E1kz0FhH9tjDfzNWbciF4M/B80kC32KZ69Ml2Sq
         KkJecrijrlWUHtlLPGCm3i1qhwl9PI+stoMbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707866661; x=1708471461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyzkdDn36VkqM4HUW3/5Yc8FfYXf+Vgri3xwPCVSUsQ=;
        b=QOsfQHKfeQdIXmXc/WYLGC+5ztN1IVK6Q8vtbZ7gPoguz4TIgrCX6de3MyqUJPMIZr
         WwT6a0EeHkbu/PGWQOV3c/ZXEl1//m87hwHWMW42cFy+YFa1tvEy4qMuIsx2eLr8LTH/
         NRzr7N+T3nG0poiVK3IFAbw6Kcks0z0LA6SS6qMBGwF5dwleotMTWpxR7xGbqpjZs+IK
         9GwMDf6g/3JCRHXpKv7fG77JXMmQiwEhRUhnfR375WZ0qLTrF3v4puIj/dUT0LwsAFVF
         ME5W9UiFr+8GNV6bk1w8sZr2rWR55C6v9oc3+ADEaWeJjvGOmvgwm3qO8FXjDzbptphr
         I6xg==
X-Forwarded-Encrypted: i=1; AJvYcCVoEpgjdRvpgAEcgA2LTLoFtHdv+Tgb28KVQx+zoebnMXE0uCtHGI8GD82YkUd6b5rodcJ2AXu+BsMgcP7bNl4dUUQq4VNPXZqXzgD0dw==
X-Gm-Message-State: AOJu0YwxuLBXmem5lyatILvrnPBcVyb6xiwAn/Pu2+8/mMDzuixMWF0J
	IjM/yjL4rLMiWn7sf4GoJoMm42vsRtGz3iL72eon9SxElKNNJeIc2bzw+zK/UzbRL38VUWDbuox
	V4hBb
X-Google-Smtp-Source: AGHT+IF2lR2VjhQItcvt/8kQZAwAUjsAdeloG5ENnKv8mrH7QLW1gN6gd3D/JiNrrrvRa8funWnCiQ==
X-Received: by 2002:aa7:c24c:0:b0:561:b9a3:f589 with SMTP id y12-20020aa7c24c000000b00561b9a3f589mr681664edo.4.1707866660694;
        Tue, 13 Feb 2024 15:24:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUOeXa1JGKGK4PtidEmyn8qOLJK1eaEfeUJm7E7rBPYcEmfijwiL84LOjNNvXb5dyU1vJL0h9ntpY0J8arIP61w1f8Ej3lVnrnpNre0dA==
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id c16-20020a056402121000b0056183062ef9sm3497711edw.91.2024.02.13.15.24.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 15:24:20 -0800 (PST)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-410acf9e776so96355e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 15:24:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV1RGfqWTUOxoSvz1X7D2a4yAo5Pq58xZAIUJvy9ypdSfdB7IQqTgU2VjrcD7YIqdIh3y7kU/2KdBNfAbNLZrzldobU7jVjJiPSAFPPrQ==
X-Received: by 2002:a05:600c:a16:b0:411:cf85:9549 with SMTP id
 z22-20020a05600c0a1600b00411cf859549mr57493wmp.3.1707866660353; Tue, 13 Feb
 2024 15:24:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-20-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-20-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 15:24:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XxX9wqZdwf9Wtq2=KOKgTr5FhyJJWp8S9W1xFW3cY80Q@mail.gmail.com>
Message-ID: <CAD=FV=XxX9wqZdwf9Wtq2=KOKgTr5FhyJJWp8S9W1xFW3cY80Q@mail.gmail.com>
Subject: Re: [PATCH 19/22] arm64: dts: qcom: sc7180: quackingstick: Disable
 instead of delete usb_c1
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, cros-qcom-dts-watchers@chromium.org, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 9, 2024 at 11:10=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> It's simpler to reason about things if we disable nodes instead of
> deleting them. Disable the second usb type-c connector node on
> quackingstick instead of deleting it so that we can reason about ports
> more easily.
>
> Cc: <cros-qcom-dts-watchers@chromium.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: <linux-arm-msm@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: Pin-yen Lin <treapking@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Bjorn: happy to see this landed any time to shorten Stephen's series.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

