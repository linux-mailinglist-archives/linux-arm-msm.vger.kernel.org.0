Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F38678C745
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Aug 2023 16:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236602AbjH2OUP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Aug 2023 10:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236809AbjH2OUF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Aug 2023 10:20:05 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7C61BC
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 07:19:54 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-d7830c5b20aso5691550276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Aug 2023 07:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693318794; x=1693923594; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u6C2BMeyRT9BVmnW3F8DPujOXWC4dh3QQ/H+JPTB0fs=;
        b=NqiWGwqDdZooKYiFOaEU4pIVdwEJlvqpKW6i8CBSzmkt5eo0D9tU69ogQfXd/CHCxc
         cE9h04VsPeV54NojBDAJZhsPTOLa+VRhvtg0M4qWkdGlOiO3NaTrkmScjat55V+mP40A
         LvRKjedZ2Px2lbyUNpmmkyIQm3s4Nr5TCEmL8QMnwdkSpyVPSYiOSG5xaRTxMI/99uNo
         72dXFXyvoxFhewN4mBdYBc853FSOS2zu1kfyti4PRGhvj1OdyBAvtGBVRRPkqiKXGuvs
         LzfshVdodJKbWHw99EhknOL/QO2Z7810DrigmG3jN3CrLiKv7m6Awevq21bomgKLciMg
         OXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693318794; x=1693923594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u6C2BMeyRT9BVmnW3F8DPujOXWC4dh3QQ/H+JPTB0fs=;
        b=edLUpBHsFKtINWdk2M0lZ2N/OV810+nDMGI6gi82mOFKc7RuoVIGarWFLa9JCnNjLM
         mwFGQwt7RIln+M5oiPT5SKzr93L5vKBjyh5y1fIyM2WQWk8wbDiY/8R49GGL6Ui2hvPZ
         Yv8jQ0rDJ0NVSaPLn4gxK+bnOdGT93I/0+urNOAPG4cJYdBGHrpWKKI9I+Ye/uCtDkSN
         3UqQrf8SKJc6qAGT5vdbPJA+imgHkHkFqYe9FzsTcbZKEmoXLDQeRr+A2Tqz03FG2qHh
         OAdEUKWwwDwkMGPjuIRGdrRVtl1bSm6kaj1xVl+bKupmha2DLYR3VOZMTqJFc89J2UrR
         4XCA==
X-Gm-Message-State: AOJu0YyJvU7Q6JoR/B3WrHEtozWckVmwkz3HWjnUAInwnUw1uyOIVeMh
        kYIJsKXwaKfZ2GWonreDouyflJZecjE6mtIiWWw8qA==
X-Google-Smtp-Source: AGHT+IEgqrTR3rzPEkyWMAt43eU7aH3VbO5cV13+UrfArXFHtoQoQUe+dIwD7Q7am42u6ixQo1XAFSnYnxc1PpJrXK0=
X-Received: by 2002:a25:d38c:0:b0:d7a:b6b9:73d8 with SMTP id
 e134-20020a25d38c000000b00d7ab6b973d8mr3445294ybf.20.1693318793789; Tue, 29
 Aug 2023 07:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230829135818.2219438-1-quic_ipkumar@quicinc.com> <20230829135818.2219438-2-quic_ipkumar@quicinc.com>
In-Reply-To: <20230829135818.2219438-2-quic_ipkumar@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 29 Aug 2023 17:19:43 +0300
Message-ID: <CAA8EJpqA-poJ9=XKJa2s=yZUGbBbgOqgiDC-q9skJzBqLux84g@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: phy: qcom,uniphy: Rename ipq4019 usb PHY
 to UNIPHY
To:     Praveenkumar I <quic_ipkumar@quicinc.com>
Cc:     robert.marko@sartura.hr, luka.perkov@sartura.hr, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, catalin.marinas@arm.com,
        will@kernel.org, p.zabel@pengutronix.de, arnd@arndb.de,
        geert+renesas@glider.be, nfraprado@collabora.com, rafal@milecki.pl,
        peng.fan@nxp.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_varada@quicinc.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 29 Aug 2023 at 16:59, Praveenkumar I <quic_ipkumar@quicinc.com> wrote:
>
> UNIPHY / Combo PHY used on various qualcomm SoC's are very similar to
> ipq4019 PHY. Hence renaming this dt-binding to uniphy dt-binding and
> can be used for other qualcomm SoCs which are having similar UNIPHY.
>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
>  .../phy/{qcom-usb-ipq4019-phy.yaml => qcom,uniphy.yaml}  | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/phy/{qcom-usb-ipq4019-phy.yaml => qcom,uniphy.yaml} (78%)
>
> diff --git a/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,uniphy.yaml
> similarity index 78%
> rename from Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
> rename to Documentation/devicetree/bindings/phy/qcom,uniphy.yaml
> index 09c614952fea..cbe2cc820009 100644
> --- a/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,uniphy.yaml
> @@ -1,13 +1,18 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/phy/qcom-usb-ipq4019-phy.yaml#
> +$id: http://devicetree.org/schemas/phy/qcom,uniphy.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>
> -title: Qualcom IPQ40xx Dakota HS/SS USB PHY
> +title: Qualcomm UNIPHY

We know that UNIPHY was a common design / IP block used for APQ8064
SATA and MSM8974 DSI and HDMI PHYs. Is this the same design, or was
the name reused by the Qualcomm for some other PHYs?
Several latest generations have USB QMP PHYs which are called 'uni-phy'.

>
>  maintainers:
>    - Robert Marko <robert.marko@sartura.hr>
> +  - Praveenkumar I <quic_ipkumar@quicinc.com>
> +
> +description:
> +  UNIPHY / COMBO PHY supports physical layer functionality for USB and PCIe on
> +  Qualcomm chipsets.
>
>  properties:
>    compatible:
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
