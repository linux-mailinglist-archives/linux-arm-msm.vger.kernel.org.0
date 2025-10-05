Return-Path: <linux-arm-msm+bounces-75984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF86BB9C94
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Oct 2025 21:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08DB83B8B79
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Oct 2025 19:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D15C1E0E08;
	Sun,  5 Oct 2025 19:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnuYQTmn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FA12745C
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Oct 2025 19:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759692973; cv=none; b=BJd3FITaKhsviM8kdkkgxArafMFIR0aqvYyUThmAOf8ZG6LYwEhijcF6kM6iQnAjdPHs3X9cNNbfNJ8uUq0cCJ0nEMpsFGPP+yh+DWqVtqWV7k/P+V7eUTV4l1ULrKvS4cFJ5qzm5++iZP3C5hIoD8FFp6nph3Y1FU+Ipo6mgSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759692973; c=relaxed/simple;
	bh=HpCPwTV6Ymso2jLvEaOmKrvUbLjDDf+rF1XltKBbEo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gh/Ci+zzICyTV3sOb/LiK3XAjiYTqTVL96es7SvkuXxeuImycywlqPB5EguNuh/pW2Jwth/ABTUkJVgKEymQc0qMjDwzoPlv5UiWOmAGsnSMN7EQGlyuVcRgpkSAwnl4x1Xnc5zvthH/J7uKIsVviy6igpjl9Nn/0SppTZzoT6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnuYQTmn; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-57dfd0b6cd7so5132506e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Oct 2025 12:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759692970; x=1760297770; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B8ByiJnX+QP06S+C98Ev13SN/Q5Wa0f7/4hHRsHwc/k=;
        b=FnuYQTmn26+cBaC0AwP1dStC58+OZP1x5qrT/Ikq2HfFvgfel66g3Co+QjS72KOQbT
         BWdRp3XPT/vPU6s2SQUjhTUe7CCgiMAn/zMEFHEKe7/Uv26Nu2QJ6kAzrKBnKR86T4bx
         n9VpBw4ns6NN9+IHH1bH39cxhhEGVy9sgrFG58yUG6l6DkAsiK/8ztdJYoc4oZGnSweh
         8DB8ApsS4grL4flVePSv1g081o+CEs2C0MHyl78b50rYaH4Wco/zi5Acrtq+6ieR0Cxv
         NjHgoNwPHxOBlARJpkTP4SB/fahH3VEj6PIHLOD0zhhFt+prFEvuzHfk6jzNExRW6bYh
         Yzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759692970; x=1760297770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8ByiJnX+QP06S+C98Ev13SN/Q5Wa0f7/4hHRsHwc/k=;
        b=mrVy4ePr00oTFjO2RPL7Mscn+s9/eXzIr1f/3z4qtqU78sXc9tzXjOOXqaJjb0OFbF
         XdVOH1UEyUpmR55ckHDUh3VuBueZmsEcIlZy+rUh8H1lAhbk/IGqbHrzWjWy5Uxbl4Jo
         qsFo/y43QptHvXfcgCIXqq2MZVQSrbKf1RgYZ2wxj7+H655olIoKrrrDEpA7JrEZo0Qq
         pFswgFXmdKW0odhIkF3xIoyZ8nHA99udIOyXn14hBjFV/i9fNKJxQdpECMZtRWxui+Xj
         lItHp/S0/6nKTHK4Tfoq5XfI23it8HJdq803e3dBPUIQoON488D/LEnPhZ2onTAMha74
         gCoA==
X-Forwarded-Encrypted: i=1; AJvYcCXL/I9aKX7TVfhkvnjmvpy9a6bYTK+jm/+T9z5m7BXjlCWFhow46QuKOU2wgNPi57FETFfRmL1SlelJ6qYf@vger.kernel.org
X-Gm-Message-State: AOJu0YxYOaa19ptsDMO4nNsRLNbx+4uSecW80m7Tcu11btWDXLf0Y0OW
	TTwDv+mBEvjwQWCY6vq8X0ULxppwmH35/ObTLWomUF2jxq3tGAaZFw8KNgmLul958CJdVXdwiyu
	loP2P/PlVzQtQ/dqyeMLnHSDXF1QXF2U=
