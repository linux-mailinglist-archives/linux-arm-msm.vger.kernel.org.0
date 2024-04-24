Return-Path: <linux-arm-msm+bounces-18472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9AA8B0FA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 18:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DCAB1C246BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 16:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6335168B0F;
	Wed, 24 Apr 2024 16:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N94SiuIZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED8C161904
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 16:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713975907; cv=none; b=YJAXRg/SZYuvmVFObp7L1iiAnNfJsY7JX+Py0WQS9NpK0E2XjwUaZPEGBXXyFxi0x0vIUjjd+z13g48kbeIlKlIFfz6rJ1iC/gIoFoY9HIFF3Xqi0Tn3lxZYqoAb/688qrM6EBDhZTWG7DYK7WsK4wTPpCMw5XMzWn+oDpOpdBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713975907; c=relaxed/simple;
	bh=F8U+eywUSK4O8B2yNFCJfPiNXX5n0S1cQ/ES1sXTwWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oaU1iZhQODF/2/tWWEWhOO3TkwIaw0LeCtYJwmxTGhA3HC4CdUs+q/EtS5R+k07RYR2lyYlRDnfREUGxVhvpw0O6Kx3gscAWvGmxezXVgtMU0xO8LQkkgrlPxSYpZOJs7TpuCZ9U79G6iLfjsdpAQfolty5U1uLeCv4sl5HhphE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N94SiuIZ; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78f05035f56so446655485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 09:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713975905; x=1714580705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8U+eywUSK4O8B2yNFCJfPiNXX5n0S1cQ/ES1sXTwWQ=;
        b=N94SiuIZwiXWjA7TLMgyVCr3ae2mvaPEroqIhitRros4LbqZjRiRBG+2C951Rgz1J7
         Se+8npixQfPlaoQXSJa+AzkszKw96rJHRhPpEwrC5fn7p6kHiWGEBcVyCoEEMBHhcjMU
         QTkC2yEP69r08NbOKh+YQ977yWVGseoLQUIuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713975905; x=1714580705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8U+eywUSK4O8B2yNFCJfPiNXX5n0S1cQ/ES1sXTwWQ=;
        b=gzBvPtfwhNLAMx9GFSSXH6gTrWYPe1prDBuKXWkmNh/YjSGSvKLqFCr50HzFJumSEz
         vYpq2EAYR0kaeSH+XdYEeN5AY2TVK7aCVn6N/vWfESf1H3XsjT/WGojMnqgbuXTMeYb2
         5o1od9niC3OQhpxXgnke9KrnA93cNhMtOh1OeWx5gYKPTvZ7LDkJvcCUmJnQVfw5LcK+
         w1CInz4f9VB2hbBR6Q1nng2C6H6OzLblfoLkFD0otiGDgUnXYrbdgJcLaVtSDa5JvW2W
         PNagIMQ3Ux1/TcdoS351bMbNLyXYd1o68yTGmpjXvivCyWdeYIeKH08T15Og+OLRMNUw
         pWzw==
X-Forwarded-Encrypted: i=1; AJvYcCWtKUWWCWqSqXTERPOyrJjyK3audOkX09SiU/kGOSTQ0UA1zU6d+zQ9f1WqQtG/OYAYfxUBtDh/T30acj38cAhz9aGWFmjf7x5LAAXanA==
X-Gm-Message-State: AOJu0Yx7UHkXF8+wJTq89+KXtbafV58LVjoMJeeTbHTsziELQd+j6O6Y
	UTGDRDA/RMClk2bdTRussspmO/2LXdxw014mXpAU18dRK2QQMGH6fdNvN4ObmNrqHld6kBPA3Ug
	=
X-Google-Smtp-Source: AGHT+IHmEHv2L7tOIdsnOCZR5Xl840n1wO7KRy6zSNLKaYkBWTfrp+Wo6Kym2ooI18FUzofhITMTBQ==
X-Received: by 2002:a0c:eac7:0:b0:6a0:9427:a5c7 with SMTP id y7-20020a0ceac7000000b006a09427a5c7mr2362750qvp.12.1713975905166;
        Wed, 24 Apr 2024 09:25:05 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id q11-20020a0ce20b000000b0069b42d51d3bsm6114678qvl.103.2024.04.24.09.25.04
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 09:25:05 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-439b1c72676so595281cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 09:25:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaxEcrd9+7bm/tVxf0hRf+EHACjkQTfHo4GYPvN3m/FVe5d/7FZ2HE2I3nM1ozaAIBEJnhsFhXWl12n9I4QlhBv5BrtfoRrIAUfUTRlQ==
X-Received: by 2002:ac8:498a:0:b0:439:9c1b:ce93 with SMTP id
 f10-20020ac8498a000000b004399c1bce93mr389740qtq.12.1713975904358; Wed, 24 Apr
 2024 09:25:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423134611.31979-1-johan+linaro@kernel.org>
 <CAD=FV=W2Y=Sr-=YkKb01XLQsbQJr2b981c9kcfvAc4_5E9XD7g@mail.gmail.com> <ZijH6EaqWKHWRcdK@hovoldconsulting.com>
