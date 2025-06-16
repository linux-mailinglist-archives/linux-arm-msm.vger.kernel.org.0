Return-Path: <linux-arm-msm+bounces-61488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B584AADB73D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 18:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86889188A346
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2EB4288514;
	Mon, 16 Jun 2025 16:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HDY8YsEJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEF221C174
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750092210; cv=none; b=pjY+17m1Hipy0U6ucjphpmSCa5VvOnwAMDpdbMd4ePgPsAhReNg0obXaQ3zDMPS6V6jYs5wumdNPlZobuIsD1qJ27CuU0LtnDuWFD2NLo/KGO0OA9caNnNVDetcD0NalAY3DVpEcSm54dzemyWpngdrVKWRx85UNAHZp1huRmHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750092210; c=relaxed/simple;
	bh=OejPlSKGynCmdpezDgqod+LZY/8q9ve9GJ/c2Iod8aY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLAn7twDRA2OKZzmkajZpLc5NTuGxkk7ZHU+SvHrH60VHmpmkb34Si8uOeQGdwDmfxDXIDFjGVbpxy4utxV+zhuIhJt12DwHJjsBA+tyH3kFg94zihIk0ELEvslnBQCreK45lQFKAixuDlUDES7I4PBl8CgKjvxtMfNcS6OYamM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HDY8YsEJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553bcba4ff8so1698878e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750092207; x=1750697007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OejPlSKGynCmdpezDgqod+LZY/8q9ve9GJ/c2Iod8aY=;
        b=HDY8YsEJ9VVBP2xiYnqJiiCeqlWzy3RrAnGfZv9+oTBmrgEkmgHXPiaY7ZA3JJp8y6
         krMO9Ufpe3C/TAixxB3lQ9k/kTGhFoe4SPb59+K1hxCYIR/C9fr/bncwiKy5o2fOJgsV
         CFnZR5DMGhJpDKZ3zvNoVxITo8bTnv2T5bH6evaSGro6Qa5dhTVfflf1htxBrZZaURZK
         ooSrHYvNzQLqdcXP0reu1Zp6LpUsrlAgwHgAbQmoyHL2fjCFTjmtnK/WHSWF/XiYNdxf
         O16LSkPW1PXbptbWNbzLPB4qsqnMGNFc097aYvsdHhqJqcAOecYeWZKwKJDyNojYm4Il
         GjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750092207; x=1750697007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OejPlSKGynCmdpezDgqod+LZY/8q9ve9GJ/c2Iod8aY=;
        b=hmS6bl7hdYs6qkm3vv73i1X+FNms3CzmueXykysB1dYoRqYPh2iz/zNry2HLEYVBzx
         WcVvkrBkycVkX+GmnVBP85/wznd/VINbZosx3YdvqukkEuap97FQWdQ3qT3JXfm/BY0f
         WIOCsC7kpdo5/OZEyw5s16OdyhLPuSlDwdqSlcyzdo8kg5Fih3EHePFInNPXhKsAI+HY
         Qt4fyh3D2bGtJaAm3dDEuAaj8+M3pxfU8YMJcq7FDZtWQlynefT0FZPzuDqHXb1hzKTK
         SdMJjuh8/Wb6ORPPBu2rl6JXN285/+DsvvhqHNpl3kekZg8B7sUPgJ5ln1f56FLP+buP
         rJkg==
X-Forwarded-Encrypted: i=1; AJvYcCUwjy60mai9IYsSCvO3JZfzdv/iFvqpcvxJrBQWIc8TWb5zp3nOx0LPQNk5sRHu6c4Ja8p3eD+Rm7hzpwsM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw25OoLLQDHzLtifsHAAPVMPzvrKZ2TWDDKXm3pxu52dEW0kmRW
	X4yJoO1xwiv8kUdmFpoRywcVPKpcUdC/jgrsUTaIIAkzHmrSX09L17Ipl8D5g8geb2K3ohPOsx2
	XSdGH92Yq22XgN//Wy+JifqcQ6LYQ0aY9oPWQ9nYX4g==
X-Gm-Gg: ASbGncv2ACHCO1GAGPMMlU6tBtHiGlY82i06Kcel/jIo2iV633nwqNL5jU+XFx9PgUr
	KHeyFjVk5haYp140O74uQ3Zpn6A9OMlVBqQ2eEEwVfF26IyZtgr+L0WZ+ikh+jFdHDAqmwPwMOI
	S3lwhswTjzMSymoPegkQGBURtsq5+8rXiIpQzhZHGuCNdnx7p3KA8CdonxYTAu8EYgDLFB7DGBu
	YA=
X-Google-Smtp-Source: AGHT+IEjfW8KJ+CFd34mrUL7Lt4v835CRkQLGSW8zSjjMTNXFXFzPDu5x8lMUHQAlLAEJTT2N9exshFt+2yYK66ytFg=
X-Received: by 2002:a05:6512:234e:b0:553:2c65:f1ca with SMTP id
 2adb3069b0e04-553b6ed8487mr2147512e87.19.1750092207073; Mon, 16 Jun 2025
 09:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616143341.51944-1-brgl@bgdev.pl> <713cd518-935f-4501-9753-d33c9ea6aef7@oss.qualcomm.com>
In-Reply-To: <713cd518-935f-4501-9753-d33c9ea6aef7@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 18:43:16 +0200
X-Gm-Features: AX0GCFtPDDD03AUflT_ucWSEZ_LeFivINoijJGE-0DFKBHlSa46K9X2fc2FSqG4
Message-ID: <CAMRc=MceV-HgyFFvqytXAiuY+y10PQbdPBxuvd57NCeSLVLXCg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: add debug UART pins to reserved GPIO
 ranges on RB2
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 6:20=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/16/25 4:33 PM, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > GPIO12 and GPIO13 are used for the debug UART and must not be available
> > to drivers or user-space. Add them to the gpio-reserved-ranges.
> >
> > Fixes: 8d58a8c0d930c ("arm64: dts: qcom: Add base qrb4210-rb2 board dts=
")
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> That also makes them unavailable to the kernel though, no?
>

Yes. They could only be used by QUP - I2C or SPI #4 - on sm6115 but
none of these are used on RB2. I just noticed that my console froze
when I accidentally requested GPIO12 and figured that it makes sense
to make them unavailable. Let me know if this should be dropped.

Bart

