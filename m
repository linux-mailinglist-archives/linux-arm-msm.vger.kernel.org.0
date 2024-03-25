Return-Path: <linux-arm-msm+bounces-15106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F67288B646
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 01:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03FF7B273FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 20:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252285B5BB;
	Mon, 25 Mar 2024 20:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FwlzIbJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474C72C87C
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 20:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711400195; cv=none; b=VZygngISkJa0aKBwy2NUI2aA8pnsm+BYEM6wCrhsXlrJXpIcAZ3Isplv9tR7n75bqsttPnXaL26PhP5cPV2u3jFk5lVhG15EE0X2t4MQIuIoc/yDiBoVb10tgPY3aBajlT5bZgFST55gKO3LCDomoGpQjvcYZNMDwNX1iiw0srA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711400195; c=relaxed/simple;
	bh=9UYGMc9oR0eHzWyKCyGIWWDkMJdM4kvKdBugGGt2fxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qoMRkL4P507BZUabJ32j/XF29lJhDfX1uIVxwDnInA1h9KnC9nkUqItbOjvpRhpMzssMG1/CIPIhp8lKDAgqTl4+P3ohU9tThZRZO84tKClr/E067Ti7M3me/SaZ/sYdyFbG5rjGMFmcsz4ywILPaKdEsFdcN54Yj08NZHxG/pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FwlzIbJe; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so3777569276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 13:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711400192; x=1712004992; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=besxki1zzZKLyiavhPEaN+iJiY/oxhKxhbXBWHJWvKo=;
        b=FwlzIbJeELfv5Ko6y9n0xiEPM2nFmhlZWb3RYhTIi9eI7sFnvC3FoSSqCFQPIbRsqU
         ypGEeH9gGg0R3wIMO/hgZ7XxSo4URcsU618LZ1YJZDbhZ2/Es1QIPGVyd5RD0R9GyHZH
         WtB3hET7cCdOxgTA3j1D2OoverPycgyhr/H+UMXgdyI9ff9Kcc1KnVjNoEJybsCy9oeD
         sGMzWQ4UV7CnaxlDUj8QIMoWxGzevxVS10+7O0LCp2DZRBlpt6Pv5pSgkRNWrAIyq2mU
         XFI2uh1MrJE/rd1cD7uH8TRUUYhLR0Q4vsuHw+93MIhBv0uT0hTNtTiRQtH+8j1wLcoD
         snWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711400192; x=1712004992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=besxki1zzZKLyiavhPEaN+iJiY/oxhKxhbXBWHJWvKo=;
        b=fppmcngohR98nCOfa8OqY5mNEKRGvNjkO8f/90ZQk5XOVJjVfeuyprdXkjWWd1uUfW
         /Rbw1IXv0G6TXMXgfVdawxpgYm243aR0z/BUajIq0gD2TpUyFpOSG1Aw75jB01JwwGc4
         JI3rAEtrat9lV86dTMYl3A0CPUz1LU+acbBPJHLKikYiLtaLuFEbO431b2hU0nW7/5qG
         WwK+D1mrgVSI7C01QD7sy0o8aySiyx4mrnkH4VLv/z5hoe3H5oBQSBR1vNOLGzTyNw1D
         dLgXobj0rnn/EN8GdpiKJGiTkHWQSy+rkDyOyrZu/aAs0OGM8TfinHIwDzraA4UzKOxp
         7SmQ==
X-Forwarded-Encrypted: i=1; AJvYcCULB8/sYSgRg/kt6qUocxY6LCWykk1o18OvdvwFLi5jvFLgksYG5uztYIOmakzsrrICk/KUoXVfp9+OOZPh3jrjl7Dsmh/8kvJbUAU99w==
X-Gm-Message-State: AOJu0Yyq4Ur0yEY14nZQ/0N9vw3EVHpy2OH0jf4Te50mzguGRI5yEVnd
	ccvO8I9Ga8oAYxWh/WLOEj9QEWRtnpTWi7Qu2bZiJqAcVL1LA/jg6gOP/zKO/+IULVI98JU+NQG
	gB1N+SQGd+sa/CObq2fztdii58fDAcDjrZtRfaQ==
