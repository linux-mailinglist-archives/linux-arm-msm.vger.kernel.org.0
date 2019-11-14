Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8EAFCBF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2019 18:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfKNRgi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Nov 2019 12:36:38 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46343 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfKNRgi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Nov 2019 12:36:38 -0500
Received: by mail-pl1-f194.google.com with SMTP id l4so2912548plt.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2019 09:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:from:subject:to:user-agent:date;
        bh=C6YP6a5qaQZIPYsi+5V8cI3C9omvPfi1Xs6RxG615gE=;
        b=g80wO05/V1QnUyEPrXevIPKGCUs0gl81OsgscFqoJh8MJk38dzhMsUyZYyV11xC+zR
         95aneAPJNR1Mow8cIT7r20ItAnxRlvlA0UPxr4lR/k3agU26LKOi6SAqED+8CIX4uDOK
         n5/Y49376nXCYndXL7xwNjvzPyglvSRZy9RNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:from:subject:to
         :user-agent:date;
        bh=C6YP6a5qaQZIPYsi+5V8cI3C9omvPfi1Xs6RxG615gE=;
        b=qrwGvROsAZF5wockfJ22DR8xj4W/dgPPHbfS0WN27xjDXZ8u/oeXNzRvww75rNQXYX
         srDacy/RYyzoY1arxZ5TVBvX7srPYuIdzPnHECwyc6KluQOpcJLUFGrHA/o7yD76iUxa
         o8Zvg8kQoKHjb3GVk1BSXRXMXs4VWctilgxj3LeiemF4z0M27dEBLFsNs/tWUyMBC8F/
         sNpfoG00zWfCU7XHj1NgK5L1AT+XPVoJdETu5IStgwaU1+WMmq9Lqc1Zz/7rs7rkEhPm
         W9ATFabG29kSoFqLJDoRC05SIsGPSspkacPzb8DMIbguwpjYbjALigxlWPOSd6du6Hpa
         4XsA==
X-Gm-Message-State: APjAAAWZr1RU14mtd+M6uKHeG5xXsV1JdtEYfZ+oL/IyBAW2tXb/Lr8n
        x61UYvZbR/+/hcKriIxG9SMwoYpiIpQ=
X-Google-Smtp-Source: APXvYqzde3guieFZj9+8mSsqy0440HPz5f29QmZ7BKL214xHYlzSXiamcCVgzJoQJMNpGAJl76WmWw==
X-Received: by 2002:a17:902:b702:: with SMTP id d2mr10751055pls.104.1573752997461;
        Thu, 14 Nov 2019 09:36:37 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 82sm7131673pfa.115.2019.11.14.09.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 09:36:36 -0800 (PST)
Message-ID: <5dcd90a4.1c69fb81.757a7.37e8@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573642161-14189-1-git-send-email-akashast@codeaurora.org>
References: <1573642161-14189-1-git-send-email-akashast@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        mgautam@codeaurora.org, msavaliy@codeaurora.org,
        Akash Asthana <akashast@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v5 3/3] tty: serial: qcom_geni_serial: Remove sysfs file
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
User-Agent: alot/0.8.1
Date:   Thu, 14 Nov 2019 09:36:36 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Please update the subject. This patch does more than remove the sysfs
file. "Move loopback support to TIOCM_LOOP"?

Quoting Akash Asthana (2019-11-13 02:49:21)
> Remove code from the driver that create and maintain loopback sysfs node.
> Instead use the ioctl TIOCMSET with TIOCM_LOOP argument to set HW to
> loopback mode.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>
> ---
> Changes in V5:
>  - As per Greg's and Stephen's comment on v4 patch, removed loopback sysfs
>    file related code.
>=20
>  drivers/tty/serial/qcom_geni_serial.c | 30 ++++--------------------------
>  1 file changed, 4 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/q=
com_geni_serial.c
> index 56dad67..52f5ea2 100644
> --- a/drivers/tty/serial/qcom_geni_serial.c
> +++ b/drivers/tty/serial/qcom_geni_serial.c
> @@ -238,10 +214,14 @@ static void qcom_geni_serial_set_mctrl(struct uart_=
port *uport,
>                                                         unsigned int mctr=
l)
>  {
>         u32 uart_manual_rfr =3D 0;
> +       struct qcom_geni_serial_port *port =3D to_dev_port(uport, uport);
> =20
>         if (uart_console(uport))
>                 return;
> =20
> +       if (mctrl & TIOCM_LOOP)
> +               port->loopback =3D MAX_LOOPBACK_CFG;

How does this work? The loopback is supposed to be the max all the time
and not match some qup number or something?

