Return-Path: <linux-arm-msm+bounces-79963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6B6C26FB5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 22:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C97A4188A081
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 21:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA0742ED87C;
	Fri, 31 Oct 2025 21:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVOC31sb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F62222301
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 21:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761945152; cv=none; b=GHxz350s6R2IsbigtsYHgRoudvnJ1X9tOnKyDNEdClgfIc8yEhgRtr21uYgRSbZgSuo7hUxoXwNAoLZh/v9/TnPg8suRL947GH/Onf50Rxvlipq60FBLJjuAh6Cky+gFOmEB/cMIsjvF38RehIwfcW2/o8Gs1xF3M9+DBOh0vcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761945152; c=relaxed/simple;
	bh=RxRZVbgBXbZ11l9CJuzna3nb+s+vri3PRzzPf/vY52E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvjpcgWMPl+xvLNQ6ATGEoBmQUZojOKTLEyG8LfB/NKh43t56lVFpocEk9SUzgdY4x3Ilzr9HjpcnDoD6+yMnBGMXE0J9Q53RPa+OJxCoC54u2hhZsPsK0Vj2lNoocY3uYjwGZo5plUCQZRsJ3k5htucUZwjOxYLiIdyRfjEqlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVOC31sb; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-78617e96ae1so27832747b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 14:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761945150; x=1762549950; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxRZVbgBXbZ11l9CJuzna3nb+s+vri3PRzzPf/vY52E=;
        b=XVOC31sbo9r5F7BVAWX5E/04JfG3p7nH5F3qCrZ2DQ1cQz15Uw15+2oZcQU4FIHodW
         vkyPNxj4b0FhXxT38Q8lXTNbYaKNZGMO8RtTrWnOSUmShjcK4zx3FlKPvUQZ74AXPrYb
         rMYtQbcV+i/scrt536UfZjv10zhBBdyxZpHtyjPSgQzuetr2dA/YvqB7iWHxCHDKRK1A
         01c/Hh0zE05wcc43EmF6Fe1KiLR5ntFUHf+uV4FDc/XuvoL4raii/92gP2yFlIre4Z75
         nclkMgk9upNA50VoOKXV3/gXP9aBu4Lno7NGfbJWRClal6YE+abvDic3D7FfGXC6sJFg
         Q14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761945150; x=1762549950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RxRZVbgBXbZ11l9CJuzna3nb+s+vri3PRzzPf/vY52E=;
        b=xRfgprkpnPeAe0HaR3tkx3lytrun+HyiGDx6ZC9DdMW8lzU7M+546ywF6FsgB/A50g
         GQF7xeC2ZGSBiE9fRn36LR0G3LoTX2njogjJlh+pVrAJJayKkbbUlBfpY7jPKYOa+I1Y
         bUsn7Tt7QfFQCuC8IPi2JocmhzF1un81zbAex1k3tjFPXdS08vohw/uVzajVy1qpSLJJ
         2Jjef1GY3WmkZNexZHXDE8snq/GVTC2+bfLohHbvyghBwLJPPWv365i7G/SNmCWuo4a8
         BN7pSPsNM9RitoxxKsZjI75x2JH/kVUdn9xUoJa4kgtzMkgrHj5AqoBryWg6UvmGTNTw
         5M6w==
X-Forwarded-Encrypted: i=1; AJvYcCXxetP7vtq5650v0JvGEOcRUccS71cUlzUbF5EV8ufELgyATTcJYqKtGeYX34qeyFNAztXXq4zBKFfHgbNi@vger.kernel.org
X-Gm-Message-State: AOJu0YyQtqjjj2v2gQt+FpGAn0bfbmH1MmdFPV+tCjrDitPi1F5cvZil
	exk4CbUNWpSa0ICe2W2IBw5FvnlH40O38j0PYfPDtX2CBM3CsTw42wqi3PDYDrD26mTGLvVmuBi
	9GWFATAlkhB9T+S6kXke5LLwOhPSMQ/c=
X-Gm-Gg: ASbGnctUYp/KAgRq2vtKIdjazapxXrZNhjS72/dEou/epQEsmJuemoVQ/UqQjb4rqpl
	P09EP3hgkpCoOV8U3QxCGOGOVrgu1nCnMxbCr+ab3/6GRj7IqOfDwyaMeVvfezA64h3QY6zuCzL
	8W43ZyvVYnCqptEAXoULB5F81KnAN8orK1AfgeumKkU80TSSmz87j76n8K+Db5PgXM2ZT+facjT
	7kBchqkfgvScDm8kvdatMp3PaYVTy+XYdT5wYt2ln6jV8IxAglQx32KuWEtnQ==
X-Google-Smtp-Source: AGHT+IGf+2hqwNIvkxF2qVcHXGJA9AdN87r2O00FhqVjx+0PJJ4RnIdOz3Y2v4WN+nf2PaxkjO4OJTI6SiNS6tCn6BE=
X-Received: by 2002:a05:690c:6111:b0:786:56ec:e3c6 with SMTP id
 00721157ae682-78656ecee71mr19761427b3.55.1761945150168; Fri, 31 Oct 2025
 14:12:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014044135.177210-1-ghatto404@gmail.com> <91113d48-a8ef-4a24-a73f-6d32ac271a00@oss.qualcomm.com>
In-Reply-To: <91113d48-a8ef-4a24-a73f-6d32ac271a00@oss.qualcomm.com>
From: Ghatto <ghatto404@gmail.com>
Date: Fri, 31 Oct 2025 18:12:18 -0300
X-Gm-Features: AWmQ_bkJM_BsqbzwVWRLOCiui_KfbOc2l1X_oA_9DhB9pGWlZLXqfCHgZ0VRaqY
Message-ID: <CAMQHOhcMUk99wdS03yjQiwzTg0D0mt8H-QU5QQFn44m7sDZ25Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: r0q: enable more peripherals
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 6:58=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/14/25 6:41 AM, Eric Gon=C3=A7alves wrote:
> > This patchset adds support for multiple devices found on the Galaxy S22=
,
> > side buttons, touchscreen, max77705 charger/fuelgauge, RTC and UFS. It
> > depends on "Input: add support for the STM FTS2BA61Y touchscreen" for
> > TS to be enabled - and for the fuelgauge/charger to work,
> > "mfd: max77705: support revision 0x2" is needed too.
> >
> > Thanks!
> >
> > Changes in v2:
> > - split the gpio keys patch into 2 for small refactor
> > - rename spi-gpio: spi-gpio@0 to spi8
> > - use tabs instead of spaces on max77705 nodes
> > - added new patch that fixes adsp_mem and video_mem memory regions
> > I couldn't find the clock-frequency for i2c5 bus :(
>
> You can boot downstram and run debugcc to dump the current state
> (incl. rates) of all clocks
>
> https://github.com/linux-msm/debugcc
I can't get a custom build of the downstream kernel running on recent
Android versions...
>
> Or /sys/kernel/debug/clk/gcc_name_of_the_clock/clk_rate
Nothing exists past /sys/kernel/debug
>
> may also give you a good result, although YMMV
>
> Konrad

