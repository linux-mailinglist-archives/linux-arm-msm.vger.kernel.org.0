Return-Path: <linux-arm-msm+bounces-34714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 867E99A1E52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38BBE1F23104
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACC71D8DF9;
	Thu, 17 Oct 2024 09:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bApJLpo8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D462A1D88D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157316; cv=none; b=u4iJCLew/g79iQ1Ywv2bT20ZUtKaFYjX8sVO4WXQQzfIKyP9BtcyaOpUjWCjjt7i51TWFUXO8irYJfOvAb34oD7G52rRs0jybCDXYJCLvlUC6GTi48a79oVUzU1qeL6KIPuyaj1748ESfD73JakWF7FC2bEIQw49ldSfVvjdYAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157316; c=relaxed/simple;
	bh=3JxCbA3plKuWlzh3DdAcu/EpWlbWdGPeJJNsgc/8v/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IUo0TCNmJtQI8COtAeNuEsacG+XZJ1M8MUUVXJlSUJT2U79GpMa2mgcWYgoy2YTeMBl+XSxC/aLBAjtndj7RgypsZJ28odxGq5BHYb5C1HqBMeVpp5d5q0Q+Wyck60DGVInXsYpUqxFZ/W4UEVCNpUJimBMYSVK5DJpQFag88kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bApJLpo8; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so11280371fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 02:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729157311; x=1729762111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujlKFoZAU3IuBC3XvqlZ9TW01zV3UE3c49sjcx7h6Tk=;
        b=bApJLpo8stG+PnxoVQN9Z7UXxBGGKiZTkZ1Bfpy7uBPmV0OfvFeB9IY2BHK4G5zByh
         gFBL51KFptJKtkcPuwC6VmsO8RN+3yg8NHqA4WzPtKyMz8t2AjM6kNAuYCqcEVDP8bHy
         4tTtK8v+fzIzFbU8v32AyQABCacE8jNur5qCnLkg4OcDVvTqQ23TWVE8HdEEK4G0wAL5
         A0/ytuo+IcKu0IH1FK+J1WjKiOdsOrIBY/7LQT7LGirKINtuGGeC0apjS7x0NZ72VgpS
         kO5CXxZ4sR0yB024/SrHlMgxdCb5bX4pdWedf2yw8zaXBt6AtkVoCXNuffTmAaUzYakb
         q/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729157311; x=1729762111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujlKFoZAU3IuBC3XvqlZ9TW01zV3UE3c49sjcx7h6Tk=;
        b=rBMnlGafmME0mHKQWuEYR4PqQCsovxfVLAmIl41+sYcv79D2dudXXV1JOsNi7btNVa
         sX77vT1cozDQW1WcPOgzejvqrPgVRm2Nt5tfKaWlg0CUQqa5WALNCyljByu4ccebL9a3
         it4bJsNMVzE52LREDeXnTNPslOECvZzz9jztc4e100Rizj8GcA93qjI0wwpYZQHhVkvi
         KxcnSJ2tXeHdhoWWryKNsYK+66ivDX4gaI5XkylBPk5caWi4Vn/86Nzw2W3YQzWTA942
         NHjoxGt7ysMOpiDLYzZNNa8oUIAX1bMwLFgB3ViDvV57S2puVvjA/axiNBzs1TGL2lsy
         /+2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWAV0L2gkhGKTrT2Pn7nmslhHLLkaH0j0+h+CO1IYmdhpuuJvasuOblwQX0jY9xGlCucL45eb3gZr3n7o8L@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8WCfMvQm459nYsRBCUQmwa1GykC3UZtlDXPSAf1X/aI4xMBF/
	4AwqKejwy0zSzmdQv3reiztiE/30imYfibCVcefsWSAzBdCM3vQCk9vLgpOt/oZyptVRU3GhWt8
	LMIeeqi/78VNSFR/xkRmsKX7dQAl0grYIGGTDFg==
X-Google-Smtp-Source: AGHT+IEY+3SV+hBJUgIpM1mrD/VMIPjwYqeTMMlR7fhnpB2nNrdPkRRvzY3JDQvwDcgUwUgOg9XphlUR4GGduZiSn9o=
X-Received: by 2002:a05:6512:e9d:b0:535:6a34:b8c3 with SMTP id
 2adb3069b0e04-539e54d772bmr13956584e87.5.1729157310716; Thu, 17 Oct 2024
 02:28:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007-x1e80100-pwrseq-qcp-v1-0-f7166510ab17@linaro.org>
 <20241007-x1e80100-pwrseq-qcp-v1-3-f7166510ab17@linaro.org>
 <ZweftESPrJNEsqGE@hovoldconsulting.com> <Zwj539cN2DJ7nd3A@linaro.org>
 <Zw5fzNZ_xCwPyw4G@hovoldconsulting.com> <Zw_dE1rQ-Ljsh-sY@linaro.org>
In-Reply-To: <Zw_dE1rQ-Ljsh-sY@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 Oct 2024 11:28:18 +0200
Message-ID: <CAMRc=MfUEfKHkAVvtGODxvJ-BdL+kX7uDgW+1y4QW3Kc5mpX+w@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
To: Stephan Gerhold <stephan.gerhold@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 5:34=E2=80=AFPM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Tue, Oct 15, 2024 at 02:27:56PM +0200, Johan Hovold wrote:
> > On Fri, Oct 11, 2024 at 12:11:43PM +0200, Stephan Gerhold wrote:
> > > On Thu, Oct 10, 2024 at 11:34:44AM +0200, Johan Hovold wrote:
> >
> > > > Based on our discussions it seems we do not really need to describe=
 the
> > > > internal PMU at all for WCN7850 (as the bluetooth and wlan blocks c=
an be
> > > > enabled indepdendently) so perhaps we can just restore the old bind=
ing
> > > > and drop most of this boilerplate for all boards.
> > > >
> > >
> > > I think there is no clear conclusion on that yet. The old bindings
> > > didn't describe any power supplies for WiFi at all. The pwrseq bindin=
gs
> > > are currently the only way to do that.
> > >
> > > We could potentially move all the "PMU supplies" to the WiFi/BT nodes
> > > and rely on reference counting to handle them. But I think it's bette=
r
> > > to wait how the M.2/generic PCI power control discussion turns out
> > > before investing any time to refactor the current solution.
> > >
> > > There are existing users of qcom,wcn7850-pmu already in 6.11, so I th=
ink
> > > it does not hurt to take this patch as-is for now. We can clean them =
up
> > > together later if needed.
> >
> > Sounds good.
> >
> > But can you please address the following warning that I see with this
> > series:
> >
> >       pwrseq-qcom_wcn wcn7850-pmu: supply vddio1p2 not found, using dum=
my regulator
> >
> > Not sure if it's the dtsi that's missing a supply if it's the driver
> > that needs fixing.
> >
>
> It's the driver, the DT should be correct. This supply exists on the
> WCN7850 chip, but nothing is connected there on the QCP.
>
> Unfortunately, it's not entirely straightforward to drop the warning
> since the pwrseq-qcom-wcn driver uses the bulk regulator APIs and
> (AFAIK) there is no good way to make only one of the regulators optional
> there.
>
> @Bartosz: Any thoughts on this? sm8550-qrd and sm8550-hdk are also
> missing the vddio1p2-supply, so they probably have the same warning in
> latest mainline.
>

How do others deal with it? I'm asking because I've been seeing these
warnings for years on many platforms which makes me think they are not
a high priority for anyone.

The best approach would be to provide an optional bulk get for the
regulator API. Or extend struct regulator_bulk_data with bool optional
and take this into account.

Mark: Any thoughts on this?

Bart

