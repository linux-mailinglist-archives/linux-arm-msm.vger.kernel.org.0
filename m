Return-Path: <linux-arm-msm+bounces-83181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8967FC83AF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:18:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 420ED3ABEC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37FD2D0C76;
	Tue, 25 Nov 2025 07:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XSEegx2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A1286D4B
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 07:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764055107; cv=none; b=S+ENwPPpSePDIl2ZySGxUhmIh4rNsVpr1qnUH4+N026aQc89XfWqS0i06lBQOR1nnuJMFcj2Ix9YBF4oBCnyNj7RCrBqMAfiDiWqUc1YRStDT/XiDAsmMMMgIcI+wWW8DRmrl9SMFJcQrW+p0ufrwoYtKIIpb9qTalXDHy+yJjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764055107; c=relaxed/simple;
	bh=Tz3LbhzJhL2NF3VwtgFGi4NJlgrEkYE+TVA7VGJCjo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2Skjw8umGyBuap3KCP6VNgz3hGq9GhG2gLbgPLP0ltPuvSnra6NpFmiDBriM7uoS9vQarBzVp38f2az4QoCGomC9C0B7eyAOrnrI2wLTYwkXaUhtB3YoUE5Yrii6l1AgxEwa5Tc6KJvQm23zNblbFjcEU892q8xw7BRQgsjA4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XSEegx2q; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59445ee9738so3926945e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 23:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764055104; x=1764659904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9KLrVH2R0wRtcEdh32X6NYZk3WdTp2IqjBZ1pxFS/A=;
        b=XSEegx2q41pvUJLinnDVwbpShi1OI0s6HwnzS4G2WOgUvdABQwbMb5hWtND2JPg0YN
         xXyKPpgmHokAznJfu3UR1xBISXTAn9yCZernqc6xTyklGoJtT1drq6OYEE8rOJCu8BMz
         CDzzhq1JDR9rTdOeyphpGJMxEKQ1Xwu4j8u8Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764055104; x=1764659904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C9KLrVH2R0wRtcEdh32X6NYZk3WdTp2IqjBZ1pxFS/A=;
        b=UCuOLc1gfiLQ7/orsQC6F4wS4PsBiRNXQLTocT76oxaaJhgASooFiymB0puxniSza0
         R/xpKqrcrXrnYR9FldiIXPjZJ//K2vEcUAesQGkEjG9y6f3DKESNoI7WNvuiNd0NDzWj
         EbJFXSg68oH6Zr3TPAbx+5ND6rNEXhFSgPErLaNgoh/mJU0ehbmv6Bd3PGGlP3altStp
         qw+s2v/+kA2vZzAB/AKisX+JdmH2JGGcpIOfQniX7f/AjtbiA8ewxWmoHeVcmwTk2CSR
         VmfnThQZ+zEQ7tiFqzc7zb2U1r6ed2dMtPx+cFRc+kGxv4bavKPAVS5YE1hgW930Ntr3
         sPCw==
X-Forwarded-Encrypted: i=1; AJvYcCWeK6RXsazh05YiPCI5csZ0c63PjLw6+tYBx7AsCl5zBYefZhe9KAXUyEf+rk8+jaiDFSM/g3VRy2vO4LHy@vger.kernel.org
X-Gm-Message-State: AOJu0YyUoqP3+nowIgFjlWbe31/g/+KyWQC4EXzgqxtd9gc1UJxl+lOm
	yRT7X9rmv0aUtmVlUbSgLRtGiH5uZXPJp8T01YX+h9rEwi5QoXT26TP7Xy3VEcXbEP+7xpFA56M
	Ek+Fyf42pUwS9AG1HD1QftC0J1CHxTlrjBk70EM4x
