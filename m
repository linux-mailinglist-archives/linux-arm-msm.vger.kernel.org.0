Return-Path: <linux-arm-msm+bounces-77952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70456BEFB30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5DF2E4E2F98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 07:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68CF2DECD2;
	Mon, 20 Oct 2025 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MSk2u71R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF302DECAA
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760946022; cv=none; b=DWVpbH7yZknb8BTbCo5bmiUwyuWR6Dwbh2lomTIz9jTptFvbfkjA2Xp8vw4YD8pn9nNQSYEhsQ43DP1skuj5feQEVSZl21lwlNH4D9DlVIZ1eG9+1AxoHfLar0HF5ddgloaULs+Wn2F44KMKeejryRyNkDZQ4gnNP1FMo1KcD6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760946022; c=relaxed/simple;
	bh=0wMIPfwxIFmgU2DtKGuEKOz6gPwOombg7G5RLq4Dz+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAxCjj5IdKxn2WMJQ8+/kNje0TMCFK1za9jC1829VJJzE6LSSWGfg5Tu0KAWfbnIvrDtOc5DEIowfEzTdB3cnv+9QuFbO/2lP9NP0qcaMdjDAPKmQqmCCcpU6b9BhoQf4wcjfcUZrtzDgRRl9UD0aT7ybNg7xZdofNLiGNTL7aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MSk2u71R; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b4539dddd99so707965866b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 00:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760946019; x=1761550819; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0wMIPfwxIFmgU2DtKGuEKOz6gPwOombg7G5RLq4Dz+g=;
        b=MSk2u71R5pbAfn9yA+iF0+DwkdGBpGbs9S5R4u5lEwtA00mJE1FD8+X0UcteIsj4S+
         0zhs5rM9ct2EN6RJXH1Jw0L83r0uMTCx/NgbZsc/7V87woMGk2fAy6MaZn0smFnhCHWG
         +u0tmtwhOrEetp2pWQpJftbMGdp39Hpme19Pvnv5oU266oFRNB4chII9yeSmUaVquovx
         7jcmmrw8zUEC/r8Ylw7DpPXpAxvs9GcntkWlY2x+2fKOzajEyFjEFQu69NivNKgLAqxa
         SOPnRM8QX45R6P5mHC93PMJc5pBBlS9c9zReIMROm1GZ1lHMMQ6+tCfe/wT6gQZOCOUl
         REGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760946019; x=1761550819;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wMIPfwxIFmgU2DtKGuEKOz6gPwOombg7G5RLq4Dz+g=;
        b=Wx5JGsxtDI1KZ0o23kvyxmehAS5OEMpv1vBSp5UQXco7JKfZ4E+VVGoLXvGWvaHkup
         Tjue9RhHN1/Wvr5toOkor/Pq9CqQG0sBpqSz1ygeFXqoiY35C4X7QLk65sCHQCLiicLq
         aU516rW8rqsPpWjuv1tUF2wKpJavLczeMGz1jo1D3qCjM9UcIjdAt52fTkHr4/MJOWf1
         BxOEoQWL/9n/DGRCyA2zkQAzGyoWONUnyBCRMrzyU/2u7XKBD5hVYULMKGap1jLWtfYg
         nOBvZsKEI1cjEGix9yybGKQvrs8OxdkMusAOjOasAhKf68oRDFKu5Qk9ayAV2CzsBBzx
         AYcA==
X-Forwarded-Encrypted: i=1; AJvYcCUeB6cgyppVxr9OruAxS7eCPLZ2NGGfuJkhECGqqPMVP6+eiglkuAKa3PS5jscJu+/cSEFo4kppIuXriq+W@vger.kernel.org
X-Gm-Message-State: AOJu0YxoFNYZZ/ISFYjmxOEOmSbanfva7/37NJZoomRs99QTRJg5Dw1+
	SWgTEaSfoPMGD7KWZeeL9Vt7YXQbavxfdKPkk0U1sZ6ZL2JzHvFQQLRaXjQzLyixvLg6IPGY0kS
	VK1Z1/13aUmUhRynZtc6ajuVfQMOkJ2IdRjz3Amzdeg==
X-Gm-Gg: ASbGncuhnLlC5egzMYG3g1etoXJQDcN3hwFLYkkqC3OWJbr2WUN9NuWAD+gWIjxXH1N
	/X7TQ/lYlEmRV6lXcqm8aJONVvbMWzaEFkQcK0NWxS4C6m7/C7tJxZeLeZJ11LwNGIFS1G4swJF
	7uELrjV6VqwPd7BaUx3oSeebmUYgRfvfzhFV2wYhTlu1j2US0xqRqTs0VCd/cVn/6OVcrsFkL0J
	lbJhhIZe4MXbecpmIQ1v6J8ZCbex6r5bUT8dfv6nP4ndzJXvsYbUADeEJEqCr+lYmhL8F1xB10c
	1GhWfKLeuaH5IFHg
X-Google-Smtp-Source: AGHT+IEO+V8VAFMfi1d+Dpc8VhoXd1xOMdOzj7La5+gPgRBFBmz4EnWtgFm++KSbXHUMJdJsGohBl0OEYJE1bSAL0Zo=
X-Received: by 2002:a17:907:a07:b0:b42:e3fb:c950 with SMTP id
 a640c23a62f3a-b6474940089mr1185686466b.42.1760946019110; Mon, 20 Oct 2025
 00:40:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
 <CACMJSetWthCcJo8v7EuUK-aDKhf5KTNG5WQQ9aTQu62B+E=DMA@mail.gmail.com> <8fb6e8e0-cdca-0bd5-d0fe-56b5f6d27a5c@oss.qualcomm.com>
In-Reply-To: <8fb6e8e0-cdca-0bd5-d0fe-56b5f6d27a5c@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 20 Oct 2025 09:40:08 +0200
X-Gm-Features: AS18NWDQAFben5J2E63tcGMgXbcz7DeN5SPmzBXSPc44YmLC1GOGJsimgnGM4cs
Message-ID: <CACMJSetTrze028iXmH3i=JguJy=aNOMcnkLhO1ewYNiusvVmgA@mail.gmail.com>
Subject: Re: [PATCH v16 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Souvik Chakravarty <Souvik.Chakravarty@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Yan <andy.yan@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	John Stultz <john.stultz@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Stephen Boyd <swboyd@chromium.org>, 
	Andre Draszik <andre.draszik@linaro.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Elliot Berman <quic_eberman@quicinc.com>, Srinivas Kandagatla <srini@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Oct 2025 at 21:40, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> >
> > If you're using devres here - at least make it obvious by adding the
> > devm_ prefix to the function name and make it take an explicit struct
> > device * parameter so that it's clear who owns the managed resource.
> >
>
> sure. we can add devm_ prefix to the function name.
> reboot->reboot_dev is an internal member of struct reboot_mode_driver *reboot.
> The struct reboot_mode_driver *reboot is owned by the calling driver.
> If we want to PASS reboot->reboot_dev to the devm_ prefixed function call, we
> will need to kind of split create_reboot_mode_device into two calls - device_create
> in a separate function and then call the devm_ prefix function where we add the devres_alloc.
> Can you suggest a bit more on this?
>

Ah, ok I missed the broken logic here. Devres should only be used in
devices already *attached* to a driver as all managed resources will
get released on driver *detach*. What you have here may "work" by
accident but that's not correct and is very fragile as soon as you
have some non-standard behavior or error paths. Devres won't fly here,
please just use regular allocation and free whatever you need in the
corresponding release/free/whatever routine.

Bart

