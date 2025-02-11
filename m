Return-Path: <linux-arm-msm+bounces-47634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FD6A3157D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 20:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3112F7A11E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 19:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B588E26E632;
	Tue, 11 Feb 2025 19:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wVwgWhD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E347126E626
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 19:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739302504; cv=none; b=OZSXrGadHR1UcyEaVZj7HI7RcWq3f7PS0zaCMPWugBeSSyeW1IythPoBChZVDZ//lhdeZXx0YI2FHmwDoFEp6pgIYnFI5E5NCjKyk6yXzGseQlXeePaCVrVSQQDpihUT9OEFms2Spk6+numF+cJrv/FuV+oqpzC830civxU8hXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739302504; c=relaxed/simple;
	bh=Lzk3JO4szt3sEB/N/pUn3BzbN+74+DtV5pLcgvSbqxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1hHeNK75CwFRsHCu7rrYtgy/83U3JdIeH8CMK5nBp6tl0ycgfMoxr27FiSk3ltpOs/kmu1Ok0SP0pV/syi/ps05/a99IWlSBlRydQYzt9A/dFJbrkneeQgAogwVp4rphcqvsX9YMQ4TEFMQsU/hMXdkGYcFndjYZSU0LsHMEtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wVwgWhD+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5450b91dbc8so2422326e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 11:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739302501; x=1739907301; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=drPWUvNTbl2xqE92lHeNDNa9DZ5Dy2MPgdDShKYcM30=;
        b=wVwgWhD+oSOPPdvPybTqYbKdSsBDgQmlZnQpUftZemELyaXIRezJtYeqmV35ZnDkr8
         d5O7caO7XAyw4XwujK2U9grrM+2/1LYVE8IAkGXBwqpTe4hDo4JnWueqqW8g/YhdWlH6
         zFI8PD9caN3bfYc2XX2onSU+qho5WVLxgXe3FLRnuSa/jouhHhk3sMIxyfhwZTn67Nhy
         0yBqgOSUlY/4SFkOusG5cLGixCwb5paAJnnziZxncL6+lqpDDwUGo6u7xzyoJ46wONvo
         JyvbogUWSVDUX4dOsqedQizr64F2TsQFthx/YWpfYkYRIox233qOHPMFEeibf5/ZA3PJ
         o5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739302501; x=1739907301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drPWUvNTbl2xqE92lHeNDNa9DZ5Dy2MPgdDShKYcM30=;
        b=t7hPU0Jg0KRoYE4y296deAEqsj3cWe84Y6/N8tVe4iQHBGe4u9X1iKKtGJ3NWE96PX
         EPTfhCgoYbA1T0xUoTFKVvgggdoJvcBDBQwrUcbug8u5WfWKhejtryefsFME+nB5tHO2
         uGEW59BpS5jm/OXKJwcSES10o5Sdj2o/BXYK335XbAMjZD1KSdOwnbO4Z7rmQMyjsK4Z
         DeJSoK64wBJDMMS87Hu/+5uWRgaXqcKbyU9X17fFoZNrwfUtDMKDO42JywCGTbSjfNRC
         rR98DaHhEvon9y89MnvPlNLRrURSuiv8thkybLTaKnd7LJ+T7g0KvSdq790IMCXZXf2T
         SGvg==
X-Forwarded-Encrypted: i=1; AJvYcCU0g7YWmon5hNUc0je0e+0OaUKG/D52v1aH3YWjps3uqubMvTlFobgUaANhRGhpAo1c8gpyfl5deLGYCGI0@vger.kernel.org
X-Gm-Message-State: AOJu0YzwPrkfQOZte/R1whpZEVuf/HTrynu+UB8jRqo3LShUfDQ4Rq+H
	rmCmouyXi8JQSDMRYgqJ1kd1dWpwNTvARMjZwVrezpm18Lx8QnSvlEbNSeLx4oDOcFkll7Kan7P
	zJKoB3wT/YeemH2zvm179iigwa3wqPbDJ5qV2lg==
X-Gm-Gg: ASbGnctUPwCF2yySWnqzjZV+IAQiGWf5eVmuXv6gzpimWzmQ4HH5D7iSwj3bkuMU8EF
	CATmFuHwbIuwf0CBKFFJCxWuWLtQQEmAlu11gMPrMyOIh43qCQDM/EfIFz6ycVGaFbpDwvQnqlA
	m0FSufpfqrTz7QGbBETtXYJ1HZXCQ=
