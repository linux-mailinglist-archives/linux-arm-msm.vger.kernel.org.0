Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7E0E6EF1D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Apr 2023 12:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240018AbjDZKVq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Apr 2023 06:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240153AbjDZKVo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Apr 2023 06:21:44 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F41A935AC
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Apr 2023 03:21:41 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4403aef7f1fso2495586e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Apr 2023 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20221208.gappssmtp.com; s=20221208; t=1682504501; x=1685096501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5ddJJouQF0VMg4gLphGJLFIlcb6TbSvOUl9yWeTAB0=;
        b=zsa8P4i496EbZ9/9LRHfm1Evv1CuEbHUX3snQ7nJzrrN0Bpetkz5flyHJBq7GP6ZY+
         ZDN6lYgi03rJQ39TC1ONkGoUcnlTYaO0wTAknsa6BEO/eZptGfP1/Wk2rmxhy/cDFN1u
         fg3uQNBGXXdLlL6QwJiPFNXIFOy0hEHCB3i8MvIUiBou7zklIKfvkGQfz43o8VohfGVc
         OJ73U3gxiNbCx7ZScD0ypfbdJe9zxRLZyfk7N+HBB2GvK2XIuQULBsMPhSVdFNuvjmfy
         syVmhZd7P4Z8sWbz7DAh7rUGfzOu/vgvoLnTXgTRg9jgTLEXnfmupwmlsNLk2kOB/PVJ
         5Auw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682504501; x=1685096501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5ddJJouQF0VMg4gLphGJLFIlcb6TbSvOUl9yWeTAB0=;
        b=c2iwZPap62BBXstnFueYWW68vurDcMqPprvygeu0nx9U8SpVe3Ep8gA5dS1pkx7Yi6
         OOgQfGCuXARudzIcT8aVhXgvq5ILK3U8Q5g/5u7CPzc7Caq3oE2hM+wxZD1ADsNh2y5y
         WYkk+SxVP7UXAazbCw0bvcgQKLefDtXfRN7TGLwlCpmfEpdbbuREDj4/tXBwJPrTcHml
         mqJfuHonGqOUNBTAl1uhhpxd3qP3SRmCP2j/EIzFR9QiGSskIeDXPuxxGrRUKPZZj/bb
         dSGLyiFZgcAf1xVaRbU+YHxHsGK3vsaJhmkr9p/uX/sFyqfvNRoDITIYmrctnKvmC4+E
         5crw==
X-Gm-Message-State: AAQBX9c14y10FDffJPUwYGuQ8jwTdpY693NrbtlgYiLmYM/wyqX+8TDh
        LeqLL0UyObaT7BF7pczKJ6BysqS0DOACaVEJZyJnAg==
X-Google-Smtp-Source: AKy350Zi9Q1Lktqu4EEULyrk/A02CU31Usyj5JoncFgGwtXrBx71o/Oi0fhGYphHH3NKVhpiK4Dqe5GdaCdrPCC9fZc=
X-Received: by 2002:a1f:4f83:0:b0:43f:bcdf:b60e with SMTP id
 d125-20020a1f4f83000000b0043fbcdfb60emr4937454vkb.0.1682504501111; Wed, 26
 Apr 2023 03:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230425034010.3789376-1-quic_bjorande@quicinc.com> <20230425034010.3789376-2-quic_bjorande@quicinc.com>
In-Reply-To: <20230425034010.3789376-2-quic_bjorande@quicinc.com>
From:   "Bryan O'Donoghue" <pure.logic@nexus-software.ie>
Date:   Wed, 26 Apr 2023 11:21:29 +0100
Message-ID: <CAJB8c06H+3pxoUGXWOXyCgtbOj6y0OhSxb9dvoTo1b6iChy7ng@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Add
 ports and orientation-switch
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 25, 2023 at 4:40=E2=80=AFAM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> The QMP combo phy can be connected to a TCPM, a USB controller and a
> DisplayPort controller for handling USB Type-C orientation switching
> and propagating HPD signals.
>
> Extend the binding to allow these connections to be described.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb4=
3dp-phy.yaml
> index 3cd5fc3e8fab..c037ac90ce7f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy=
.yaml
> @@ -60,6 +60,26 @@ properties:
>      description:
>        See include/dt-bindings/dt-bindings/phy/phy-qcom-qmp.h
>
> +  orientation-switch:
> +    description:
> +      Flag the PHY as possible handler of USB Type-C orientation switchi=
ng
> +    type: boolean
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Output endpoint of the PHY
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        description: Incoming endpoint from the USB controller

Do you really need this one ?

The controller doesn't process orientation switching.

---
bod