X-Google-Smtp-Source: AGHT+IHGDdQ7jXrkcSrON57XhBZ3l9DnPEzT4z7nR2v3+oetUEyIZcbZO1m/thzWE25cnAXAr4k+8VB4qHNQUa4YEwo=
X-Received: by 2002:a25:7411:0:b0:dd1:6cad:8fd3 with SMTP id
 p17-20020a257411000000b00dd16cad8fd3mr3677424ybc.27.1711400192183; Mon, 25
 Mar 2024 13:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313-qcom-ucsi-fixes-v1-0-74d90cb48a00@linaro.org> <Zf12vSHvDiFTufLE@hovoldconsulting.com>
In-Reply-To: <Zf12vSHvDiFTufLE@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Mar 2024 22:56:21 +0200
Message-ID: <CAA8EJprAzy41pn7RMtRgbA-3MO8LoMf8UXQqJ3hD-SzHS_=AOg@mail.gmail.com>
Subject: Re: [PATCH 0/7] usb: typec: ucsi: fix several issues manifesting on
 Qualcomm platforms
To: Johan Hovold <johan@kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Bjorn Andersson <andersson@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Johan Hovold <johan+linaro@kernel.org>, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Mar 2024 at 14:16, Johan Hovold <johan@kernel.org> wrote:
>
> On Wed, Mar 13, 2024 at 05:54:10AM +0200, Dmitry Baryshkov wrote:
> > Fix several issues discovered while debugging UCSI implementation on
> > Qualcomm platforms (ucsi_glink). With these patches I was able to
> > get a working Type-C port managament implementation. Tested on SC8280XP
> > (Lenovo X13s laptop) and SM8350-HDK.
>
> > Dmitry Baryshkov (7):
> >       usb: typec: ucsi: fix race condition in connection change ACK'ing
> >       usb: typec: ucsi: acknowledge the UCSI_CCI_NOT_SUPPORTED
> >       usb: typec: ucsi: make ACK_CC_CI rules more obvious
> >       usb: typec: ucsi: allow non-partner GET_PDOS for Qualcomm devices
> >       usb: typec: ucsi: limit the UCSI_NO_PARTNER_PDOS even further
> >       usb: typec: ucsi: properly register partner's PD device
>
> >       soc: qcom: pmic_glink: reenable UCSI on sc8280xp
>
> I just gave this series a quick spin on my X13s and it seems there are
> still some issues that needs to be resolved before merging at least the
> final patch in this series:
>
> [    7.786167] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> [    7.786445] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> [    7.883493] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> [    7.883614] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> [    7.905194] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> [    7.905295] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)
> [    7.913340] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
> [    7.913409] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: UCSI_GET_PDOS failed (-5)

I have traced what is causing these messages. During UCSI startup the
ucsi_register_port() function queries for PDOs associated with the
on-board USB-C port. This is allowed by the spec. Qualcomm firmware
detects that there is no PD-device connected and instead of returning
corresponding set of PDOs returns Eerror Indicator set to 1b but then
it returns zero error status in response to GET_ERROR_STATUS, causing
"unknown error 0" code. I have checked the PPM, it doesn't even have
the code to set the error status properly in this case (not to mention
that asking for device's PDOs should not be an error, unless the
command is inappropriate for the target.

Thus said, I think the driver is behaving correctly. Granted that
these messages are harmless, we can ignore them for now. I'll later
check if we can update PD information for the device's ports when PD
device is attached. I have verified that once the PD device is
attached, corresponding GET_PDOS command returns correct set of PD
objects. Ccurrently the driver registers usb_power_delivery devices,
but with neither source nor sink set of capabilities.

An alternative option is to drop patches 4 and 5, keeping
'NO_PARTNER_PDOS' quirk equivalent to 'don't send GET_PDOS at all'.
However I'd like to abstain from this option, since it doesn't allow
us to check PD capabilities of the attached device.

Heikki, Johan, WDYT?

For reference, here is a trace of relevant messages exchanged over the
GLINK interface during UCSI bootstrap:

[   11.030838] write: 00000000: 10 00 01 00 07 00 00 00

GET_PDOS(connection 1, Source, 3 PDOs)

[   11.044171] write ack: 0
[   11.044263] notify: 00000000: 00 00 00 c0 00 00 00 00

Command Complete, Error

[   11.044458] read: 00000000: 00 01 00 00 00 00 00 c0 00 00 00 00 00 00 00 00
[   11.044460] read: 00000010: e7 3f 00 00 00 00 00 00 02 00 20 01 00 03 30 01
[   11.044462] read: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   11.059790] read: 00000000: 00 01 00 00 00 00 00 c0 00 00 00 00 00 00 00 00
[   11.059797] read: 00000010: e7 3f 00 00 00 00 00 00 02 00 20 01 00 03 30 01
[   11.059801] read: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   11.059814] write: 00000000: 04 00 02 00 00 00 00 00

