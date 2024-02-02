Return-Path: <linux-arm-msm+bounces-9548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3608470D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 14:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9794F28C45C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Feb 2024 13:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1A34C6A;
	Fri,  2 Feb 2024 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="krb/jVRI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9D5523F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Feb 2024 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706879173; cv=none; b=PvlJ6PzICPKjgHBEsFNYt16cA7MmTrKZmBWU4xK51nqJ+3eK8BLtPZmtr0CLqDYDEsZgPNchIlGA7j/P2wct89pE7NO7q5us2pI2aTTQagQvJunV8R01maAEcuy4xFwHj4W5zKAhgczdl5PyWCxdJIrGXOzRf0aeqlUNd54uivM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706879173; c=relaxed/simple;
	bh=0dxT2bZfqUTaN/pgDE3v3v3YQiHSfOH7dfGHB+kmRmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fajVcyodxUloeaWNdHe0NKdNvbEZ9eRXs2RTGFXlhx4fLjxkx7s34hByMwuIj5PnfQICuNPNegHoip0dM6h2EM4gOYvD7MDULfL++wLhN7XhinZ0SniVGVUOh7rLEZHpuYBUg3+hUtjKogHmW346arCw+xsN/GCGqhGbIW2NqKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=krb/jVRI; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4c0148cd75eso25526e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Feb 2024 05:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706879170; x=1707483970; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dxT2bZfqUTaN/pgDE3v3v3YQiHSfOH7dfGHB+kmRmg=;
        b=krb/jVRIzFSy7rofP1kdGAN1lBPMRGaSy3yXvyAR8qAJ/pJXXQYkLdo5cHNuP3YK5H
         qKJuQ17g0kaiEuTHn91wZRikrV//iD8lekH50jVs/Y0M67gX98Lg7rH1iU4mDLviBnp/
         3e5Lboy0RHc+dsoVmTCnu2WnjyO3ZDwBel2VkFIAxdadWIfXaIUQd/y8YlCHnLhzYFhy
         sWyE2JNnKhYvITTW5SIdCL+YNzjrxYT3omFkSW2gpcNjzuMjKGk7TpxhJOi82SC173+F
         COLFkotOjz4hBAfxqwP7o2zfb7ukpqBYVMIrwia1EMAXrP6ZMGEUCEEhH4qgH/Gk3Dnc
         wggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706879170; x=1707483970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0dxT2bZfqUTaN/pgDE3v3v3YQiHSfOH7dfGHB+kmRmg=;
        b=kkR6HppoehbyxE1YQCLPExkvTy6VAcDejPzA6VZeWKATWSwatongx6DnZjgWiGLug+
         ykwjHOREWj0d8ZJuxn745JnppmH3H/fKnjUyaXWP0I6ixWPpVUdBaX/tYPam+IESvxMW
         PTXRLr9YnksM3NHu0+1FbYnDCQomn3XoVUUBqhukc1vTvf7PdNLN/aMhPf4OJSqs472e
         MHQqEp5aJno+eOaLEkIiwOdatudd0+SJYzq3BWPdd929HfUfQtZ6HJps4JVVJGMtUJwY
         6ZpAClPwENgkWAu3jCr/G3uR6Gafqt6P2sdUdYaEs0UhDvjJlLGf3D0mGQ1YXLtzpT4I
         WkLQ==
X-Gm-Message-State: AOJu0YwWH76nk2ypI9FzKFZkX+3OiFa5F1Xm2lYJ9OFkbthOl+BLOjgT
	g2Xvsd+5MItx7fKApoRxxATaHS2zGa1fSsGEqzIKb0BH2nRA5oU1MZe3wSLaB9T9ryzzg+uVMlF
	7HjNrKsncaIa4nx0FhdhK+dTuHz2u6+Qlg1e0Zw==
X-Google-Smtp-Source: AGHT+IEWSGGwOYOwE9UNS4a7/BGQ5J1Iy+sfg/cwAIy6czcrvkxuNiWzhaxMEH75CieiMzMPxqerQJsKsDuJ/9HoZ2E=
X-Received: by 2002:a05:6122:3a05:b0:4bd:728b:c108 with SMTP id
 fp5-20020a0561223a0500b004bd728bc108mr8581270vkb.8.1706879170735; Fri, 02 Feb
 2024 05:06:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201155532.49707-1-brgl@bgdev.pl> <20240201155532.49707-10-brgl@bgdev.pl>
 <jb4hzijjxjv4kiy3cn2fuc5ox4x5uutredbxiwo2fvnkh2xudf@5w65qtp35ase>
In-Reply-To: <jb4hzijjxjv4kiy3cn2fuc5ox4x5uutredbxiwo2fvnkh2xudf@5w65qtp35ase>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 2 Feb 2024 14:05:59 +0100
Message-ID: <CAMRc=MdQ_uRq7a24RYt=KRSff9sw_1soQ+8ONEpNXy0emk5ChQ@mail.gmail.com>
Subject: Re: [RFC 9/9] PCI/pwrctl: add a PCI power control driver for power
 sequenced devices
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Abel Vesa <abel.vesa@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 2, 2024 at 5:03=E2=80=AFAM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
> On Thu, Feb 01, 2024 at 04:55:32PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a PCI power control driver that's capable of correctly powering up
> > devices using the power sequencing subsystem. For now we support the
> > ath11k module on QCA6390.
> >
>
> For a PCI device which doesn't share resources with something on another
> bus, the whole power sequencing would be implemented in a driver like
> this - without the involvement of the power sequence framework.
>

Yes, this is what I did in the previous incarnation of this code[1].

(I know, I should have linked it here. My bad, I will do it next time).

> I think it would be nice to see this series introduce a simple
> pci_pwrctl driver, and then (in the same series) introduce the power
> sequence framework and your PMU driver.
>

I disagree. I was initially annoyed by Dmitry asking me to do a lot
more work than anticipated but he's right after all. WLAN and BT
consuming what is really the PMU's inputs is simply not the actual
representation. That's why we should make it a pwrseq user IMO.

> One case where such model would be appropriate is the XHCI controller
> (uPD720201) on db845c. Today we describe vddpe-3p3-supply as a supply on
> the PCI controller, but it should have been vdd33-supply, vdd10-supply,
> avdd33-supply on the PCI device.

Sounds like a good second user then!

>
> That would provide an example for how a simple PCI power control driver
> can/should look like, and we can discuss the PCI pieces separate from
> the introduction of the new power sequence framework (which is unrelated
> to PCI).

I agree it's unrelated and it could possibly go upstream separately
but the particular use-case on RB5 (and other Qcom platforms) requires
both the PCI and generic power sequencing to be addressed.

Bart

[snip]

[1] https://lore.kernel.org/netdev/20240117160748.37682-7-brgl@bgdev.pl/T/#=
m72f52254a52fcb8a8a44de0702cad1087d4bcfa1

