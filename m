Return-Path: <linux-arm-msm+bounces-7977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D2383925E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 16:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9C351C23075
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 15:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCEA5FEF3;
	Tue, 23 Jan 2024 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NzlJcIWX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB825FEF2
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 15:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706022907; cv=none; b=Vnzc7ulRWE7bSLmBbqQhxOy0RpkjD0bWMWepcO7m+F1mKSn/paV+7Mu+8+P/se/OCf/uoXpFCOnEl+gfyiHGotfJ3nLBR03w52qLiqyMlqJPittmOMoI3y7k+dBAoQVh77WwSvoe60VyHRfG/zBmcEm92pD/p1pBLYEJmOB9l/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706022907; c=relaxed/simple;
	bh=21LN+N2u6KwgSCGz5xda7xdM9UVxZyeOpxSHkNhYW5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDctkV1ENyEMLo6sgd2iCJ5uXyoM1sVQNiqJehM9etswB+V3WH3mhZKgXyNVh+cL4P3VtuI1OzCsVURSNpJyLPQXIdpZ400NmiaaasBRImpPgsG8FfO+PlHUaZkwEVs7XoF/i37SySM4oQ9ExaMds9AwQhsG0J9tFm9lBB88RZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NzlJcIWX; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-467010c1c72so2680959137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 07:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706022905; x=1706627705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21LN+N2u6KwgSCGz5xda7xdM9UVxZyeOpxSHkNhYW5I=;
        b=NzlJcIWXFzEbJEnvSeMg0tjZgBZbVOq8rl4a6RAcEasejN/fuUWCev8zWxylBJiT9Z
         2iiImD8bM1gbWbP1NMeWV4K9atiYfb2ICfHzEzyjyAyOhUfmOnmMCx/gy6xM2WKg/xc0
         QGAh03JD5HqD4AAISjcm56t3PAB2K62/a3OuaV51y4mCmUVz7rWriq1QcBCKqn6PygZV
         49VdSRrDxS4SqcWACFIOETEb2yd7P1lSQXJfPu2m8vlYBtYJisM9dpM5plwQI5pwbsam
         fJ2O/0VVkdqLtHm4aCvPmlAqqNnNj0VW8yD7HVPea0CgfiCCgy+bDN2tldZG5ZCymNgx
         vW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706022905; x=1706627705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21LN+N2u6KwgSCGz5xda7xdM9UVxZyeOpxSHkNhYW5I=;
        b=J2WMd/1qnKTYjIZ52UM0NY41oylM21MOMp4IlpjJTJHE2T9KfwDXbXboXnfHP5MpEW
         YAMa5Txj8EnlZiT+tHh3u2qdDlqvF5YRzT7Fkt4ymovR931NW/kEChcnLHd0Fgy91FUx
         LSFvUNaiPKEP5JuWe66fXv/Nb3ZhCAuUdUQU0OGJCzSAnzCQdUxB4xgL/STFm5rgaPdB
         9x1ORne+snMyxL3rG0HssYeGRPF0/PloYN6v9JIV7+Dadw9Zo+LWursguMi6TjtLDgz/
         IspeDm0M32eJWdYO7BBu0kz/I8l4o+yRbiibEwxEETqUEuep7Oc6ZDVZqOE65PdiiugA
         tjwA==
X-Gm-Message-State: AOJu0Yx6PiR/r7YxnOcDa+RXCZDZGq2vebhWfpMDOo+7l4F32etQlVIe
	T2fSldeKeF1lLmgiS/I/nloGPipaqLdWs969uMv6GqfAR2wcyL3Cswh8nv7JngsE3jsxwxZd4GS
	yFYKgP0SnZC0qua1QDNry1hBgh6XlP6kPwHoS9g==
X-Google-Smtp-Source: AGHT+IEg2EldcpmZFoE+SBYd3xS6BPJMRKB34is6XcO6kElvYRrfZ4jjst2C6VcGlJosNfUyVM/DsnbXPVkecNf2psM=
X-Received: by 2002:a67:ebcf:0:b0:468:1350:4084 with SMTP id
 y15-20020a67ebcf000000b0046813504084mr3604802vso.25.1706022904969; Tue, 23
 Jan 2024 07:15:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122182158.69183-1-brgl@bgdev.pl> <98925264-badb-4954-b542-9287a0c7d184@linaro.org>
 <CAMRc=Mc+GNoi57eTQg71DXkQKjdaoAmCpB=h2ndEpGnmdhVV-Q@mail.gmail.com> <08903b30-b321-4f13-b8a7-ddd31a94ca5e@linaro.org>
In-Reply-To: <08903b30-b321-4f13-b8a7-ddd31a94ca5e@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Jan 2024 16:14:53 +0100
Message-ID: <CAMRc=Me_8o=tNsZ7JzcK=pJDNb0nYPLLGufnM2ochqc6XKc7Tg@mail.gmail.com>
Subject: Re: [RFC] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 4:09=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/01/2024 11:04, Bartosz Golaszewski wrote:
> > On Tue, Jan 23, 2024 at 9:30=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 22/01/2024 19:21, Bartosz Golaszewski wrote:
> >>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>>
> >>> I'm limiting the audience of this compared to the PCI power sequencin=
g
> >>> series as I wanted to run the DT part by the maintainers before I com=
mit
> >>> to a doomed effort.
> >>>
> >>> Here is the DT representation of the QCA6390's PMU with its inputs an=
d
> >>> outputs. If I were to implement the pwrseq framework that would be ab=
le
> >>> to assign the relevant pwrseq data to the consumer based on the actua=
l
> >>> regulators and not abstract bt-pwrseq or wlan-pwrseq properties - wou=
ld
> >>> that fly with you?
> >>>
> >>> We'd need to deprecate the existing BT bindings but unfortunately the=
y
> >>> are already described as consuming the host PMIC regulators in bindin=
gs.
> >>>
> >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >> Please provide lore link to the binding.
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >
> > This is the one:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>
> This does not describe your PMU node. Maybe lack of the binding was
> intentional? In such case I missed it from commit msg...
>

Ah, I thought you were asking about the existing bluetooth binding.
Yes, I intentionally didn't include any new bindings as my question
is: does this device-tree source change make sense? If so, then I'll
include it in my series and build the bindings and C code around it.

Bartosz

