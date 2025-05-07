Return-Path: <linux-arm-msm+bounces-57180-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF8AAE6DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 18:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C446018846D7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C086028C03D;
	Wed,  7 May 2025 16:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+di1bRy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA91C28C039;
	Wed,  7 May 2025 16:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746635790; cv=none; b=moz9/QK+kN8jEYHzzR6i6w2Mn0w40+kWUgDYg4LMUZ4tPqSFnBf8+VFhP7CebthqhVhq3ekRJ4usycddJ5Vera+Sy0y6wPJHiDuq1mCT+IUiFukU4Nx4eCwXmmDtDUMcxHxc2jBjdx7dtBYTobVsLfwnDw8Gd29Mv5VoPZqIjLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746635790; c=relaxed/simple;
	bh=jodQBOUHL1Gt952eiPBvOHE9pzfV95ZMyn2l0xgzhNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DuSLf7VWnPY+2EGXXrX99PHEHlub57OqPDWko8jlydnRCMMpTpaf1Znutdff/YDBmSmcEhbe6KA6hiFzycmzfZktLwwyocAAK7tJAl5NmCYv0drpgeAWmsrhR6PeuDMcJbgcGE/RLs1hQIYrtE5q/HnwEiKL3287VH15MvEgMDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+di1bRy; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0b933f214so60373f8f.0;
        Wed, 07 May 2025 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746635787; x=1747240587; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=axt5Qbp2mD3JDBMkh2CUDM68i+V3fWWqBODx7JRunlE=;
        b=X+di1bRy4H0E1YI5jauGFNQ2Nmsz5RbAd2Po/39/HscWNC+omMPJN6NyiluKdYKClS
         gKkdIlLYadh0beLMtDIxP1GzyPn6LIH5Wbd2QdolQ4A3RZB8+O8O9X+HahHdousyWiIj
         U4mTdT28rKE34v3Av0RbbkW0zPiFOjCAdzmnKQev5pocoZb1y1zUTbFnhxVWuvkBwYnD
         QtbRlE2AU6cEU/ODVwqnT0QDAoIc4htRV6BZPJYIb4y6SgfiGOqCqXRq95j5KWvtHpNC
         NnbErISEVvDiW/O9NFWNBVMa8S0neqVpao5JKZZEQfPUbdMvMCWEnFcsWN+6XaYrAuzj
         YVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746635787; x=1747240587;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=axt5Qbp2mD3JDBMkh2CUDM68i+V3fWWqBODx7JRunlE=;
        b=oGYWXg4zOhmrpsDg0GDSL+7ISVVTzskCjMdZj50Cs9WJz4vNfIenYVN5e36qjIPBJb
         K4ozJh02B1OChkZ59hVovv+fBfDCdeDv5R2voVhDhAcg5swe6OKbgdgXQWU8dRtQNwB9
         oQPhVrBE/RbmdY5nDqz+6wcq3jxgniR/mAFF6SQKujbzXQMuUJZqlzCTRJX0M4gtemVB
         4GdgtCp3oFTMuUPondULodJ8XQ/8G4DFFL437BXbalA9o9Yw8RlZVO7FCtmh/dIksYjk
         R8/Nghwmtc1XVRZGvditLDHo2aKPS/7q75x5yPzkq2iXzJouLwlU4b7p1IqInTSwTflS
         jS0g==
