Return-Path: <linux-arm-msm+bounces-22230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B2902BA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2024 00:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AF24281172
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 22:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 507E618E2A;
	Mon, 10 Jun 2024 22:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EwyGb2Cp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C015E6AAD
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 22:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718058396; cv=none; b=aewMt1hAUV+ewPDsiIyCjHDvPMSQJ/M56mqT5lFXb0zq/9d65MPSf71vesjyNMFbSgO7lIiPQq5J20GBjt0f43VOoD3X6VbeHJE9qcr/VgyB31tS8XZpk1iQxrVvZ8jgVP7i4FQtnl69GHS4zjdXWZ5h9C6t7gWFC1ZQCKEWoSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718058396; c=relaxed/simple;
	bh=UkdMo81OPxibP5QWCa3Q4ea2Hnlk2bNprAdwi0u0DcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3zHk4ihl3OG2hWs6vXjfj0vR+vpE0d+TNBYrxhkYncm7d7Z2FW7avM7X5KYtjRdBxlx0shwxq94/5vDrhco+SZLNsQ2kg6aWuWQSDWhj3j/24zBe2Uvx+usWVHv3rWEOFAfUipkI37ZnYqu9ld1pBpA0Lw5OdFhe8KRq+hx5Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EwyGb2Cp; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6b0825b8421so5965906d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 15:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718058392; x=1718663192; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KvmBLiFSEfvE3RppHoP2rx6eSDtIOM7lvuped6LOb5g=;
        b=EwyGb2CpJIy9YfKnCrJGgb0fE0KWhQPMMUpKd97iFGn5enRdepAp5J8/G9MlZv4hF2
         3NR8mJGugZ9TEeBmuX5D/8f7fU3AGpQsq3KB7vOy1zHIESN/HqnBz8OY0lLn7VKerESv
         N/4B+VyOKtjSgy9ydqNieES5LWhi+6FW6CTcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718058392; x=1718663192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KvmBLiFSEfvE3RppHoP2rx6eSDtIOM7lvuped6LOb5g=;
        b=EeYiAx/Gco04/igdAgfMvwoShy5qAqQF1ESFD4UlNndUwkiZSWmDU1uIcRgdiHlhP7
         8J1Q85uz3lTqeNYi8Ek9uFkaPIXKwzgne6LJhdIy5PQhFFjcdf+T0kI2bBvYwlzipCqe
         fpqlzlRjdJXxg6agCR1VfnIWaTC9jVN8fQtsJdIxNzDJ3WWTMUv4Xmucq7gvregNKBse
         roQxFLYM1rz7HY75q/0ttZU40WWvGIqjZyamDP3Elcttf8dnL06NryYTw22OiGU4ouok
         uHHZckgPrA+bcH+RkgqSYG5+5kYQ45JV/V9er5RubibI3p5BgLbuM4lc8+468Z/dC4qa
         NybA==
X-Forwarded-Encrypted: i=1; AJvYcCW1eVyc3ulKxh6lb+62K5+ULutjiDrr2jjTa4lBeQmqJEFD4HhncfJbIeCa55a3s1OhqX6KoYBad7i0sliS3GB0wRigebPABd8oWjG/Wg==
X-Gm-Message-State: AOJu0YySmTM6JGse24VMTqcuUEngzRPx+FRYTAnxnCnVsQYjeZNUvP/0
	WJ8ZLFhXGdR2hBpacl6ijF9KCO3+5f3SYG8hsUADbZcmDrtoFweln6ZeOeK+NF4OExqfxIFctHU
	=
