Return-Path: <linux-arm-msm+bounces-80579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF26C3A7FC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 12:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82EB042410F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 11:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B63AA30C622;
	Thu,  6 Nov 2025 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MeDLRnLO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13742EDD70
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762427543; cv=none; b=TvZMC9VKQ1tHgedwDQOKiZQ8IJmEKpPTe+9AknseH4xSsY6IctFlJC+IwVjRc/tXagfifZ1QoUKCOy4BETdtpB3towEOoGz5ANCW/Iz/LZqiwIPiBDAARDJeiynQ8ntEU/+k9xIh4dqnaUNNudvn17VRMmiYv28OSriUtUmza6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762427543; c=relaxed/simple;
	bh=k39p6ctwzumtM930CezhirQ3llb81chzlkpbZXG+C1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALVpsRbd7HvUhIjSlz4s3Mr5dmKeDdbkN0lkSkdLD8EthZmMqtS8+9kQ8CfZb95ysT9FhNCh7BNAQN9zgHnq1o4c/ev0TJ6NPP0hYP8UEn89nalzx4KGy/AzDodqchjIG++Ugx0gzTnj9YGC8o0WTDuYHt++9Hc3yC6tJCfoAiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MeDLRnLO; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7200568b13so148896066b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 03:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762427540; x=1763032340; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2yrvTjvjO1pUk8F3CcXiYPOz5oOf/FwysOOSOBS5mvM=;
        b=MeDLRnLOZKCKc364E71cyWH1QjArtOK7QVwNri34wdiwWhxx9WjH3MRp3m2vde1Qp4
         fd08NF8dSBmmvCCX+TzfLktxLHqNpra7+FAc+W+o8wyJhYgo7vVdbLQTACZRrJ1l0pVb
         qhmOBpqSCvdvEqjsPOvxrMiUHkDbC6ydbAvD5xKESvzu34QqJ+500RJYy42rZKoK2DV3
         AIY3HYW12tdjF/ls1FXza8fqRL8riQvQiuQPXakEfC82LlFdcrWd/H6NJvzXm6Vga3xk
         0C3aKUTNPoItMCBqJE1kvWi8BpUOu5lsK3niAGgU7uBZ5eSbDcS9z2v1nZNAt1aBcP+T
         d7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762427540; x=1763032340;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yrvTjvjO1pUk8F3CcXiYPOz5oOf/FwysOOSOBS5mvM=;
        b=HdGOw6dbwK9nUvlLoT6rZn1/4ngFuICsZmQNpaRfdhkgwuGtqEmo8oChVRaktQRIp1
         /iih+XeDgkprVKIG/G/KXaEQ5kgCzRbWCDw3rE5ChmIm6FfXFI5xukdMMTGwfoqVkGdY
         L/5qEUcybAk4N/X2T97xY4bS3TcuyiXMeGZ6nHVDfPFHdshfoRCeNbKUsSd8Pi9z1VgV
         +PjrQswcTs/33ZbDFKleM1gehBwCXcYxeWo72kTOKso/+d40niAtAh+FJ+99gz6s7NLT
         tMT+Bm6LIMvHXvPABC/n2qtQJOaNkUkx+zBlnPjxRWpHwueMSXEBu2l3IDGeiM9NMfyy
         Vryw==
X-Forwarded-Encrypted: i=1; AJvYcCWiW1d0FcS4h2Cx+A1DBC9h38r12ZGc8LSzEvlhqX+/vrivPN+xcZWCPcv7EdraFTWuJ/LheV1emjbsCxs2@vger.kernel.org
X-Gm-Message-State: AOJu0YwpsUtJ2BxYZWdNCB62hZ5gTyeEi8NAy6LY9x8Dz9mJQMrynh/D
	i1ld3GA6yhMAp0Skhk6Ahj5Ytr2QVEn2ITPP2Ztp0zU4poYkdYkwmBly/AcgVg/3XRshYl4xrAc
	ovYYV1vO/sa0HqjTladL5ZlaQAkrV/L9aeJrxiuWQJA==
X-Gm-Gg: ASbGncv3U+pKFdYPV0N4y7VguEgYKvN8JKBANNB//oWCwI7sV6g2mg12tQLu8itOq4W
	f+VBrY2F5hUmt1FeYH+9fH7o7rx/h7vVFCQVUEOFa0c9L87XEUqDBbVfN6zgKdivWnV7jtsLCwM
	4xr8uyk6OvM5EnBNoXomD7JdcxBc4jO9StCl8Br0r2No6oyFx3i00jqExgQXlYmA+E9GGGASBt4
	A0GKv7Jd8ZRLmrmkwTNfOxJrDNbE0XEC7zaZN0es+RKnPm2I4WTX8BAklAt2Q==
X-Google-Smtp-Source: AGHT+IHUgEAII+KCZtG9kG3bTwp715Xxrh6yTyMBInhVCP+K/K/WKOOQZr1KOXhWjo8wScgSJ9aNwT8ZjsYf4IzDF4A=
X-Received: by 2002:a17:906:9fc4:b0:b47:de64:df1e with SMTP id
 a640c23a62f3a-b7265195d0cmr835459466b.4.1762427540227; Thu, 06 Nov 2025
 03:12:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105154107.148187-1-ggo@tuxedocomputers.com>
 <20251105154107.148187-2-ggo@tuxedocomputers.com> <20251106-lemon-kittiwake-of-freedom-dfcfdf@kuoka>
In-Reply-To: <20251106-lemon-kittiwake-of-freedom-dfcfdf@kuoka>
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Thu, 6 Nov 2025 12:12:09 +0100
X-Gm-Features: AWmQ_bk0LxY3qjnahgz6ixNPKz7DJgXQRgCibkCqf95T14Y4Ienoc9DL3NvbRxs
Message-ID: <CACBDSOW=_dudXh_+rHSOpbShKewKSr+va5+1Ng0hJRyC2vp==Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: vendor-prefixes: Add ASL Xiamen Technology
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georg Gottleuber <ggo@tuxedocomputers.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org, stephan.gerhold@linaro.org, 
	wse@tuxedocomputers.com, cs@tuxedo.de
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Nov 2025 at 09:05, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Nov 05, 2025 at 04:41:01PM +0100, Georg Gottleuber wrote:
> > From: Ettore Chimenti <ettore.chimenti@linaro.org>
> >
> > ASL Xiamen Technology Co. Ltd. is a Chinese high-speed interface and
> > display system chip design company. Adding it to the vendor prefixes.
> >
> > Link: https://www.asl-tek.com/
> >
> > Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index f1d1882009ba..278cb879781f 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -176,6 +176,8 @@ patternProperties:
> >      description: All Sensors Corporation
> >    "^asix,.*":
> >      description: ASIX Electronics Corporation
> > +  "^asl,.*":
>
> So the prefix is asl-tek, like its domain.

Ack. Fixing in v3.

Best Regards,
Ettore

>
> Best regards,
> Krzysztof
>

