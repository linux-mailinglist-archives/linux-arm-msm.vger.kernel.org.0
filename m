Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC57718C16E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 21:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbgCSUaG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Mar 2020 16:30:06 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46523 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727136AbgCSUaG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Mar 2020 16:30:06 -0400
Received: by mail-pf1-f196.google.com with SMTP id c19so2017394pfo.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2020 13:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=jWRRL5fJU84goaEEMPwzMKuUagdNByNPY2GPzz3BqUo=;
        b=lWmsiQ6Lb12qslAwJviWPgtxxPbMSrg+pf/z7L753FhqBwUjeQBLJhoTf8/lddF/he
         xOvVxA7tlABxLQiOJrogLhHZqlWH9NMdQK6z4QFWYrq0WhNVbIDT1NPcMDNKDlbpBIGY
         esQgYzmhVXZOC2O6GW91aUxmqMwf/hxeKNtH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=jWRRL5fJU84goaEEMPwzMKuUagdNByNPY2GPzz3BqUo=;
        b=tlCYz0F1Z053s89ip1J/mCrt9vVNFIlePiVNMpAfJ7Gd/rnWdcOJgyfX2CQjc2pOWR
         9q4f1xBlYAvBm8+wQka6D1MKfeqwv953LM2C8S+hZglK5q6PThbZ/7/PYCogXqC5RN+9
         toh2t2FMCrUP1D2il/MY136nNvB1lqJEJA/9cBokGdHZ8GbAqXK2RvEZw8Vbxh02oZIR
         FyXQKCJYH3qryJwUn3YFcYIQ2+gP9UD49tuISGmurflWyQ4gpbIsRZLCMjDOzs4bumoH
         fg31flv8npVpjrwchh9SOgbFU12qyLnioSrdo14UfLz1cvuqBWmuKS5tOpsjje/81MI6
         sxTw==
X-Gm-Message-State: ANhLgQ3BJZ2mu4mIzENdX+wc7ytYmpLuv9JI+YztgZ1j+t8kiqEzmBHs
        EfNOO7Hm6fXicKQnI8WK9ISJfXT1ZIo=
X-Google-Smtp-Source: ADFU+vvXN5rPoEsslES8Yzt/IbFnT4RPQKMhfYMmFrcParmX/mJcnSp+G095zu6wuQaOYpmLGqW8Lw==
X-Received: by 2002:a62:7a88:: with SMTP id v130mr5681312pfc.129.1584649804565;
        Thu, 19 Mar 2020 13:30:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z16sm3343326pfr.138.2020.03.19.13.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 13:30:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f6e948cb-7d3f-72b6-b153-58afb1304c49@linaro.org>
References: <20200311191501.8165-1-bryan.odonoghue@linaro.org> <20200311191501.8165-3-bryan.odonoghue@linaro.org> <158458013177.152100.17920784952083533825@swboyd.mtv.corp.google.com> <aa6aa234-e2d1-bdcd-0f0e-64b2a7e497d3@linaro.org> <158463604559.152100.9219030962819234620@swboyd.mtv.corp.google.com> <f6e948cb-7d3f-72b6-b153-58afb1304c49@linaro.org>
Subject: Re: [PATCH 2/7] dt-bindings: usb: dwc3: Add a gpio-usb-connector example
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, jackp@codeaurora.org, robh@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, balbi@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Date:   Thu, 19 Mar 2020 13:30:02 -0700
Message-ID: <158464980279.152100.13680630167113607572@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bryan O'Donoghue (2020-03-19 11:03:58)
> On 19/03/2020 16:40, Stephen Boyd wrote:
> > the gpio for the connector?
>=20
> Previous version of the PHY from 2019 had extcon toggling vbus.
>=20
> Since extcon is going away, we moved go usb-gpio
>=20
> https://lwn.net/ml/devicetree/20190905175802.GA19599@jackp-linux.qualcomm=
.com/
>=20
> https://lwn.net/ml/devicetree/5d71edf5.1c69fb81.1f307.fdd6@mx.google.com/
>=20
> usb-gpio-conn handle VBUS and notifies via the USB role switch API.
>=20
> Which if the connector is a child of the controller "just works" but,=20
> maybe with a little bit of work DT <port> references could do the same=20
> thing and the connector wouldn't need to be declared as a child.
>=20
> > We (ChromeOS) need to integrate the type-c connector class, etc. on
> > sc7180 with the dwc3 driver and the current thinking has the type-c
> > connectors underneath the cros_ec node because the EC is the type-c
> > manager. The EC will have a type-c driver associated with it.
>=20
> right and you don't want, doesn't work or doesn't make sense, to declare =

> cros_ec as a child of DWC3, fair enough.
>=20
> I guess a DT remote-endpoint{} will do the job.
>=20
> Something like:
> arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
>=20

Yes something like that, but it looks like that dtsi file has the usb
host controller connected through a remote-endpoint to the type-c
connector. I was under the impression that it would only be the phy that
is connected this way because it's possible for there to be multiple
different phys that drive data out through one connector. For example,
in type-c the DP phy can be different from the USB2 phy or USB3 phy and
there could even be other things like an HDMI phy too that all go to the
same connector.
