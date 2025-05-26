Return-Path: <linux-arm-msm+bounces-59442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C847EAC4241
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 17:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AB06178CDC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334962144C4;
	Mon, 26 May 2025 15:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNlgbMZA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5828C21423F;
	Mon, 26 May 2025 15:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748273298; cv=none; b=TMOOZ1jBctnbRlPbsbQqZg3dIEO0aVhEjToMJfhW3R0UA/kFQHZkzNJgTe5mDPJN2wTTEF+SD8ldfmTjZB1Qdxn9SS/5jXZkvzvrD6S08oVzi51dC1CPAOs6f2ALvfxnL/5jP6SQ6ktu5ZZ0ZUzP1Ot1u8PuPBJk0zKGRJiEpQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748273298; c=relaxed/simple;
	bh=XgpvUG9KykTN5yAtg1OwU7QbpXzVIwV1QV+ipNPAC7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikQaAR3D6yy70W/PsuJop0vkYkNJXUNuJ7DlkugEUqpuwYmCKqwWaGZ8khwXUDYeLup/bOwpSb8iIAr4p1Ki50mJvcOIhi5oo+z5TOeiJ/so+2FjgO08BgAnqxvSvKBClUe9FDYyCeGCBPZcaFfQK3Y9SBupdxkM8UIzspJdrS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNlgbMZA; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-8647e143f28so186955939f.1;
        Mon, 26 May 2025 08:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748273295; x=1748878095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ok85kvavAOBcumYOi4zTE1YwoECPNwKxwTVh7Dm7eVw=;
        b=hNlgbMZAs1DDgZ3l8JaV7O9HkNHhLyWFK5UfCD34DLVSosnultiOimUSU+YO8z8qWk
         AUYvPeorwT7XNIMoCUDoEjQAws54n0l2e/XCN/8nDP6sUf/rdk7XRct/hlEz/zc0mnF1
         BTzQIGuNATJKQGYhxK7ronXS0NHFsVfowqtPSNe+V9FQd9f6V2T108htgTeQSXSAudlp
         0j0mBYGSaDougpAC26CkWIPcTp+lkA4itlpMDl5hXYSTPEKLMaRAdZ5pR6ardMKJZSn6
         klqzyZpaLzi1cjFFQ4Ac+3uRTuUO4V3utg6uVA/Ri69NcXvhgLYEAoXHwHpurp0fl9pL
         1jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748273295; x=1748878095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok85kvavAOBcumYOi4zTE1YwoECPNwKxwTVh7Dm7eVw=;
        b=JepQQcLn2sxLIBlZPKOzgseq7yP5N7JeJPCSY/KhV0sAaPAJ8+COFc2WGZdYLKWnZ/
         Hh7z/AtZpP2jWXbqCIdAc9XK1VZKJOgp7XfvD2XoCbdHzml2ti91hgIlesM3JGOVLd05
         I7M5HTQtNVk3PYBUS6d8ap+wVUfpiWbfjqt6BK0wGRWXsWQG5Ctv7jhqY7G4itBig79/
         FCfcsux8OQeFb5CaJf0XGhW4ktXF0TqbsjN0irMPCVbGfZsXobAD2ihYmEfmwj5VeYhz
         eVC9F/Y82LtMjcWoXqdo4QPnbW6aicGv0tRX3GOq/+HpA11ZLpnRRl2T5vEXhDWB1a77
         DR0A==
