Return-Path: <linux-arm-msm+bounces-49832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B630BA493CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 09:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CDF31892602
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 08:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296F62528E9;
	Fri, 28 Feb 2025 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSdMfQuN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF7F2512C1
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 08:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732185; cv=none; b=ETQKjWgqEY61CXxPFfqayBdXa4h6fePV7cVJfuJ9QeujQjGsLDwqpnxKdvy3P61JuihH51YXDgqaN/NyK8Nl+VbHHYbjiIrXHJudh5VJOXkpo8xH28DrO8IRcrrHphcqKnSSWExuHEvishj0QLw7LtACqV8+PAv9hhTNrv8esaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732185; c=relaxed/simple;
	bh=kx5ixhvdP6EmZ7yF5ftbKYrRukemNttfsGC0jekV/Og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F0RwDVXkz+GFQAiCYuDKZUptZUv3W4wGyoHzv5U4mlqv88PqHqIVYllPuedp5QnXdL9HWhyls5pUOmOdXVRaEuwWB9gw70wZTh0pwe1bqv3Ok9763/WbIz+X1tuisNEpXeT2EzizcUptRlJvatAcqi8sQ6qotlDPZeQR9rSNzcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oSdMfQuN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-548878c6a5aso1943342e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 00:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740732181; x=1741336981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kx5ixhvdP6EmZ7yF5ftbKYrRukemNttfsGC0jekV/Og=;
        b=oSdMfQuNDVth3wWTaRks3YxgepFFHPDjNkiaa3KJatMYwcWQAR4kShm7/1kihKx3Uc
         IYddF7UJXGd8MQ6IK6ZquCshGaxMQfF8t9WC/txbXPp8hLkt4L77st87XQKUjLuuQRkZ
         i5s0aQV9uXLhEyWMhTe7r48iwEEmMD/It67fscjfMFqTQm0kvzwoBOZk9xrBF55MFdAP
         s5nEJpWgXdSRNY+aNt2ssFeDFavjWsU5G637ujmJkjT9li1hqqQB22nL8cUYTmvpGLeu
         p3wiNScWHxT92sredgOHkX2alyUwJ5Hm4YdMxExD2CCqbABPAo6qnq5vUByuVovDB+Ev
         AVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740732181; x=1741336981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kx5ixhvdP6EmZ7yF5ftbKYrRukemNttfsGC0jekV/Og=;
        b=V5LK3FF+XkeYKPnFgIFXwiSKSqfQ2pK0KePoMFWThKSOwdtT98+xV7HE7uWL2ZZa+G
         xcS8AHyBdc88mdXDgrz2grQyQZ0RC+pJArXa/aLt1gZrnFPawQzUT5KUk08q6JFUAnbP
         RSYId8eAtkWrXlCozq/vamwKiVAerR6JJcYJCLQAvINHL+zPKPeAOBai6Qo1dNR3DG7a
         HsLfT2IvX7PXeG/K8v4kiaUINvWbb5n9sn3QO7HQjW+YzPkFj2lyti3ChGW0hfnf8rPJ
         P6EG8OO9fe46Yl/k+DGZ9oGTLVllaIvzFV9fhfD7npZLZ5tpyKdd0JLUy7gVsecCNgd7
         9XLA==
X-Forwarded-Encrypted: i=1; AJvYcCVAYgzSXgVRaO9KLLhej8uNiLEfQ0B+jI//RgUnTyNGsV5On8ljGswVAjFlHglHLppdcdf6ygq0y/nGn6pp@vger.kernel.org
X-Gm-Message-State: AOJu0YySzYi2UXXjHV3CA8lO9ojRmefnHz663czSPD0scW/WEBS2mvZh
	OTUOCG4yS6dOWCfJBIROOi81vNZOjmKeErFU+++2nU3dJDIrcES2PZbVLWB5g/mkFFoB0BvPVtw
	c7hg91nURj6zaMeuc++mJMMTT9dCxP/1aCr6ojQ==
X-Gm-Gg: ASbGncsLGHWoBn3/hbNbCvrybwjlUKedYm4o2bFgPc7x2LfP+15/k1tPF1CXjakQ5mM
	sDnYaIEROYkNwuXrUKVp/GxDE1zh8z4uLMEcuyXZ2GZFUZtmY3qVHPRn9JHbESmbIORyFXZqbyx
	tVEkr6t8k=
X-Google-Smtp-Source: AGHT+IFnojnEU0ZTQwdhFM8EZ+VzCTRW5WfJ+IRPsOQXruxW3ArvgVeYghHEs1cbMHob7yzBli3HbDb90ZQPHvgxO/A=
X-Received: by 2002:a05:6512:4021:b0:545:f9c:a825 with SMTP id
 2adb3069b0e04-5494c312576mr703967e87.2.1740732181275; Fri, 28 Feb 2025
 00:43:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-tlmm-test-v1-1-d18877b4a5db@oss.qualcomm.com>
In-Reply-To: <20250227-tlmm-test-v1-1-d18877b4a5db@oss.qualcomm.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 09:42:50 +0100
X-Gm-Features: AQ5f1Jq7kGENpEdbNLcHzj870r4DoaeXZChk9tcwrlm_rnPAZaKo-WGL4SgZr-A
Message-ID: <CACRpkdZP4u+LwhfRYnjhD6bkoBAG7AHX3SnF=5R8fc72BDradg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Add test case for TLMM interrupt handling
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 9:33=E2=80=AFPM Bjorn Andersson
<bjorn.andersson@oss.qualcomm.com> wrote:

> While looking at the X1E PDC GPIO interrupts it became clear that we're
> lacking a convenient and accessible way to validate if the TLMM
> interrupt code performing as expected.
>
> This introduces a kunit-based "hack" that relies on pin bias/pull
> configuration to tickle the interrupt logic in non-connected pins to
> allow us to evaluate that an expected number of interrupts are
> delivered.
>
> The bias/pull configuration is done with mmio accesses directly from the
> test code, to avoid having to programmatically acquire and drive the
> pinconf interface for the test pin. This limits the scalability of the
> code to targets with a particular register layout, but serves our needs
> for now.
>
> The pin to be used for testing is specified by the tester using the
> "tlmm-test.gpio" module parameter.
>
> Worth mentioning is that some of the test cases currently fails for
> GPIOs that is not backed by PDC (i.e. "non-wakeup" GPIOs), as lingering
> latched interrupt state is being delivered at IRQ request time.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

That looks like a super dangerous footgun to shoot oneself in the
foot with.

But the usecase is 100% valid and I see why you need this.

Patch applied!

Yours,
Linus Walleij

