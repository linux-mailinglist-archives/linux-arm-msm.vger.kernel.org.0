Return-Path: <linux-arm-msm+bounces-55814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D05A9DA82
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 14:14:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2C77928259
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 12:13:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4460B22F776;
	Sat, 26 Apr 2025 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9BQYtSa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742DC1F8ACA;
	Sat, 26 Apr 2025 12:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745669648; cv=none; b=kDEun2SpwWDXL8LKpG6EFw8V0aDs/itL7jUn1QFoDMAFmLmFPAoYdA1eJXNGNpl73tkMcgWuBQG77n0jTXhYd76I8qfi5D1v4BrH1VM6D43MX6rJdRLifebPCjdPZaKFi+Mgwo8nS/I20cMPZ7NKPMpb0slcWy9776YGDod03Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745669648; c=relaxed/simple;
	bh=tHR2ncmKak9quhJ3NJQqmiDOJ+7stReEKBw5PGBT/Ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fXQtoCGnkzz7w1H6EcdXu/VpahkmEauYHo1RQlEqfvwVLcd8EJ3gZp1bR3mcTTDfY4Eeq+6V7twjIAWn1iC4NhgDbjUqcKeXMYfd8ivSPX4kaL18FiYFyjhx3HX7dyyYLS1UwthEo4UqFy6KZe4Qhrv5uT6l4vMVML3eWXojU1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e9BQYtSa; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so3405739f8f.3;
        Sat, 26 Apr 2025 05:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745669645; x=1746274445; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iqHO8e/kxK05Q6w+crpG5qUQ8aCaFtVXM157XelPMI4=;
        b=e9BQYtSaEREhVvs5KStqv3uCitfbmGl1+e9xMGsEQ6oU6aPOVYDCFLmu3pPZQPlLxZ
         1ASUYAY4omKCLSUM/lMbYUd6cTE6dkQSGdTj1BXYGjhdeuzu4uWbWrgYCpwV10Ygl8mR
         XdlagqeqeTzQXv5O+HMR86GVKDA5hcj5xpbABmrVpRHvN/QvKpkD1zAgtc23al3twPTX
         qG7EZFJ5dLhCFXUdTQRqSEQNmYHMiHgaORImRHmIFHcQFVCa2/LFxAn87DINJn38Ohjs
         5jvo2NVG6VRy3tUkGwu2D9YtdaS1nmI7/IC0UHGOaQe4wyRCDNEvDkAl5PgSiHnU+V0E
         yDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745669645; x=1746274445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqHO8e/kxK05Q6w+crpG5qUQ8aCaFtVXM157XelPMI4=;
        b=LPVDdXY2nPI5evb3ww3FFykrWhyiEvuA1mpwzBKCQeLb1eA7azylhM0fvKWlk1u6v9
         fIevhZrd8KXXWlIEDHHZ+kt1fxT2/HNmIsXuyYT47Xspv/AQJrO8C6bEkv2lCvjzkndQ
         KwyIsWiELyS3RcIfnVNVv/RT+Lj6PHMfM1M5QomOFsDvqi7bVUjy6dJafVKIInIx4AIh
         dvgQUmXfUxSNe7BkE+3ByPoUXp5SGN8lxMOv873RTNz1jFtKzaIxURh2t/so3xOlZfN9
         3yHBxWRZIfIzEKu4dBr35DGaYgWYObm+bCsCTuJ8y8IY93QdCFPlWOCk0FL2udQk3LtJ
         uLcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDFtqE7ur1K6vgNywdwUrDzP0QHbZb+ffobAPczho6dFkJQWEEqbocOeLWW6x4mGeGXdQPXSV14+WK@vger.kernel.org, AJvYcCUKju7ZpOO6THAypExtRAFHccnNTZPF0s6x5M/gYqZJMHBIkiafvnOx+Wu3xEomuQAhagpbn1uLojXEdIIAcQ==@vger.kernel.org, AJvYcCWLPwRrDYg6ykrgatjMrKIcqc/bQxtkSJtbflf5JzWsjT8lMd6V3x3OL0WWqM8fw3CfHyWdnFPCT6Jw@vger.kernel.org, AJvYcCWjibkWaw2efIKtI7S/kk1e6CDcPeA5JLRPi72Xt+wW5o06z82LcBuMYwN6fsKQkGm9mBV0MyQ6Jy3ZwCNE@vger.kernel.org