In-Reply-To: <ZijH6EaqWKHWRcdK@hovoldconsulting.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 Apr 2024 09:24:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+RaSxsWtY704-si9vrqkoUey0W11R6X8pTxgJkt6Fiw@mail.gmail.com>
Message-ID: <CAD=FV=X+RaSxsWtY704-si9vrqkoUey0W11R6X8pTxgJkt6Fiw@mail.gmail.com>
Subject: Re: [PATCH 0/6] HID/arm64: dts: qcom: sc8280xp-x13s: fix touchscreen
 power on
To: Johan Hovold <johan@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 24, 2024 at 1:50=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Tue, Apr 23, 2024 at 01:36:18PM -0700, Doug Anderson wrote:
> > On Tue, Apr 23, 2024 at 6:46=E2=80=AFAM Johan Hovold <johan+linaro@kern=
el.org> wrote:
> > > The Elan eKTH5015M touch controller on the X13s requires a 300 ms del=
ay
> > > before sending commands after having deasserted reset during power on=
.
> > >
> > > This series switches the X13s devicetree to use the Elan specific
> > > binding so that the OS can determine the required power-on sequence a=
nd
> > > make sure that the controller is always detected during boot. [1]
> > >
> > > The Elan hid-i2c driver currently asserts reset unconditionally durin=
g
> > > suspend, which does not work on the X13s where the touch controller
> > > supply is shared with other peripherals that may remain powered. Hold=
ing
> > > the controller in reset can increase power consumption and also leaks
> > > current through the reset circuitry pull ups.
> >
> > Can you provide more details about which devices exactly it shares
> > power with? I'm worried that you may be shooting yourself in the foot
> > to avoid shooting yourself in the arm.
> >
> > Specifically, if those other peripherals that may remain powered ever
> > power themselves off then you'll end up back-driving the touchscreen
> > through the reset line, won't you? Since reset is active low then not
> > asserting reset drives the reset line high and, if you power it off,
> > it can leach power backwards through the reset line. The
> > "goodix,no-reset-during-suspend" property that I added earlier
> > specifically worked on systems where the rail was always-on so I could
> > guarantee that didn't happen.
> >
> > From looking at your dts patch it looks like your power _is_ on an
> > always-on rail so you should be OK, but it should be documented that
> > this only works for always-on rails.
> >
> > ..also, from your patch description it sounds as if (maybe?) you
> > intend to eventually let the rail power off if the trackpad isn't a
> > wakeup source. If you eventually plan to do that then you definitely
> > need something more complex here...
>
> No, that's the whole point: the hardware is designed so that the reset
> line can be left deasserted by the CPU also when the supply is off.
>
> The supply in this case is shared with the keyboard and touchpad, but
> also some other devices which are not yet fully described. As you
> rightly noted, the intention is to allow the supply to eventually be
> disabled when none of these devices are enabled as wakeup sources.
>
> I did not want to get in to too much details on exactly how this
> particular reset circuit is designed, but basically you have a pull up
> to an always-on 1.8 V rail on the CPU side, a FET level shifter, and a
> pull up to the supply voltage on the peripheral side.
>
> With this design, the reset line can be left deasserted by the CPU
> (tri-stated or driven high), but the important part is that the reset
> signal that goes into the controller will be pulled to 3.3 V only when
> the supply is left on and otherwise it will be connected to ground.

Ah, got it. The level shifter isolating things makes sense.


> > I guess one last thought is: what do we do if/when someone needs the
> > same solution but they want multiple sources of touchscreens, assuming
> > we ever get the second-sourcing problem solved well. In that case the
> > different touchscreen drivers might have a different idea of how the
> > GPIO should be left when the driver exits...
>
> The second-source problem is arguable a separate one, and as we've
> discussed in the past, the current approach of describing both devices
> in the devicetree only works when the devices are truly compatible in
> terms of external resources (supplies, gpios, pinconfig). For anything
> more complex, we need a more elaborate implementation.
>
> In this case it should not be a problem, though, as the reset circuit
> should have the same properties regardless of which controller you
> connect (e.g. both nodes would have the 'no-reset-on-power-off'
> property).

The reset circuitry may be the same, but the properties of the
touchscreen might not be. It would be easy to imagine a different
touchscreen that consumes less power when held in reset.

In any case, not a problem we need to solve right now.


-Doug

