Return-Path: <linux-arm-msm+bounces-11125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 784F7855865
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 01:45:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3CB96B260E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 00:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6979818;
	Thu, 15 Feb 2024 00:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rpg3YnKi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAAFECE
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 00:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707957897; cv=none; b=CfNVFczdqakiK7rtipuHn7C4Pk2t/Z1zG0bOvNSn97ycxGfWTZJcdSD2izI7gLFPc6sJyWL72wJikUbxx4p6c3hI4ekYZojYYbL6Kg9ScLetkyQBMT8EcvHZMjkkPFWYgjAKgwW+Z0zAn8sdNktObJxYB2YbvAIpdtM3+I1J+Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707957897; c=relaxed/simple;
	bh=wP/opWg4NPPj3Q1TJjBcRMLyLYuk3vBq7WguCOVgHEk=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADjzzsxa8UQysgsjR8pycBiAtfhjTeH95hYA+sR8SmlspWrMtZZTqUJMabJoFhpJuKnfNfttn4sB543QsWDFuu38IWFB6wXNsPbHDrCztKm7rIa+NHH/IS2BWf40FDE5AT5sY6zzzGqGe0/+/ukLOxJUEGojq4eAqNurTn6o1x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rpg3YnKi; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5101cd91017so411017e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 16:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707957894; x=1708562694; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZK7IS77/W7TToczCQpY2GYKtvK4AuoqqptX1LvYKQRA=;
        b=Rpg3YnKikda5gYTI6t8tbb4u9HLoOhCMrJam+9AqefCcRhKc5xaqBssE9mqyS/zg4/
         GwRGAq3O4XcrcMMpxkOH5C5NO+gZ//wiak4RQxfiGSCWTev1ibSgBbhbq7hmXPUT+2eu
         Z5c7DbL3lslmiGnvieKcjWmJZexhgLZxb1zTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707957894; x=1708562694;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZK7IS77/W7TToczCQpY2GYKtvK4AuoqqptX1LvYKQRA=;
        b=DjNsmOZPcIPlQTb8DErtPyxxg6LveUmUd4bXqmy5qzuddVxhEY384eu7OUwDGP7O43
         trGFkZQC4bMQJLajsQpU/lb8kWpS2JDIKSuWCBOQ9SJ+lhxKMNV/ke33BCqquTGl0TVZ
         Y5sn2IxZD+q/tSZDu4Aqyz71kiea7ax1YtPXMuG11F/Y6D77rE5ILhwrwmrOYa5iy8Kz
         KBgdl2jWN+qzx3+f7Wb1AwHpz+RmEIlDwADuM0b2xdWOjSVq4Loj5uRGb78Ahgq+U7R8
         asE8Sdd2GMh3/bal7SI7BkLLXdnOtNZxQVSBAJwHd9fqSmE00Flmf6ch5mm21WKbIrNO
         1wFQ==
X-Forwarded-Encrypted: i=1; AJvYcCULhgITKzDa3eJJDYWh985/lqY1Q5i5gUdNpqSyIpcogcc+LroQXzDTYYN7PuF2Hfvj6hEpqkCUlEqv68dCkWE9mCgoYRCLCy1d9EUuIA==
X-Gm-Message-State: AOJu0YxenZsttFXsaVsoxqFgvb7RY4RlHcHBFU1TFO9Qi1zVJQPEwoSW
	kpSTRj+mpfD7zygbssuIJ4bckM0bJKp6FvSKx0Ax+uu4eyFCsAF/pVmZPyHWH3YkTD7nbeyURBU
	vI8ot+h4naIVItEa7fosTFJHeNIYUhQbjw4Tn
X-Google-Smtp-Source: AGHT+IGKsNObiv5/sSxZv6aITBScisJn3oLmwBXS+yX42z/wkWCduLTcJnTn4E24I+pmYo583/8HG2h1y512aeNzcHg=
X-Received: by 2002:a05:6512:3487:b0:511:5c98:acd2 with SMTP id
 v7-20020a056512348700b005115c98acd2mr193884lfr.37.1707957893979; Wed, 14 Feb
 2024 16:44:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Feb 2024 16:44:53 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <a6ce4811-2a3d-4df6-aad3-9942a1bcfedd@linaro.org>
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-2-swboyd@chromium.org>
 <a6ce4811-2a3d-4df6-aad3-9942a1bcfedd@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 14 Feb 2024 16:44:53 -0800
Message-ID: <CAE-0n50Ms_QcscgGrFe55O-j5j+GA+GvvDmp=Qo60bcSD9VxUQ@mail.gmail.com>
Subject: Re: [PATCH 01/22] dt-bindings: gpio: Add binding for ChromeOS EC GPIO controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, chrome-platform@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Krzysztof Kozlowski (2024-02-11 05:26:33)
> On 10/02/2024 08:09, Stephen Boyd wrote:
> > The ChromeOS embedded controller (EC) supports setting the state of
> > GPIOs when the system is unlocked, and getting the state of GPIOs in all
> > cases. The GPIOs are on the EC itself, so the EC acts similar to a GPIO
> > expander. Add a binding to describe these GPIOs in DT so that other
> > devices described in DT can read the GPIOs on the EC.
>
> ...
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    spi {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      cros-ec@0 {
> > +        compatible = "google,cros-ec-spi";
> > +        reg = <0>;
> > +        interrupts = <101 0>;
>
> This is should be proper define but then are you sure interrupt is type
> NONE? Does not look right.
>

I copied this from cros-ec-typec.yaml so I'll have to fix them all!

