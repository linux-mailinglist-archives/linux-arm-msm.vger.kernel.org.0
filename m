Return-Path: <linux-arm-msm+bounces-30895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E595796D86D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 902801F26B95
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 12:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD9919D070;
	Thu,  5 Sep 2024 12:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sjnpjkLu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A3B8C1A
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 12:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725538907; cv=none; b=KOOE2mbz1QobEiGWNZthzyfFrZbNLG0jU/Iqw5ENF0k/F5uov4gUPE91WcXJSV8Y+Ktm5oidDA9AOT4Lp4p7D/m5AbbfS+TV4LZ6B+RM1dkq92tERIbFUFUDXwfVnZQrGRZj+3SoT6MHQjLM6xWOHh/8DPWFbS7PBxwtzlpSAAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725538907; c=relaxed/simple;
	bh=F01XbYYcnFz3IrGJAZEt/h6KlLzKcoJy+krrnv7pnJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K4b1QSUosdriRzfU1V118OnwW+ELhFTL3bQcVGnY+Pw7rkQnW2aDNwOGpRCpKpCRRPRqXYHH5HQLPv1s2uFz5xyzLfPnwhq+GisfEx6S/GqcRyOs/t2oOV9/nO5gWZ6/tOcsxeNplzS75KVnOFVoXVpLeJLVAHXQFANTjQZKO+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sjnpjkLu; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5353cd2fa28so822961e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725538903; x=1726143703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TACxCNrG/DopYef41PGhbtqig8LKMsOnKp3kgyqsYHs=;
        b=sjnpjkLuw1INmoHTo4VwdOPWr86OrPYTHyFc/HZSTGlqSL6+lE7mj9xYlg75bPN8HZ
         kzEjJLRDJiWSdnIN1+h+vysHjaN0eg5g+8sesDdqTd/0SCR2K8aCH0mCk++/fKkYUlvK
         Kn3QfRNFsEpaMbjYffJiYlj/lCGEZ2wrhRMOeVV/oduW6/CQozNRJmqwitRz/1FF/JZ8
         NoH7rVr1owoHGNkcpNCl2fSlAmznjPLahN+AK70aQCYIzrM/V4E7Yw6OmgzKejP5ahIx
         TnrL547DbyQFevjgVs4vF/oPJObQD2oKnGr9Gyd8XWe1t2kcYzq4FT12R9hYGL70Rw0Z
         zo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725538903; x=1726143703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TACxCNrG/DopYef41PGhbtqig8LKMsOnKp3kgyqsYHs=;
        b=CoFaAqTumJuKXqrRkwMUBNn7JH8W6EHM0BahH1OqWHXC9ZjH6XubLDb+ncAZam7sbU
         4yRURMNzo7UvPwUFXt0xBoh3l6PP3WoWiY0R9GO0Hjd+AreT2aXyOii4Fljs6FpfuYsT
         XvINIRN/0ua9ALsiBTicBwFf5WXO4ZUkIwrSRY0S8A0gvMxgiOowlwNTQMXuZcZ8RtDh
         AG/KF0RqlqevY732rBW47GO98ys7m1J0UhFWyTYgCklMfH9j+7l8UB2JIST1RGE3Oczy
         Wg8Hw0ZN/KP4aDkU1c165cwq63j/dH+ug3wQukDwwiAFOjYxytYZT4FmQCkGbso7DuO+
         xU0A==
X-Forwarded-Encrypted: i=1; AJvYcCXVRmr5hSFmDFLMxtmL2SgABJwVJq2Tu7YDAc4ZgujFrmEMCisYQQy4cGKZ/oFSU97FwCxyGUmS9O8YrN96@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ9aH9SmEgQif2JAYfqFfWe9xWUA0yLw/+Px3ZQXAxofwMRHFT
	IaYlrsGh1RXkIVQYdmwbZz/eeSpPXbKZn3xxK5o16gu1SrjE1JHj64upvESdfBZR/6dVwY59Vpe
	bzOA26sV9L8T6itOwKuoNgnDdvmltZLrJdlf7VA==
X-Google-Smtp-Source: AGHT+IFcMMTAuv+S+5/9hcRxIAh41Pmij3mBunr6XibOfsaQXElI+A3yPmhY2q3bx6emgGpGca4XjRlTGGn+3XPVLNc=
X-Received: by 2002:a05:6512:3e06:b0:52c:dfa0:dca0 with SMTP id
 2adb3069b0e04-53546ba0eabmr12703593e87.43.1725538901776; Thu, 05 Sep 2024
 05:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240903093629.16242-1-brgl@bgdev.pl> <20240903093629.16242-4-brgl@bgdev.pl>
 <lpjfpgnbhrp3u4rqczoouf2kvktdigisi3sjhfstanw4t5g2sc@fvqana5gftds>
In-Reply-To: <lpjfpgnbhrp3u4rqczoouf2kvktdigisi3sjhfstanw4t5g2sc@fvqana5gftds>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Sep 2024 14:21:30 +0200
Message-ID: <CAMRc=McmnXe83bsRf+uivV05Z_dv8V9ox5Rx3kGH9O1eDpka1A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp-x13s: model the PMU of
 the on-board wcn6855
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 4:18=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, Sep 03, 2024 at 11:36:28AM GMT, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a node for the PMU of the WCN6855 and rework the inputs of the wifi
> > and bluetooth nodes to consume the PMU's outputs.
> >
> > Tested-by: Steev Klimaszewski <steev@kali.org> # Thinkpad X13s
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 98 ++++++++++++++++---
> >  1 file changed, 86 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts=
 b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > index 6a28cab97189..88b31550f9df 100644
> > --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> > @@ -400,6 +400,67 @@ usb1_sbu_mux: endpoint {
> >                       };
> >               };
> >       };
> > +
> > +     wcn6855-pmu {
> > +             compatible =3D "qcom,wcn6855-pmu";
> > +
> > +             pinctrl-0 =3D <&wlan_en>;
> > +             pinctrl-names =3D "default";
> > +
> > +             wlan-enable-gpios =3D <&tlmm 134 GPIO_ACTIVE_HIGH>;
> > +             bt-enable-gpios =3D <&tlmm 133 GPIO_ACTIVE_HIGH>;
> > +
> > +             vddio-supply =3D <&vreg_s10b>;
> > +             vddaon-supply =3D <&vreg_s12b>;
> > +             vddpmu-supply =3D <&vreg_s12b>;
> > +             vddrfa0p95-supply =3D <&vreg_s12b>;
> > +             vddrfa1p3-supply =3D <&vreg_s11b>;
> > +             vddrfa1p9-supply =3D <&vreg_s1c>;
> > +             vddpcie1p3-supply =3D <&vreg_s11b>;
> > +             vddpcie1p9-supply =3D <&vreg_s1c>;
>
> As the WiFi is now properly using the PMU, should we also remove some of
> the regulator-always-on properties?
>

I added a separate patch that doesn't seem to impact anything with the
PMU changes applied but will be easy to revert if something does
break.

Bart

> > +
>
> --
> With best wishes
> Dmitry

