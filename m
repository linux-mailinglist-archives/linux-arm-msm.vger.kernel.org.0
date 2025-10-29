Return-Path: <linux-arm-msm+bounces-79464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 343D7C1AAD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 14:28:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 108565A1AFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 13:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACE83358D9;
	Wed, 29 Oct 2025 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RuSYPpDF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF933358D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 13:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743754; cv=none; b=sLw8XO3dG9u/MjxJfX/Oq3CNVQrMDz4nOEZmN4/v1p/yHF5082skfRPba12VjrPIJ/7cJtNX9HsT3OPBJQhliEIdP9Q5Vxyq1cQk+En5KH+A2572iAVoSGsVwPb4YDyaGiR7e0T8K7OeoT87Rn8UAzMcuIE0haknFHeDOIeRpso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743754; c=relaxed/simple;
	bh=idJ1/xpsY9Qz5yevc36Vw8gxViLPchWiyXx0zGa+jFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdHFLSUrgHG4ZOJkLigIf54FO3q4cWqMEmsqJOvV+SN8l5wMPTKYCjrIHUGhJgnWIWTKVK+LmOFFVZd7gIDdJi8y4mf7GtLKgrmmGu0Cv3ZWhDZFm27X9dxtYj2I3c+DROAOxhqVW9Uzs8Qk0U6Z4pC1wO6fkQddEN7pgn0ab7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RuSYPpDF; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-57bd04f2e84so8755202e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 06:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761743751; x=1762348551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOUisOdkXU0bOduvB/ByBLb4wJp/5x2Vdu+Ct3A15wo=;
        b=RuSYPpDFB4REAVfafBOGVygb/P7rkfXo3U5o7RAbKuf+FFtQdoHehowXFNnsFCLPKM
         lsahh6Goc7ckmd8JBWRgi/E9gqB8MQg96XDwUWi1d+nXwsaHUHRbwiqSfcNcm1EzSoVf
         jitUK50/2fXnjO1Dg+OKrHZouoTWCKozi3cLm9ahFPz0neptppiUdWslHosJ+xsEqvLh
         qsoDLF3LmbaI28247Tn9fpyI7UXyXiTgY7h1kNq0Jd4W6EJiW+hPhx7bEenLKS2YGnbg
         M2a9IsdyW1RGosdkcI5gUgKW8d8oE0Zm2V25u9/caZzaH3cme21/ZyVfMtLzK7BUnoIf
         PAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761743751; x=1762348551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOUisOdkXU0bOduvB/ByBLb4wJp/5x2Vdu+Ct3A15wo=;
        b=SzI1PFsl9GqUirTOwBeeAMlzdWDzRw4TDWuWdYOrMbEouXoODQsbi2D3KA0PTJ6cmF
         3185xosJvRYYXgz08zUkfDUCyOASHZvi3LfCW3mIwxcBh7TEjmyGKvErfUC94l3l7n/E
         C4EJrV/reeQsNRsBRDdwbrQmbsom0lS591uuH1P+ajYDYJ3ABpWh3seiYDdAR9BVM5NC
         jpMpsnKn78H+lp2W8/Tuga6eE4VU5Bo3zBnH+JAUthG4ekBigPs0w4iDHilz3/TgxYi1
         juM4aAoQmAmDaClHEcG8o3vWVSKqj9BNTshUfQY44ySGTOvmpPq3l77YtyVnY1q40J6i
         YGGw==
X-Forwarded-Encrypted: i=1; AJvYcCV3eWfUYjxIaf4ZSUxeQUQgqXDKIRpKSJIEz849OljAkGbIt2ZT/cTh7YYiq02L9GaT2naJVSCgQHajR//J@vger.kernel.org
X-Gm-Message-State: AOJu0YysFZlvMA1GIzIVEf82pZTZGz0Ndw5mCBdJX+GTdWSYovG2VhdC
	1fjg71boHQmEbe3vJvtSZfUtEVWFV/heH8NjR7UUQvLV2URGNIEU+2edzJxGu2UI9RdLyIPtf+t
	JlenKOgZe2qcfXYOZUsS9KXpMMHVxQNZaO6qZI0o2EQ==
X-Gm-Gg: ASbGncvDOQCSNFzTsJWZ/ulhBdfCFTUXztGSgU5tfz009O0/fnToSErGCm/o2Pl5c0U
	GUHLTeaM+IWjQbS9nVj6XCEhEyBOZ3ybXPS+uprbEX2S17DXes6XW2i3d5ICismhq7XHRwiBHOk
	bPGSyGz8urMiOGzDX1eKgpgUpmcTgOgEJoMEnSgV/9DWtONBxKcQ2jIb2p3Cj6LAZczkRq6JKaQ
	s+tmOxaWfhVzVjpuUdJTxP+KVE1/nhElSVcq8FgJVcGvPHYSXPyEGC0l8Ptybrved9AjKjWGmp6
	303EBkX5pbrfPsF90fzx3ARr4r8=
X-Google-Smtp-Source: AGHT+IERc+XWdsch1n0sjpOQOzD+cW2IjfHO0Rpz1QeHwY2DnN9gsWkr3+lO2lQRgACmeZoFB2eG85VNyJBLdF9v7Qc=
X-Received: by 2002:a05:6512:e84:b0:593:5066:8e35 with SMTP id
 2adb3069b0e04-59412878b7emr1119097e87.13.1761743750670; Wed, 29 Oct 2025
 06:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029-qps615_v4_1-v7-0-68426de5844a@oss.qualcomm.com> <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
In-Reply-To: <20251029-qps615_v4_1-v7-7-68426de5844a@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 14:15:37 +0100
X-Gm-Features: AWmQ_bnxen2afRHV8wd2ApkjxBH0TleB__nu5t1NsDGu_HDLvXbdqDWBWRF_WWQ
Message-ID: <CAMRc=McWw6tAjjaa6wst6y3+Dw=JT8446wwvQ0_c5LHHm=1Y-Q@mail.gmail.com>
Subject: Re: [PATCH v7 7/8] arm64: defconfig: Enable TC9563 PWRCTL driver
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	chaitanya chundru <quic_krichai@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Jingoo Han <jingoohan1@gmail.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 12:30=E2=80=AFPM Krishna Chaitanya Chundru
<krishna.chundru@oss.qualcomm.com> wrote:
>
> Enable TC9563 PCIe switch pwrctl driver by default. This is needed
> to power the PCIe switch which is present in Qualcomm RB3gen2 platform.
> Without this the switch will not powered up and we can't use the
> endpoints connected to the switch.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.co=
m>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e3a2d37bd10423b028f59dc40d6e8ee1c610d6b8..fe5c9951c437a67ac76bf939a=
9e436eafa3820bf 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -249,6 +249,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=3Dy
>  CONFIG_PCI_ENDPOINT=3Dy
>  CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
>  CONFIG_PCI_EPF_TEST=3Dm
> +CONFIG_PCI_PWRCTRL_TC9563=3Dm
>  CONFIG_DEVTMPFS=3Dy
>  CONFIG_DEVTMPFS_MOUNT=3Dy
>  CONFIG_FW_LOADER_USER_HELPER=3Dy
>
> --
> 2.34.1
>

Can't we just do the following in the respective Kconfig entry?

config PCI_PWRCTRL_TC9563
    tristate ...
    default m if ARCH_QCOM

Bart

