Return-Path: <linux-arm-msm+bounces-29309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F1E95BF5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 22:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD9E428226D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 20:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33D114B968;
	Thu, 22 Aug 2024 20:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LOjtHvXy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4231C287
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 20:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356880; cv=none; b=L6RZxAY9+hcSvzdepTcKka0L2oyhX7XL+GT01A28DuyfPMvaIsouZhIG4RuxAPtfmlvuhpv2vFIZyeJnXlyKK7GZsspbn/xSwUBco2aW0KfAWmpIFAVx7dgwkwQL20M8dmDIhWNH0SXwoWoQ7hFRGQulWhy6iZnpV+xpegJXf0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356880; c=relaxed/simple;
	bh=QarGgRQr+gI4+f2UfWJ5gh3yFj+scMNLwIR1YGzkv0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jxUCqpOmukni7FiSvBgKQJNpcdpTRoPaGJWTEnb74APNPKCCFLTJmytEWZ3yTPW6CcqjL/xeFmtQsqMu/ZKbnvIZMbY18bznuhHTfan5lk7UcLW7SGVpsPnRKbVjgFYl2VQvzw5Q8WUBfTPeK0QjI6estFKDSm7sMp5AzuP9tEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LOjtHvXy; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-533488ffaebso1405571e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 13:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724356876; x=1724961676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OgHWaDNWmiIFNd4ncEUg8oQiBFdIcEtIv7xdX5ZNjFc=;
        b=LOjtHvXy+rN1UtIpdtm7iR9qPnhFoUQAc9rPis7Ig9k197ufGSCS6fboQq80sLJ/Qy
         2EWQkOUBfZxw1dw1AqXSchqakfiQBK43zHUIuPXTpeP04OvXFGOWyK6bXebGFfflsEvi
         OIG8Lof7+dmaXb6H8pIGpoUQJuao4LqR8/KMR0WjSwhaJ3jS44XFoU7QCkREGrOdz434
         Ea/gsaTZUEVxrRKoyjB02X109OVyvpyNHwoFbCPtJrqO3IetL6dw9UW1AfiU7dNm8Kz/
         h+pZqBpKIGmTyvqIv6zEZYXnsMnRc/iF1YqyOTLLPp8OTWMQEfIpPd5mQZPEhQAqbxX+
         7aiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724356876; x=1724961676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OgHWaDNWmiIFNd4ncEUg8oQiBFdIcEtIv7xdX5ZNjFc=;
        b=JGtOCUFd1e/++AmcMrGzxWncSokLlts17dQRcgDDrr83vRwlC2YcZCtLKCjdlKEcTx
         3Hn02beRk2IGMBTP2UJK5liGEOCv4iuz+bHmaf6UtlRETycQjQ36vvyd0bcfHSyM2K9A
         fZtY6bAnTlED8h8yAq2z9jkkLVMFJ7mYaQ6B1NU5/L4ExAGIGwtQ5l3B0Mr9akzl9U2k
         ziNrc2JAAFJ19+9oJOhhwphZFn0XZnka4SBnZ9Mi8YJuktBnRpHs3Hz2+kH+nqP3I7Dk
         hbf5Yg3D+pzINaU61WpVKENgBpXqH9Yv0jLCfPinyvWeoVAfH7O90yBYUK3KBsWIKgkG
         2dhg==
X-Forwarded-Encrypted: i=1; AJvYcCV+bakpceoyBchcCCtVRlrWMJK9BDFXzhxBmvddH2p/B4+zCmttwH4LX8lFwgCdlr+kedeyGEiXVj/wcgTY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzao/yn67KFcP2SEs1+PJerXLgjFg2ZpQUc82/s9yW/Dv8vUxAw
	aR8T/dP+KEQlAD0mG2bLjICiyQQfvBSKKtfYoDMMonoYDpkmb7CglvTb+T6fOZagdoW5CnG5wfW
	qXStMCcBclRJDm20anjIdNbtf5AaByRubtVVL9g==
X-Google-Smtp-Source: AGHT+IGDx6yb2VS9q05wWF0GDGcpEIDi1TSv52Or1xmRG3FDdwv89W2uTgFzK7JYmPGZ3u/3WrZX+wNo4dihHvHt45k=
X-Received: by 2002:a05:6512:ba7:b0:52b:c0b1:ab9e with SMTP id
 2adb3069b0e04-5343875589fmr46511e87.5.1724356875411; Thu, 22 Aug 2024
 13:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=MeWFs+M+2kpotRqmcbPgXx8xCWEa-DqatGxWUAcixQb2g@mail.gmail.com>
 <20240822192838.GA346474@bhelgaas>
In-Reply-To: <20240822192838.GA346474@bhelgaas>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 22 Aug 2024 22:01:04 +0200
Message-ID: <CAMRc=Mcrrhagqykg6eXXkVJ2dYAm5ViLtwL=VKTn8i72UY12Zg@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] PCI: Change the parent to correctly represent pcie hierarchy
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, cros-qcom-dts-watchers@chromium.org, 
	Jingoo Han <jingoohan1@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, andersson@kernel.org, 
	quic_vbadigan@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 9:28=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Tue, Aug 13, 2024 at 09:15:06PM +0200, Bartosz Golaszewski wrote:
> > On Sat, Aug 3, 2024 at 5:23=E2=80=AFAM Krishna chaitanya chundru
> > <quic_krichai@quicinc.com> wrote:
> > >
> > > Currently the pwrctl driver is child of pci-pci bridge driver,
> > > this will cause issue when suspend resume is introduced in the pwr
> > > control driver. If the supply is removed to the endpoint in the
> > > power control driver then the config space access by the
> > > pci-pci bridge driver can cause issues like Timeouts.
> > >
> > > For this reason change the parent to controller from pci-pci bridge.
> > >
> > > Fixes: 4565d2652a37 ("PCI/pwrctl: Add PCI power control core code")
> > > Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> > > ---
> >
> > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Bjorn,
> >
> > I think this should go into v6.11 as it does indeed better represent
> > the underlying logic.
>
> Is this patch independent of the rest?  I don't think the whole series
> looks like v6.11 material, but if this patch can be applied
> independently, *and* we can make a case in the commit log for why it
> is v6.11 material, we can do that.
>
> Right now the commit log doesn't tell me enough to justify a
> post-merge window change.
>
> Bjorn

Please, apply this patch independently. FYI I have a WiP branch[1]
with a v3 of the fixes series rebased on top of this one. Manivannan
and I are working on fixing one last remaining issue and I'll resend
it. This should go into v6.11.

Bart

[1] https://git.codelinaro.org/bartosz_golaszewski/linux/-/tree/topic/pci-p=
wrctl-fixes

