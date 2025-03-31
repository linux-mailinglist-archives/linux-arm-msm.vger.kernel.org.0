Return-Path: <linux-arm-msm+bounces-52893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84334A76F33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 22:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1F86188BBF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 20:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3B82185B1;
	Mon, 31 Mar 2025 20:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZoA0utL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB8C217664;
	Mon, 31 Mar 2025 20:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743452883; cv=none; b=Hzc22ijfBETppyRm5DsEx1wmrILzZQ8JcpFWBF50axqHUsydxe+YTNIuJDQCHliQOFxyMOrjsTJCopvxJB8gtGZiMMlHlw/j3by3oWKSaDlZIkVl445wcvy/3aSlQ7M9tFO2mT3x7G6O2TtyDijl5/J2zVtkR0tdd65RJ3gyPyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743452883; c=relaxed/simple;
	bh=PguanBqMDkb5To9BTN3sgW0idJGAj6XtvhMWRpcqrEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RO1BHfu5cBuzdgtnT/AnCx2kgzrjYWk37PgRrvAM+9clcu7f8DX4cC+op7svx5UA7qzbdMJVB5fsVbD9GbpGqnQ8a0SzfouxJsyz4XP17PP9Ded54YOnFLV1gcXzczdU5EQmtIG0qI/h7GU6XFLc3fahBqRuJRrmz37sgQQFxuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZoA0utL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3851574f8f.2;
        Mon, 31 Mar 2025 13:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743452880; x=1744057680; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QUt09F+DYIFnC8f7XCRnOh1byr9Dt+QFf/4SpMdh7mY=;
        b=HZoA0utLuFN2BrJ95ZDkBizPVqRHTMNgdDxGWJczPGza6qpKP4RdteZ7fy71RskKPK
         KbGaOJL+iDpQgiq+IvLpaEZLjAQlrnS1OzDIbGNDtzpsyVMpYiZdzD4xBEOGtwNdXOVP
         rGBQSWrGw5Q5GLNyTWGpgngMw8qSwJ5bo1W+CR/+5SxiQaUhf9dxTlvN/Jy013Zvm2eb
         7xVIZV/FoC7DvJAyk77KhWuOqZy01tTBxyXPkr+3Yy3klal4KoIgUbCFrIaJQBlmvvnQ
         jYixHaVHjXHuKlffqYij6DxViMig5LVdzkczw0h/zlBbBf3/5ilQrFC5NmsU56DSVvIo
         2czQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743452880; x=1744057680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUt09F+DYIFnC8f7XCRnOh1byr9Dt+QFf/4SpMdh7mY=;
        b=xIdq+kxhGoQqJVWqORXduhdp3qdGAedtraLbpzMj4+bdTpmgSEqe5Nnd260CTIDT3U
         +pA4in3BkZUw+vQgKCQhLLrKuIDruqJdz4xQutfSeTyZJmg1NI1fVyg+T1xKp4T0HmAK
         n+LqtrdVQBUIVkMrHp1G6IIiwzr+H9OtVgw3tUqBDO8L7bMWqwi54hgOQj+npLBy+ZRZ
         zKguL6u0cDt/MYQsnLOqoOI5T7ViXaUh3lWM+Pz/1Dwc+5NZgWEO//fi4e6gujT7crFz
         iFyE/2yDF7YzFNwdJrU/xE7mVUjbDipiuPD59R99G0bszdfbXGXHaO607Q+dycPPl/ZG
         7Wbw==
X-Forwarded-Encrypted: i=1; AJvYcCVCX4VnzFeizDKQxKOTKziaOuDXTRG6n4qrxJzaRdBT+4TcesUhll+L0XVU4u9tv8hx/vvy9X3Q2u2JN7nN@vger.kernel.org, AJvYcCX3IF3trOOy4BJvSaMpKI4VdQK0kc3LRpU7e67pZvpSVBEKF0SZsXkiCTFU9gbJALrHypyfvXxq0AiS@vger.kernel.org, AJvYcCXisxc3nxFznaeEvlAgTAukqZ1HdVHMDM9iqhofEI/NwhCALH335/WyqyxlpJbdJ55Jb2YrG8txWHEUX4dgWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpzcwFB+dHTE2llz9/gPZc7RkZESu9cohnIol0KrOuHQxkMXiF
	INxlgiC4UCOakUrTdo4OvDvSQZnenB76YXbZmWKX8CosqZL6aa1L2NKWB5rjbC8o4hJ84OAOtH2
	mOKHxykcpTYfWMIO3fup4KTbdpw==
X-Gm-Gg: ASbGncvxKTWcNnMmCKuVG40oH5Muw42zw1qv8zxc021NwZ4SzGDkFeCgl1Dy5zY37qJ
	VN5sekhRhUEqeXdUOxAyZ0y8LsXPuDpc9EHVWCLwpt4VSp71wzVP2YSF8u/C9gdQIrwlGbJek3A
	qFU85zIZ2KqxNDMABi9V0GT6AUvg==
