Return-Path: <linux-arm-msm+bounces-44666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DADA081CB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 21:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7923B3A675A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 20:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CAC200B95;
	Thu,  9 Jan 2025 20:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mOF4sgs2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2D31FF7D4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 20:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455896; cv=none; b=cjT0U+b8jIGfMdy8hhYHX8TV8cHwnl4WILpbGtx+9vbQqYjUs40DMPhhWxil/eX01Xv480Q//eGyDHO0O5HKwJ7xs2rbhL18LobO62CWmdvNSanY1TPMy/IQ0u0TxaasU5ndMaUoFYUvHcRy1Ad15pHC7h67Qi5irkKxmkS+Z60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455896; c=relaxed/simple;
	bh=/TsRdN+g/t5WPSJQXnaL9WV9wg//3dakf9wDwajrJgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8CTET9Jm4loR0DCgpgK57cHD9KHEMYdyjzzX03kLOF2dX4Bv1FkY2Kb2A3e1Fmo4ZdfwQsBeydl54N0M9gLSkbQcR1GOmOi/OoJrnp104x3P8YyCSZXaIRhsrVDs/6Wj8nvUDtuxFlrfH8Aqr93AjFTnKERByXMwPTQM1VWGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mOF4sgs2; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f2e13cb359so416987eaf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 12:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736455894; x=1737060694; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mebvm12Efix/HOfbzCEke0YYM9SXOWLxp0bQs2kiNYc=;
        b=mOF4sgs2AuJfIlbM8hsfBJ5Yqkk1J0h4Ip1yjwXpqzTnEnL9lcz6i51+hBQlEUNjG5
         gzpfhkcuWZcOZGEGdEoJ8ZVXDEbbo+oJ5Q/086J7QkBaaE7QoDgy2OZN6A7JcsuRHa4j
         dq54djhCkfLRmoBHCkHfDfL2R3c6FD4TOjwqxucKyLhMd2RXnucCXbVVZHNOt2+3asnn
         sqIu1x90LhRTTUjkaWiMfmH3EBoyc7RVgmRJlA934gEMceKOBH49iO22kPlzTYzz0fFM
         bxy3hDC4xEukxzkEGO6vf8uF8p0AjxFVW4JQXI2sQ58bk33iFkEg2BMY3Il/VlG+17tp
         o/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455894; x=1737060694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mebvm12Efix/HOfbzCEke0YYM9SXOWLxp0bQs2kiNYc=;
        b=adUFEG0RZpinhqsHFLY+PABnKI0Y2xXkhsHorkPOhz/ImLUUkFw4TDoj50mpU/u6m+
         7Fn+Bz8SXL50bGXxMTcFqVDVIq7iX7sRdkZi+OSKAf4uSu01jkWdf9ottT8CzxoLYw9Q
         hsR0jTdI/z7TdxM8Ss/V1XT0fSxCkJiKJ8aWTQiVhzC6SAbDGTo0V85e72gjEWv2d8gx
         e2sVplELB3PNNMe9PjRxxwB/fip9wRgTWS/ehm/EffUrn5XdN5Hg4o9HQTQudE27Opan
         VzVpn9NEPaDMASwzueghLzGj2gi4CVRZ2cOesOvAPSLlaEqir+3XL39iQzMYCrw4foKJ
         iMPw==
X-Forwarded-Encrypted: i=1; AJvYcCUBAJ1jfUkdx1xGOs6MeKDWhfpPAadbu1h/IcsWTjXZAOmuyvidCY8kC1QYeFGfGYFrL+lcCJr/yJjCvxgG@vger.kernel.org
X-Gm-Message-State: AOJu0YytbV0xhRwnziOH1kLgvMeH6G3aUq0okuPsl9/wCy/iIJ5It9c+
	ZpO1xtBc3rKaJwa/kVy2H1/4oi4anwpwY+/xVpAf93qJqA0bbJgj4onb+ffKfZPE9J6ukOFQL6I
	bebILLItUWvc0mukd5ep3/ScxrCsrXqVuJQCGWJUNT3WVL0MY7fs=
