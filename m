Return-Path: <linux-arm-msm+bounces-43071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC189FA499
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 08:56:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EFE916680B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 07:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9F21632D7;
	Sun, 22 Dec 2024 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+T7yZPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69476F31E;
	Sun, 22 Dec 2024 07:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734854157; cv=none; b=MiY+AupHPvMORFYvKrVgEuQ3XOOfn5/HJkJtRq4KRd1PHZWZHuRSNIm7rO/Ba8N8aArmreFn554DW8FSKNsd64KNiOSydpI+fs8vjH8JhdRlhTjK1w4sqwBWkSBDRfYR4oG03Z2pFSLiIHZNmG1MTsAOyR2JsjCltFF3D9KeeaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734854157; c=relaxed/simple;
	bh=M1Vbah9THqC10bO4tCeycD96owB2e4B9+n14uYRp7Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bLEgW+Wrj7uS6eD/dGruAPyMREh7jcSn8OvSW3QzIRF8NcE9CqFx7BLb3qEv3BrI+lCmAd6uxzI5IakxSIcSW+MBRvJAi8FRPVV9DFVKhPfFtQxgtCAoGVn5m+Wxtvxsv86j0dFI7oYGxyHJJ5YX7m8MKUkMecvfjzqKkLCH2D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+T7yZPa; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-29fbba47ca4so1515366fac.3;
        Sat, 21 Dec 2024 23:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734854155; x=1735458955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v5qv1jdP2agz4pI5HNaKvdcQpLRY2HpN9vekhuMUNzs=;
        b=H+T7yZPaDBpou5xjMFy83xr0OyrPrU3Qq7roV4jgIsuGgfGwQ/2PX7+EoZ/GMGae7o
         eBqGNLEXWu6NAnDBC7W0j0I3afjlpSE9pkL95ROrGRWYawfy0nNi/YCE+l9GRiGa5Ram
         f2zBY4IswHgJkra7cpJ8XhUjjK10DafTF7lpjs54VbKh27TrIO810zTuFDclGAyegfZc
         pq+tN4MRexgfOcJuhW14Tyb1HrImLMeHrEwOdFMIgSkq2/dLa0JbaSGWSVk+o5hSpTVk
         JGgWvSnTobNJOwQmCcSBERyYCL4UEU0SNP4jkxW+pX8/ATleLcmUafwymlDC7ly1lpck
         SeLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734854155; x=1735458955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5qv1jdP2agz4pI5HNaKvdcQpLRY2HpN9vekhuMUNzs=;
        b=Rf7IlZCdbctKK6qcL4EkMIECsq14j3VsSRxTCr0HMD6LrMfEeKUUG0i8bwpBpoLVT7
         Ds7RS8LwKXOyKCGxOuYGx0r1y97KcEu+KpPBV/bJT4OtMNgdh6POrG47dnWWGiMxFh6q
         Wni4TBxcHGGwogDZ3epUO5NGWNJ0CV8VPqp7kOwUWZ9EmLCgpfjsHmc8osROjvzxYlEY
         vTzSE30loYN2IiIcio38lPMrLW/UzhdTIXIeKkDva58/4CyNdjMRht4VHQgAgEWjtxSN
         MkeFMQuPvhuZEaCSgDbJEHe1U4oWRMTJNqR1fqA2eHmbgTYcCEPpcv+RCB9rgtMXssSV
         7E/g==
X-Forwarded-Encrypted: i=1; AJvYcCU9XQaeTYezab0EvoZi979rKdX2VzT9ph5iO4GWtUpVVjEYWz4/YMBHyInnWASauE2Ogte/LmugXcXROsFc@vger.kernel.org, AJvYcCXFxcjFrUJOmq9ljbPW45vbgmTJomA6SrIjqbEJDOn1SpLvR2V+WEnReRJbhz2XYnaw8c7n3DmoLn4t@vger.kernel.org, AJvYcCXYcazsnIvqH85bnrvMBf/De17ocrZtUc5JA3Wuk3G1YxtOYkan3xiW3jjHZ69kizzY3arLz+M9WZp4tbG/Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHBWwpjYRxkRbThRbdn1cTWEFvg8B9wyBLEjnjl+nimVLqZ6KO
	Fu2PeNBkjNzzSGuYvJyf2D7WWZoI3H6HQ6ME+7GuLakGztN7NVcys8j2Od228ca9dwfScsYzHVj
	KWr62HzyUW8zHT4bHHfvJMsgGjj0=
X-Gm-Gg: ASbGncvnWsTcDDxI/weup7MzguPVq2Y3qRuo+8EESa2wQSMIGbJayAq9VGeb7pfSAex
	Tuyk0Qq5yn9q6kWjQG82Bw8GKFyDCOXV5RCDMm3k=
X-Google-Smtp-Source: AGHT+IE4nGVT4fLIMqZuz5mCpJ6LP/p6tD1BoWVyOVyCEVrgqNw+yNbc1/UqV3utJuAC9+UBfhbVPXcAxO2vfep9FKQ=
X-Received: by 2002:a05:6870:1681:b0:29e:69a9:8311 with SMTP id
 586e51a60fabf-2a7fb39b3edmr4631701fac.36.1734854154823; Sat, 21 Dec 2024
 23:55:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219200821.8328-1-maccraft123mc@gmail.com>
 <tma7q7lfskdr7myfoeene7o27g7nhc5ca66kpmnqvgksv5oxqv@ziefqqp5khic> <57515c0f-caa0-4651-96cf-dde75a13937f@kernel.org>
In-Reply-To: <57515c0f-caa0-4651-96cf-dde75a13937f@kernel.org>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Sun, 22 Dec 2024 08:55:18 +0100
Message-ID: <CAO_MupJNuK2UyXEPdr-xufWotbP-EmHyUk81YiTwaQR=WccSEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add bindings for Qcom's EC
 on IT8987
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

niedz., 22 gru 2024 o 07:40 Krzysztof Kozlowski <krzk@kernel.org> napisa=C5=
=82(a):
>
> On 22/12/2024 07:33, Krzysztof Kozlowski wrote:
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - const: qcom,x1e-it8987-ec
> >
> > That's not a SoC, so I don't understand:
> > 1. referring to the SoC,
> > 2. Having this alone and as fallback.
> >
> > It does not look like you tested the bindings, at least after quick
> > look. Please run 'make dt_binding_check' (see
> > Documentation/devicetree/bindings/writing-schema.rst for instructions).
> > Maybe you need to update your dtschema and yamllint. Don't rely on
> > distro packages for dtschema and be sure you are using the latest
> > released dtschema.
>
> BTW, for sure Qualcomm did not develop/create it8987, so it cannot be
> used here. Come with specific compatible for this given, one product:
> embedded controller on one Lenovo laptop and use it also as filename.

Under these assumptions:

- Qualcomm developed the firmware running on the IT8987 in most x1e machine=
s
- IT8987 is also used in other machines with a non-compatible firmware
- The driver name should reflect the assumptions

I think the name qcom,x1e-it8987-ec is not the worst name for it, as
"ite,it8987-ec" would imply compatibility with other devices running
non-compatible firmware,
and names specifying only the device wouldn't reflect the "firmware is
based on what qcom did and it's driven the same way" part

Which other names do you think would fit this better?

>
> Best regards,
> Krzysztof

