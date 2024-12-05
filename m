Return-Path: <linux-arm-msm+bounces-40510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3046D9E5721
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 14:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAF57286EE2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 13:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EC09219A9C;
	Thu,  5 Dec 2024 13:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RODxSZ7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D92217F36;
	Thu,  5 Dec 2024 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733405399; cv=none; b=qzaJAKjh6BzcTCKUqNXga6rXYa+aMUEfc4vWJ1cewcHAbVxC53kQ8NTsdQfe/KFjzKuOTOP7l/pm/YgphVO/I+rKkNQtI3+lTSoE7LcK8DyqPgy2KFGB5yEpDTSZ0/tOFw2mYLo23vBaJmhrhMToYIsZciM16+3VpYK/BPdvRqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733405399; c=relaxed/simple;
	bh=YR4GHueAOAhwFTammZfWOuuRJ4yKoeZUyRqZFAURMSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0TReahUXNMh5p5FlyFH0GAC/fol4k8kC49tE0oiuVj5WtYKrAykVTH5raCIk2+8xWk0Fh4OzGII7zWhYjRPnDvKF8nyXGaZu9II6jpRN3RQqTsgfCcSCIr78ZPDXEIYHIijFfjnKGkaPRkNHK0fUn5tzgFp+ViHhY5Wk40BYl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RODxSZ7w; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4afa753c6d6so277601137.2;
        Thu, 05 Dec 2024 05:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733405397; x=1734010197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylDjEClI/7mIIYwF0dNr8g22hgKRAkTcMUiNYa8gpm4=;
        b=RODxSZ7wl7vOhEFFDMu8dfsyzr4z+O0tBYMPk2VRjroBU+n52WpLXFtZ0qG+sJzrOB
         lOz3veWywe7EswhzwEZrfJ20K1B1n7xTlm4piJKOlsUOkOYbm7hkocJ/J7G9mPZXOR+s
         zSRoezZ0mYCpV2BJtd2+GmpLgtB3vEX3p7bMI7AEyOhcu/2uhPcJdAE5Kj7hvb/sJGLo
         JIkXBTMZCDjoyyfDTocVIP5xFT4TeTzTXaZbG/3peFZ+Gv+K2NYRe/YTFrKM/rfznpji
         8qpfiK7+QLF1MPFAxHpF+YJ8B9jJlyFxqslnR3ZNA71PzFcrsywuYfih8/hLbd212xt3
         m/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733405397; x=1734010197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylDjEClI/7mIIYwF0dNr8g22hgKRAkTcMUiNYa8gpm4=;
        b=vxoGLthzWGDNzB4py8SMZiDCb2CHdtjM7mcaESOFoGdcO79k3MMA1MjNlILU2cYkow
         kUoOYyvBArX+tuTFNm6E0mHvqq8flTWFvaX/4zCml27z+d6Qz1odeI7GwbBvPqvuTAYb
         PZl6FzR9uEJ3QJ8GttU7EdV2lwPIMm8nlodPu5xkuhQ+WBeFFND3mHYzPyVqPFg/9Zpf
         tUgE+CSyhyRN/4bpdvLySC4s5ycJfLfqOUdUF1rqtM6ZRQ1Iy0IRGt2rsKGZjOA7tDRM
         tiev4a2LdR2cUnYmGXqBV+ntXH1jQN2WJqvjkHeU8Oi1R3VxGn8AckDtuH4o7uzd0yfb
         ovbA==
X-Forwarded-Encrypted: i=1; AJvYcCVNeuCxPwFCkWqkq7S3YGP5pYU5mQ6YV2WMrL1k1XWpg9t4g5Rt+QVFNKzaGbKlvOGwedijnp8EeiDcWf1Q@vger.kernel.org, AJvYcCVg5RLQdgB8Fs1oCDb8gtAMXfOUdg3ihA7ldB/ngNciZTAkA9hX2DNzJcPSSrab8soxMJBmDJJxoDc+@vger.kernel.org, AJvYcCVxk+Rn05RzLzQB+CEh8kOIS7Ydv5iTeM93KBnXJdRoE7wL03yhJAmJdx6mpDTMtZwqf0Cbp9arT/uWV+R/2g==@vger.kernel.org, AJvYcCWVC+ui7oYf40ZJPjBkRqIFozmgBvBB4ooFHcS5fAFPEi575pF0mzzjV7VKwkTBD3KA5nEX+gWRz6VuQxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHksNOwPYqFvl1ZcRPQ7m2vkHISuR2u5wJG8UAwujAxoc7JrjP
	8IsVkj1GS35TpUdBo6j80BzSAUwfwv/VLw07XFwpOurGAgVciq45QQflmepUWNQnamcBWi1qOm3
	4m8ycRv2LZjLZ00hUVb5FMKaPQ1k=
X-Gm-Gg: ASbGnctsRu3on2AO7NHXBhuSRkYH2W/o9/kLPtrq4g/88AIsxjYdRXMZG9AWqqRYKea
	n8I4ClOiDFnuF6AgCH16I98WWE0y1ow==
X-Google-Smtp-Source: AGHT+IHqdLVTw7LFCNcWIGfl2YvVPTopD9vaTRve5kiiNTKeEKy6ZWYdof0NETgFtIQlaLA+8jnKb0p9z2BoZJK09to=
X-Received: by 2002:a05:6102:3908:b0:4af:bda1:8109 with SMTP id
 ada2fe7eead31-4afbda188bfmr1660076137.21.1733405397371; Thu, 05 Dec 2024
 05:29:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205084021.35610-1-krzysztof.kozlowski@linaro.org> <c3d2477b-f12a-47dd-bf95-927e6c0d8fd5@sirena.org.uk>
In-Reply-To: <c3d2477b-f12a-47dd-bf95-927e6c0d8fd5@sirena.org.uk>
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 5 Dec 2024 16:29:45 +0300
Message-ID: <CABTCjFA9DyRzca93qoS5_+sfc2RLfNVNqN14WVfKODjHykwGJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd9335: Add define for number of DAIs
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 5 =D0=B4=D0=B5=D0=BA. 2024=E2=80=AF=D0=B3. =D0=B2 15:33, Mark=
 Brown <broonie@kernel.org>:
>
> On Thu, Dec 05, 2024 at 09:40:20AM +0100, Krzysztof Kozlowski wrote:
> > Number of DAIs in the codec is not really a binding, because it could
> > grow, e.g. when we implement missing features.  Add the define to the
> > driver, which will replace the one in the binding header.
>
> This breaks an allmodconfig build:
>
> /build/stage/linux/sound/soc/codecs/wcd9335.c:162: error: "NUM_CODEC_DAIS=
" redef
> ined [-Werror]
>   162 | #define NUM_CODEC_DAIS          (AIF4_PB + 1)
>       |
> In file included from /build/stage/linux/sound/soc/codecs/wcd9335.c:28:
> /build/stage/linux/include/dt-bindings/sound/qcom,wcd9335.h:13: note: thi=
s is th
> e location of the previous definition
>    13 | #define NUM_CODEC_DAIS          7
>       |

This is the 1st patch in series, and NUM_CODEC_DAIS redefine from bindings
is deleted in the 2nd one.