X-Gm-Gg: ASbGncsUts02QQjJb5FSXWqFp6VRlKFfot7x7Mep8QCJ6E8HtGqgRmdpx4Lf7D4Glkm
	dBdUf9RLInUMXE8Fqe+aLSzJn7+a7/FEIxrfHiQ==
X-Google-Smtp-Source: AGHT+IGw0KIVg/dvzz7d9PF80SBHOTL5uvW2Zpk7HWjQlYX/tsf3aX9InA3qQG3yCXLbshZwbBGvXAfuWrNEWOn1Gs0=
X-Received: by 2002:a05:6820:1798:b0:5f3:4175:1d7f with SMTP id
 006d021491bc7-5f73096717dmr4383494eaf.8.1736455893957; Thu, 09 Jan 2025
 12:51:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org> <CAMZdPi9KiLczjETLwJG_9krn_z=Og0uZhYuajPeZYoBHanxMiw@mail.gmail.com>
 <20250108160211.6dok3zcn2qaoj3lp@thinkpad>
In-Reply-To: <20250108160211.6dok3zcn2qaoj3lp@thinkpad>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Thu, 9 Jan 2025 21:50:55 +0100
X-Gm-Features: AbW1kvaYy2ijj3_SpahQvOJx-c_o9llvwrvJ3pguay-O4M-tUnMoDS8jvItsP7k
Message-ID: <CAMZdPi_OPXGkrT_4iyLF-698TPUgHu=Y5M-wVRq=kx6RWH4bVw@mail.gmail.com>
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Recover the device
 synchronously from mhi_pci_runtime_resume()
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 17:02, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Wed, Jan 08, 2025 at 04:19:06PM +0100, Loic Poulain wrote:
> > On Wed, 8 Jan 2025 at 14:39, Manivannan Sadhasivam via B4 Relay
> > <devnull+manivannan.sadhasivam.linaro.org@kernel.org> wrote:
> > >
> > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > >
> > > Currently, in mhi_pci_runtime_resume(), if the resume fails, recovery_work
> > > is started asynchronously and success is returned. But this doesn't align
> > > with what PM core expects as documented in
> > > Documentation/power/runtime_pm.rst:
> > >
> > > "Once the subsystem-level resume callback (or the driver resume callback,
> > > if invoked directly) has completed successfully, the PM core regards the
> > > device as fully operational, which means that the device _must_ be able to
> > > complete I/O operations as needed.  The runtime PM status of the device is
> > > then 'active'."
> > >
> > > So the PM core ends up marking the runtime PM status of the device as
> > > 'active', even though the device is not able to handle the I/O operations.
> > > This same condition more or less applies to system resume as well.
> > >
> > > So to avoid this ambiguity, try to recover the device synchronously from
> > > mhi_pci_runtime_resume() and return the actual error code in the case of
> > > recovery failure.
> > >
> > > For doing so, move the recovery code to __mhi_pci_recovery_work() helper
> > > and call that from both mhi_pci_recovery_work() and
> > > mhi_pci_runtime_resume(). Former still ignores the return value, while the
> > > latter passes it to PM core.
> > >
> > > Cc: stable@vger.kernel.org # 5.13
> > > Reported-by: Johan Hovold <johan@kernel.org>
> > > Closes: https://lore.kernel.org/mhi/Z2PbEPYpqFfrLSJi@hovoldconsulting.com
> > > Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > Note that it will noticeably impact the user experience on system-wide
> > resume (mhi_pci_resume), because MHI devices usually take a while (a
> > few seconds) to cold boot and reach a ready state (or time out in the
> > worst case). So we may have people complaining about delayed resume
> > regression on their laptop even if they are not using the MHI
> > device/modem function. Are we ok with that?
> >
>
> Are you saying that the modem will enter D3Cold all the time during system
> suspend? I think you are referring to x86 host machines here.

It depends on the host and its firmware implementation, but yes I
observed that x86_64 based laptops are powering off the mPCIe slot
while suspended.

> If that is the case, we should not be using mhi_pci_runtime_*() calls in
> mhi_pci_suspend/resume(). Rather the MHI stack should be powered down during
> suspend and powered ON during resume.

Yes, but what about the hosts keeping power in suspend state? we can
not really know that programmatically AFAIK.

Regards,
Loic