X-Gm-Gg: ASbGnct9MHyVdowy/57wSSBT5AA9d3UNYqh4ZB3vq/NcEHmKmfd8yeW2WDDCzbM9gFM
	OhAocpdAx3nAcdEtNDcHp+NmG0uaqCm0PsFIY2wzl6A+pgBYzQOKmaYCqFFbVVYIIxVncvqJK0/
	GokafSAmmTy22trtOJVtPZh39QPj6UfY3fDcXHhrK99vRzyWRNv469bHeucqA4UZfFougXeXFFh
	wYF2XEfAOxfhslz29xaeo8TMVzsECBKVjELHtjZfV6nhalsuQf5UxXsC5xyOhgLn02LBTJDZZQa
	h5qMMyp6Xb1MzRnYd08pIKDFqXRTqZguyaJLw111YxU8TUImq2sjQF0xriSxlN0/2kf1e7yMtq+
	Gnwho7CM=
X-Google-Smtp-Source: AGHT+IGeuKU8klCmxB4Wd39ZsY1VEQw2A/8b61XgTuTEMmx63wy7XwkjXnKRo8krqB/HqCUkM+y01HIC7xEEEyhzQ+g=
X-Received: by 2002:a05:6512:230b:b0:585:1ca7:1b7b with SMTP id
 2adb3069b0e04-58cbb255fcbmr3402254e87.31.1759692969485; Sun, 05 Oct 2025
 12:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-9-b14cf9e9a928@postmarketos.org> <42463474-7fba-4df3-9dbb-24140581690f@oss.qualcomm.com>
In-Reply-To: <42463474-7fba-4df3-9dbb-24140581690f@oss.qualcomm.com>
From: Chris Brown <crispybrown@gmail.com>
Date: Sun, 5 Oct 2025 15:35:56 -0400
X-Gm-Features: AS18NWD0klMI-Y0ok5kdj815WG__q8Dt0zdKpCJrqe8wE9-WN-Ydtjc6OrnZJzM
Message-ID: <CABN5=wEpekmKxFCr7nBcYGSt6ZH-g+bx7Y5Nmoo=tMrorz2XBg@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] arm64: dts: qcom: sdm845-lg-common: Add camera flash
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Paul Sajna <sajattack@postmarketos.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
	Amir Dahan <system64fumo@protonmail.com>
Content-Type: text/plain; charset="UTF-8"

850mA looks correct for the flash, whereas the flashlight/torch should
be 100mA based on
https://github.com/EmanuelCN/android_kernel_lge_sdm845/blob/U/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-camera/sdm845-judy-camera.dtsi
i.e. led-max-microamp = <100000>;

On Wed, 1 Oct 2025 at 05:04, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/29/25 7:05 AM, Paul Sajna wrote:
> > So it can be used as a flashlight
> >
> > Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > index a8c8706f2057d36d5ef4130f11d9ad417f93d575..f309e6ebc075a691c7a522238b4a93ba9e63f3c0 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> > @@ -509,6 +509,19 @@ &pm8998_resin {
> >       status = "okay";
> >  };
> >
> > +&pmi8998_flash {
> > +     status = "okay";
> > +
> > +     led-0 {
> > +             function = LED_FUNCTION_FLASH;
> > +             color = <LED_COLOR_ID_WHITE>;
> > +             led-sources = <1>;
> > +             led-max-microamp = <850000>;
> > +             flash-max-microamp = <850000>;
>
> Allowing the same current for flash (brief on/off for night photos)
> and LED (flashlight which you normally toggle through quick settings)
> sounds no less than suspicious
>
> Konrad
>
> > +             flash-max-timeout-us = <500000>;
> > +     };
> > +};
> > +
> >  &pmi8998_lpg {
> >       status = "okay";
> >
> >

