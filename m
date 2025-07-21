Return-Path: <linux-arm-msm+bounces-65841-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B3AB0BC72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 08:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C51E169ABD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 06:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E5F26E702;
	Mon, 21 Jul 2025 06:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aq8cV+t8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C76626E6F5
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 06:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753078931; cv=none; b=cd9MXCNbKpNi/0gpGzZ0o2dno0tpZS+TInwxNgAvsK/O7mg0NBKWHDzHHiGxzxkOrK1SFAQonVp6HYPHtIulW9z4P/Ud0bxweQJTFNndO7NzmzZC3pBc/Y3kkWnVYPs9BH3pHgk4jSk/yysh/i0IzO8VuVtNMTdqjCtCODFPwVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753078931; c=relaxed/simple;
	bh=e/WbSFDNeDfS+LSOj9AgaJuPp6oksM9qfd/sSKFNU8Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=lyC8/rG2NFEZKPCtT77VQZrLctt52MdijJkplIUBpPsLgaW8g/2Z2kBR6CkUSQBpjTIXZjgxbVGXfqRyNucUtY7Q2nyY34ZsHUJH+gITAakUt0SIzWT9nbIcBxubn2hyUxiWOk/yo4LsXpgJeTSawELqPfDr4AjpQ1+wPNJWVz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aq8cV+t8; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so6668688a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 23:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1753078928; x=1753683728; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxlTp2H4f+SSkPB3pjUTlZ/GS1r2OUFTEUF3Vv45kbo=;
        b=aq8cV+t8y3rWHCjiRbl1Fa/PBc1hKt6fQzWP9kVTQ8Lbya1WAwYWSCto1v2ps501YO
         kz6t8IVe7/MxPGy9n/plexfvL9Xk6caeMmH1znATp2fzc9Cu6iYNevRm4g0YE1sT9Z7G
         M9FWnLLkYRmhWd1sOBOmDSS5RSuCLGw6qohCuuUZAmjMoXji/WD400pN7adUslNfF4Ju
         jxShos+hgQ4l1awXVGTZVeaS0YwOCjZ/FBRM6a21Rmo4O9xPTUMLYcKLI5uecb0xdd5H
         GGZEZXu3eB3WpgW//GERqpoAKIvduMvNq01cjq0ompbmiayFUZgCvlBHfDvaoZ5OiXGl
         rftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753078928; x=1753683728;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SxlTp2H4f+SSkPB3pjUTlZ/GS1r2OUFTEUF3Vv45kbo=;
        b=LzaRd81w8p4us27CTLLyFDEXfXFjxxFSVwRNipyIlQtMwtDXccbJ/4st7fDhLSYtUs
         Z9ExtBAExY2vOOy2OTkm7NcrjW0VEmM+TlX3mlVk7y9KYcJdgSSX9pm5N47PfM9sze9B
         nCeV4+yNxgcWo0NaKo1ZbRwCGwWJ768IyJ2lZ26xhWsu/Es4CECEanwoF5FvhcCfWTyD
         HQUeEO3QNWX3WVyiJVBHRvfKW9epkxVgH0Xyhlyp5JUOujO4p57sTMmkuv2XKhIuBEjs
         F1o1VAHertpSNwh4U1VxS6xoknkeZfHyFYdICQpzKk+Mo1jBCvrjBCFA3z6qvMqmstTS
         qY4A==
X-Forwarded-Encrypted: i=1; AJvYcCVueWXqSeqb1yKHH41f3R3fV5xXs2OD3n7dw2QnLyQsqNOUXvQ9qZ+yu9xHLfi1JtZNS3VetYi8g62yYa2n@vger.kernel.org
X-Gm-Message-State: AOJu0YzMpMg5rIezPnIyQ+nR97V0J/2MnW0vbbFJkhgLTzogEwlv1LNa
	a5MJVQVnA4CvDlDMDxx54MY3/twHUCqPcQz5Y92ibYx3ETwQS4aqNYuTGHvEKD96e88=
X-Gm-Gg: ASbGnctLLXcnGF9tqfmlFBSL62861v1DbNSywBJg3VbykR053yE0echCP91Ge/VdH/2
	xZ3max4VqWxPJGcfKb/AjnXkweQDVsqjmSGIduC6wnt/C2nbkUhTOVhQpGp/jOwYKNoGdCvF+zS
	2EgTdIxjJubgSXfD6uMVbZAJ0pKg1L/pocyJJVJbvYyn4SfH+x/tCbP3Z7zntMuKgnJGNXtz/pF
	svihiDwuPQqVGkdC0ASoiBAGCYdX89ajGSsxevdk4geUBmk/9qRWXT+A3gY93A1GcJzmgf8+Rax
	wVh2qO1RJWmuW06k3l2uSeTID8BnBjHv0PLQZOtjSEcA4Tc3RaHrsCsuj1Q8fR+vpvaCpC6yfUM
	1754PRN/YMMbbUNEKozGWb1UrToO9oZF6Q4Eq8ZQHSXadyci2xfUoOv1CwRsSjApD7cnlWwj2xf
	XpiqHdvDCWHJzTCwDE9/0jF0E2noeJG18=