X-Google-Smtp-Source: AGHT+IGZ7aD+wTuJCUUTIE2voBO6WaNR+M71hW0FwWuRHRO+nbuXUQt2yRpKAIAzsQ1Ki+hHiXULVp/okC5PD1K/ujA=
X-Received: by 2002:a05:6000:1848:b0:391:4b8e:a200 with SMTP id
 ffacd0b85a97d-39c120e3f45mr7986223f8f.32.1743452879739; Mon, 31 Mar 2025
 13:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331073423.3184322-1-alex.vinarskis@gmail.com>
 <20250331073423.3184322-2-alex.vinarskis@gmail.com> <Z-pN1qloL2m4BWaq@hovoldconsulting.com>
 <CAMcHhXq9W64MHhOV5i3U4t+ZfKNC_GaBq5X3ZN7VOLt0cjPQPg@mail.gmail.com>
 <Z-p1uADNVAM9NcAW@hovoldconsulting.com> <CAMcHhXqO2Ej3UAej9QodX1NNCHAk956++=oakPxx-MkpOucJ2Q@mail.gmail.com>
 <Z-rnvSKEysdDyj4s@hovoldconsulting.com> <siktv5i4fnkbjgzfwkztp3px3cxlhxuoxssmksr4ww5voe5heq@ttzkhisnyxl6>
In-Reply-To: <siktv5i4fnkbjgzfwkztp3px3cxlhxuoxssmksr4ww5voe5heq@ttzkhisnyxl6>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Mon, 31 Mar 2025 22:27:47 +0200
X-Gm-Features: AQ5f1JrvxkAG2q5VhnZZeDDpnCGBUwNe0xLpshq81zgzYXlp6gvsgRPSqtO2KTU
Message-ID: <CAMcHhXrUZxG07OOA20FRkO+j+U0iiT0B4CpRaV2uZ0dwfyQpYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: x1e80100-dell-xps-9345: Add
 WiFi/BT pwrseq
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Johan Hovold <johan@kernel.org>, "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 31 Mar 2025 at 22:15, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Mar 31, 2025 at 09:06:37PM +0200, Johan Hovold wrote:
> > On Mon, Mar 31, 2025 at 06:51:03PM +0200, Aleksandrs Vinarskis wrote:
> > > On Mon, 31 Mar 2025 at 13:00, Johan Hovold <johan@kernel.org> wrote:
> > > > On Mon, Mar 31, 2025 at 11:38:25AM +0200, Aleksandrs Vinarskis wrote:
> > > > > On Mon, 31 Mar 2025 at 10:09, Johan Hovold <johan@kernel.org> wrote:
> > > > > > On Mon, Mar 31, 2025 at 08:33:47AM +0100, Aleksandrs Vinarskis wrote:
> > > > > > > Add the WiFi/BT nodes for XPS and describe the regulators for the WCN7850
> > > > > > > combo chip using the new power sequencing bindings. All voltages are
> > > > > > > derived from chained fixed regulators controlled using a single GPIO.
> > > > > > >
> > > > > > > Based on the commit d09ab685a8f5 ("arm64: dts: qcom: x1e80100-qcp: Add
> > > > > > > WiFi/BT pwrseq").
> >
> > > > > > > With that fixed commit f5b788d0e8cd ("arm64: dts: qcom: Add support for
> > > > > > > X1-based Dell XPS 13 9345")
> > > > > >
> > > > > > Not sure what happened here.
> > > > >
> > > > > Bluetooth and WLAN definitions were missing, as at the time I only
> > > > > knew the UART port being used for bluetooth, and was missing
> > > > > everything else to describe it.
> > > >
> > > > Ah, ok. The above sentence looked like some left-over copy paste. I
> > > > guess you don't need to mention it at all since this does not seem to
> > > > warrant a proper Fixes tag.
> > >
> > > It was a suggestion from Dmitry in v1. Though indeed it does not
> > > warrant a proper Fixed tag, as it is something  that was left out from
> > > the initial series, I think it's fine to keep it like this, if it's
> > > okay with you?
> >
> > I think you misinterpreted Dmitry here. He just said that after you
> > added the reference to the commit you based this on to the commit
> > message you could add his reviewed-by tag ("With that fixed: R-B: Dmitry
> > ...")
> >
> >       https://lore.kernel.org/all/ou7w4hvbbz72nzrm45gfhpq2uzkuwpfudqeh2o34tcnbnazxgz@glmuryu5dh3s/
> >
> > As it stands it's hard to understand what that sentence means and why
> > it is there (looks like a copy paste mistake). I suggest you just drop
> > it.
>
> I disliked the original phrase "Derived from: commit subject". Instead I
> suggested a different, more standard way, '... commit abcdefabcdef
> ("commit subject")'. With that phrase in place Aleksandrs can add my R-B
> tag.

SMH just re-read it... apologies for the confusion. Will fix it now.

Alex

>
> --
> With best wishes
> Dmitry

