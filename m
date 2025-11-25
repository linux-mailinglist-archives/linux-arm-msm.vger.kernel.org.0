Return-Path: <linux-arm-msm+bounces-83254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B3EC8537C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B4E754EA463
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1D0222578;
	Tue, 25 Nov 2025 13:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gUxkl/gL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41E8221FBD
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078035; cv=none; b=WTyOdQ7R3UbLT4MT/Ivi7E5MlcgZXPUKo39pizF0u0D23TP/9e2p2aZihmknotDho0WAk+WvsS/1f0WqnAy4eWew6AG7ioM/HbVz+Nr/UkIjF6qly4n5uIBZN63D0JoJMr/LdbQSjzfpkMyz/vFyexikPWaRx365QTN6y04Q+/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078035; c=relaxed/simple;
	bh=lnB0FHtS868yE6fAnh7oRnW/VHegRILe4RKNczS1Vj4=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evhWNZ9j/LzX1hNU6QssPjGKwm6redXyxSakl9YhcVapgJ4HJH48mzrKNMOiMQ7MhAM1q94NrBaj1N7bP5+a77Bxbnze4Wz1XoWqD2G8AjWf4C/Lzuc4TQoBbPm1nAGdcwLjsmNBBn9QL546HUDdHNCTa2LOf1wboQukd+ufvCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gUxkl/gL; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5959d9a8eceso6597919e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 05:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764078030; x=1764682830; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lnB0FHtS868yE6fAnh7oRnW/VHegRILe4RKNczS1Vj4=;
        b=gUxkl/gLWN+68qzjHd65r4jDd/piYGMVZVvNJ5fV8Ql314lISoMCnXo/84a56lQZns
         Y6w2kkcyda22B4/BfAEmE92OfCjcxzFg/4G9nPVTvDzMzv+S5vgRr9G0e7VvHCKIAkhE
         tF+IkfvfEmDrW+893K9gm8b1dtkFdTT6mFDj2h0adtBjKCGkq21ILeDOBciMdRMwClIa
         J/mUyAy4J6l1+WsWqJrZSU1ut0bjAGt9MdvT0vI/2k1cTKndvEvLBYM4Qfqf3OqYJb/y
         e5nKoF2SmnvyvLAyvjQP3GyIoZuvLSpJbWQt1c8GOy7l4mk6ezWULeG4ix187JJB/X82
         9/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078030; x=1764682830;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnB0FHtS868yE6fAnh7oRnW/VHegRILe4RKNczS1Vj4=;
        b=QZf156TvYcPSn4qIDieN+AHqVrlS3iUBAqRz/VjzymkeRj+UVywAsK/ZSGDvRjQ18x
         NkiGX++V5cYJrikBu9GT+DPepGEGDpKfiU9pq2s9ik0KpFezXW+um/uMexJsudt7Uvw7
         qPzSyQiBz+Q92CzoOzoJIi8Ui3eRRmpQu0ffRTBtuSiM/f/pewPSy3hqA3B4TSHmH3np
         kMOpT4yDfGiRSbs/EyOtjWK+iZ8kRdB6I+qOhEJ7Dy1c4cCAj0TNjc+rl4BrKnwf0QsW
         kXWItM3v2dMii+uV98JV8nEOtSEGFi6PW8ovON0dDmvCaVL9eapgq2W0oMaGtQP2wRbJ
         yjIg==
X-Forwarded-Encrypted: i=1; AJvYcCXwGJXcWtuYrGkU3uh2FGu/ZtVX4pj7GcXE1/353UodXfqWXp3n0p7UIML32LIHf9uIViMil6Ye/O5aY/3t@vger.kernel.org
X-Gm-Message-State: AOJu0YxnfhMEQ1bcLSuSgXEamYq/Ma/niAblJ8/j7lcI2LIJ71t155nJ
	DZ66y7IkPQDE8OsIvTHt1kIOHvl1gSioFTsN+mkFMlWcDyi2VXWVXcUFvJ/b/kT/WxPeqriXyfV
	fWLKa/PWB2HeVyWo019o9uCk++FSJ5hK3t3CkDibM6Q==
X-Gm-Gg: ASbGncvnoQY4ZUTfoqD54myeKRN/XCk4OtLY8LVe9zdF+V1BR25ZIxT3Z4NJ9MO+DN8
	fdJOFivV5wVpKC037SWrO6nQRQlqHAMGpiqHSGBFAj0zemBj+EeFvT1QP0RDxt9/JIqZj3/oUql
	fKBwrT3R//5SdrWiepYpJqABgrVxmk08YuGrW350/UftISFnP6jhyQBvzeGe6NF2TNBEuuUaHEV
	TGmfRweh+eR2/H5nOl5iolKjZL7Bnu3UxlPYNxLHmCzcNGnwGun/hsDVJX11fChoNP7cYXQQyXU
	43EuL8QSKV8OLA88/9Fww0C6BQo=
X-Google-Smtp-Source: AGHT+IEAiK5P3FP6YZR4PGEsZxoZj2T57vGEhYoLRvRvyiOcJ5QpL7oNVEiL3/hPQYK8muIUij1TG1qyJsdEnBz1z4E=
X-Received: by 2002:a05:6512:290c:b0:577:2d9:59f1 with SMTP id
 2adb3069b0e04-596a3eb3241mr4564860e87.19.1764078029997; Tue, 25 Nov 2025
 05:40:29 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 05:40:28 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 05:40:28 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251124-pci-pwrctrl-rework-v1-4-78a72627683d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124-pci-pwrctrl-rework-v1-0-78a72627683d@oss.qualcomm.com> <20251124-pci-pwrctrl-rework-v1-4-78a72627683d@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 05:40:28 -0800
X-Gm-Features: AWmQ_bmV0QsterptNcf19bHGW_bPkBOzXs3poYw4YgdIPFSdq5_BW_ziO3dSMHg
Message-ID: <CAMRc=Mf=dwXNY-1oy9mv7GcqSjrjfcJLmKbVDtBYzqqzvahKng@mail.gmail.com>
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

Makes sense.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

