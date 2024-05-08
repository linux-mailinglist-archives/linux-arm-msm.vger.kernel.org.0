Return-Path: <linux-arm-msm+bounces-19543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 429178C0729
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 00:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9569B224FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 22:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57DDD1332B7;
	Wed,  8 May 2024 22:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mrJCh/vA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5111C132C23
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 22:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715206006; cv=none; b=cf3PNjmZz3BRmBnT8Pf+R6wS88pjlM0DNscgjGzg2crTrDkTKlmg/wYraggQEYcfQUzHqGzl8yP+Tt7n57xL8/pmcPE98uZtmQndFwH7UerUe0dqFp4QT8MVuOmqS0BXdujxO7QL61GU4jMwor7mUok4CjxUaldkkxua+FMaeV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715206006; c=relaxed/simple;
	bh=MYf2C+IVa2MHv22SQrK22GbmF6wjXC51pjaBmwgA4/c=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNL+0YUD5BFTApXKvAwLm8GKbKpCQNEUtDP7kkeK9nGZAXGv+1UD1XzXSQ+Qm44qtSpFKg6hDTsYyZrwKiMZSa6EY8mjBs3jJfNOTeyztrpHWfjzMSkaUKelf74hnyAt76lusDAPRTEEkn5EwDu9j8UYnj6TNph6pkR9OZN4qe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mrJCh/vA; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso270084276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 15:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715206003; x=1715810803; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dMHzkcCEM6WKf+0ckd7ajH+dnlQXB7OMmlnsiVH7l2Y=;
        b=mrJCh/vAvZn/GDiaThVj4tVHRhEHhCjGfbWk22fIqaVJh6N7yaIFZT81rdInfoSeb/
         GIyrVM8eaSyktetNAojuKdFjPAn6G00CyNKOqXJYPp74pWL1cK6PXdV8O+oNLPNuJlqP
         nEEBmwzpKnn13jkNHD3kxEUKs50ZcFhrp29Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715206003; x=1715810803;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMHzkcCEM6WKf+0ckd7ajH+dnlQXB7OMmlnsiVH7l2Y=;
        b=N9ij/zGEivLvaUEHB+Jeg3lojW6OwAT7Pd60RsGiw2VSxQDXBih7q6fj1CNpQPNhRU
         VpX0adKiD4Q4h96bQqrGnIq35plAS2h2obPXxG3UGgNIi5Dvg7alohGc73do56VVv/6h
         SkfdBvouevG59VhjOxiLPF+ZPvd1Ja1yjPGxO+WkgMPCQ8N7bZ06RejT34cryviG9wI/
         r4ksO0eaXkDvGxYGF9d3OH4fnNkm0aDx3/FV4cIPUuIGUeSf3H2BUX2Al7EC7GpkXjkm
         dprzyc8aaQSq3yk1y3gOu/YDeti8VibdmIlDruKXbU6HL09Fv4KRxbHLMParHwb9Q6tu
         60Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWy1eDhMINLat4vmuhCUHZ63sLp0Y1W1zK6fhHUFtNoAWJs3TTSdMkmnDUMM6Nm2SJzS9eqcUYq1leI4pweyNGO3aDxjeUTnSimYrhs1Q==
X-Gm-Message-State: AOJu0YwhwArLFCX/cGX4SNJHP163KHVbiWHhAT8kix1wpq527NGgfs4C
	n3BPrK3YqKkaNgmG2lINjrHyHfX1TNYHvDcYBMa2dTiORANpf3R0nfMRRx5kpcx+FTZIk6EdMu9
	a8BJbTIZq1nrDxu141GMiOd5HQCZA4m2TDjFb
X-Google-Smtp-Source: AGHT+IEdwkrhfX0w2UniR3n9+sRy8cxE66X/Cjr3CnSlguofehS2mZBYzAz3B0TdrHNIzoagJzZ/piqfBJIMxUVv2nA=
X-Received: by 2002:a25:bf8e:0:b0:de6:80a:f7f2 with SMTP id
 3f1490d57ef6-debb9d711f0mr4319909276.28.1715206002100; Wed, 08 May 2024
 15:06:42 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 May 2024 15:06:41 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240506150830.23709-10-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org> <20240506150830.23709-10-johan+linaro@kernel.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 May 2024 15:06:41 -0700
Message-ID: <CAE-0n52+d4s1gJGWpiuCc1vc-rM-d-6FE3VC_qm78kNcKyrb=w@mail.gmail.com>
Subject: Re: [PATCH 09/13] pinctrl: qcom: spmi-gpio: drop broken pm8008 support
To: Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Brown <broonie@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Satya Priya <quic_c_skakit@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Johan Hovold (2024-05-06 08:08:26)
> The SPMI GPIO driver assumes that the parent device is an SPMI device
> and accesses random data when backcasting the parent struct device
> pointer for non-SPMI devices.
>
> Fortunately this does not seem to cause any issues currently when the
> parent device is an I2C client like the PM8008, but this could change if
> the structures are reorganised (e.g. using structure randomisation).
>
> Notably the interrupt implementation is also broken for non-SPMI devices.
>
> Also note that the two GPIO pins on PM8008 are used for interrupts and
> reset so their practical use should be limited.
>
> Drop the broken GPIO support for PM8008 for now.
>
> Fixes: ea119e5a482a ("pinctrl: qcom-pmic-gpio: Add support for pm8008")
> Cc: stable@vger.kernel.org      # 5.13
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

