Return-Path: <linux-arm-msm+bounces-62401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D90AE7E16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:53:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A61F188811D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 09:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ADB327FD4B;
	Wed, 25 Jun 2025 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNISsXNj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F387273D90;
	Wed, 25 Jun 2025 09:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750844965; cv=none; b=Ywe2JucQEI2MpFw/ropW5arBjM0kMmaod6U4P6XGCb5AEdRdDvMOnjHzyyK+stcngVg9dvLCVJ77eCYxZ5JG+7miw941RjU+L/S+pBQgr3oig5EjTR9KH5DLqRTPqtapiQ7khG6pWCmVUyz+EaLQNrOfiGCrJ7wG0vkCKYuZMCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750844965; c=relaxed/simple;
	bh=njyKbOLtLQeqzlE3NFqljLHpeOQTtmP3fsZXPwv+m3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDR+qiupd9ZjVoSyGP4Up1EGmjE8H6PYm6zLcoNmVlKC/upop9+gSMQkXC88JoFlOcbaChq/E4nNYmo01oLgbrH4l51qnVNGJC/SvfTzp3ZM1UEsvTjs4JwPjLsqKKEM2xJb+MmxqWhh40wpGKqHp+r9q/IsXgfpSG2GTUkhd1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNISsXNj; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a575a988f9so828762f8f.0;
        Wed, 25 Jun 2025 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750844962; x=1751449762; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=njyKbOLtLQeqzlE3NFqljLHpeOQTtmP3fsZXPwv+m3M=;
        b=QNISsXNjvyPFf0XiUOfqb7EMW2N9gNYuhHIfQxk8Av2VlXiLh1AvmNs6Mwk2N6ei3f
         QOQBoD8ldZL8+xMZjvaxB8mTMMjznG8YClS6JT9CWmJS/ffUQtE9nO29GinLTUHcS5FM
         r6MPygK7axhGBK2i/Kl72/9ONIPguPXhztf4D3gawe3cXUIYxXSwH5/owyjrEKwWif3x
         89ZjDKkcni7jjeVeld6WNBspVHfMpRzW4xjThyXjCl5qaAdouJ9Yr+ND7HaFXV/Sd6SW
         3T5SpWv5299PsGrCkQbawORpv9vHrZo8IvKUnFf2C4QCpDxmae767u8ZoA94YuD0S99G
         S4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750844962; x=1751449762;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njyKbOLtLQeqzlE3NFqljLHpeOQTtmP3fsZXPwv+m3M=;
        b=UQLMS//+nSrSkM9LwKqKBJcp3WDm7+KeZimmd6iYDcqOHG0r18APstCQwmaeTaOXRP
         LQNgg2IjHi8e+/QqF8r62PTQqnx3HDuMRyPp6mIqNJRVW8MqwqDsXvlM/MloUaoaNIuR
         D/25gD1KhYzDrL8kfgcOloR+g+0qDie0kZ7GtyTy2j+scE3fnXPub5U4/m/StxfWrl+i
         Zm7PqbXH5LFkAcPc0iS1oTmCy+UQkpPUJtxls9oT1kdVH5z3mKHPPVDcUuWSzwvMqv4R
         gVBFlz3J45gmFUVzW0/4QcHaZgvZpmrnMdXIM37PSDdXEOwoQGGI1OmF0PBve0P0zHv6
         NSKA==