X-Google-Smtp-Source: AGHT+IGWvgXRtNul1EHNPbtYzvjFLipYAjCIlsMOcSI5SACMCOkh5I5JbXvq4SIjNEe0zxTInnpH1A==
X-Received: by 2002:a05:6402:1ed2:b0:5ff:ef06:1c52 with SMTP id 4fb4d7f45d1cf-612859187eemr18924367a12.3.1753078927734;
        Sun, 20 Jul 2025 23:22:07 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f09d99sm4949565a12.3.2025.07.20.23.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jul 2025 23:22:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Jul 2025 08:22:06 +0200
Message-Id: <DBHIM4SA3OIK.PXX6HMDE93B8@fairphone.com>
Subject: Re: [PATCH v2 0/5] Enable USB audio offloading on Fairphone 4
 smartphone
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Felipe Balbi" <balbi@kernel.org>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Wesley Cheng" <quic_wcheng@quicinc.com>,
 "Stephan Gerhold" <stephan.gerhold@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250501-fp4-usb-audio-offload-v2-0-30f4596281cd@fairphone.com>
 <DBDAPORDD5IM.1BHXPK225E2PP@fairphone.com>
In-Reply-To: <DBDAPORDD5IM.1BHXPK225E2PP@fairphone.com>

Hi Mark Brown,

On Wed Jul 16, 2025 at 9:19 AM CEST, Luca Weiss wrote:
> Hi all,
>
> On Thu May 1, 2025 at 8:48 AM CEST, Luca Weiss wrote:
>> Since the series for the USB sound offloading driver was finally merged,
>> we can add the sm6350 dts and enable it on Fairphone 4.
>>
>> A few devicetree binding bits have also been missing in that series, so
>> there's some extra patches for the basics in this series.
>>
>> Depends on:
>> - For qcom,sm8250.yaml & sm8250.c:
>>   https://lore.kernel.org/linux-arm-msm/20250425-fp5-dp-sound-v3-0-7cb45=
180091b@fairphone.com/T/
>> - For dts:
>>   https://lore.kernel.org/linux-arm-msm/20250321-sm6350-apr-v1-1-7805ce7=
b4dcf@fairphone.com/
>>
>> Devicetree patches go through qcom
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>> Changes in v2:
>> - Move num-hc-interrupters prop to sm6350.dtsi (Konrad)
>> - Sort cpu & codec nodes correctly (Konrad)
>> - Remove usb-soc-be prop as it's no longer needed (Wesley)
>> - Pick up tags
>> - Link to v1: https://lore.kernel.org/r/20250425-fp4-usb-audio-offload-v=
1-0-f90f571636e4@fairphone.com
>>
>> ---
>> Luca Weiss (5):
>>       ASoC: dt-bindings: qcom,q6afe: Document q6usb subnode
>>       ASoC: dt-bindings: qcom,sm8250: Add Fairphone 4 sound card
>>       ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible
>>       arm64: dts: qcom: sm6350: Add q6usbdai node
>>       arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB audio offload s=
upport
>
> All dependencies for the patches have been applied already, so this
> series can land as well!

Is it still possible to pick up the sound patches (1-3) for 6.17? Dts
has been applied already.

Regards
Luca

>
> Devicetree patches go through qcom, the rest through their trees.
>
> Regards
> Luca
>
>>
>>  .../devicetree/bindings/sound/qcom,q6afe.yaml      | 13 ++++++++
>>  .../devicetree/bindings/sound/qcom,sm8250.yaml     |  1 +
>>  arch/arm64/boot/dts/qcom/sm6350.dtsi               | 11 +++++++
>>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  | 36 +++++++++++++++=
+++++++
>>  sound/soc/qcom/sm8250.c                            |  1 +
>>  5 files changed, 62 insertions(+)
>> ---
>> base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
>> change-id: 20250425-fp4-usb-audio-offload-e5d7fb55d283
>> prerequisite-change-id: 20250321-sm6350-apr-15f3e7e4e5ca:v1
>> prerequisite-patch-id: 69859554c94de52068406dab0d2869ca26072c78
>> prerequisite-change-id: 20240809-fp5-dp-sound-b3768f3019bd:v3
>> prerequisite-patch-id: 2d8997a2be02cfddf3a054c79e7eb308a6d06710
>> prerequisite-patch-id: 1b7c8f00ab50ae71c0221868578b9c1dfe939e4d
>> prerequisite-patch-id: 4fd0673c4d35c1fefce63ec5785ff5ea67cc3d3a
>> prerequisite-patch-id: f5ec3a893de19900f62dc691d83986f1104914b0
>> prerequisite-patch-id: fce7573c39e768f7a09c002064b6159b8e91161a
>>
>> Best regards,


