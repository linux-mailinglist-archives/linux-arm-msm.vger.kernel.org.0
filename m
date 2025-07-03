Return-Path: <linux-arm-msm+bounces-63583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4CEAF833B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 00:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA6AE582F7A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 22:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384F528EA4D;
	Thu,  3 Jul 2025 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s06L0ePE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577CB24A066
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jul 2025 22:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581309; cv=none; b=kfuZOIF9GsfDHs9S9xWazWNA/WOpx7S8UCo3o9NdobwJMcGtypDWY/ijHu/6ZQQSEc0eb1ZibzZaaXcgF2Jp/Fd8fSdpqg6bATK4RS6rdO1LOFPXrs/S58BCeJHtPiojE/IPMYSXje6SDmUN8LRLmkdIJ5+KX8dr+9ULul5uzNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581309; c=relaxed/simple;
	bh=hXa7xVr03JFbcgBBljLOZWrTDtWUk6UBg/vmRmvPVoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5HY1PppJGPxUu1u9tXQLTmfjZ3x7M0fgcMhiZ8O1fTlZJjWyVhTeACdvrG6Yo+yveC1dEusSIOAN1i/xP0lyOQ90Rk3EaHWYMol6driOHV9FbX3pZ42i0Ejzg8XbgfVsQYGYdhNCY63b8xZjxwLdTG4PxMBQRiTwaDolM3hvqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s06L0ePE; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553d52cb80dso338773e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jul 2025 15:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751581305; x=1752186105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXa7xVr03JFbcgBBljLOZWrTDtWUk6UBg/vmRmvPVoo=;
        b=s06L0ePEV+Ik/W++lG6RnHh2ha8t1mhR9yAbOmBc/IokvzgsMjUYG2PGa5hCfZfyYu
         7suCgB0NhgU8mGTFAZE3l5VeQRtkAR48nM0X9mIan6GXsHMLV/MI5JL1h2WkOgLa4vjv
         mKgIldSipKXKAg695Z58qM0JMF0JDcv3nj5MGoG297pVRjK+Sy0CIWOFM6YUBdGn38sF
         zZEVUROaG/Eggrt/Cemq4QpG/jU1RWDVhm0a0f8iUbxp47Lyn+MmfB3hoKwSXdHwyqtd
         uJJ2z1pJcgrWs+5Dt1m91CZj1ftxAJMLJkPpw0MVns+3YRo2A5+0nuuD9WohhQN2sQBo
         87JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751581305; x=1752186105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXa7xVr03JFbcgBBljLOZWrTDtWUk6UBg/vmRmvPVoo=;
        b=Or+gZyqZyn2j6BVC7d2Y5ZXHU0p9N2+cW0ghysghYPB1n9v1dIEV6CUSXxFUkDT81q
         DKsPPsBQlXVI7t39FqK7JdCyB4dP9m1cYtS7FQdtS8eOkRFxyFROYX9KcDn2CqonQkUR
         zOGdP2dfPgPrFqjOOhNrLGzc/Gc+7TznLOI3bteK1a11SPnOzz1Y1Hh2Ry2t9q/gQLPr
         HSzXwcJf3Gf7y100woozXLQugBMHRR2xANXXQE9M8Fbn8WV8nt9vE7hlFcRt9EEGEOEe
         72NgauVCZDrEclzjxkc7qa0SNXj8O7U0AoVr29fBFMec8P5urXII26nBGtaqCvJSo/E/
         IH+g==
X-Forwarded-Encrypted: i=1; AJvYcCV8HprZ9RWPnQv82341JAowPf0BHXiAqXJbC75JzSN8UPDxSlmzisjotzCrivyioboojoT0br7JNAQLiTOr@vger.kernel.org
X-Gm-Message-State: AOJu0YxUYyglnbDy1P/urW7XwjvgvasMiRq+Qc143uczIhJ1oP6duOVt
	VtSHrkiWNFSRvZs2Vs46sOEoXIP9t39JHkqFYdmWt+x67ZMzDDfOG/znyXkuJsHiSFnBdkH/DnF
	ozyC6Mi0ZiqXBtxG8rLA2SC5b70OVZ4ITjL5ATzCioQ==
X-Gm-Gg: ASbGncvescj1YqzomgTGfhvzk0CfbKzzMjXlfOq37DIFcCEUgm/bvSHf24E2jjWCtU2
	aLhiO77W1n2rzSZN7+ZUGB0T7FRSNm+7j29HJgbulrklKAihGVyYfxBcdlqv1GmGLdBj8S5JuhU
	c1R2vPkyBigov5tzeZCPDqK7LgNSFweGxmBWblFdP29rw=
X-Google-Smtp-Source: AGHT+IEdCJvHXhlmBq1702X71zoM5ng69d7Mh6npUYCQ1PTXuNgk3bG87vuighjDtFReOyDckV1OsZwH3mt/qEZLkiU=
X-Received: by 2002:a05:6512:3f0c:b0:553:2969:1d6d with SMTP id
 2adb3069b0e04-5565baa76a4mr164653e87.13.1751581305466; Thu, 03 Jul 2025
 15:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153711.194208-1-brgl@bgdev.pl> <d92e7c52-eab5-4759-af3f-16b24254bff6@oss.qualcomm.com>
 <CAMRc=Md=ABd+aSc7DE-2dsR5rMnpnvbetuexw8vmrf7_zzT31Q@mail.gmail.com>
In-Reply-To: <CAMRc=Md=ABd+aSc7DE-2dsR5rMnpnvbetuexw8vmrf7_zzT31Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 00:21:34 +0200
X-Gm-Features: Ac12FXyNl8F_EhX9xgzHWQ-gwTL-nTjQtlFOhsSbHuo_tnMvAihEfroUUjENXQE
Message-ID: <CACRpkdZTXzyROqb3mGoQrsO5X_Y9-yDSU2ESUxivpb=N1WsP-g@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT] pinctrl: qcom: make the pinmuxing strict
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 10:26=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:

> Yeah, I would be surprised if nothing broke.It's probably worth
> looking into the implementation of the strict flag as it makes every
> muxed pin unavailable as GPIO even if - like in this case - the
> function *is* "gpio". Of course the "gpio" string has no real meaning
> to the pinctrl core, it's just a name but it would be awesome if we
> could say for a given function that this means GPIO and as such should
> be available to the GPIOLIB API.

Can't we just add a special callback to the pinmux_ops for that?
like

int (*is_gpio_mode) (struct pinctrl_dev *pctldev, unsigned int pin);

That the core code can call to ask the driver if a pin is in GPIO
mode already? A simple strcmp("gpio", ...) is one way for the
Qualcomm driver to implement that.

Yours,
Linus Walleij