Ack_CC command

[   11.075509] write ack: 0
[   11.075544] notify: 00000000: 00 00 00 20 00 00 00 00

Ack for Ack_CC

[   11.091828] read: 00000000: 00 01 00 00 00 00 00 20 00 00 00 00 00 00 00 00
[   11.091864] read: 00000010: e7 3f 00 00 00 00 00 00 02 00 20 01 00 03 30 01
[   11.091879] read: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   11.092339] write: 00000000: 13 00 00 00 00 00 00 00

GET_ERROR_STATUS

[   11.106398] write ack: 0
[   11.106435] notify: 00000000: 00 10 00 80 00 00 00 00

command complete, 0x10 bytes of response

[   11.122729] read: 00000000: 00 01 00 00 00 10 00 80 00 00 00 00 00 00 00 00
[   11.122758] read: 00000010: 00 00 00 00 00 00 00 00 02 00 20 01 00 03 30 01
[   11.122770] read: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

Zero response data


[   11.137523] read: 00000000: 00 01 00 00 00 10 00 80 00 00 00 00 00 00 00 00
[   11.137548] read: 00000010: 00 00 00 00 00 00 00 00 02 00 20 01 00 03 30 01
[   11.137559] read: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   11.153028] read: 00000000: 00 01 00 00 00 10 00 80 00 00 00 00 00 00 00 00
[   11.153064] read: 00000010: 00 00 00 00 00 00 00 00 02 00 20 01 00 03 30 01
[   11.153080] read: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   11.153492] write: 00000000: 04 00 02 00 00 00 00 00

Ack_CC for the GET_ERROR_STATUS command

[   11.169060] write ack: 0
[   11.169108] notify: 00000000: 00 00 00 20 00 00 00 00

Ack for ACK_CC

[   11.184114] read: 00000000: 00 01 00 00 00 00 00 20 00 00 00 00 00 00 00 00
[   11.184140] read: 00000010: 00 00 00 00 00 00 00 00 02 00 20 01 00 03 30 01
[   11.184152] read: 00000020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   11.184548] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: unknown error 0
[   11.184695] ------------[ cut here ]------------
[   11.184703] WARNING: CPU: 2 PID: 28 at
drivers/usb/typec/ucsi/ucsi.c:140 ucsi_exec_command+0x284/0x328
[typec_ucsi]
[   11.185488] Call trace:
[   11.185494]  ucsi_exec_command+0x284/0x328 [typec_ucsi]
[   11.185519]  ucsi_send_command+0x54/0x118 [typec_ucsi]
[   11.185543]  ucsi_read_pdos+0x5c/0xdc [typec_ucsi]
[   11.185567]  ucsi_get_pdos+0x30/0xa4 [typec_ucsi]
[   11.185590]  ucsi_init_work+0x3bc/0x82c [typec_ucsi]
[   11.185614]  process_one_work+0x148/0x2a0
[   11.185638]  worker_thread+0x2fc/0x40c
[   11.185655]  kthread+0x110/0x114
[   11.185668]  ret_from_fork+0x10/0x20

Then comes the same log for the Connector=1, Sink PDOs, Connector=2
Source PDOs and finally Connector=2 Sink PDOs.


-- 
With best wishes
Dmitry

