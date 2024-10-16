Return-Path: <linux-arm-msm+bounces-34623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABA09A0F13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 17:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1EE4281F76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 15:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09CD20E011;
	Wed, 16 Oct 2024 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eo94hqbZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6031384B3;
	Wed, 16 Oct 2024 15:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729093983; cv=none; b=Z/E6qaxlrNVJ+IHNzlndwV4Sw1yjEukt5ij8+uhvYDzDdR4k3tJiq8Klsn1gTfJ3ENDIwWqDz3CzKTigxMCUbIGfByLCUTfRe2rp9d19widOYSK1Rdjn9tTNgceefG4lW5anxGfGc3ImiZAWTwWbrrr3RsK6PkPhTqDahBDu61M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729093983; c=relaxed/simple;
	bh=FPh6jZxs0IrBbZtVRvslvKBioZsmMoFNj9CMSpT4A60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YegapKfkaArXykJb5AbHY+z07MvpYm2wNqRlwsrKzbmgqOsv8aTVfv3HFFHhg02hzcvUWJei17JKgooL2WIjPOUsyUgkRTmw8U7+7pvHAjc712pbpgGWlHkbGQLq+E1JPbFlVPaZh6kRfBXOmZmJvaRJft+KEMMsUKkllkny7Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eo94hqbZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d58377339so5514568f8f.1;
        Wed, 16 Oct 2024 08:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729093980; x=1729698780; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FyCuyE5iZzyPXH4JBMeN3qOWiKSfUYQ0TZFcy+/kyVA=;
        b=eo94hqbZHGxSt0J22JPKnb2CoW5IQrwVLG6spBa0Qu6Bi03n9TCUE+0Ya98sRNBEkb
         24thWhS6o7/B+4GLwGts1eaXOxlFkFp+Cvtv1JAcb/o3Fxnwzj08/8T+vOTVGv92P4Ge
         dcN1hZ4oCy6xJ2e5lmruy0FWsqs/FGb44ACbuNZ6bpc3RZ6765O/2L/FYWl6XxLPRisq
         9qMTpzEEZO2ApRhpi/Q3FR7Hsgzj8ze99Z4gl2T9lETv2A2bSbyugHTEXQmuD3x8DcpF
         ejufx/vOTHTWyiDMnOWCjPZvkFNC233Nva8i0nFPoMZjxc5uuaa3aegViwit+IUMpgAv
         t0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729093980; x=1729698780;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyCuyE5iZzyPXH4JBMeN3qOWiKSfUYQ0TZFcy+/kyVA=;
        b=kUvoffgvRe7rdOodKxSmQc2GuRq+jadvV8nKaHyQK2TDc6f6Ld3HEZKyqki+1HPzj3
         Yh4QkJbRd48IVnqp/f7Cg3wkr6DsQ9DXTZY5BB7nn3duat0OJVTdXpIBk12ug6vv00T4
         EHR7gY0CuIRCkfJCQckzUhSe708l9oHpwAj+gI6JK7xiUD+kniW+IT/5E75GNV/RmssS
         qDN4RD/C32GaqKbxQIIzxv/4wRTJqBUzWAbx2tqFEMZGSxffRMEHn1AsMRHk67al7igR
         z6ah9mkPdzL4/f3A+iZP68w2i4E2olT5KuJMnl3oP+fET07Lr8wCbIJtfD8E1IojqSr8
         HcKg==
X-Forwarded-Encrypted: i=1; AJvYcCU95d0nnFavI6qRaaZQIw05FrbqTIm7HkPn4wJSbaKFQA2RwjJiD/ZjfKese18Pj/5Y4xtvnrKRwYQfYzu0@vger.kernel.org, AJvYcCVdgyOMlecfBBHW9sGIDDKiAS3MYzsfhrV4Et5rQlglPcnRmeIfAFgbttPjrJs4p91Z3JReIJ6HWnve@vger.kernel.org, AJvYcCWCLhWXVcqM9UHSH12xSAWcZEi220Qhfwi92FkLGnP0I1FixtdNxHo22Li/IdHReppa8Iq5cbTNx2wLwlXkZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6orvN6PGdTh2AyLU19e/FT5jpEuIKiyGySOzPuDfdrAZzEdY7
	2//9q88fWp2Dd2chiU3WybIkssSqipn9x9qCm9Rc+bRqEHPP114e4NH43DakohoHXzyXbw9Oqiz
	GbIVNLJQ20bfKBPhrCqKaTPK7YQ==
X-Google-Smtp-Source: AGHT+IF1Rg6AOnfWRJypfDVK8eVLSHuY0NpfNrk1fT7UfnivSvoafbo1oEnZGTj3z8MNQN3NvBLLMu88FfhdbvLj/t8=
X-Received: by 2002:a5d:5e0c:0:b0:37d:61aa:67de with SMTP id
 ffacd0b85a97d-37d61aa7145mr12802074f8f.42.1729093979768; Wed, 16 Oct 2024
 08:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241016145112.24785-1-johan+linaro@kernel.org> <Zw_fe1tN_rdRR659@linaro.org>
In-Reply-To: <Zw_fe1tN_rdRR659@linaro.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 16 Oct 2024 17:52:46 +0200
Message-ID: <CAMcHhXpu_dFMvKyKO9m-Ls4nyr3HPQ8+X2HrVH_prc-1ao4NEw@mail.gmail.com>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: x1e80100: fix nvme regulator boot glitch
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Oct 2024 at 17:45, Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Wed, Oct 16, 2024 at 04:51:06PM +0200, Johan Hovold wrote:
> > The NVMe regulator has been left enabled by the boot firmware. Mark it
> > as such to avoid disabling the regulator temporarily during boot.
> >
> > Johan
>
> These look good to me, thanks!
>
> Can you or Aleksandrs send another one for the x1e80100-dell-xps13-9345
> that was applied by Bjorn yesterday?

Hi,

Sure, will give it a quick test and mail it later tonight (along with
a few other fixes).

Alex

>
> FWIW, for these patches:
>
> Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
>
> >
> >
> > Johan Hovold (6):
> >   arm64: dts: qcom: x1e78100-t14s: fix nvme regulator boot glitch
> >   arm64: dts: qcom: x1e80100-crd: fix nvme regulator boot glitch
> >   arm64: dts: qcom: x1e80100-vivobook-s15: fix nvme regulator boot
> >     glitch
> >   arm64: dts: qcom: x1e80100-yoga-slim7x: fix nvme regulator boot glitch
> >   arm64: dts: qcom: x1e80100-microsoft-romulus: fix nvme regulator boot
> >     glitch
> >   arm64: dts: qcom: x1e80100-qcp: fix nvme regulator boot glitch
> >
> >  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 2 ++
> >  arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    | 2 ++
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts                  | 2 ++
> >  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 2 ++
> >  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   | 2 ++
> >  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                  | 2 ++
> >  6 files changed, 12 insertions(+)
> >
> > --
> > 2.45.2
> >

