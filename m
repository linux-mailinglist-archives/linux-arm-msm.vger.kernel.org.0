Return-Path: <linux-arm-msm+bounces-27406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E81941091
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 13:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5469281E06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 11:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9F4187340;
	Tue, 30 Jul 2024 11:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xB+/yIJs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586ED198E82
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722339344; cv=none; b=OtSVYeyL0T4m75umFSIllT5DPbUGJsZQ2u2TOVmZpT9vWkOmQTtKm4Ckphm4E6LclVaMvqoleKf2naBltvL+R77DPT9Qk48g5FqIj2GWIcEhxyaV/UKJY04WpNYNp87aTT/zeyHnLfwgW+CS+ZU/0hAvvc4C+vTMiuaotguWtxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722339344; c=relaxed/simple;
	bh=SzNw+nJT8xnyHFJk4AFqUzJHF3dVziOgXld+vZg41KI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEOBHE/9HDcE73Ujpq1hGCOT+OvbgQ3aT/A0r96HERBPXKNzJGFgNAj4GJlNhci4E80UR5FUjaspXsnPnfYC+bx1br7MSuUIFWUXXy0/DQ/SMvTMitYshWC9X4rgB+ha3G4b74EkxGp4Td5eFWVJDu8FKKSalwMOkzntqAQE+Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xB+/yIJs; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f035ae1083so59166011fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2024 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722339340; x=1722944140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACWV171VokTXiOyHIrE7ejnV5EZjVW2CRSKDS5Os8P8=;
        b=xB+/yIJsqrDs29zeI1EFrc2n1qgUgpcHe8QvSWRjrEjH8AMZjbSQe9+ZLNEw2UH4AD
         g5L8QRFk6Uv2yffl6KGY50sRszczpZfRbT1OVNtpaZnpZCYGPGwfY+i72oYRtSccQIiW
         YVS6JkxpUnhk/iNx+lTdU02CVV3ykOWYeCy/pqH5aLZbdldGgyG8M437oa2sR9/cMrf7
         i/5GtDH2/zeCmn8CilpHcNVYE3QbY4D0Gzgdf7Av+b1G0Sm4B3E9Og9PYg6Xf90DIB/W
         59ddBMQTzpqa/tVxQrBFc38eztC33abCkANIgYyvHdEytkUbMblR/nxMHYGyrr4vE8sv
         qpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722339340; x=1722944140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACWV171VokTXiOyHIrE7ejnV5EZjVW2CRSKDS5Os8P8=;
        b=gWkVHn13BkSboPRsAbe3jHwHdWjDf9SroXgSShilhoIj+1PwS7NUctzglT9UjZyDl8
         0UAcY/+g5co+OrJxDTXDByufpiyNA+nW6rBg105KrYjOd/rKnFI/nVEWK8utYvZeEely
         VfykI/igNWaeHiG7FmvkY37x9o31Ykb052tpgP69FYIPH+JVtObdPf6usZX09vkSRf/6
         rU8pPWVbM7azhTYeCiR3mzDq6fYHwFWkwoj3eRZUMIrO+qcDNm5HPfmgUGPZ2sOvTJMI
         mEGcDHj3DnaZYJRtPot+5E7dJX9Ho6J7rhGp4lKdawafHJeAfiKdkaF3j50jzDvf0TDI
         TuUw==
X-Forwarded-Encrypted: i=1; AJvYcCXdi5TP78cHDsWMXMd+4Ia9aYfYrBIZ0a1W196HD4yulC5+NTml7swOQUXywTF+ql6cyDByjxyjRw7fohXpNWygCDAdo8bjh2WJdB/oCA==
X-Gm-Message-State: AOJu0YwvQ9b1ymSMG759gyOo1rP+fWBZWU8einYzOzT4TIMzW0H+yxPV
	QT3Q8NUOaB6NJhVKikaAczu0DZzBXseWZDnK6bEL9yTyjPIW67S0X/xHn7a6t+oXgVkmf5WQNqO
	8guQnK9TXDUI8PbFS0q7WPsDVXFv5kf5Mji0ANg==
X-Google-Smtp-Source: AGHT+IEdPXeLx5lLnsguxewxdMk+52p9t22OEqveNu0n933FvEZ3rr94X4Jj0LIrany5Lo1tS7gOYw/F7T/7oGv7pRI=
X-Received: by 2002:a2e:730b:0:b0:2ef:2ed2:25b1 with SMTP id
 38308e7fff4ca-2f12ee192bfmr71795571fa.20.1722339340222; Tue, 30 Jul 2024
 04:35:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729095542.21097-1-johan+linaro@kernel.org>
 <CAMRc=McuqEv1Sk9O6kn4aHo9wOfzskZS0z2QxzNM=q2N8XZ3zw@mail.gmail.com>
 <Zqduv66H2OczRgaH@hovoldconsulting.com> <CAMRc=MfEkPcKUNb7HbiNrqv+7q1n0wRD9sKQ8WrydoR4grao2A@mail.gmail.com>
 <ZqeP7CqEoC5iWAdL@hovoldconsulting.com>
In-Reply-To: <ZqeP7CqEoC5iWAdL@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 30 Jul 2024 13:35:28 +0200
Message-ID: <CAMRc=MecyZU6DBWjg7vtohhxtVoaOR6jCRHdEiAKinqvmEtDyQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "firmware: qcom: qseecom: convert to using the TZ allocator"
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Amirreza Zarrabi <quic_azarrabi@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 2:49=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Mon, Jul 29, 2024 at 02:35:39PM +0200, Bartosz Golaszewski wrote:
> > > > On Mon, Jul 29, 2024 at 11:58=E2=80=AFAM Johan Hovold <johan+linaro=
@kernel.org> wrote:
> > > > >
> > > > > This reverts commit 6612103ec35af6058bb85ab24dae28e119b3c055.
> > > > >
> > > > > Using the "TZ allocator" for qcseecom breaks efivars on machines =
like
> > > > > the Lenovo ThinkPad X13s and x1e80100 CRD:
> > > > >
> > > > >         qcom_scm firmware:scm: qseecom: scm call failed with erro=
r -22
>
> > How do you reproduce this on x1e?
>
> Just boot 6.11-rc1 and you should see the above error (and there are no
> variables under /sys/firmware/efi/efivars/).
>
> Johan

I'm trying to figure out what the difference is with and without
tzmem. Surprisingly the physical address passed down to the SCM call
is actually the same in both cases.

I figured that maybe using different struct device for the underlying
dma_alloc_coherent() would be the culprit but I checked and no.

I'm still on it.

Bart