X-Google-Smtp-Source: AGHT+IHcau11A+jEBxmiOx3trOXcE5y3sxMq+EAgsI4kk8PiiomlNUv7nIbmje08KEoa7QnNPHdYsQ==
X-Received: by 2002:a05:6214:3d07:b0:6b0:8789:ae3d with SMTP id 6a1803df08f44-6b08789b0efmr18774696d6.34.1718058392487;
        Mon, 10 Jun 2024 15:26:32 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b086183468sm7811006d6.60.2024.06.10.15.26.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 15:26:32 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-44056f72257so122221cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 15:26:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV0FmEQAsGB3l0kcii0UiQMGl5MMg2jgA65IKu/6knE1TrtMglzMKKu8vae2lmzTSVDppTw7Y2Oc2eqDiybH9br3Bl2fGB0zw7zq8fPDw==
X-Received: by 2002:a05:622a:2990:b0:441:4be3:8644 with SMTP id
 d75a77b69052e-4414be38780mr17231cf.1.1718058391072; Mon, 10 Jun 2024 15:26:31
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604160123.2029413-1-dianders@chromium.org>
 <20240604090028.v3.2.I3e1968bbeee67e28fd4e15509950805b6665484a@changeid> <554749d5-5709-c740-b05d-bd4957d1e8d0@linux.intel.com>
In-Reply-To: <554749d5-5709-c740-b05d-bd4957d1e8d0@linux.intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 10 Jun 2024 15:26:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VLa1pZv1gy7WONzThopx6RXf_8Uh3L0wCWdY6_Mo1KTA@mail.gmail.com>
Message-ID: <CAD=FV=VLa1pZv1gy7WONzThopx6RXf_8Uh3L0wCWdY6_Mo1KTA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] serial: qcom-geni: Fix the timeout in qcom_geni_serial_poll_bit()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-msm@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-serial <linux-serial@vger.kernel.org>, John Ogness <john.ogness@linutronix.de>, 
	Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>, 
	Stephen Boyd <swboyd@chromium.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 7, 2024 at 12:50=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> > +     /*
> > +      * This function is used to poll bits, some of which (like CMD_DO=
NE)
> > +      * might take as long as it takes for the FIFO plus the temp regi=
ster
> > +      * on the geni side to drain. The Linux core calculates such a ti=
meout
> > +      * for us and we can get it from uart_fifo_timeout().
> > +      *
> > +      * It should be noted that during earlycon the variables that
> > +      * uart_fifo_timeout() makes use of in "uport" may not be setup y=
et.
> > +      * It's difficult to set things up for earlycon since it can't
> > +      * necessarily figure out the baud rate and reading the FIFO dept=
h
> > +      * from the wrapper means some extra MMIO maps that we don't get =
by
> > +      * default. This isn't a big problem, though, since uart_fifo_tim=
eout()
> > +      * gives back its "slop" of 20ms as a minimum and that should be
> > +      * plenty of time for earlycon unless we're running at an extreme=
ly
> > +      * low baud rate.
> > +      */
> > +     timeout_us =3D jiffies_to_usecs(uart_fifo_timeout(uport));
>
> Hi,
>
> While this is not exactly incorrect, the back and forth conversions nsecs
> -> jiffies -> usecs feels somewhat odd, perhaps reworking
> uart_fifo_timeout()'s return type from jiffies to e.g. usecs would be
> preferrable. As is, the jiffies as its return type seems a small obstacle
> for using uart_fifo_timeout() which has come up in other contexts too.

Sure. I'll change it to "ms" instead of "us". We don't need the
fidelity of "us" here given that the function is adding 20 ms of slop
anyway so might as well return ms so that callers don't need to do so
much math and don't need to work with u64.

This means that I'll have to add a "* USEC_PER_MSEC" in my driver, but
it still feels like the more correct thing to do. It also has the nice
side effect of allowing the driver to remove the awkward
"DIV_ROUND_UP(timeout_us, 10) * 10" because we know that the timeout
will always be a proper multiple.

I'll also add a new function with the _ms suffix instead of changing
the old one. The suffix makes it clear to the caller what the unit of
the returned value is and we might as well leave the old wrapper
there--otherwise we just need to move the jiffies conversion into the
existing callers.

