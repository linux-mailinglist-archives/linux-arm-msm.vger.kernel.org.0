Return-Path: <linux-arm-msm+bounces-83252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F06C852FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:34:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE4754E27FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C1021D596;
	Tue, 25 Nov 2025 13:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="meGWSM+v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB101D516C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764077650; cv=none; b=XkGCMixQYBNV+4LzI6b6BSJ+GI5tuCpfJrYJZrWlRGruyUAzvuAq50shD4TJwFFDWAzTkZLIhjK+UsAmLaTfF4E79rTMG7abYKBSohR5C8keRyBVoaAhTNvLV5VEso9puBEF0T3s4EIewddo649isd+474+eRiEIyA2YnNaZmtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764077650; c=relaxed/simple;
	bh=2MLNRS8OGcGxSnKUVKP+56ZKMabB5DVbJvKWuU9wTyc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b3jIWes1geVfi+J4gzrXWXFBxgXc+jJGMRWmEkoCr+ni1Acp6QpkU0VynxH7+s95o0UDZrE5DS7BIv8zFS+ZeBkyb2jAJgQ+o/H16in5qP5G7TQ6slDv6m8yUKsR3wFYkTL3C7bNnyMx9Zg/iDTy/oIJ6AEBKQ0STq0x4SYXuek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=meGWSM+v; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59578e38613so6374163e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 05:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764077646; x=1764682446; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dAVYy7T5TP7gCxNE/224Hph+WRtTy6ByMNTbqAz/tmc=;
        b=meGWSM+vkMSX2x8SdJwaUHggf8VO2HW/KgcT3yaz4TaSyOb2/uG2wNNy/b43BjjVfv
         7ChW5ck/FfqN2Anfc5em3f5u8jAw3ANnzpbafdJ+/OZ3U2ZmLy2ee3EwU4svp0dIKD5b
         KZMk+74XZKdWjDknv1KH1yMOzgYZ8Gq15D6jtgtPtL8NyWzmT0ZnJ+YIlGcdVQLAMDLT
         gAhXyDXtd+0d7gG0ceM1UwORSHCfsFLVGNSCROypXJLQ2vfzPTwa783yIvAHBzKxxfJm
         FZSexM3AJHZIpSwmKC/Q+lyZsAwO/bXqmk4kmISE+YDIBZUeMWFDbp5Y170iKpuucrl9
         QABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764077646; x=1764682446;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dAVYy7T5TP7gCxNE/224Hph+WRtTy6ByMNTbqAz/tmc=;
        b=kHFdE9hb6dTLltrkmvZPenRYmpKLvNAqBVSbvXHZB2fejEOFg/3sl1c77lJEYCtUCo
         cJy+sjadL713w03BHeMmuIMP8YFg1e16PJ36E3GWsEFkKSWvUM6ZLtn3Hv/2pjxfroBT
         ESin7S9XHGL9vHOZncRuiFa/M9w7M63ZTF8UT8wka8/yuHRevmxundpVDFbrGsEZo8l9
         Bi6tU2sCJQID8eCiNc1fT3OWzAQM5AIjwhg85UyGWgsruuxF1TR3rOWPGA0oimvQ14na
         rheOFdptP0d3heV7GPuTFk4EHpSOiQplGJL5KMkR0x687xuksUJWI9z5wXQb3U74mQLD
         MxPg==
X-Forwarded-Encrypted: i=1; AJvYcCW+fqzg2dZf4RbsaeHRxZ4R2XbAVTiGASO3qrIK1bxNygC10ZcWXD19v0ZpC/U28IBewWINGRc9PyvWEsFH@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoaj1KBhpqqr9mAA4WbAPFBl5hcMXshe0P6AG74BaTH9gS4LGt
	w5PiutligUldDjRbTns0GJfUb1yzXSD/N2PrgwzFpNjUHltlDsRzq+KO7oDRI7QGrS/hV9IyGLz
	MU4K/CVPGJBZlbhJja5j1WmKJJIHx54SLAuHFyje0Pw==
X-Gm-Gg: ASbGncsaB/mmO00Bym3nW4Gp9HcpFdUi3JEbIgjBj1Fgtushn4303/Nd9hY2YJKbBKt
	RM1CyF4hSwoL9zOeQgknEREF1ljejRd2GMY+voefIOMwXwRgv+P9C+N8VwuhyZOnseCRFhVYjZc
	rzV3UvgHtmKvVo6ZiV9f370eZQ4BkRHWcrzILnNrDTALYOKOttRaDwUttcK9Y3Ibfau5nyTGMmd
	todhVeXNM3LG6iSFqZVxGHJ9caCsBJ7I3hk80hJImBUSHBMoU7+Tl/wap+U6qrB+7jvD/y70jlD
	TDFmHf+MqD8PdjotFy86epqf4NU=
