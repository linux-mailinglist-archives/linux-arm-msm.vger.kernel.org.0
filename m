Return-Path: <linux-arm-msm+bounces-64503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A37B01537
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 09:52:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4B6D5847D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 07:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C61471F4C89;
	Fri, 11 Jul 2025 07:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xTERj0jb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E061F4261
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 07:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752220365; cv=none; b=TYs++Tv0jwJ3NTu6qbmOrXfANGoSPlLUBWIF41aipbnIkuErU7N9t945Am1Jz4JDyZjPd3yUVkO/YCQs1aqeBhM64Lujd8c4wOhuckWozP//54WJFdcJTVYJTCfimi9/ZvhM7ENG+xEB7viJPsB0hFwFqLEimKbeT8A9TtdfuZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752220365; c=relaxed/simple;
	bh=88clJWMTGmjqJ9BXiN1KTtldoVSFmnjIjDiwiXd3dew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TosJDwWKsx3tg6pGK7Iws5uBqmupSm11qDbMuNemUks9qvF9rHFuqch2iKF2ChMvnkxHGkl3nTyQZLBamGikKETUOtXj2xyU3/SC7KwJIRFwDm47REawdNdaAPol0vovy0lVsKVgn5JmDjyezOkmAHaH/FasEKBQgYSV/XYWXyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xTERj0jb; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so2293107e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 00:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752220361; x=1752825161; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yjU8KLlsfOgD84pvhzgohiFicyXio8p2w/NrIenWZQ=;
        b=xTERj0jbyEBY1ou9oHAhnP8s8HVgQ8puUPoYhAdVmHv2xNx6G++ZUmjIDGJqS0N0nd
         ISBBvPVqTKgmz1tpILfwPqGq9KOt1QA9ixW/yQuZ4QDTxaAWA2Nu8wtrPdWHrhGBqqlQ
         Tk1zXW7tFDNpJgZdIsKWHx+t5VcfI0y6AM9z21vHzTFK2a9ofmsuCRaCFDFfzI8Qxjmq
         GFBaftBLjAXgAs/tW2wvuW3hv0eCWEinPU3fTJ/KlAJNFC3SJzJ/oRXim4T028bxxdxJ
         GDBIkbrDm8zJJBtEkAhc/kJhi++YUGFYhLhf1dJp6Cs3FwryaF7iVlU0jDZPBNTa4I7q
         +g5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752220361; x=1752825161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yjU8KLlsfOgD84pvhzgohiFicyXio8p2w/NrIenWZQ=;
        b=jL04xWLt43xFm9vgDC4hq2E38V2TE36Ow+CgVuaAgJH3oEdh+y2361lq2rfbkPfXmx
         +RCtHPxdfzuWgCueU7kXMq0zxa06NIPZEagR2QnYdNDskED0CbawJ2zUcf7E41PLaqRq
         bmzkyYnN2/v/ol3Brncg5eSARdR4W9a8G8Ub7XB9gs+mDqyG/TDzXknLjDcVWIy+vgWN
         cFbO9CRGNvxtT1C63FLoB3vj/8vblTDyz+gPwRdZAixQPuPEfavtVvcSUhoU8FlgUiFF
         rdNUC6NjsUhU/JasqxMSx10pYc33aMuQcqEziVNJPmZe+TB0ML3ocWcQV9zI2PY6E5Ba
         YQbg==
X-Forwarded-Encrypted: i=1; AJvYcCVXDrpXrnU9eMLazH20IcqDYsLWfWI1SFzgMQxDTkhErhAc49wFb7j3+fotzIF3LCOUg+0QSpZM5MNdXQE6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsw0NPmAgdhqT5mhYWkmRorldkDFdxdxRfeD5EsqVrjQXvpAQB
	ezHpFZQRMKbvcW8iG1TC5S8E+mxrtYC2uzoOqe+aSjgRBSVZo5TUFlJCn7vJUHowt0eeX5b0nW1
	UGNzGdDM3vJwsNJqmhv2DTDgMBKFUmTaqTCUcuDCWPX/nAXGaDkxyZiM=
X-Gm-Gg: ASbGnct95klqPQleIWJcxnsmyLExjBg9SPlunsoS2M5HOEps91uh5mujfdts7GLknDf
	OuuoHssM/yHiPU8iE3zFtemQTrfSlMy0mW4d6UR8Pc/B8MhNjTw+f+LZGPTp/pyLGiWrFEJsW+Q
	mJZctoub/Qvs861UM+JfSjKUX7hio2p4yZBMp82+JLbJJ5N4Hj9MEspcYAx/HALd3G5cjFqkfxn
	7cQLog0sLDEyomgplzX7I9QySkp7wpXYxmdRw==
X-Google-Smtp-Source: AGHT+IFnZKQzO8SQsEPR4+bbnrAqa1B4u0Jro/T92Yroa1+POHLtNiQWfQd6cdNN76m9sgUP6bGZdURAsrGpoIwSBow=
X-Received: by 2002:a05:6512:3ca6:b0:553:2bf2:e303 with SMTP id
 2adb3069b0e04-55a0463bafamr620336e87.30.1752220361177; Fri, 11 Jul 2025
 00:52:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org>
 <242d353e-99a1-4ce8-9435-8b2addcf1276@oss.qualcomm.com>
In-Reply-To: <242d353e-99a1-4ce8-9435-8b2addcf1276@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 11 Jul 2025 09:52:29 +0200
X-Gm-Features: Ac12FXxcX5qRn9gdh-ZC7VHsr37pXFF-mMITmlqtVTHjrCNkvSZ0ELEV4kvVi_I
Message-ID: <CAMRc=Mf6o0XNGTEbKih1vNNk119i5uSAqdOT219Fqk214cWoOQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: fix GPIO lookup flags for i2c-gpio
 SDA and SCL pins
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 1:11=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 01-Jul-25 11:01, Bartosz Golaszewski wrote:
> > There are three platforms in the QCom DTS tree that are missing the
> > open-drain lookup flag in their DT nodes associated with the i2c-gpio
> > device whose driver enforces open-drain outputs. This causes the GPIO
> > core to emit warnings such as:
> >
> > [    5.153550] gpio-528 (sda): enforced open drain please flag it prope=
rly in DT/ACPI DSDT/board file
> > [    5.166373] gpio-529 (scl): enforced open drain please flag it prope=
rly in DT/ACPI DSDT/board file
> >
> > Silence the warnings by adding appriopriate flags.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
>
> For the series:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>

We're late into rc5 so gentle ping, any chance we could get this
queued for v6.17?

Bartosz

