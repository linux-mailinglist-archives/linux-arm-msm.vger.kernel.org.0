Return-Path: <linux-arm-msm+bounces-33654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2009999643B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5201B1C21D1E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2FE18BBAE;
	Wed,  9 Oct 2024 08:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qly0dBCC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EDB18D650
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 08:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728464070; cv=none; b=jsIOTpHsRFuOyL+7F9ffoSJkSFVZwtNnzf5D6TA6KRg4TotpH7ZFhjbWRXjrlw2LsaMc7LNkW2cgSjagqLM+moBwnvkHwc5aiq3gp2P8vHRsfsnIyAxj9mz36xIGz/A5ggMOpyK93xnHwZb/jPRgTIvQsENrtr7V5Eo80924wws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728464070; c=relaxed/simple;
	bh=FFpBgRTSKsDxjFwRJ4STqSap+pHtBiqiKgJExfia4cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zj+lzbvawIYYx6oOra+EpVnM+H0mFv+pxV3qNnQ0v4yeHOAAai9/RMJPUOjgfrpbAH4d0iVBq937ru8LgH8UdB60aU0t6EHPShS2FcNTC0tc0pASXax8VJwt7rrj+1qxe8kEahoVnO9wJDXZfnDyN/vQDsfvPh9uJNSoGaE65AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qly0dBCC; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c883459b19so7542496a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 01:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728464067; x=1729068867; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dpIdKlGEx3HAehwqgbFbosdnXDUfWgAPKaA5vSiJ7Sg=;
        b=qly0dBCCgx/PKO8FM7kP3nfkfpTi1IYuzHKzpXG0GA3+Bstye7DQHR5ClxRAurhocE
         w5hTuxGeBEtoTkFrV/5S5CkCalr3GkffDanMybsoEIPwC78d003EkGafxdHhY6MIm8su
         4XI077YoehVFJXS5QPymPpxN81SAn5qx66SVCfE/DCQR4kwVE6WnAp3MkKg3XOYLhM4L
         wtyE81WsxWRvkw70/VdnMN8z6m2WKScIFeu/ypKeNnXc4PHdMqh/WZ3zpMRMXDiRT4zZ
         ZnicK17HZqog2VpCYEi2W8bxuQjAExqgSuXPLIGLgA8RbsGQ19YXhD20QG+jnMUlqlUV
         Rvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728464067; x=1729068867;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpIdKlGEx3HAehwqgbFbosdnXDUfWgAPKaA5vSiJ7Sg=;
        b=IYN8V/ZYtwKTJCNhwR91IUIUtmRepQcMqeLDbh1drDbd0xfpdBNl4jUUfSGn89yKKG
         l/wkoZBJaW3Hswgf9Yw90tLMCJsP91KmZZtgQ54nfkjNlyaN4WWNId5D7R8a2br8Ehjy
         qbFfyM5o4/92JOSKkfcv6cmDf4NGCrZisPP2rH+Dw2Rm9QBYgSc6wc19YLYoTTd9Y3mk
         rEsCgEelks3ANK+WSTXstWdGR6JByRKIYr/qgcZutOVAnQL98P2d6ZEzRyIfw+S2GA7y
         Gb9o2/0ZpyZTor+grnSr5WMNH1PiQCd+MJWYpGHUATuS05oc/AvBz9S1KB/BMcJyu0yQ
         35ig==
X-Forwarded-Encrypted: i=1; AJvYcCVLzIN5JCprPik4+Ac8YYfn6Rx+GfuDtO/kg4g4GT32byQT0VK7VSrYiL4u3p7rNTQl6mG3hpPG0F1RUulV@vger.kernel.org
X-Gm-Message-State: AOJu0YxPD6q9yHssTcsufwhNXadK0UAB07GRiIR+mfiZ/QuLdd6VKjg2
	lidtQgOYLDnk6SFsl6YkLIHvkvAKauZCTSAAnKPIm3ORomfvDSM6Tnr8LncdjEgCCYleEdR9Mtg
	FuRE3eMp0IJoCYintd+wnrw3LhDNnlH8zPC9EkQ==
X-Google-Smtp-Source: AGHT+IF44BE8hthfETE7YKbsC6rLoLa1YTo/RGuFZV8OdBGOLSb3SfY5NiHb4he54Y0t/CrceLlKzYCcXMtLj21d6h0=
X-Received: by 2002:a17:907:3ea7:b0:a99:3ac1:2997 with SMTP id
 a640c23a62f3a-a998d199561mr127216166b.25.1728464067351; Wed, 09 Oct 2024
 01:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003211139.9296-1-alex.vinarskis@gmail.com>
 <20241003211139.9296-2-alex.vinarskis@gmail.com> <CAEvtbut-boW2nrbUTXFkvZ8N7qA_OtNz0dMPzRq0OYu4oF+jmg@mail.gmail.com>
 <7cfa0ccd-2fb3-41ed-ac4f-8ca9bf29514b@linaro.org>
In-Reply-To: <7cfa0ccd-2fb3-41ed-ac4f-8ca9bf29514b@linaro.org>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Wed, 9 Oct 2024 10:54:15 +0200
Message-ID: <CAEvtbus6AK3-NHm98aO7O-PBYcaQ+VH_Mup5eViqMwCQrP1GFA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Dell XPS 13 9345
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, robdclark@gmail.com, 
	peterdekraker@umito.nl, Bryan.Kemp@dell.com, tudor.laurentiu.oss@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

On Wed, 9 Oct 2024 at 08:55, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/10/2024 23:07, Stefan Schmidt wrote:
> > Hello Aleksandrs,
> >
> > [Again in plain text]
> >
> > On Thu, 3 Oct 2024 at 23:12, Aleksandrs Vinarskis
> > <alex.vinarskis@gmail.com> wrote:
> >>
> >> Document the X1E80100-based Dell XPS 13 9345 laptop, platform
> >> codenamed 'Tributo'/'Tributo R'.
> >>
> >> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> >> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> >> index 5cb54d69af0b..7c01fe30dabc 100644
> >> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> >> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> >> @@ -1058,6 +1058,7 @@ properties:
> >>        - items:
> >>            - enum:
> >>                - asus,vivobook-s15
> >> +              - dell,xps13-9345
> >>                - lenovo,yoga-slim7x
> >>                - microsoft,romulus13
> >>                - microsoft,romulus15
> >> --
> >> 2.43.0
> >
> > Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
>
> How do you test bindings? Running static checks in kernel tree is the
> same as compiling software and adding tested-by.

I took the whole patchset in when testing it on the actual hardware,
so I gave the tested-by for the whole series as well.
That being said, the binding patch here does indeed not benefit from
any on device testing. Feel free to drop it.

regards
Stefan Schmidt