X-Google-Smtp-Source: AGHT+IG9Ti7lkxwD7MySbGXbpescEnPD1qEmT//p7y8c8bi7c2mgLpxwJZgArS0veNWA5TYlb0r7uGuZGZ7oZ1bzD/s=
X-Received: by 2002:a05:6512:3d91:b0:594:2f72:2fa2 with SMTP id
 2adb3069b0e04-596b4e4b868mr1099951e87.5.1764077646330; Tue, 25 Nov 2025
 05:34:06 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 05:34:04 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 05:34:04 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251124-pci-pwrctrl-rework-v1-4-78a72627683d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-pci-pwrctrl-rework-v1-0-78a72627683d@oss.qualcomm.com> <20251124-pci-pwrctrl-rework-v1-4-78a72627683d@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 05:34:04 -0800
X-Gm-Features: AWmQ_bk4lV0HZ4z8cp-6GbalWXiC88o63pPNYrCLxihcKDksJLD6FQwEonYAt8s
Message-ID: <CAMRc=MeRVLALxdPoFP2fXpq+inZpA7h-eCBRuegTkxWUGOpDew@mail.gmail.com>
Subject: Re: [PATCH 4/5] PCI/pwrctrl: Add APIs to power on/off the pwrctrl devices
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Niklas Cassel <cassel@kernel.org>, 
	Alex Elder <elder@riscstar.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Nov 2025 17:20:47 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> To fix PCIe bridge resource allocation issues when powering PCIe
> switches with the pwrctrl driver, introduce APIs to explicitly power
> on and off all related devices simultaneously.
>
> Previously, the individual pwrctrl drivers powered on/off the PCIe devices
> autonomously, without any control from the controller drivers. But to
> enforce ordering w.r.t powering on the devices, these APIs will power
> on/off all the devices at the same time.
>
> The pci_pwrctrl_power_on_devices() API recursively scans the PCI child
> nodes, makes sure that pwrctrl drivers are bind to devices, and calls their
> power_on() callbacks.
>
> Similarly, pci_pwrctrl_power_off_devices() API powers off devices
> recursively via their power_off() callbacks.
>
> These APIs are expected to be called during the controller probe and
> suspend/resume time to power on/off the devices. But before calling these
> APIs, the pwrctrl devices should've been created beforehand using the
> pci_pwrctrl_{create/destroy}_devices() APIs.
>
> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/pci/pwrctrl/core.c  | 121 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pci-pwrctrl.h |   4 ++
>  2 files changed, 125 insertions(+)
>
> diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
> index 6eca54e0d540..e0a0cf015bd0 100644
> --- a/drivers/pci/pwrctrl/core.c
> +++ b/drivers/pci/pwrctrl/core.c
> @@ -65,6 +65,7 @@ void pci_pwrctrl_init(struct pci_pwrctrl *pwrctrl, struct device *dev)
>  {
>  	pwrctrl->dev = dev;
>  	INIT_WORK(&pwrctrl->work, rescan_work_func);
> +	dev_set_drvdata(dev, pwrctrl);
>  }
>  EXPORT_SYMBOL_GPL(pci_pwrctrl_init);
>
> @@ -152,6 +153,126 @@ int devm_pci_pwrctrl_device_set_ready(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_pci_pwrctrl_device_set_ready);
>
> +static int __pci_pwrctrl_power_on_device(struct device *dev)

Both this and __pci_pwrctrl_power_off_device() are only used once each. Does
it really make sense to split it out?

> +{
> +	struct pci_pwrctrl *pwrctrl = dev_get_drvdata(dev);
> +
> +	if (!pwrctrl)
> +		return 0;
> +
> +	return pwrctrl->power_on(pwrctrl);
> +}
> +
> +/*
> + * Power on the devices in a depth first manner. Before powering on the device,
> + * make sure its driver is bound.
> + */
> +static int pci_pwrctrl_power_on_device(struct device_node *np)
> +{
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	for_each_available_child_of_node_scoped(np, child) {
> +		ret = pci_pwrctrl_power_on_device(child);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	pdev = of_find_device_by_node(np);
> +	if (pdev) {
> +		if (!device_is_bound(&pdev->dev)) {
> +			dev_err(&pdev->dev, "driver is not bound\n");

This is not an error though, is it? If there are multiple deferalls, we'll
spam the kernel log.

> +			ret = -EPROBE_DEFER;
> +		} else {
> +			ret = __pci_pwrctrl_power_on_device(&pdev->dev);
> +		}
> +		put_device(&pdev->dev);
> +
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;

Bart