X-Forwarded-Encrypted: i=1; AJvYcCUiyRrT2pn3QEqyfIevaMKEaLB4r7uZ776RQDYHwTQLvCwSCZPs2LY9RuVPdnFB0g5x/kMxc32G/7r2/a/5WQ==@vger.kernel.org, AJvYcCWSMDhUr/6+pMO4bwVPIlN8OKJjMlpMOdNJgcBjf+HKkxRqal/zxOwjY1RoHW7tGBlk+Vg8s9F+b2jhO+P4@vger.kernel.org, AJvYcCWV5K3dZprBlpKSX02lgfEMO/uqQOn6KiT3kF0OyfrbyifzrqjlWnhb0PunEinUUH6UYmCCU5dD7Fs5@vger.kernel.org, AJvYcCXl981C1isytE+cIppeKx/zTXspHnYgTPYyTpi7mMJJ/aWeSo4E9iaP7rM2J/w/i9f+acmHPXF7SwTc@vger.kernel.org
X-Gm-Message-State: AOJu0YwtZH3IwkDImlyOEpGMBsLr/GtCcFXDnfadAwNd0Ak/13cnpWs3
	LjaZSqq2NIL3PONbwTFSROyYo1M1Kpsz41xhAxHSqFys99CrfLnLAxM1Vki3jcb2PcVWm5eCM43
	icclI3wPvmJKveWuCBeroy471vIvWW/o=
X-Gm-Gg: ASbGncsN4r/a0V0zuMkxSZ3P/4caBvQUWna1QT+WSRYtaiL3sjvMtT0DK6znw8JkxkB
	XI8oO/M2GV3HqQm8wnwV2LoyKZm9sH+tAiNtqlOeBslUecQp1ONTuGYH0SeE0QlGPP92kald/c9
	nZeudgf9rMJXHh/3xAbEdM8wuU6eXE9xtdf6Xc84N7yHt4l2CBmUQQ5Skyrg32dB9U
X-Google-Smtp-Source: AGHT+IHnjEOHDEa+vpbuy9fu6OzuQBLctXm8e94NFAA5PAxQ1vPEMihVba1OMwmRFrSVy6hhC0EPPpaB3XtabMoYhcY=
X-Received: by 2002:a05:6e02:1a26:b0:3dc:8075:ccde with SMTP id
 e9e14a558f8ab-3dc9b68097amr86275465ab.4.1748273295224; Mon, 26 May 2025
 08:28:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-5-2c1e6018d3f0@oldschoolsolutions.biz>
 <g7vlyqma6ow6tdsaqt2rfwvblxqwbqlwmoueio7i4vqvjy76kw@5bz4g33pq4t7>
 <CAMcHhXoYkQru_0n5siMGGkTcHu8yWRZWfT4ByiD8D0ieZHF+wQ@mail.gmail.com>
 <vwoixgdyjjzcjlv4muwrzv7wztnqyidtj7ghacgkjg6hgkkyl7@ji53bhiltaef>
 <CAMcHhXqDFuo+x99KOK0pQFj-FyTdQoZS_JvehNE2AC_JSoQ2gQ@mail.gmail.com> <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
In-Reply-To: <rvyfkow43atquc64p6slck6lpfsot67v47ngvfnuhxqo222h6k@kdvbsmf3fwsr>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 26 May 2025 08:28:03 -0700
X-Gm-Features: AX0GCFth23zIDl8jXgXc3hV3XSnIr7KUSlHYudJjPTsDM7Pwue023yHnh3K8dkQ
Message-ID: <CAF6AEGvr_foMVwaE_VSVWLT50cbGi8i3UGwo2e=rORD-1JmTmA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY
 device tree
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, jens.glathe@oldschoolsolutions.biz, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Kaehlcke <mka@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
	linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 1:36=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, May 25, 2025 at 09:43:36PM +0200, Aleksandrs Vinarskis wrote:
