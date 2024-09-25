Return-Path: <linux-arm-msm+bounces-32467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F0E9856E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 12:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 437FDB248F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 10:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D82A4158DC3;
	Wed, 25 Sep 2024 10:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IivE4xrD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1394C3C099;
	Wed, 25 Sep 2024 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727258737; cv=none; b=dBcx1XDZCVrRrEZTPDCGxGxoh1AOSN4nW/PHIWqA/R+k/zwiUiVkfKEXBPbmW2hYscOlfdmrkzSfT7L2ZScDceU74gzVRXFS9lDXQeXD1/m5L+MDzmoOir5PtlsGqBqWUw6w96ZTGegURSE64LLpwCcwzFkoPR66Io7DhK557EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727258737; c=relaxed/simple;
	bh=PMGr4ub6WyUP7/n9CvwU9x+gaOcYwN+0wSqoGS1kqJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sj0l8U6Jbdzfx/nzd5fros+08veqLW4gpfbQSIG1l5KA4aKZRdVPXfy0vN8WF6t37aZKmzGm/xbjQhypyrGdX9nTdYzmUNrzufFw1QZU12Df1v2fz1LAGjciq1k/jKH74fikVDDXh/wPv+e0KUZgSQD6jI/rQo/9SLILng9r/hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IivE4xrD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso65018285e9.0;
        Wed, 25 Sep 2024 03:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727258734; x=1727863534; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l9MaGQVXr2fBdIQIs313PlGTY+3M+szp1AAgBMhPxZg=;
        b=IivE4xrDigE29PrlNcqiulK31HA9IcbbN3+cS/EpnlfM0cmCVd//6K7ROV6+WKoAty
         159YERCDoeEZhH54n1QQtSDjI9n9qWpBoYUNGDyJD5hC0ENHgTdVTjWFV5liye8OTqsZ
         MsiyFLAv06gwnQrbrAeFfgpkfanEuZZUzukRrNCpgK6Pi7/o0HUwq6q8hzIu4WRyW5lB
         3DCzm9BQ2jvENwVZbWS7k2iHEgC0cofuT4JPjQRzjTtRG4FJ1Sq6Mh0JWTuOqUECxFPV
         JQ3/aWt+i9Cd9lGjvEnAH9CF/XykSTHuBhqnxe6o4FVIEF4aCjRy1j3JmjGjaSoXPyKk
         QJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258734; x=1727863534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9MaGQVXr2fBdIQIs313PlGTY+3M+szp1AAgBMhPxZg=;
        b=pBrIdq/iZE5j84uDhbxNHI7/bPor68L3mrY2ddkRyVQhsKXuo5bWGWtSyg+ezQklnE
         4Q6wYQIZ+S2aOvgsm1Gb+f+RZPYnWU3GhUWhhxi4EESEMLhSK5MjFuCprt7w8Lmic/5O
         liw24pyvPLTSzeGF7YLs2b7iQbPL9vUR2OWDydObjF+0uILTdIfk5Q4bdz6bZJE1mrED
         vE+pSWXSqFqwxDTkluQKag2pS2zciuihVMx83F7ImYPpfwkS4JQDFyZjKKWfbQ+oYcsA
         liNAR+IsnN2LAxs/4iGrQUmxN1KSlbetxgCxCjGzPeDKT2N85vtfdwtf+A+A0XVsxXqb
         PUnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQu2PqGcCl3TQeqeS44FSZc7oFHkhH+wN7nlFhaXH51TXxMi6rB/Z2G6ZoFqUMmcFJC+MDL0Hhqm3R@vger.kernel.org, AJvYcCUpBbtvr4+nG6GUFPOuAtXFtCS5AHvW1S607MicZ+T1xZTbGb+fCmL5wrzPRD6oACjkeOnqJ8MATVrTM5bNwQ==@vger.kernel.org, AJvYcCVsQ7G+U5GyH5o+VvSd+Q+pJgiER2di0M3gVJjaIlrRRnzXrubwJSuVwtVoh56B8DJcwBxdkAGpVcKzWa/O@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZLtjXF/LPSh5qMLOq6IEwS0kDibbvKRHH3QY5Rufr/pwMCNs
	ktucsFiAnlJzMNCr3uajFs3ibw0UbCUbLQeDVC635hh8CXsLEtwOlhYqdkVyYUPVKGGWuDLff67
	wKM2azZPRvBfCt9fQWRkufbMN5FkV4ZtCjvI3t+A=