X-Forwarded-Encrypted: i=1; AJvYcCVN7nw6vDyhRxtTKgi84qpSCdXFXSoCn3VQQmSGZnMP7GvHUBR5wVbyJ8k9avnRQT8ciZOHObyfKN1OQYBVig==@vger.kernel.org, AJvYcCVowdbXrD7oSUn+C9qMfYaaSKxlnFG1kTzl27X7UhBNYUE/kxiJ1noh/2WEk0b5tV4HD2XhVrBDK6Wb@vger.kernel.org, AJvYcCXyBkZ8PbOQWBJg3w+O2QrV/74mcZg1rBk/aurUEwsVGYUlwMUUP+k/h5UeapgSgIE2qO3ishiYukKlSGXa@vger.kernel.org
X-Gm-Message-State: AOJu0YxV4lJRETwGT1X/b4Oz12b/Y5pvkAjWOFXoC0WjbySSwadmXD/o
	ai7YH9dl6zbpVkv5QB4OmzJlwqs650N6cyrLlYoyb5Y8E0/sLJ0KDqb831K1WySrr4h18jQVtqH
	CGINOaIOah5TGPQMHrX1Phcx7NqNcNA==
X-Gm-Gg: ASbGncvUgoutFko2zLmr369AQe9efECHx0mY63lSgKw0DfbtWkGLLJ8R34HZDnhoxxc
	rRvMWy/7yf1TzfGQS9NyzNMLR70FW8kJfgEbVy88+SP6L8bnBTrxN7nlPwfniiOJJGe8XKJInOT
	WhZjiIy0+IxgO7TyWuqSAMwsRCl9h6CP+xA6mAPnE6NXU=
X-Google-Smtp-Source: AGHT+IEJ442JhAOHIWyZBURFpryxYK2v8sGLkiTMcUZP34/SamRW2qxVIMhwFQh6GD1kXXh3lReE/naRrec1aznr3QU=
X-Received: by 2002:a05:6000:200d:b0:3a6:d95c:5e8 with SMTP id
 ffacd0b85a97d-3a6ed66464dmr2006514f8f.35.1750844961972; Wed, 25 Jun 2025
 02:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624225056.1056974-1-alex.vinarskis@gmail.com>
 <20250624225056.1056974-2-alex.vinarskis@gmail.com> <aFuq2JFZZhC1r3N4@hovoldconsulting.com>
In-Reply-To: <aFuq2JFZZhC1r3N4@hovoldconsulting.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Wed, 25 Jun 2025 11:49:08 +0200
X-Gm-Features: Ac12FXz6py_g4izWfb6HHN6uycpIk3UcyhlAK4llx3dEWGlTUorZ7CmrZDAximg
Message-ID: <CAMcHhXotN7mWwUkAAX8J6d4Yo8xSLV=_=DDJJ5Nhh=Cy98_JNg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010
 by default
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com, 
	abel.vesa@linaro.org, bryan.odonoghue@linaro.org, 
	jens.glathe@oldschoolsolutions.biz
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Jun 2025 at 09:52, Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Jun 25, 2025 at 12:41:20AM +0200, Aleksandrs Vinarskis wrote:
> > pm8010 is a camera specific PMIC, and may not be present on some
> > devices. These may instead use a dedicated vreg for this purpose (Dell
> > XPS 9345, Dell Inspiron..) or use USB webcam instead of a MIPI one
> > alltogether (Lenovo Thinbook 16, Lenovo Yoga..).
> >
> > Disable pm8010 by default, let platforms that actually have one onboard
> > enable it instead.
> >
> > This fixes dmesg errors of PMIC failing to probe, and on Dell XPS 9345
> > fixes the issue of power button not working as power off/suspend (only
> > long press cuts the power).
> >
> > Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")
> >
>
> Nit: There shouldn't be a new line here after the Fixes tag.

Thanks, will fix it next time,

>
> Not sure how this breaks the power button on the XPS, but sounds like
> this one should be marked for stable backport:

I suspect it's because the power button "pmic_pwrkey" is coming from
one of the PMICs (..spmi-0/...pmic@0). As pm8010 is on the same spmi
bus, it appears failing to probe breaks communication on the entire
bus? pm8010 is the last one in the list, so it could be that other
PMICs were already initialized to correct voltage, that would explain
why everything else still works. Just a theory though.

>
> Cc: stable@vger.kernel.org

Did not think of that, but you are probably right.

Alex

>
> > Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
>
> Johan

