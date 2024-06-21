Return-Path: <linux-arm-msm+bounces-23584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B43912677
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0258B212C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 13:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6451553B0;
	Fri, 21 Jun 2024 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBCJA1WN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F08D15444C
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 13:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718975666; cv=none; b=aBpdHeeqVbieMB5rgn2Obb5fonx+AbiJmPudJ8Vbni820RjA81NICI00laP6sUgf49QAZ83kVS/YwwI0nQIPy+kIfQcAmqHlM0PQIHHXr04QqJNsZl/SbSDNeY7sTBkcJ7S9x3Vi2IMSG5PsPqHRbhSenfn7D5PB9W/YM5YAVn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718975666; c=relaxed/simple;
	bh=lT3/0UqtMDn26n/9FLC4BSIBh/uUYJWYvZjdb5CfcLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lBkKYQ10rUwx+pWfVxm18lWSmcLm0qOAg60hzNPzcGTXyjuy+NYzSB47tiIcKwlKKfEs7vTI8033X+yP5nU5Div3pahmgxI+NB7BpZdEXBpg3UYto8iukEuQxzjLQe52uD/9Hl6LVEVBAR2UX9WM5y85SUQU3DCkT+/5mCjzFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBCJA1WN; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dff26b612a9so1811689276.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 06:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718975664; x=1719580464; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=St4J3uvn8l8JSYyCUFuUaA3lT6tDkhwwUDqJHgH5Ff8=;
        b=IBCJA1WN+2UAECsHaPoXrMbwYXAh4dh927AK12Ir6t7/AxpjvpP8cxiKigm5UKltf3
         utnrzkdAunvrScCGfbwbX3l8xBxqdU1vVhQvV/9B5MeJ7Rh7sasyyd3bZCkaMZRPZZmq
         vU3zwJCPBb45q2PPFtqWq+IQzQi5DDI7BDdbE0Go4Zi1GBJOioWTYs/cZLvo2DYzbnHI
         1l6+nKj8ILVHkq1sqW8EbUPPqY9Icf6k4fwayB73M/App05ZDO4cSDB34jdwTWijZoNY
         4Oxb1+ULTDtmeasIidy+nFSWgxx5zcTDtT11lULNy6Da4dGzd8lKYtZhrFIBbfBCAh6D
         M0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718975664; x=1719580464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=St4J3uvn8l8JSYyCUFuUaA3lT6tDkhwwUDqJHgH5Ff8=;
        b=K/Rq5nwiY3LuSXQ1WnanxhKruU+lwY0q5n3RlmuW9djfR14kIYdcOhg5UkxstptztJ
         pTTEXR9XslhCz9xV5WXXgCQEA+QOjbMCV6ZCyEiqqpB2hrREZzbkSZADMUdXcVhivWVA
         cZQq9TzDvBQLEjaqbIR/maIFtTL6ZfrpRI+gdLGOnf8Ja1Z92IsRV75p4tWEgOoGVJeD
         X8b/GM2LnTmn6XVc/VogBr8H7feTTL/xD9LJ7vAVo6osW9QqHqjy43MQMuONDos2h7Vq
         irEqJg+J+IfGnuwRxLOAsqRF2DHskxtq658nnpCTMvrj8t5knD9bSLUl5SF4d6s/Ne4f
         F5+w==
X-Forwarded-Encrypted: i=1; AJvYcCVh2KvMSIykFJ3lfW23NZzY55rpouKB7ctMWb/AN1whaKhR5H3Pr9rUtXCYrLOxQgVX9hGrSmOjoCFULY4InfrADp9cR1HDD4+cf2QYyQ==
X-Gm-Message-State: AOJu0YyI1K64zAm8mJmmVNd/JlXrU3ybkGswzT7BujZd2rBAb9Wc0oLP
	Dl2nTrvaVHKb5ADesVSfNDbuKJX9fLkKurXuzAx4mYcQp3QHogcJUsTQlOu6jT1TUxTE2iyH45J
	Lh9V9oH/qB+C8XaDdt5DKRRAEQ7ZnkuyT0dWjtRa/P0fgI45M
X-Google-Smtp-Source: AGHT+IF5Kjmxgdie6GcMoOwWvEJr0hx8dV3HK+rzPmDaF3nNfHrnmvu2DU8t6Caag/RxJgO2Tk62vCZRxGA02P6OtL0=
X-Received: by 2002:a25:820d:0:b0:e02:c4fa:2180 with SMTP id
 3f1490d57ef6-e02c4fa246bmr6862131276.14.1718975664432; Fri, 21 Jun 2024
 06:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619183255.34107-1-brgl@bgdev.pl> <20240619183255.34107-3-brgl@bgdev.pl>
 <henuash23dwkj5fcmub6sabygwo4kam7fgots2pp2j3eu4asuk@cn3o7a62lo74>
In-Reply-To: <henuash23dwkj5fcmub6sabygwo4kam7fgots2pp2j3eu4asuk@cn3o7a62lo74>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 21 Jun 2024 15:14:13 +0200
Message-ID: <CACMJSes7XcXPZt8NgZm9mQ7h2B6A=+mL13gpZEHY6UnTFqXdOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sa8775p-ride-r3: add new board file
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Jun 2024 at 18:04, Andrew Halaney <ahalaney@redhat.com> wrote:
>
> > +
> > +&mdio {
> > +     compatible = "snps,dwmac-mdio";
> > +     #address-cells = <1>;
> > +     #size-cells = <0>;
> > +
> > +     sgmii_phy0: phy@8 {
> > +             compatible = "ethernet-phy-id31c3.1c33";
> > +             reg = <0x8>;
> > +             device_type = "ethernet-phy";
> > +             interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> > +             reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> > +             reset-assert-us = <11000>;
> > +             reset-deassert-us = <70000>;
>
> I need to read your other series still wrt "ocsgmii", but any chance you
> have access to docs indicating the reset timing? I've never had docs for
> the specific Marvell phy on the prior board or the Aquantia one on the
> new board...
>

I have but they're not public. :(

> Boot time is something automotive is always concerned over, so I just
> want to make sure that this timing isn't any longer than it needs to be.
> Right now it looks the same as the Marvell phy's in the "v2" boards etc
> and that made me raise my eyebrows.
>

That's a good point but what else can we do? This should typically
execute in its own thread anyway.

Bart

