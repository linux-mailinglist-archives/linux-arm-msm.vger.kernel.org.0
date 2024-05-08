Return-Path: <linux-arm-msm+bounces-19542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F4E8C0722
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 00:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4491B28339F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 22:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F2A132803;
	Wed,  8 May 2024 22:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NUKw/+0m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65061132C0E
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 22:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715205965; cv=none; b=WmR4K1K54j7OwRAGnZqLdul5GHZGoO7q79Uh9PUy6k+YR2prQuYiFWiahFZEDVpbd6g6YheQJ714IMIM9QNPXilI24FzrqM4iVAiW7EdkRFuAw21W38UAkgz9/Wqdcx6Y62RDjySWASgicTT7k5warrRKo2uH/y1kOfNFl68tP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715205965; c=relaxed/simple;
	bh=4GmjLoOojpEg7WhLizCXheISc+kGTWTFxnKHwCHw/Mg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgScBsJ6Y2N9G8vSElFAocuBy7Ev3qfctntGt5FfFnoOZl5gY0Q1pDyv/OkDDPsWof5HCqUidj5k17yifZ7OPaenSliqI4zifAwmcFV56rXM38mMvdWdb0P3hIGSZoXGwg6fAN2BwZ0ehxaFOtbBubCfqi/2HJedIg6RBx0fdNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NUKw/+0m; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-de6074a464aso319158276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 15:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715205963; x=1715810763; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4GmjLoOojpEg7WhLizCXheISc+kGTWTFxnKHwCHw/Mg=;
        b=NUKw/+0m0ePExsvsFHD3SgHPUZge/vpDH/1dWH8O7p8/C9Uj2ki0Z4odqVes8b12Q/
         ovAjzzwOCEd06dRukza9R7ezMxIptvyJGeEYkB23iOx9kWqVy5LIa6lvh50iE4oPGwsa
         l2fFjjc5rqAsG9atJybFMht7N9T/73cXEdgJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715205963; x=1715810763;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4GmjLoOojpEg7WhLizCXheISc+kGTWTFxnKHwCHw/Mg=;
        b=WWrAngLQ0GLo6b7bowcuDvkYtrhVk9SfAcaVmGLs7f/JlBWKTNIy6Vs5P9yXjRG9KY
         +Zxc+47duYrBmqA3qwbsc+iwZwjHyD5UwfwOfNCmXSNhAsfExGQONiK4phhp02iSpmFb
         abs36Vd4P4tcDht2tj1Ly3XrQ/x3RIl+dN+aFUA+Cl1mYj3UcXifD/0X34jibQ09kvCu
         iCctsU3j5g3kbzmG//rETCVGfR1Jo5tbdQ6DyBlFVaBJH++E+mJltm1+ALm1tjaYiUnz
         ijHhhPjABXw/sTagLk6fp4blJm2NGZu1wxpuKzpYb+5ti48LlIK5kBeT6F95n7tGuNPu
         KwqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMfUFvadUi7yhwwrjo7KzMH1ShvFDO5a6qqX2pk1Oyv2VPIsBXqgGJukkcVRToMlFRlYwHJCSlkRHtI+EojKypHf8CyWVmt5BwtpxZ2g==
X-Gm-Message-State: AOJu0YzUVGWK1/ur6jgNJsl67a83F8EcK5fJx9tk13+Y8gNHgjHAV4f0
	sK37B2JW4ToXoktVV5ORWyc+DTwEFZy2X0zKFK0yFcKvg4u7RhORhmr6JjvjSIq74XJPW470ttt
	FqHg5C/RR1rbqpsCkDi4Vddz4yUqLqVuqWzKx
X-Google-Smtp-Source: AGHT+IEtqqWBmwa9YminWEi55PV7HF4TSL0XOzGl7mR6y7E7ORDiXSQKZtGJ2hpXVXVDyymKtOMfdIRRGFW1rvQ6Pkk=
X-Received: by 2002:a25:bb12:0:b0:de4:627e:b556 with SMTP id
 3f1490d57ef6-debb9d89584mr4172658276.16.1715205963556; Wed, 08 May 2024
 15:06:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 17:06:03 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506150830.23709-9-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-9-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 17:06:03 -0500
Message-ID: <CAE-0n50GbXpc4K-zKOUxpGiPyQwzQfth0+f1fPDnSRH3gfwnsg@mail.gmail.com>
Subject: Re: [PATCH 08/13] dt-bindings: pinctrl: qcom,pmic-gpio: drop pm8008
To: Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Johan Hovold (2024-05-06 08:08:25)
> The binding for PM8008 is being reworked so that internal details like
> interrupts and register offsets are no longer described. This
> specifically also involves dropping the gpio child node and its
> compatible string which is no longer needed.
>
> Note that there are currently no users of the upstream binding and
> driver.
>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

