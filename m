Return-Path: <linux-arm-msm+bounces-8262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4414683C38E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 14:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B4301C2253B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 13:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D432F50A74;
	Thu, 25 Jan 2024 13:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lBQOarpj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D417E4F88D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 13:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189037; cv=none; b=Mqf89iDRvOyOQAQDG2K1xKzrabzyXV0BfKY0OC/8PLxyJv9VGQjr6oWljO+AAfyyk2n34wUIE+ZAFLJRbtAHQqzjzWOyI2AqvB/cTY91IL1NF3nvNkLI/3dhhzzOwjZ2z6yximp0cPbgd9+hKttcw3EZ4rUm336YBiJwZjdHAtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189037; c=relaxed/simple;
	bh=9slEGncr5sZ2i+sO83m3sEyUhFhOGIiWij0i1fDgPT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOAGZWhDD1nvTumQZqVwiTyz7kTl0uAhkrxgmww3kJksvasFbBpq/jBlpX7jBqsn6lq9n16vL6wYUzpQ0oE7sFzrKDNGWNLJnM+VEjngYIddKZZVM4BTrFcJk4bxTaG1fZ/0PKyR2vj1Ovjo+rAzSyThX0MHWXhtj/sK02jHsRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lBQOarpj; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60032f9e510so25737077b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 05:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706189034; x=1706793834; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SKIQmJv3IRL1HN1k5v1jdt5ZpUKF/3uDhIJJ9D50Mw0=;
        b=lBQOarpjyA1FJnCIE0Z18AoNBqAJmpqliteXzsHIPPC+64kiHBhwqXNrHQESWUb2SX
         W9k9XEikVoyH9WFgNMAr76vSnwcfneJ2aQTo+RPv/dMDed5C+ziFRjUoXisqK5hWX6qr
         b8qYWAZU8T560VNM1Q2C3YFcr9jqt8H0pmiTpzvb70s++c08l4yT4iI4j8GVRHlkreNz
         SgP6ysDXjiY25TzGQfopvwWVJT2AsEohNUVZBTrb1mz2KWDyYSIlueYOxqsxgofdnKUR
         gVUWnKtU3m5yb0xoESXhe97kLM/A+wrq1yFchSYAv9DItTd88RRFvkCYLg/s3ku/HDHp
         KafA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706189034; x=1706793834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKIQmJv3IRL1HN1k5v1jdt5ZpUKF/3uDhIJJ9D50Mw0=;
        b=ns22ZrhLQzevHQRiuixx9YjUUtdQJc6WNKwuYm87txuWD+hRcia94doUU2r+pmnwAo
         gKhB3eucdEpXtfLCMa7GKQk5nSwgNbQCvPLg83kkNp10heBihXCPEXrhgu5rMRAmo8Vm
         XXnfQ+8qJ6zoXmkLAHpMpZdpWK2K4mlH3D13SseaY7vCwFguDn5oCvM4UsQhZwq2WyVL
         kONLdFgv38teS52bwfPdD1go9ClUJWucV8kVS/Kxw2anx2T2fmUffqwIbMg8HNYSTRGe
         ZJWYjYVXHNPlCMTGgN+hYDnK9wdxbe68XXgh1SzUyLz26ta46WixrvflT/yzwtwndJZp
         1Brg==
X-Gm-Message-State: AOJu0Yyn0OALJTENNGSdbIQEftV5E3+7lPLj/d6nPS/SwG50oJg2rncC
	beGir5DG4ew/ahgRcRVEMwaSDDNmUJQqvEi02ziJDOcaBr/FlyH7jWu91RWppJOy1KSf2UwAiW4
	OZvL3osV/OebFbZldiP8DfvjY4v73N2bG1J+7sA==
X-Google-Smtp-Source: AGHT+IGHbJyy+W+hk2nttEPhM/r+2iuDN2cokkfPGX1Gz3cB4l5gZ9pEXayzRvDCgHB/mdI4i0pwoIKX4YkikR4KGNE=
X-Received: by 2002:a81:ad4a:0:b0:5ff:4842:9ea6 with SMTP id
 l10-20020a81ad4a000000b005ff48429ea6mr664617ywk.47.1706189033971; Thu, 25 Jan
 2024 05:23:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125130626.390850-1-krzysztof.kozlowski@linaro.org> <20240125130626.390850-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240125130626.390850-4-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 25 Jan 2024 15:23:43 +0200
Message-ID: <CAA8EJpo_GUgfYZOgmbCyhO0Oe=RRC0+LP2kZTbSV5wHob4X8=Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8450: describe all PCI MSI interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 15:08, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Each group of MSI interrupts is mapped to the separate host interrupt.
> Describe each of interrupts in the device tree for PCIe hosts.  Only
> boot tested on hardware.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

