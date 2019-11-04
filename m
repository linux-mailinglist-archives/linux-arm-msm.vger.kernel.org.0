Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAAFAEF05A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 23:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387610AbfKDVuH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 16:50:07 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36907 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387606AbfKDVuF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 16:50:05 -0500
Received: by mail-pg1-f193.google.com with SMTP id z24so7840982pgu.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2019 13:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:from:to:user-agent:date;
        bh=m7u6XnFno1niAn3g/GTTogmEyGnr2KDC1wpIxFpftd8=;
        b=VdrX4xLlj0CeahX2K+/3ygXshjkC6iCjHbrwZN381IqazQOUBvxNx+hjT2v21ouHZ1
         k6jPHo8Sux1XBLg717ng17apSGAniOXPEWj5V1lO0i+wQqKKn9/jj7byg0bVgI64EJ9P
         OgCOnstMLPGEpA7ExFIGTmKBdTOmfwAL6YD2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:from:to
         :user-agent:date;
        bh=m7u6XnFno1niAn3g/GTTogmEyGnr2KDC1wpIxFpftd8=;
        b=Pqm7be8gm9V9/YHequgjlNt9i9wzq6L0qxS/s6uDaF6HEcs5u4IbcJuY8ahSnt0Gwa
         XiSIoz6a8SGvk4mWsLKIdPrlBF1DEqX6pyaHk/IXXnoloQdyEPfSOgBP4OQH8iWpQwiU
         m1JWzxQU3ftit3fhg4jXOqb/x8fch22cWy8xaYKqo47ZhqS2GQMEIfydk5K62VMQrBOd
         jIYLKxL0ZHy45Fo1czQJmd3fFW3GFr1zFYtjB5aKOtCYIB9WImKfXDZriRdH+CMoqFtd
         g1DHsbJMzdKuUQ2KNf5CCk2FHpfzEuafg2GMwaTMdzPnpnKjvW7WehfdAF84J5Ki7jYk
         /EoA==
X-Gm-Message-State: APjAAAVts2vufoab7gxOKlvpyzbxNrpEB/BlYsfUlQQzSKfKQoXkI4TD
        lpQ9tbXmLmbPf8tqkWTzeqmxS9JP8j2Hwg==
X-Google-Smtp-Source: APXvYqz6i6OlRVP/C1nZkPSqyVXpRcWXPfCHnElJZ53YJ41MFt/42z//JvyK3J+7s2m3NyiYTYlSVA==
X-Received: by 2002:a63:595:: with SMTP id 143mr32676791pgf.45.1572904204940;
        Mon, 04 Nov 2019 13:50:04 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a25sm957354pff.50.2019.11.04.13.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 13:50:04 -0800 (PST)
Message-ID: <5dc09d0c.1c69fb81.99b28.48eb@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572500287-21353-3-git-send-email-sanm@codeaurora.org>
References: <1572500287-21353-1-git-send-email-sanm@codeaurora.org> <1572500287-21353-3-git-send-email-sanm@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH 2/2] dt-bindings: phy-qcom-qusb2: Add SC7180 QUSB2 phy support
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 13:50:03 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2019-10-30 22:38:07)
> Add QUSB2 phy entries for SC7180 in device tree bindings.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)

Can you convert this binding to YAML? It may make it easier to
understand what compatibles have certain properties.

>=20
> diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/D=
ocumentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> index fe29f9e..d46fca7 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> @@ -8,6 +8,7 @@ Required properties:
>                "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
>                "qcom,msm8998-qusb2-phy" for 10nm PHY on msm8998,
>                "qcom,sdm845-qusb2-phy" for 10nm PHY on sdm845.
> +              "qcom,sc7180-qusb2-phy" for 8nm PHY on sc7180.

Please sort compatible string here.

> =20
>   - reg: offset and length of the PHY register set.
>   - #phy-cells: must be 0.
> @@ -31,23 +32,23 @@ Optional properties:
>   - qcom,imp-res-offset-value: It is a 6 bit value that specifies offset =
to be
>                 added to PHY refgen RESCODE via IMP_CTRL1 register. It is=
 a PHY
>                 tuning parameter that may vary for different boards of sa=
me SOC.
> -               This property is applicable to only QUSB2 v2 PHY (sdm845).
> +               This property is applicable to only QUSB2 v2 PHY (sdm845,=
sc7180).

Put a space after that comma please.

>   - qcom,hstx-trim-value: It is a 4 bit value that specifies tuning for H=
STX
>                 output current.
>                 Possible range is - 15mA to 24mA (stepsize of 600 uA).
>                 See dt-bindings/phy/phy-qcom-qusb2.h for applicable value=
s.
> -               This property is applicable to only QUSB2 v2 PHY (sdm845).
> +               This property is applicable to only QUSB2 v2 PHY (sdm845,=
sc7180).
>                 Default value is 22.2mA for sdm845.
>   - qcom,preemphasis-level: It is a 2 bit value that specifies pre-emphas=
is level.
>                 Possible range is 0 to 15% (stepsize of 5%).
>                 See dt-bindings/phy/phy-qcom-qusb2.h for applicable value=
s.
> -               This property is applicable to only QUSB2 v2 PHY (sdm845).
> +               This property is applicable to only QUSB2 v2 PHY (sdm845,=
sc7180).
>                 Default value is 10% for sdm845.
>  - qcom,preemphasis-width: It is a 1 bit value that specifies how long th=
e HSTX
>                 pre-emphasis (specified using qcom,preemphasis-level) mus=
t be in
>                 effect. Duration could be half-bit of full-bit.
>                 See dt-bindings/phy/phy-qcom-qusb2.h for applicable value=
s.
> -               This property is applicable to only QUSB2 v2 PHY (sdm845).
> +               This property is applicable to only QUSB2 v2 PHY (sdm845,=
sc7180).
>                 Default value is full-bit width for sdm845.
> =20

Same comment.

