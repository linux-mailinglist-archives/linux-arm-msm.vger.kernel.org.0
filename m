Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B12CAFE5E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 20:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfKOTp1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 14:45:27 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35490 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbfKOTp1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 14:45:27 -0500
Received: by mail-pl1-f196.google.com with SMTP id s10so5368068plp.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 11:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=4q+yuQTczIPpXFYrjST9iFAFqDLKVL3UwzUfPD0Ti0E=;
        b=WRVlk7Lr3fLjV7Nkh2tcg1k4iFKQwFFUyIN0aGmGyAL1KkdukzksmdojGGoF2AJUkA
         uCrx+HHEgAvmfb2tN5n20NzJV5BF+XrWPprdOHgtHotPhFXn8hOR9HVcJDF+lIbLuWBb
         igcwvzK7fT7fJw7OWfr/qP8daSLYqjE02ZjBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=4q+yuQTczIPpXFYrjST9iFAFqDLKVL3UwzUfPD0Ti0E=;
        b=t8Z9a8arV3SC4rLx0lGCXRA85LCNzqazBkN16Y3yWWBCS78AMwQ3pslUD1QCB3GGG6
         PkRqqfdKygWjImTLKuVs3TdDvzSQRpoyUOW0GChAImL6PrssoLpG0NHss6doGN+FzOEq
         7TqBOw4c8zAkLQMQPw8LOKVdT4iTnmmY+UJUmjZonCePsUkM4Z2n5X8xyzDjXfr6z9uE
         gSmtMjId1w4IDuGHVIlKB/4od6maR3ydmYKjPwyOa/1og4hvRRkvMkw+94eR5m24bxaN
         JxCMsARfvfo545zw/3g4E1nBnIvXJcoj5zvCvSxj8mdQYOdbJYCqlnZ7Z+4kmuZTOKoD
         QdRA==
X-Gm-Message-State: APjAAAUUTavlL9ZLhCcStttf8Sql1n1OOC77fhN9cT+2z7hUbSOsRH+e
        50inFdvTw8f0cFUssB88YntU/g5ltTY=
X-Google-Smtp-Source: APXvYqyB6QiOTnKo9LokNPBto3d0oQtY/rgpXWaemtQ96PKVRvPLaS089w/OqehgSpVlpKYTeoJZsQ==
X-Received: by 2002:a17:902:ac90:: with SMTP id h16mr17332925plr.147.1573847126279;
        Fri, 15 Nov 2019 11:45:26 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r22sm13291949pfg.54.2019.11.15.11.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:45:25 -0800 (PST)
Message-ID: <5dcf0055.1c69fb81.258d1.5380@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <04363987-0d4e-645f-87d0-79888913b8c3@codeaurora.org>
References: <1573642161-14189-1-git-send-email-akashast@codeaurora.org> <5dcd90a4.1c69fb81.757a7.37e8@mx.google.com> <04363987-0d4e-645f-87d0-79888913b8c3@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, msavaliy@codeaurora.org
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
Subject: Re: [PATCH v5 3/3] tty: serial: qcom_geni_serial: Remove sysfs file
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:45:24 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-11-15 01:57:48)
>=20
> On 11/14/2019 11:06 PM, Stephen Boyd wrote:
> > Please update the subject. This patch does more than remove the sysfs
> > file. "Move loopback support to TIOCM_LOOP"?
> Ok, I will update this in next version.
> > Quoting Akash Asthana (2019-11-13 02:49:21)
> >> Remove code from the driver that create and maintain loopback sysfs no=
de.
> >> Instead use the ioctl TIOCMSET with TIOCM_LOOP argument to set HW to
> >> loopback mode.
> >>
> >> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> >> ---
> >> Changes in V5:
> >>   - As per Greg's and Stephen's comment on v4 patch, removed loopback =
sysfs
> >>     file related code.
> >>
> >>   drivers/tty/serial/qcom_geni_serial.c | 30 ++++---------------------=
-----
> >>   1 file changed, 4 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/seria=
l/qcom_geni_serial.c
> >> index 56dad67..52f5ea2 100644
> >> --- a/drivers/tty/serial/qcom_geni_serial.c
> >> +++ b/drivers/tty/serial/qcom_geni_serial.c
> >> @@ -238,10 +214,14 @@ static void qcom_geni_serial_set_mctrl(struct ua=
rt_port *uport,
> >>                                                          unsigned int =
mctrl)
> >>   {
> >>          u32 uart_manual_rfr =3D 0;
> >> +       struct qcom_geni_serial_port *port =3D to_dev_port(uport, upor=
t);
> >>  =20
> >>          if (uart_console(uport))
> >>                  return;
> >>  =20
> >> +       if (mctrl & TIOCM_LOOP)
> >> +               port->loopback =3D MAX_LOOPBACK_CFG;
> > How does this work? The loopback is supposed to be the max all the time
> > and not match some qup number or something?
> port->loopback is unrelated to QUP number. However we have different=20
> modes to run loopback test, 1(rx-tx sorted), 2(cts-rts sorted),
>=20
> 3 or Max(rx-tx sorted and cts-rts sorted). In our internal testing we=20
> only use mode 3 hence we are initializing port->loopback variable
>=20
> to 3 and eventually it will be written to HW register from set_termios=20
> call.

Ok. Thanks for clarifying. Can you rename this macro to
RX_TX_CTS_RTS_SORTED? I imagine seeing something like:

	/* SE_UART_LOOPBACK_CFG */
	#define RX_TX_SORTED		BIT(0)
	#define CTS_RTS_SORTED		BIT(1)
	#define RX_TX_CTS_RTS_SORTED	RX_TX_SORTED | CTS_RTS_SORTED

or whatever the bit field names really are.