X-Gm-Message-State: AOJu0YzubJZ7gNxAfzFhegaJJx5t2XSP3yuCOTfUZNxGe9+TK3ZtvaVP
	Z89uxEkw2O+6nJZ7GU9jzeZzbn+rX9aX4M8iuOqDQNOWMmUB+Yt33p+8kZCIwxPwWW19XdxXw5D
	kG8uSY9TKDpHIH8hdEbPlTOLuPg==
X-Gm-Gg: ASbGncuCTCplOFgHqAJ43CsFkLZiILqxYZSp6gvSiEjluDU5osQOImxFZGgXI+lnvNQ
	z5AqA7fWki5/JKLpYRw0xX5IXQjRSGTjLN0Do74VTVQ/pd5wGkOzK+bQihui3x+v4hJT4T4NDA5
	8Y+1+ZsH84AvtxBuO4U7zxVw==
X-Google-Smtp-Source: AGHT+IF/Uwo9o99laUdn8MB2fPZ83NF09SfGpOWI1/rYVHd/7bhwDYks2rvdcwjz9aeLhGR2GSYYkPGqKJUNiMiPcdU=
X-Received: by 2002:a05:6000:186c:b0:38f:4acd:975c with SMTP id
 ffacd0b85a97d-3a074e4196fmr4145681f8f.27.1745669644261; Sat, 26 Apr 2025
 05:14:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416232345.5240-1-alex.vinarskis@gmail.com>
 <20250416232345.5240-5-alex.vinarskis@gmail.com> <fb21ba17-88ae-4cad-b7ca-57b5e8082b5e@oss.qualcomm.com>
In-Reply-To: <fb21ba17-88ae-4cad-b7ca-57b5e8082b5e@oss.qualcomm.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Sat, 26 Apr 2025 14:13:53 +0200
X-Gm-Features: ATxdqUGZL3TtLLgfstEotnJ_89eWTm5WF8i-XC_jsUGF-CHwe5aTEpaCkVDe-U0
Message-ID: <CAMcHhXreXNFr5vD3rMKZygqfvP2y7=t1OUr8d37O-zRc-quc5g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, maud_spierings@hotmail.com, 
	dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 12:19, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/17/25 1:20 AM, Aleksandrs Vinarskis wrote:
> > Initial support for Asus Zenbook A14. Particular moddel exists
> > in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> >
> > Mostly similar to other X1-based laptops. Notable differences are:
> > * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
> >   and Qualcomm FastConnect 7800 on UX3407RA
> > * USB Type-C retimers are Parade PS8833, appear to behave identical
> >   to Parade PS8830
> > * gpio90 is TZ protected
> >
> > Working:
> > * Keyboard
> > * Touchpad
> > * NVME
> > * Lid switch
> > * Camera LED
> > * eDP (FHD OLED, SDC420D) with brightness control
> > * Bluetooth, WiFi (WCN6855)
> > * USB Type-A port
> > * USB Type-C ports in USB2/USB3/DP (both orientations)
> > * aDSP/cDPS firmware loading, battery info
> > * Sleep/suspend, nothing visibly broken on resume
> >
> > Out of scope of this series:
> > * Audio (Speakers/microphones/headphone jack)
> > * Camera (OmniVision OV02C10)
> > * HDMI (Parade PS185HDM)
> > * EC
> >
> > Add dtsi and create two configurations for UX3407QA, UX3407RA.
> > Tested on UX3407QA with X1-26-100.
> >
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> > ---
>
> [...]
>
> > +     /* Left-side display-adjacent port, PS8833 */
>
> nit: The mention of PS8833 in the comment is rather uneventful given it
> says so right below it as well

Good point, will remove.

>
> > +     typec-mux@8 {
> > +             compatible = "parade,ps8833", "parade,ps8830";
>
> [...]
>
> > +&uart14 {
> > +     status = "okay";
> > +
> > +     bluetooth {
> > +             /* TODO: add pwrseq once validated */
> > +             compatible = "qcom,wcn7850-bt";
> > +
> > +             max-speed = <3000000>;
> > +     };
> > +};
>
> Drop it for now, the dt checker is angry about partial definitions

Hmm, but then this variant won't have bluetooth working at all...
Will drop, let's hope someone from the community has x1e variant to
test pwrseq for wnc7850 for a follow up patch soon.

Thanks,

Alex

>
> I think it looks ok otherwise
>
> Konrad

