Return-Path: <linux-arm-msm+bounces-77432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A01BDF272
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E2CDF3C5309
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1B92C159D;
	Wed, 15 Oct 2025 14:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fDZk1URF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAA12BD024
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760539648; cv=none; b=t5sGhth95/PrdP+5//jwN4Pw1o5RLVXfZeVxUEa0pgRPWemKSPjASGG4HMQK9BDUq+6j1mRMiVXUAiPlFsUhIZcwpp51IMS/Ego6Kgaq1ffgAma8tdiYDsesIVyehhAAbgVfcmVSZ/CuMkIakULB4irQmVLhF/xJiEU1DXOn8i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760539648; c=relaxed/simple;
	bh=QUCvg677zhCDZSxrUQAlexw6PjexV7DKVMj4nJGBmi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PoDH1hTvoN/vU/DV1TfO/et1uyhB1XaH4JfoEsgcyRXZQOhXCiqDjKaYHOkioVLOua8R7lM8NZcFYqsYL9vYFZGR5o1d8X3pENv4BPRWCjYVT5/XZ8/K4WfqzcXbQaIn90ctVPlIh77jKD1i3Hsn2Lq6/aqnytdygtDcmN8cHsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fDZk1URF; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b41870fef44so553456666b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 07:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760539645; x=1761144445; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BkRSLUnpznpy3qYmmJfpc7POjKcvG8Z1LeLnSK1GGKQ=;
        b=fDZk1URF5eS4U1dQlxHNMNPkp/ddZGxQOOoZBdyAtJdu9mnPnEpZHXdIHKLu5vj5OG
         8zw2OP4Njz5OSTbnJ8K2pXaKuSpYLrRtlQaO7S2sz7rk3GZH1diDieZrxCXrDFtLy5rU
         XcnCw3QIcCAR3YQ7Rbkjc3Oh6anB/XAnDVP890DhTunZyKQ4IgpR6IST6W1//kd7K+v4
         GH/WVO6Xg8bUlNMSRIMQX87RNguF1jLLH5u6J6w5L9ZhhlfSWhit8C3uxysPp8g23Sm8
         pnnniRTF6YoeJAlBaGD/EXTX+Gt5RkzyKeWnUzPEybmJo7O8iw2uRcwL6DvaxPxApNmH
         5F6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539645; x=1761144445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkRSLUnpznpy3qYmmJfpc7POjKcvG8Z1LeLnSK1GGKQ=;
        b=cj4n6xGkQ7XpLg9DIrhDF48bjEL3cdA08hR31+DObbsCS9WPdbjLRps1OqX0je4Z0Q
         YfH9/WiqqQtU1hv591U8g79BdXjWn3bSKOb7jehIF1wKf0lOfiY6gjv0snLAj9xKZdre
         xO4B7i7LQw3i+TB6tTH1Bl3f3UYaFv2nhIvPnwklyFLxI7JdLgXy40RFpc2vI25xeYx5
         VJalBkOjuoTHqXpG4Rk4LUrinrnEJQeo70ELpO24SnkcPp6j0JCL5lLI6FvBfnSiPNK2
         71KdDHIsUv+PQ8rqZz5xV/r0i3BKSypyXWo2X6473Qd+pfchrkiN1WiIjyHf98U2Lit+
         FelQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjfPiLKhL0dw55d5tHvXe//MN/5v7U8N+jSA1jcQZzRvcwqqUJdTSJEYRqWCcmwYHxHFLbMLMjTtI22oFQ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmn+9nuuozAaAHreLmThWeatwCWMzdrL3bN+BiTDRPbyxY31xr
	xys26kH9wHvTVaDYOUsdHPwBOy8PDGVImLgUtFui9zDC31KS3YyyMMeQatXf+j366BoQFZx6ZEG
	EkRi398p2JsHYVoWoxTS2my1J8BOn+ni3sRiCQ68VUg==
X-Gm-Gg: ASbGncvg3dBacmvUS7jBj4WdSIvkJIneUSa7jvrO1/7npJY4aZUROHPPif+TPAbuSlp
	kKV7r+TGtiIelj0hKAvjCts7++MDkixD2WtEMGyebp4RBkkF9qqTDYHfZspk/TOtU1PyJrGqV/a
	sPauFyO8MRbjWrP0MYeyAHIUEVe6rzbvJ18WMdmpEIajHXaSrOv7XpH9oEYm/ONZJAH81IQeWZB
	sVULCKPRVOQCNLwjpNfUFsuaKtjPE8qGBppKmSSHPCml5jOGeBTnXnlyoyuhKFKLlazs5Pp
X-Google-Smtp-Source: AGHT+IEUqGfQp9YhYQvza9pi3u1frVExIPZGobHvkJpepK8/VlN4XugYvlYQpaqAjcg5hzZJQWZYiCQ8a7FDZgL9rGQ=
X-Received: by 2002:a17:907:3e95:b0:b3c:cda5:dc5f with SMTP id
 a640c23a62f3a-b50aa48b9cdmr2796236166b.9.1760539645069; Wed, 15 Oct 2025
 07:47:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
 <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-5-b98aedaa23ee@oss.qualcomm.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Wed, 15 Oct 2025 16:47:08 +0200
X-Gm-Features: AS18NWDY7WIS_O4_p56TfpOvWCBi95zCtvBsZn2zTDEoiMSusyplTlJpgBuyRf4
Message-ID: <CACMJSetWthCcJo8v7EuUK-aDKhf5KTNG5WQQ9aTQu62B+E=DMA@mail.gmail.com>
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

On Wed, 15 Oct 2025 at 06:39, Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> Currently, there is no standardized mechanism for userspace to
> discover which reboot-modes are supported on a given platform.
> This limitation forces tools and scripts to rely on hardcoded
> assumptions about the supported reboot-modes.
>
> Create a class 'reboot-mode' and a device under it to expose a
> sysfs interface to show the available reboot mode arguments to
> userspace. Use the driver_name field of the struct
> reboot_mode_driver to create the device. For device-based
> drivers, configure the device driver name as driver_name.
>
> This results in the creation of:
>   /sys/class/reboot-mode/<driver>/reboot_modes
>
> This read-only sysfs file will exposes the list of supported
> reboot modes arguments provided by the driver, enabling userspace
> to query the list of arguments.
>
> Align the clean up path to maintain backward compatibility for
> existing reboot-mode based drivers.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

[snip]

> +
> +static int create_reboot_mode_device(struct reboot_mode_driver *reboot)
> +{
> +       struct reboot_mode_driver **dr;
> +       int ret = 0;
> +
> +       if (!rb_class) {
> +               rb_class = class_create("reboot-mode");
> +               if (IS_ERR(rb_class))
> +                       return PTR_ERR(rb_class);
> +       }
> +
> +       reboot->reboot_dev = device_create(rb_class, NULL, 0, NULL, reboot->driver_name);
> +       if (IS_ERR(reboot->reboot_dev))
> +               return PTR_ERR(reboot->reboot_dev);
> +
> +       ret = device_create_file(reboot->reboot_dev, &dev_attr_reboot_modes);
> +       if (ret)
> +               goto create_file_err;
> +
> +       dr = devres_alloc(release_reboot_mode_device, sizeof(*dr), GFP_KERNEL);
> +       if (!dr) {
> +               ret = -ENOMEM;
> +               goto devres_alloc_error;
> +       }
> +
> +       *dr = reboot;
> +       devres_add(reboot->reboot_dev, dr);

If you're using devres here - at least make it obvious by adding the
devm_ prefix to the function name and make it take an explicit struct
device * parameter so that it's clear who owns the managed resource.

Bart