X-Forwarded-Encrypted: i=1; AJvYcCUU/l9xpj43IXDZwluuB4X1YeBvAoqgBgE9vApoUgu/v1h7BfMpjy5+2WyF8qu0oNW6VW2KN8osvKl3@vger.kernel.org, AJvYcCV1YILll0+0qjPfsxh8p+0L/2ouF4tnG687rWtiY8IJ7I6RVcqiP9bjh/vRHZDSrYnSpLPACWu9urM5Lrjf@vger.kernel.org, AJvYcCXVo9uOL3Tcw3gUvXR0+moQiPBq24DurF4hwytIKw5yXwNymTjAatwtXh6wxtQ+jCMoPyW+841oBWFH@vger.kernel.org, AJvYcCXsuFCoZyqNsqUEgs3Mbz1OPuEYocLt0yN7nLjsjIzhhfCp+MbfDH534pwv2AHLCJ3eUSB+21TlQqs1BM/gPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw07RrKca0qwJnjsamrP//gkrViFUNi1MzF9xBhcENUXwv/KpSU
	IsZ5ZGLV5o6WYu7ZCCtdVE/DVgPn8fwMsSHZeFWH0JHeIW8d9g58wZBP44y2Y4K3/YwH3fktb9C
	pe4ocT/ivr7wiejQBYnJcFPcEjg==
X-Gm-Gg: ASbGncv/qXHWYRzHrbkYH8EzT1qfdGbvaTJrJShP0jdK4v0O750/e7yaz661b0AMTcx
	NaWR+FLOEhtEBUGtuaRaI0qDZzKMo2QfjNwl792e/2DiBSC8XH8ycMHTE0y0GvlGdR1/HcG1TWe
	Enfm8thxJRZKWmgPKb7cYKMaA=
X-Google-Smtp-Source: AGHT+IG4TtEc4UHcL2gxaRWi5FT3jZwhYmsgKbgjQKUE4+xfZUIUK784DIMLSgMmX34KKba9PPpbydZq1seoxRWbt+U=
X-Received: by 2002:a05:6000:ec6:b0:3a0:b4fa:e594 with SMTP id
 ffacd0b85a97d-3a0b4fae636mr3071542f8f.33.1746635786642; Wed, 07 May 2025
 09:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250426130203.37659-1-alex.vinarskis@gmail.com> <174659505811.5380.3561194017032215136.b4-ty@kernel.org>
In-Reply-To: <174659505811.5380.3561194017032215136.b4-ty@kernel.org>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 7 May 2025 18:36:12 +0200
X-Gm-Features: ATxdqUGYO_K7swrC_4mSQOoLVgxcVoKQsspTBMQaet4mxzcKeI5SjbJ6I6HJ0wA
Message-ID: <CAMcHhXq1-=JeNspAZ61W0JqtjPkoKSi2W1sL07hoVsqFu5T--Q@mail.gmail.com>
Subject: Re: (subset) [PATCH v4 0/4] X1E Asus Zenbook A14 support
To: Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, maud_spierings@hotmail.com, 
	dmitry.baryshkov@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 May 2025 at 07:18, Bjorn Andersson <andersson@kernel.org> wrote:
>
>
> On Sat, 26 Apr 2025 14:57:56 +0200, Aleksandrs Vinarskis wrote:
> > Introduce support for the mentioned laptop.
> >
> > Particular device exists in two model numbers:
> > * UX3407QA: X1P-42-100 or X1-26-100 (as tested)
> > * UX3407RA: X1E-78-100
> >
> > Mostly similar to other X1-based laptops. Notable differences are:
> > * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
> >   and Qualcomm FastConnect 7800 on UX3407RA
> > * USB Type-C retimers are Parade PS8833, appear to behave identical
> >   to Parade PS8830
> > * gpio90 is TZ protected
> >
> > [...]
>
> Applied, thanks!
>
> [2/4] dt-bindings: arm: qcom: Add Asus Zenbook A14
>       commit: 9f2ae52acd5e6c95ddc55d1cc67f44860940a21b


Thanks!

I saw 2/4, 3/4 were applied. Is there a reason 4/4 was left behind,
eg. Does it have to go through different trees like 1/4?
I also saw that another later series with dtb changes for x1e devices
[1] has landed, so 4/4 of the current series won't apply anymore...
Would you like me to rebase & respin?

Regards,
Alex

[1] https://lore.kernel.org/all/174659597008.7675.2301017495937908497.b4-ty@kernel.org/
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

