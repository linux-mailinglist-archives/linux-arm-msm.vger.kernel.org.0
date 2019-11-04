Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 763DCEEFF3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 23:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729921AbfKDWYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 17:24:37 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45503 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730761AbfKDVw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 16:52:29 -0500
Received: by mail-pg1-f193.google.com with SMTP id w11so2056793pga.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2019 13:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:subject:from:to:user-agent:date;
        bh=hvwhMbbMLTQmT4EnklRO7+XD7jrkfU1DyKxKbEv59BY=;
        b=GTmwlmHKJv6m7lEmrRHiRuVkt40QU5VjQPL4wMUQL0SBKD/ZrlEjjVXq4VXLgx23E+
         EyXEiYvKjGx1laBVzg8BHGGKL27se9kCACNYF2RbpI5aRco5j8y9o+jwoycQnytomns3
         L0LDU8wO0FgNABop05O80JS25z5KUrLambYaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:subject:from:to
         :user-agent:date;
        bh=hvwhMbbMLTQmT4EnklRO7+XD7jrkfU1DyKxKbEv59BY=;
        b=HPbHidmiCrNL99qUJV4YvOpcbLHPMbeLXACm/V4rE/ftAO2vIIn9m1iTPmK/ntjQPH
         SniNoKoaPe0N0cZifhAtJUJcFWO5UeP6VV/I1rFvoj9VyBP9bu4K+is5s1Ika2H7KgxB
         5LiDOdo9+WxSyhae+BK4oGF+BtKDi2dUTFguoUr70zIQAIdaTBlMEOzTcxO4q33RLOam
         DPd73wkBFk4qyamUbkjjyaSYN/LR3ggB4q3LQ7p1Xuc2ZFHhBTvmeIv/idiwja2Bbiuj
         Lmolen7iImYzu9hK9hAHlkSpQRPEqVW6yrvxI/RIkChPVSI6ZlMgCNbqHEoG28x13FBU
         Lq/w==
X-Gm-Message-State: APjAAAWT+u/veFCMMYV7bOVnvbOXWESoeisSsj1URSyp+asKt2PLYcKb
        qE0fN/U6unt65FRgFhibYQnC85yBhHtSTQ==
X-Google-Smtp-Source: APXvYqywPolweWSirYq4v0ZXeuALaU+gxL0P81Ry7qLEzGhQMK89OGMyA3ylB28pLWbnFC72zPaSMg==
X-Received: by 2002:a62:e214:: with SMTP id a20mr18256270pfi.193.1572904347834;
        Mon, 04 Nov 2019 13:52:27 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id p9sm18239202pfq.40.2019.11.04.13.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 13:52:27 -0800 (PST)
Message-ID: <5dc09d9b.1c69fb81.3bb21.4dfc@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1572418544-11593-3-git-send-email-sanm@codeaurora.org>
References: <1572418544-11593-1-git-send-email-sanm@codeaurora.org> <1572418544-11593-3-git-send-email-sanm@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Subject: Re: [PATCH 2/2] dt-bindings: phy-qcom-qmp: Add SC7180 QMP phy support
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
User-Agent: alot/0.8.1
Date:   Mon, 04 Nov 2019 13:52:26 -0800
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2019-10-29 23:55:44)
> Add QMP phy entries for SC7180 in device tree bindings.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20

Can you convert this binding to YAML? Would make it easier to see what
is applicable to certain compatibles.

> diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Doc=
umentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> index eac9ad3..369f5b7 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
> @@ -15,17 +15,20 @@ Required properties:
>                "qcom,sdm845-qmp-usb3-phy" for USB3 QMP V3 phy on sdm845,
>                "qcom,sdm845-qmp-usb3-uni-phy" for USB3 QMP V3 UNI phy on =
sdm845,
>                "qcom,sdm845-qmp-ufs-phy" for UFS QMP phy on sdm845,
> -              "qcom,sm8150-qmp-ufs-phy" for UFS QMP phy on sm8150.
> +              "qcom,sm8150-qmp-ufs-phy" for UFS QMP phy on sm8150,

Should remove the comma at the end of these lines so they don't have to
change.

> +              "qcom,sc7180-qmp-usb3-phy" for USB3 QMP V3 phy on sc7180.
> =20
>  - reg:
>    - index 0: address and length of register set for PHY's common
>               serdes block.
>    - index 1: address and length of the DP_COM control block (for
> -             "qcom,sdm845-qmp-usb3-phy" only).
> +             "qcom,sdm845-qmp-usb3-phy" and "qcom,sc7180-qmp-usb3-phy" o=
nly).
> =20
>  - reg-names:
>    - For "qcom,sdm845-qmp-usb3-phy":
>      - Should be: "reg-base", "dp_com"
> +  - For "qcom,sc7180-qmp-usb3-phy":
> +    - Should be: "reg-base", "dp_com"
>    - For all others:
>      - The reg-names property shouldn't be defined.

Why is this so complicated? Would be better to just know that index 1 is
dp_com and index 0 is "normal" register base.

> =20
> @@ -60,6 +63,8 @@ Required properties:
>                         "ref", "ref_aux".
>                 For "qcom,sm8150-qmp-ufs-phy" must contain:
>                         "ref", "ref_aux".
> +               For "qcom,sc7180-qmp-usb3-phy" must contain:
> +                       "aux", "cfg_ahb", "ref", "com_aux".
> =20
>   - resets: a list of phandles and reset controller specifier pairs,
>            one for each entry in reset-names.
> @@ -88,6 +93,8 @@ Required properties:
>                         "ufsphy".
>                 For "qcom,sm8150-qmp-ufs-phy": must contain:
>                         "ufsphy".
> +               For "qcom,sc7180-qmp-usb3-phy" must contain:
> +                       "phy", "common".

Please sort these lists based on compatible string.

> =20
>   - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
>   - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll b=
lock.
