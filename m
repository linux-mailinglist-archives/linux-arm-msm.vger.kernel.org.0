Return-Path: <linux-arm-msm+bounces-39317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C919DA81A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 13:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1B9316593D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 12:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57BD1FCCFC;
	Wed, 27 Nov 2024 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VFjp4YnR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56D518DF86
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732712087; cv=none; b=XgB18DL+gC7hvhTGm3tYP0DZMx7mF2LTBCxJ9KHHISr5/5H5UiM5MahG1L9NY/yD4rm8djI6e2yMvH9a/WAfwVveSG2gshGWuzv2OViBHF8Go9RDWU2nSQV2g2/etWkWTC6zLW4waxj6+Q4dlC5YkLuo9RAP2MGgeRWwc3WEvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732712087; c=relaxed/simple;
	bh=Lh+K93JZ+oSO4iAA1pLiUmBkVGI7gz64mN0R2XehEKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcpX9sbFnXPVn5yCOfN5fsNFcn17hGoD3G0eVfz2TmXNPw/Z/ZSdPF10/WhT5wgfdgYTI0lo9K0Pzep9uwu+k6wO8TuS2aKDlXxz+g5mBop2zDI6VQvUN59ilfKciZFim91Lq5a1BRIR9BMkQxowx7iIJVSCvI5V4OTIrKYL6so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VFjp4YnR; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ffc3f2b3a9so50913221fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 04:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732712084; x=1733316884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMlguYsXBaHTG8IIPiymhg5zN1IoRUyw9vVeQdmNnoE=;
        b=VFjp4YnR2BMoy20IxOEMJ6AK3Ujrzz3qmqIca2qOFLtkK55WJsWT28V1CueF2zG9oA
         obvV4ErO6bOWG4IoF9wTGVCsRzKyKxGlc1aUqRrTHzjWb0AFe1QVeXte1QXSQNi/Fy9h
         ZDqJZrq9ZY5pdpybQD0+pDTk/X/IyN4E+fD7GMadGmvERoPh9zQijAE4j1em4simzM0z
         RNVJzhnGtNKpW4usO8p2lPDZdkI7/cOnkHbnKpAPZtECWpT8mKCGuIGuEhHIW2WP4UFP
         oWvuf8iJR9xR47rt3XMM0mFg/L2TVpUfUHKFj9SPPKxO4RMU4k68P0JHutPQYPkSRbV+
         wJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732712084; x=1733316884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMlguYsXBaHTG8IIPiymhg5zN1IoRUyw9vVeQdmNnoE=;
        b=VqpKKfG/x5WKfk+UGmdbqM2yqiqqcmIRfkEZHng3czczrDIjVT6zVcUTSpmjtcJ/yM
         Uq9y6TfpRsW+jYJCiXe/PMbugPVgqwbN6/pxNw3Nuc6bh8+2EfXaoKSpnNQvP9USczc2
         xATZY9GBajLZpqm1KpYwovTPazj1dIqaZL0XZvUuxtNAxAm/uOgrqwOsXg+UhiIv9D4j
         vgpDQagYb+Njh0y1FrmSWNjhu9RQA1MqYb8F9Z23+ZHhWoFmcn/ZoPD8SZwSZj3Pv1NY
         Vl56w51umZa7zGBn/LF2+EBASOuTq2iDD7wvcmDkbSL3jvMeFhcGXNUFjMAhNrcPlIX5
         sgvw==
X-Forwarded-Encrypted: i=1; AJvYcCW7JiPM5Hebf1g0yTZ+tH+XL33VdeZ/Ca8Py5uXcczP5QTu4NQrvLiB4mZ1Cy+khbnpLoGfjucyN/PIT+9q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1BoaOQ4E5ktOuoHVdIrb6V5hVpodkWxIT2oE8dCLbk3Z5aqeR
	IjUcYBOZT5fS/Xqe7FAfyr/hW/niftkUPDLaURPAz7ZII8O/ltrUNOR1dltALNz7ioxPMn0PCUP
	oy8K2ECBsofzw2lu/n6wbzBgXOxcW2/9mOlNXzg==
X-Gm-Gg: ASbGncud5eXgYI/O8z8kkdMpysp18AJRkc0i+hLNW/OWjbkqhcaZuEezd/6gHtRkkh7
	W2i3FmyfOw26SrcYeA6IdApTsd4QKfaQjlNAHAID13hbabQsQzhRPJbuvjtCw1FQ=
X-Google-Smtp-Source: AGHT+IHx709SaQ1FKdkFFszRfWrjL9xRjWY5udSKu4C3NKATAFjJLfJrvyExi7rrNp0NGOcrVq8wkyZ207HqatYcYLA=
X-Received: by 2002:a05:6512:b26:b0:53d:efc7:70c6 with SMTP id
 2adb3069b0e04-53df00d9d1fmr2573513e87.30.1732712083923; Wed, 27 Nov 2024
 04:54:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127115107.11549-1-quic_janathot@quicinc.com>
In-Reply-To: <20241127115107.11549-1-quic_janathot@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 Nov 2024 13:54:32 +0100
Message-ID: <CAMRc=McvKvHy8sxhHE2-5LO7-MAjtPMLks6x9bufTjmpG4cT6Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Enable Bluetooth on qcs6490-rb3gen2 board
To: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, quic_mohamull@quicinc.com, 
	quic_hbandi@quicinc.com, quic_anubhavg@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 12:51=E2=80=AFPM Janaki Ramaiah Thota
<quic_janathot@quicinc.com> wrote:
>
> - Patch 1/2 enable WCN6750 Bluetooth node for qcs6490-rb3gen2 board
>   along with onchip PMU.
> - Patch 2/2 add qcom,wcn6750-pmu bindings.
>
> Janaki Ramaiah Thota (2):
>   arm64: dts: qcom: qcs6490-rb3gen2: enable Bluetooth
>   regulator: dt-bindings: qcom,qca6390-pmu: document WCN6750
>
>  .../bindings/regulator/qcom,qca6390-pmu.yaml  |  27 +++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 174 +++++++++++++++++-
>  drivers/bluetooth/hci_qca.c                   |   2 +-
>  drivers/power/sequencing/pwrseq-qcom-wcn.c    |  22 +++
>  4 files changed, 223 insertions(+), 2 deletions(-)
>
> --

Is there no associated change to the pwrseq-qcom-wcn driver?

Bart

