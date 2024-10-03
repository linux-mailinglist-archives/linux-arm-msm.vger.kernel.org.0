Return-Path: <linux-arm-msm+bounces-33043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D6698F619
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 20:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9823E1C208D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61716EB4A;
	Thu,  3 Oct 2024 18:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fb1SgGiY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E856B6A8D2
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Oct 2024 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727980221; cv=none; b=i+w/RVfulGwhFoSBTSbdWRVg2V4N0ZSz35C5L9h9JgmgGdGt+BRVKE/eSoXkusWVc5ksq379RtSgycgL72kshMzP3i2iiS9OO3pbtZuuwe77o06jY5OBhoZVY9QUzw4LHZha1+dkVLExBGV7fx/47w0Aubx1MbGrFClrI18g31w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727980221; c=relaxed/simple;
	bh=Njq0fwvF+5VhnQZ1131zaikWJHtF2S4Q3i8c1LX2lvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4LIvkrlSZF6bD9ChRu0nr3WEAGhLPO/zw0kKUb/hQOWLh714BiAkJ6wJ8Y5ZzHREjV4MbSSHOJ+OBW/ehT9eEiHDFeGWH9ZbSmN0TiuQD2FZOuEv9AQBQkUQ0WiJRSMe+irFYoEU9Ym9cTJsW3tLLonNiim5Yr9nF0zQrt+60c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fb1SgGiY; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5399041167cso2235256e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 11:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727980217; x=1728585017; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uQhmHIpIANYWDxfaKfnE9P0S3zwxERnpg0mMy9nFKho=;
        b=fb1SgGiY57LbfmRHv1G3tLy50zXrgozh7jEeNshBWKbqaV6FdXUYA8m15zu3s8Qjru
         c9wbzOmIclZu1mqCuzil+qlvsPKlGRuPx/ptEx6KqhZ3bobxwpxhAuVIjla6H8/J0n/0
         q5gxUWq8EVjWmNnpNeCA+JPseHRO6r7WeCBL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727980217; x=1728585017;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQhmHIpIANYWDxfaKfnE9P0S3zwxERnpg0mMy9nFKho=;
        b=NWtWLCLfhQocqrFFI3p86L27N4PHERfLZmdaZ9EthGq3MWs3skJLemzEA2mKGnvMS8
         kU3NSL64lDb4sbUyFf00s973BSb1jcN6wYDQivVT1Umrq2vxwB+m21WpHmm/lVjKPpH7
         cV94z9ScJ6SpUO3gSYs3jgOBqgR2dfZ1/EM2+FibBY1P3Ca6Pg9tWPPBfWqgaHXIEuDv
         Mr7pLehfnDA7bhYuJY6FRujk/qvq/428VVALZKRH0q6iEaSEyj/G6a6kxKUHmtZhqD9x
         HTmfkvdHVBpYIX/OLPhzqp4LmE8BjWnHoym6QG30OvEyP6//QF2QgAaTQYepmUw+MLfH
         nzaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzp7q2kOOzXw2cKlMToX8ML3HWtjPwQELaFg8hLxjVXVp1XjFJvwIdV2WJEzPy2EhZvVBMJpMbMhBOKB3d@vger.kernel.org
X-Gm-Message-State: AOJu0YwKuMklxJ+CFGpubIvda/21gGTel7mjaB2sGxQ1kUOxwgleqw0l
	cOzLzqsN/cboag5m9pZThE1BzHblxyNOdU/5Z82DTKu4SCC+OI25VGJTBHqfy3Z1Tf0XahEW/9z
	DFWqo
X-Google-Smtp-Source: AGHT+IH5vwYnwDIgb2AHpJpSfSVS66g0Z0c0nvluN+8ozRelgLKTdkQAzY2zvVjQA5kErYTuSKKpmQ==
X-Received: by 2002:a05:6512:4015:b0:539:89a8:600f with SMTP id 2adb3069b0e04-539ab867e9fmr262874e87.23.1727980216577;
        Thu, 03 Oct 2024 11:30:16 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a8296c45sm233334e87.132.2024.10.03.11.30.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 11:30:15 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2fad6de2590so23010691fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2024 11:30:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWeC3TAPLqlxa6PL6CBs8LXjBlu0S9D/2bK4zjUSvBUObDQiDC/EPATr4gtwAiKqw4yQBwg71JypYDANn6W@vger.kernel.org
X-Received: by 2002:a05:651c:b10:b0:2fa:e52f:4476 with SMTP id
 38308e7fff4ca-2fae52f46b7mr54095681fa.45.1727980214619; Thu, 03 Oct 2024
 11:30:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001125033.10625-1-johan+linaro@kernel.org> <20241001125033.10625-2-johan+linaro@kernel.org>
In-Reply-To: <20241001125033.10625-2-johan+linaro@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Oct 2024 11:29:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V31VFVoTWstVUnC_qDBmaUCb5Xv7pyUxUto7mquR5U4Q@mail.gmail.com>
Message-ID: <CAD=FV=V31VFVoTWstVUnC_qDBmaUCb5Xv7pyUxUto7mquR5U4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] serial: qcom-geni: fix premature receiver enable
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, stable@vger.kernel.org, 
	Aniket Randive <quic_arandive@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 1, 2024 at 5:51=E2=80=AFAM Johan Hovold <johan+linaro@kernel.or=
g> wrote:
>
> The receiver should not be enabled until the port is opened so drop the
> bogus call to start rx from the setup code which is shared with the
> console implementation.
>
> This was added for some confused implementation of hibernation support,
> but the receiver must not be started unconditionally as the port may not
> have been open when hibernating the system.

Could you provide a motivation for your patch in the description? Is
patch needed for something (perhaps a future patch in the series)? Is
it fixing a bug? Does it save power? Is the call harmless but cleaner
to get rid of?


> Fixes: 35781d8356a2 ("tty: serial: qcom-geni-serial: Add support for Hibe=
rnation feature")
> Cc: stable@vger.kernel.org      # 6.2
> Cc: Aniket Randive <quic_arandive@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 6f0db310cf69..9ea6bd09e665 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -1152,7 +1152,6 @@ static int qcom_geni_serial_port_setup(struct uart_=
port *uport)
>                                false, true, true);
>         geni_se_init(&port->se, UART_RX_WM, port->rx_fifo_depth - 2);
>         geni_se_select_mode(&port->se, port->dev_data->mode);
> -       qcom_geni_serial_start_rx(uport);

FWIW, I found at least one thing that's broken by your patch. If you
enable kgdb (but _not_ "kgdboc_earlycon") and then add "kgdbwait" to
the kernel command line parameters then things will be broken after
your patch. You'll drop into the debugger but can't interact with it.
The "kgdboc_earlycon" path handles this because of
"qcom_geni_serial_enable_early_read()" but it doesn't seem like
there's anything that handles it for normal kgdb. If you drop in the
debugger later it'll probably work if you've got an "agetty" running
because that'll enable the RX path.


-Doug

