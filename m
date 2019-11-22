Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD12107739
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 19:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfKVSWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 13:22:51 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46398 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbfKVSWu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 13:22:50 -0500
Received: by mail-pf1-f193.google.com with SMTP id 193so3833492pfc.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Nov 2019 10:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:subject:from:cc:to:user-agent:date;
        bh=QO/pxZNRQHl3Qo/n2ceXv96kjzOvi8W+JyZM4+1PLSg=;
        b=ZK5vufmDalcHrG0n+TiAVvpySwmhneQu6Uhn+V1lN1pTnn+oK0iVC4veifFP0e5yv4
         ItOIjcNrbro+Nb1XSso2WyO1P6uOF6fofJvMOQ3H9S7DR70ZsXFp+hwcaT9W07yzstAK
         7BRJeB2b4G4EY1uC+SifxJ1TOUGeonhylxdo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:subject:from:cc:to
         :user-agent:date;
        bh=QO/pxZNRQHl3Qo/n2ceXv96kjzOvi8W+JyZM4+1PLSg=;
        b=XatLEPxh3xac6/juK72BTc6CWQ59vUVw8Uq0Z9SGkmHUZR6xPdQtxNnetNQx72clWq
         N4Rf7P9BbShPGYjF63ICVo2iZMVij15jkOqUDCG6H2lLVgVIrlq3DXfHRyFsuhecczHW
         C7KrPXaOznOa49DN5A4SIksKbPVEOZwoR0s3TSBeqJV8HS70/1XdO+aPnbPOSpmxq0jQ
         RY+dt9zR5cjI0FC3OuHP6WeLNiJXa7d7mIhNL58rLTG0ZrtP19kNixbh+wzKe1JSyESr
         VtvU2UARKY2uSo77PbeAcGlOr3mtRSM+LilkRQR8Srpcgw1lf8pzQhV9MJXJ423xm6tR
         NKqQ==
X-Gm-Message-State: APjAAAU4sX4MgYZXtI8S9bRkNCo/k2MjLA7CF07hFGNCq3goPUSajZ6g
        aqsR/quxyVUHvymeTuepN6L0R7ZGWSQ=
X-Google-Smtp-Source: APXvYqwAqwt6xENnn01835Nc7UcTVS401B+p8Mxy8RIewsuVXuee9EswcADVgrtT8miyldbW01XWLg==
X-Received: by 2002:a63:ff0b:: with SMTP id k11mr18061258pgi.274.1574446969779;
        Fri, 22 Nov 2019 10:22:49 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b1sm3526572pjw.19.2019.11.22.10.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 10:22:49 -0800 (PST)
Message-ID: <5dd82779.1c69fb81.c1de1.90e5@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0101016e937a5b83-1c5c4e0e-ae63-447a-8724-52477b11dff4-000000@us-west-2.amazonses.com>
References: <1574432266-20732-1-git-send-email-akashast@codeaurora.org> <0101016e937a5b83-1c5c4e0e-ae63-447a-8724-52477b11dff4-000000@us-west-2.amazonses.com>
Subject: Re: [PATCH v6 4/5] tty: serial: qcom_geni_serial: Wakeup over UART RX
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>, gregkh@linuxfoundation.org
User-Agent: alot/0.8.1
Date:   Fri, 22 Nov 2019 10:22:48 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2019-11-22 06:18:19)
> Add system wakeup capability over UART RX line for wakeup capable UART.
> When system is suspended, RX line act as an interrupt to wakeup system
> for any communication requests from peer.
>=20
> Signed-off-by: Akash Asthana <akashast@codeaurora.org>

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

One question below.

> @@ -1330,6 +1354,10 @@ static int qcom_geni_serial_remove(struct platform=
_device *pdev)
>         struct uart_driver *drv =3D port->uport.private_data;
> =20
>         uart_remove_one_port(drv, &port->uport);
> +
> +       device_init_wakeup(&pdev->dev, false);
> +       dev_pm_clear_wake_irq(&pdev->dev);

Should this order be swapped? Usually remove is done in reverse of probe
order, so clear_wake_irq, init wakeup, and remove uart port. I'm not
convinced it will actually matter though so maybe this isn't a problem.