X-Google-Smtp-Source: AGHT+IFD3rqkaxcetw18lKnk+UeskSAtgzDjLPLjES5a0Y5ajqEQUC4mAc1J7/76mm4qltVqWD6J7AJqjasPotKXRBQ=
X-Received: by 2002:adf:fc08:0:b0:374:c847:86d with SMTP id
 ffacd0b85a97d-37cc2467801mr1388393f8f.16.1727258733767; Wed, 25 Sep 2024
 03:05:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240921163455.12577-1-alex.vinarskis@gmail.com>
 <20240921163455.12577-4-alex.vinarskis@gmail.com> <effqouni7fmzpag6g6e2t6uq4tltjiufynjhym3rmrpylezydt@ipqglqizisqr>
In-Reply-To: <effqouni7fmzpag6g6e2t6uq4tltjiufynjhym3rmrpylezydt@ipqglqizisqr>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 25 Sep 2024 12:05:22 +0200
Message-ID: <CAMcHhXp=nw8XXNFdw+a7+qcMbJVvkqzBcgZo0fombokBj2tD2Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Peter de Kraker <peterdekraker@umito.nl>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Sept 2024 at 00:15, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Sat, Sep 21, 2024 at 06:33:33PM GMT, Aleksandrs Vinarskis wrote:
> > Initial support for Dell XPS 9345 13" 2024 (Tributo) based on X1E80100.
>
> Very nice.
>
> >
> > Working:
> > * Touchpad
> > * Keyboard (only post suspend&resume, i2c-hid patch WIP)
>
> Hitting scroll lock/unlock on a USB keyboard once fixes this issue for
> me as well. Looking forward to your WIP patch.

Thanks for your review.
Just submitted the series [3].

>
> > * eDP, with brightness control
> > * NVME
> > * USB Type-C ports in USB2/USB3 (one orientation)
> > * WiFi
> > * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
> > * Lid switch
> > * Sleep/suspend, nothing visibly broken on resume
> >
> > Not working:
> > * Speakers (WIP, pin guessing, x4 WSA8845)
> > * Microphones (WIP, pin guessing)
> > * Fingerprint Reader (WIP, USB MP with ptn3222)
> > * USB as DP/USB3 (WIP, PS8830 based)
> > * Camera
> > * Battery Info
>
> Adding the ADSP firmware gave me both battery status and info, but
> perhaps you're hitting the previously reported issue in pmic_glink?
>

Could you please share a bug report for the mentioned issue?

Were you running with [2] patch reverted or not?
Without reverting it, I cannot boot Ubuntu at all - it is spamming
qcom_battmngr errors and holding services back.
With patch reverted I do not get any battery related info, which I
guess makes sense.  I tried applying [1], however it did help.

There are a few pmic_glink related errors in dmesg, so perhaps its related.

> >
> > Should be working, but cannot be tested due to lack of hw:
> > * Higher res OLED, higher res IPS panels
>
> I tried closing the lid and opening it again (which I believe is what
> was reported to not work on the other devices), and that seems to work
> fine.
>
> > * Touchscreen
>
> See below
>
> >
> [..]
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
> [..]
> > +&i2c8 {
> > +     clock-frequency = <400000>;
> > +
> > +     status = "okay";
> > +
> > +     touchscreen@0 {
> > +             compatible = "hid-over-i2c";
> > +             reg = <0x0>;
>
> Make this 0x10 (and update the unit address accordingly) and we have
> touchscreen.

Awesome, thanks for testing. Will add it.
Do you have an OLED variant, or high-res IPS? Will update description
when respinning to include it.

Thinking about it, perhaps depending on the OLED/IPS variant they have
different touchscreen models with different addresses? I find it weird
that the address was 0 as per ACPI.

> > +
> > +             hid-descr-addr = <0x1>;
> > +             interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
> > +
> > +             pinctrl-0 = <&ts0_default>;
> > +             pinctrl-names = "default";
> > +     };
> > +};
> [..]
> > +&mdss_dp3 {
> > +     compatible = "qcom,x1e80100-dp";
>
> This isn't needed, right?

Indeed. Will fix it.

>
> [..]
> > +&uart21 {
>
> This fails to probe, because we don't have an alias for it, which in
> turn prevents sync_state on interconnects...
>

Indeed. Will fix it.

Thanks,
Alex

[1] https://lore.kernel.org/all/20240918-x1e-fix-pdm-pdr-v1-1-cefc79bb33d1@linaro.org/
[2] https://lore.kernel.org/all/20240708-x1e80100-pd-mapper-v1-1-854386af4cf5@linaro.org/
[3] https://lore.kernel.org/all/20240925100303.9112-1-alex.vinarskis@gmail.com/


> > +     compatible = "qcom,geni-debug-uart";
> > +     status = "okay";
> > +};
> > +
>
> Regards,
> Bjorn