X-Gm-Gg: ASbGnctvRuCgezarDnmA4EJdg8Embw6WSliebHtcbrxKYHT81kH9wiwKT7YtsBrM6q0
	64QHdgOA7HMADtrY4KeJCplO67347f1keoHkHfUqcj+ZNlRdfnbjoEHG99KWHVW9olA+wXfEwts
	gWbD3rHG1coJTUXVIW5x0kpQqgBYCtICUa8FqrRgnFCEPdEBnEyUil6FvMRLG5ZcRoufFBqfYFe
	10WO3S+XbPeOo2wckeSu3KvrAotsweqAVI7/PQV4CivZOtZ19HUKgRhVU3mKlmjGBfDrjeJj8cj
	yZdafVfbK4ffkIJm2KljOsXoYQUhoUOZjUZz
X-Google-Smtp-Source: AGHT+IGrhybsyZ3HltBSJRrIxp5NbHesaqk0urlgmn2HoCi5Pbbf8Ic/TZ9/x6CZveL7/LiBNbNSgJFr7pcd5+HwKoo=
X-Received: by 2002:a05:6512:3b95:b0:594:2f1a:6ff0 with SMTP id
 2adb3069b0e04-596a3e9fc38mr6083359e87.9.1764055103647; Mon, 24 Nov 2025
 23:18:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-pci-pwrctrl-rework-v1-0-78a72627683d@oss.qualcomm.com> <20251124-pci-pwrctrl-rework-v1-5-78a72627683d@oss.qualcomm.com>
In-Reply-To: <20251124-pci-pwrctrl-rework-v1-5-78a72627683d@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Nov 2025 15:18:12 +0800
X-Gm-Features: AWmQ_blmfM4D42BW0mtigbQ0zM4iSkiLMdvXtsaw49mXE-k5hVXEr2ekLrwjHJY
Message-ID: <CAGXv+5FnL_uvz2F6WDLwY-cwdQAqFicRTt26Pnqo-nqAhf4ikg@mail.gmail.com>
Subject: Re: [PATCH 5/5] PCI/pwrctrl: Switch to the new pwrctrl APIs
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Niklas Cassel <cassel@kernel.org>, 
	Alex Elder <elder@riscstar.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 3:15=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> Adopt the recently introduced pwrctrl APIs to create, power on, destroy,
> and power off pwrctrl devices. In qcom_pcie_host_init(), call
> pci_pwrctrl_create_devices() to create devices, then
> pci_pwrctrl_power_on_devices() to power them on, both after controller
> resource initialization. Once successful, deassert PERST# for all devices=
.
>
> In qcom_pcie_host_deinit(), call pci_pwrctrl_power_off_devices() after
> asserting PERST#. Note that pci_pwrctrl_destroy_devices() is not called
> here, as deinit is only invoked during system suspend where device
> destruction is unnecessary. If the driver becomes removable in future,
> pci_pwrctrl_destroy_devices() should be called in the remove() handler.
>
> At last, remove the old pwrctrl framework code from the PCI core, as the
> new APIs are now the sole consumer of pwrctrl functionality. And also do
> not power on the pwrctrl drivers during probe() as this is now handled by
> the APIs.
>
> Co-developed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.=
com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c   | 22 ++++++++++--
>  drivers/pci/probe.c                      | 59 --------------------------=
------
>  drivers/pci/pwrctrl/core.c               | 15 --------
>  drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c |  5 ---
>  drivers/pci/pwrctrl/slot.c               |  2 --
>  drivers/pci/remove.c                     | 20 -----------
>  6 files changed, 20 insertions(+), 103 deletions(-)

[...]

> @@ -66,7 +47,6 @@ static void pci_destroy_dev(struct pci_dev *dev)
>         pci_doe_destroy(dev);
>         pcie_aspm_exit_link_state(dev);
>         pci_bridge_d3_update(dev);
> -       pci_pwrctrl_unregister(&dev->dev);
>         pci_free_resources(dev);
>         put_device(&dev->dev);

This hunk has a minor conflict with

    079115370d00 PCI/IDE: Initialize an ID for all IDE streams

already in linux-next.

>  }
>
> --
> 2.48.1
>

