Return-Path: <linux-arm-msm+bounces-48007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB59A35B69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E6D33AE2EE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 10:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C332925A2AD;
	Fri, 14 Feb 2025 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jezb1I0M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6475523A9B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739528448; cv=none; b=dVYbr6FjG9da6YGh1GfRiTfLf+tLKW6nHCXGCvLMU3SiFkJsEpYCiM64KMwNuGw34ScaN1nxy6ndZopknwzRjK3Jz2p14BtoznPeTIV65DTzbppX2rBXhVcqRWJRrxOgJA6zRh7Ar90S/nebXt/u5LEyYYvmSFdeTY+nwg8SW0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739528448; c=relaxed/simple;
	bh=CTVSHuL61/AhoBRJTC+WTqwIf//cehy9pgtd28J8H5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KX9Jp0eyxGpoKHNDMCOQ4ARBG4C+wuUOgDWD1Fd2fgjvERp04KxWpH38vdqRLeGElEoQkMBCuxnuNTtlWSrermT+91B7XiP/DxMk92ntavZu4tX5Bs3sZQSmuEMHhq8umGrRETzXon6M8mlZ8wPIfR0NLucHtxD9Myly/22ycZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jezb1I0M; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3072f8dc069so19828861fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 02:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739528443; x=1740133243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTVSHuL61/AhoBRJTC+WTqwIf//cehy9pgtd28J8H5w=;
        b=Jezb1I0M2617sN0MnAeELG7DWdbODlFft9t6Nr8KMJG78nUyvWKUU8krBSe63ZGGNR
         xPtCsOxZ0bJjSpTf0q0EKmFpRDi2+LwNV8f7JxbsX/iOecFylb2Pp4EX3Nb9irLERdsM
         M87AgZhkDrCz+GibkLUeDhh88GvJ/neRFY9YeT4KNqQTVdB2Q7qLSURTsL8K7QS5vC33
         9lIuO2+XTtsApbP8MiAVTLn8EOACTRzWYXNw7tfNJLzmHGigdYTxa7owR38X2R5JrOVE
         zjGNhKSJho7wygY3pC2gn3Axpcpn1U3X9P3kyF5lQm9VgcPkQdi9MqWaFUy0Y1z6UUzg
         /VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739528443; x=1740133243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CTVSHuL61/AhoBRJTC+WTqwIf//cehy9pgtd28J8H5w=;
        b=veTYGbqBdhGTIn0U3CgaEr0UBj4MPZMXzNeSYveSYFnp/5bthl8aRUxrypo86hGPzM
         IVL0PtkFpUkgXR0NGZ5sSxIMY6hcSso9aROBgklv8uSJuezQQbdFyKmcsYTRIsisRsa6
         gpRjstn6Z8QVgLknu12228BZKN3ycnCFHATS8C3HfhHzaEfXFJl7Kn84WtTF3Gwx7HRb
         5GcbJ60mIVtov9i00naOhTQ3B6ZlpsC5j1qZ6sTuWO/7E4NIjxlaFcGGG1qLNhjyos5M
         12f+pk8Mly/TPC1hfxRWxELBYFYF1ZTY0vW55l70nKQQ+9Y3/BbZck/NarnCHUxTj2NR
         Ghdg==
X-Forwarded-Encrypted: i=1; AJvYcCW6C6YCREcNdOuvcY6B43/Y61uh7zQBw72lFk3P1hB8wL3oEbGmP4l8Vjp7RMtOdH9eGRLqCf3hd7pv7GAX@vger.kernel.org
X-Gm-Message-State: AOJu0YxGBZOfc84kOoF4G9CC25qD6mCT9xHP+d1xOzOyu8HwLWPM76fz
	T3eFsrvrE0n9YPGLV1c9vHOD+b/AVAUug5JrZX1gZQdbDrcHaYkBho/UOl6FjzxDgja6LiQS1j6
	TG0hfhabuEGzP6QV71CcqIbJHZ9T2rURUJ3dxyA==
X-Gm-Gg: ASbGnct2nrBmn/3EjcgXjIiQbv6/UIlfV3qhGJKbkI8vtEw5so8RXe9+F1a3biLXAua
	3wrMXk+ooj8Il3T7kznUn0iFP55ewH1UVH+0m8V1mc6+50YWqRqBLIthJxypud/QYUpnaKsSi
X-Google-Smtp-Source: AGHT+IGxEKSdYAC3wifyGNgk5Eh89epo8lJDj6yQU/T/HzKQmZRPC1uyCtKYApqXa99y+vDHCBVSpmZfESb33W2+lF8=
X-Received: by 2002:a2e:a7ca:0:b0:308:f860:7e8 with SMTP id
 38308e7fff4ca-30903669b5bmr38024031fa.20.1739528443454; Fri, 14 Feb 2025
 02:20:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org> <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
In-Reply-To: <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 11:20:31 +0100
X-Gm-Features: AWEUYZlN87XktebbarRKF7Naij4xj70q78-i9U_Bkah2OKeETlLFl7lqa7kEoVU
Message-ID: <CACRpkdbG-cS59TbB36=OrZ0MfXPdDPSpPEA8U_L_iMOgNZK70w@mail.gmail.com>
Subject: Re: [PATCH 04/10] pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	iommu@lists.linux.dev, Dang Huynh <danct12@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 11:38=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> From: Dang Huynh <danct12@riseup.net>
>
> It looks like both 8917 and 8937 are the same except for one pin
> "wsa_reset".
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

Is this something I can just apply to the pinctrl tree?

Yours,
Linus Walleij

