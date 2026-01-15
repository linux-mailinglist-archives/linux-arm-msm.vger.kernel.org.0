Return-Path: <linux-arm-msm+bounces-89223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 26114D24F2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 15:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E128F3020980
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 14:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0823A35AB;
	Thu, 15 Jan 2026 14:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9z1KC8j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC6A3A1E88
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768487255; cv=none; b=o+L1/AmSoZAnhLlBe/RY4EZXG+7itkmY5i7RgGE1FJ2HQ/ZAYb6g/b9fvzurtLxrfnNVNDOtxVANsrsKC2OKllN2OOBEVFD64uBzYwIyYSDBd+E3KGSzMFRgGnAG+JDRjE84PWZBrl0V9Wx65JUrj/7Yv+Nxkb9Jcmm08CPyHpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768487255; c=relaxed/simple;
	bh=jvPb3lrGzvQY4eXmn3nFfcrCHXN1JWep9zU2aZLbhWI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WXcgcN23UsADqupP6sYb8zcmcvopwm4k0P2NnMG/foGtryQLUO+V9kfe4HuSXUHk2bGRI/qHbr0hXCngCb6Bi3Ic1CwCoKjX/ILcFIRhfBa0vUrvD/pV4X/apb4/vHuGCVI6oTpQx/HZDPVP+ROIemTp+yRX5qKMciFIjnC9fF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9z1KC8j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA6CC19423
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768487255;
	bh=jvPb3lrGzvQY4eXmn3nFfcrCHXN1JWep9zU2aZLbhWI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=k9z1KC8jMi/9MUCq142fQyP/tcGcUo3N7oGTRcBnIwvUCKw7Or4Q8yGZZ2hB3eyAX
	 jaW+x0k0lqQGC2uC7LL7cP61XNAi9151Hgv6d+lQqlF/HantMAKsz+mWNbhupvUR43
	 Kb+Xo8iDZ4kRdI+8ZHASuBMnzm12csKj7h5SG+HSrUD9ZQ2WvBlu9dGaxcn0wRfToU
	 RnLKdMOfebvg5FkqklVJRu2yTvPxR91I3uIGVnJL956bPOHE1rzRwydGspc30L73Yt
	 lFmNMXgpRckKzYka289y+67qnz2Vvr2NDRi+4bv45PmeS25X8WfkP/IdJ3fZw8TwdH
	 KZP3zrlFEhCUw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b7882e605so1363442e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:27:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKhmrPW5g9vw2FxIUUMYbsGXezTRORWbaWFZTo+9rPPaeAKS8wCaVP2VhY+wj3ST1lyG+p4nemiE/WAeYP@vger.kernel.org
X-Gm-Message-State: AOJu0YwyUbhQlEkSp2lfdHMjKb7UJ1z4EQZnjswJRX9S15dweu2auXig
	A89MZq3JCDwnxFeuoYep0mw/KCuos8I2DOw/BzecqgowxGasQv8mAAnGgM9iPldutAMGLwTCIIv
	NGUVauXIiNVe9T9sabEpOU2vPkDjjVFlpnRZ1i0y6Dg==
X-Received: by 2002:a05:6512:23a5:b0:59b:811f:cfb1 with SMTP id
 2adb3069b0e04-59ba0f81f8bmr2290889e87.34.1768487254417; Thu, 15 Jan 2026
 06:27:34 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 09:27:32 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Jan 2026 09:27:32 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260115-pci-pwrctrl-rework-v5-8-9d26da3ce903@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-pci-pwrctrl-rework-v5-0-9d26da3ce903@oss.qualcomm.com> <20260115-pci-pwrctrl-rework-v5-8-9d26da3ce903@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:27:32 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mf8okkzRAAW2m4XnGQxzTE0tJT1kmg9AvPp-4LpEXL6hA@mail.gmail.com>
X-Gm-Features: AZwV_Qj2AXUr43FE6yjbGbv7tF91o4DACTtZ4l_6-QI5wb48h1KQ3mkWwIA-Fzk
Message-ID: <CAMRc=Mf8okkzRAAW2m4XnGQxzTE0tJT1kmg9AvPp-4LpEXL6hA@mail.gmail.com>
Subject: Re: [PATCH v5 08/15] PCI/pwrctrl: pwrseq: Factor out power on/off
 code to helpers
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, Niklas Cassel <cassel@kernel.org>, 
	Alex Elder <elder@riscstar.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Jan 2026 08:29:00 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> In order to allow the pwrctrl core to control the power on/off logic of the
> pwrctrl pwrseq driver, move the power on/off code to
> pci_pwrctrl_pwrseq_power_{off/on} helper functions.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

