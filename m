Return-Path: <linux-arm-msm+bounces-18354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C18068AF811
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 22:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B24A1F23FAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 20:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD902142E83;
	Tue, 23 Apr 2024 20:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AfFm0DLD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4398F1F95E
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 20:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713904601; cv=none; b=HoJTn3QRL+0SfBZMB56Bq+K67UJO1jbBlplRX7ENXT6nXVbS2IBCBoFGGgVxbhGRvzxd8EKIq8UayvpHpqFhnXUkzDUtOzdE/UlwzGQOvV1sjjrKdYgmyEEXZWeh2dv1keHCE4r8G74/LauwRltZIWfK2iEozTEkC35k4rnq1i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713904601; c=relaxed/simple;
	bh=hdVBYhMGvt4bNKMToAfaZbct/f7HDFw/iwj5G53CShY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbyje3o67eA1GiaxOMdiam5O6Zof4QfULseY7eH3Z60yMr8lUlSO9aJK4g4H3XOXjPPEkcgrbCRtVTJO5KBw7euN+vxvNRy0DQjUqN35L5rhzF9WX2sDrd5Nz5q8nEc9Hci+fNvwrTCfM/UPL80VV+qpxP7Bc3FUs426ldM2syk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AfFm0DLD; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-78efd1a0022so450149385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 13:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713904596; x=1714509396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hdVBYhMGvt4bNKMToAfaZbct/f7HDFw/iwj5G53CShY=;
        b=AfFm0DLDqAIgfOhgdgIlPSE17bGr/mf1rs3EKLIdFm8I6M/2ixA4QRO6xvNnlxLT95
         TxIwYbf/9W4u5JAVzKWx6tAgOqxnjv/rjKDJ3n5B+5L/yNbynN4HEC1CLbES0yiBq/K2
         ISYb71b3auMD/PTnBCUn4ueWgXibYM3by5SV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713904596; x=1714509396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hdVBYhMGvt4bNKMToAfaZbct/f7HDFw/iwj5G53CShY=;
        b=hqbH51nFBvp97DL4x9vFZItxAtACM1hk3q/IKSPClg+DXkBOFDrirvd8MunLEKa6Hc
         mG7/V1RYRkfkeDaHQR3v2WWlYpTO5zd75HxdCQGbhz80zI4kI7gKYs+hdp31VoiQ+S2W
         TVoXB0SnJBcKjBi3KhZZ2d2EWXjV8Q3BHxH8NpNVJfhZ1nE9C8Hky06u6Joj58op6XUc
         5Z+2FaTKrG9R62GOuOEQbJ8jS7HCiJvThSHoCUYxw4+rQ93YENVfT9fjDpteGf3UGfZs
         KyLFhJPXtFJDMpJwBxluVD1CxIwyQWlVg+juyeIxjGbBA3WxlFTHMIpIaEskBRlp4Q8y
         6FYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm5SnK7CeqUJwWu99cnTnG94tR1r5T4ynIiMjI/9+/u/zuTzPsdsXOZ4NCLYPNvmayqLRzB3baof46cGGqqDlrqqHRT4JgizhGkwM6UA==
X-Gm-Message-State: AOJu0YwoxPC/TWEpo2dtP90qd8FLg8Dr9mlsE8YHiI/nUA1AodCvAYIg
	ky8F9RBX+GBB+FTAAJ6rTo6urMvoXyXtRaKzaGGrdErUM5cBKffR2Uakf/q5GWDobz7ABt5ftP/
	lzg2c
X-Google-Smtp-Source: AGHT+IFc0TpbKBC3gUEt2R+KVBomuw0yKk5RzrWOJb+awK9JRCO+zha+nIMa99aglgIJH7rbtZ1mYg==
X-Received: by 2002:a05:620a:238:b0:790:7d72:977c with SMTP id u24-20020a05620a023800b007907d72977cmr697063qkm.62.1713904596179;
        Tue, 23 Apr 2024 13:36:36 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id a8-20020a05620a124800b0078f28a08785sm4394747qkl.88.2024.04.23.13.36.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 13:36:35 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-43989e6ca42so95781cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 13:36:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVVFkar/5OE5mJbYJUMjvJMF2s3+9jPvapgMGIcGm6D5OmQkhLOvP61+rfQUqa5AAm+SRT0CIeg1sOG5JJGzNNEyAGr7LqPHyMr5XzLLg==
X-Received: by 2002:a05:622a:1cc5:b0:437:b572:6a with SMTP id
 bc5-20020a05622a1cc500b00437b572006amr6192qtb.23.1713904593750; Tue, 23 Apr
 2024 13:36:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240423134611.31979-1-johan+linaro@kernel.org>
In-Reply-To: <20240423134611.31979-1-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 23 Apr 2024 13:36:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W2Y=Sr-=YkKb01XLQsbQJr2b981c9kcfvAc4_5E9XD7g@mail.gmail.com>
Message-ID: <CAD=FV=W2Y=Sr-=YkKb01XLQsbQJr2b981c9kcfvAc4_5E9XD7g@mail.gmail.com>
Subject: Re: [PATCH 0/6] HID/arm64: dts: qcom: sc8280xp-x13s: fix touchscreen
 power on
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 23, 2024 at 6:46=E2=80=AFAM Johan Hovold <johan+linaro@kernel.o=
rg> wrote:
>
> The Elan eKTH5015M touch controller on the X13s requires a 300 ms delay
> before sending commands after having deasserted reset during power on.
>
> This series switches the X13s devicetree to use the Elan specific
> binding so that the OS can determine the required power-on sequence and
> make sure that the controller is always detected during boot. [1]
>
> The Elan hid-i2c driver currently asserts reset unconditionally during
> suspend, which does not work on the X13s where the touch controller
> supply is shared with other peripherals that may remain powered. Holding
> the controller in reset can increase power consumption and also leaks
> current through the reset circuitry pull ups.

Can you provide more details about which devices exactly it shares
power with? I'm worried that you may be shooting yourself in the foot
to avoid shooting yourself in the arm.

Specifically, if those other peripherals that may remain powered ever
power themselves off then you'll end up back-driving the touchscreen
through the reset line, won't you? Since reset is active low then not
asserting reset drives the reset line high and, if you power it off,
it can leach power backwards through the reset line. The
"goodix,no-reset-during-suspend" property that I added earlier
specifically worked on systems where the rail was always-on so I could
guarantee that didn't happen.

From looking at your dts patch it looks like your power _is_ on an
always-on rail so you should be OK, but it should be documented that
this only works for always-on rails.

...also, from your patch description it sounds as if (maybe?) you
intend to eventually let the rail power off if the trackpad isn't a
wakeup source. If you eventually plan to do that then you definitely
need something more complex here...


> Note that the latter also affects X13s variants where the touchscreen is
> not populated as the driver also exits probe() with reset asserted.

I assume driving against an external pull is _probably_ not a huge
deal (should be a pretty small amount of power), but I agree it would
be nice to fix.

I'm a bit leery of actively driving the reset pin high (deasserting
the reset) just to match the pull. It feels like in your case it would
be better to make it an input w/ no pulls. It almost feels like
something in the pinctrl system should handle this. Something where
the pin is default "input no pull" at the board level and when the
driver exits it should go back to the pinctrl default...


I guess one last thought is: what do we do if/when someone needs the
same solution but they want multiple sources of touchscreens, assuming
we ever get the second-sourcing problem solved well. In that case the
different touchscreen drivers might have a different idea of how the
GPIO should be left when the driver exits...

-Doug