X-Google-Smtp-Source: AGHT+IENh7+nnwerkUXKfjNHvIrZjJbgA4nVwo8pSn2O2KjLAKEx5uBtJDNQahXwubnc3itr5UpqLKEB/aF0axoJR14=
X-Received: by 2002:a05:6512:e98:b0:544:1156:a9d with SMTP id
 2adb3069b0e04-5451810d0a2mr50314e87.22.1739302500660; Tue, 11 Feb 2025
 11:35:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211-x1e80100-pwrseq-qcp-v2-1-c4349ca974ab@linaro.org>
 <Z6txevdftVNww0wD@hovoldconsulting.com> <CAMRc=McApxN7TKKKAL2OmfkosKYA9gCYZXQZXFAE_A9a5qykmw@mail.gmail.com>
 <Z6uVJeQd1DXFFHG1@linaro.org>
In-Reply-To: <Z6uVJeQd1DXFFHG1@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 20:34:49 +0100
X-Gm-Features: AWEUYZmxYAztARbq_llYUY0lB0u5EhPSVbakcUSWbCMuoLnLogvwKAVly3UHO-o
Message-ID: <CAMRc=Mcf8gSr8JGixZ2MQ=d0KbZjDQ3tYNU6RNuSRDQSHpNiwQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 7:21=E2=80=AFPM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Tue, Feb 11, 2025 at 06:51:02PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Feb 11, 2025 at 4:49=E2=80=AFPM Johan Hovold <johan@kernel.org>=
 wrote:
> > >
> > > On Tue, Feb 11, 2025 at 04:01:56PM +0100, Stephan Gerhold wrote:
> > > > Add the WiFi/BT nodes for QCP and describe the regulators for the W=
CN7850
> > > > combo chip using the new power sequencing bindings. All voltages ar=
e
> > > > derived from chained fixed regulators controlled using a single GPI=
O.
> > > >
> > > > The same setup also works for CRD (and likely most of the other X1E=
80100
> > > > laptops). However, unlike the QCP they use soldered or removable M.=
2 cards
> > > > supplied by a single 3.3V fixed regulator. The other necessary volt=
ages are
> > > > then derived inside the M.2 card. Describing this properly requires
> > > > new bindings, so this commit only adds QCP for now.
> > > >
> > > > Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > > > ---
> > > > Changes in v2:
> > > > - Rebase on qcom for-next, patch 1-2 were applied already
> > > > - Mention dummy regulator warning
> > > > - Link to v1: https://lore.kernel.org/r/20241007-x1e80100-pwrseq-qc=
p-v1-0-f7166510ab17@linaro.org
> > > > ---
> > > > The Linux driver currently warns about a missing regulator supply:
> > > >
> > > >   pwrseq-qcom_wcn wcn7850-pmu: supply vddio1p2 not found, using dum=
my regulator
> > > >
> > > > This supply exists on the WCN7850 chip, but nothing is connected th=
ere on
> > > > the QCP. Discussion is still open how to hide this warning in the d=
river,
> > > > but since the DT is correct and the same setup is already used on S=
M8550
> > > > upstream, this shouldn't block this patch.
> > >
> > > I thought Bartosz was gonna fix his driver...
> > >
> >
> > This is not the same issue. The one you're thinking about[1] was fixed
> > by commit ad783b9f8e78 ("PCI/pwrctl: Abandon QCom WCN probe on
> > pre-pwrseq device-trees").
> >
> > This warning comes from the PMU driver, not the PCI pwrctrl one for
> > the WLAN module. One solution would be to make this supply optional in
> > bindings and use regulator_get_optional for the ones we know may be
> > unconnected. Does it sound correct?
> >
>
> The supply is optional already in the bindings. It's not optional in the
> driver though, because that one uses the bulk regulator API and that
> currently provides no way to mark an individual regulator as optional.
>
> We did discuss this on v1 of this patch. I think you did not get back to
> Mark's last message yet [2]. :-)
>
> Thanks,
> Stephan
>
> [2]: https://lore.kernel.org/linux-arm-msm/f125c7d5-5f85-4ff6-999b-2098ff=
3103f9@sirena.org.uk/

Indeed, thanks for reminding me. I'll respond tomorrow.

Bartosz