> > On Sun, 25 May 2025 at 15:33, Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On Sat, May 24, 2025 at 07:58:13PM +0200, Aleksandrs Vinarskis wrote:
> > > > On Sat, 24 May 2025 at 17:33, Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > >
> > > > > On Sat, May 24, 2025 at 01:48:40PM +0200, Jens Glathe via B4 Rela=
y wrote:
> > > > > > From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > > > >
> > > > > > Device tree for the Lenovo Thinkbook 16 G7 QOY
> > > > > >
> > > > > > The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1=
].
> > > > > >
> > > > > > Supported features:
> > > > > >
> > > > > > - USB type-c and type-a ports
> > > > > > - Keyboard
> > > > > > - Touchpad (all that are described in the dsdt)
> > > > > > - Touchscreen (described in the dsdt, no known SKUss)
> > > > > > - Display including PWM backlight control
> > > > > > - PCIe devices
> > > > > > - nvme
> > > > > > - SDHC card reader
> > > > > > - ath12k WCN7850 Wifi and Bluetooth
> > > > > > - ADSP and CDSP
> > > > > > - GPIO keys (Lid switch)
> > > > > > - Sound via internal speakers / DMIC / USB / headphone jack
> > > > > > - DP Altmode with 2 lanes (as all of these still do)
> > > > > > - Integrated fingerprint reader (FPC)
> > > > > > - Integrated UVC camera
> > > > > >
> > > > > > Not supported yet:
> > > > > >
> > > > > > - HDMI port.
> > > > > > - EC and some fn hotkeys.
> > > > > >
> > > > > > Limited support yet:
> > > > > >
> > > > > > - SDHC card reader is based on the on-chip sdhc_2 controller, b=
ut the driver from
> > > > > > the Snapdragon Dev Kit is only a partial match. It can do norma=
l slow sd cards,
> > > > > > but not UHS-I (SD104) and UHS-II.
> > > > > >
> > > > > > - The GPU is not yet supported. Graphics is only software rende=
red.
> > > > > >
> > > > > > This work was done without any schematics or non-public knowled=
ge of the device.
> > > > > > So, it is based on the existing x1e device trees, dsdt analysis=
, using HWInfo
> > > > > > ARM64, and pure guesswork. It has been confirmed, however, that=
 the device really
> > > > > > has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a =
reset GPIO (eusb5
> > > > > > @43).
> > > > > >
> > > > > > Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > > > > > Co-developed by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com=
>
> > > > > > ---

[snip]

> > > > > I think that you wrote that GPU isn't supported (yet).
> > > >
> > > > GPU is not supported on SoC level (x1p42100/purwa), not device
> > > > specific. The idea I suggested to Jens was to mimic Asus Zenbook A1=
4
> > > > as per discussion abou purwa GPU and purwa firmware in general [1]:=
 to
> > > > already include correct filename and firmware path (since these are
> > > > known) such that once SoC lands the GPU support laptops with that S=
oC
> > > > will gain GPU support 'automatically'. As nothing consumes this
> > > > property (on purwa) just yet, adding it already does not cause any
> > > > harm.
> > >
> > >
> > > Not quite. A14 specified the firmware name, but didn't enable the GPU=
.
> > > This patch actually enables the GPU device. Which means, that we are
> > > going to probe a driver on an unsupported device, using invalid GPU i=
ds.
> > >
> >
> > A14 also enables the GPU, just in the .dsti, not in the purwa .dts.
> > Though now looking at it, perhaps it's a bit misleading.
>
> It should be enabled in the board.dts, not in the interim dtsi.
>
> > Yes you are right, it does give GPU-related error in dmesg, which
> > appear to be otherwise harmless. Perhaps because `x1p42100.dtsi`
> > deletes the compatible of the GPU, hence no driver is probing it?
> >
> > ```
> > [    3.085697] msm_dpu ae01000.display-controller: no GPU device was fo=
und
> > ```
> >
> > Otherwise, if you still say GPU should be disabled regardless, shall I
> > also disable it on A14's purwa variant?
>
> Yes, please. Don't set okay status for the GPU until it gets enabled.

Drive-by: Shouldn't the dtb describe the hw and not the state of the
linux kernel's support for the hw?  Ie. if bad things happen if we
describe hw which is missing driver support, shouldn't we fix that in
the driver.

(In the case of the GPU there is the slight wrinkle that we don't have
a gpu-id yet so there is no compatible in the dtb yet.)

BR,
-R

