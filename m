Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CD71A8D90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 23:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633733AbgDNVVZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 17:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2633778AbgDNVVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 17:21:20 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69BAAC061A0F
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 14:21:20 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id m21so520946pff.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=qYUxUinpAV+jTdIPlQ2ftanC+VH4TYtMDBpvx6CaE/M=;
        b=e6D9UKxRfuRB6Vg27Qve4+YFdRAD4xfEU/6fiSyFULykIaaqQmkoKD2e9ao9hIBax8
         BIg3X9WuPUCvye8P3WyERQJJmZ4no8QQNxBFjt8wy/gPFWEL+qcpQOi0WWSA3MVnH1gN
         nxjTcN0XIJfb9nPMSkfPXl4vSaCFCt8Z1f8so=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=qYUxUinpAV+jTdIPlQ2ftanC+VH4TYtMDBpvx6CaE/M=;
        b=CFgPeWHa/obVtyF0vHuILZn6wHq+h0ELnizDvHsV26bq3nQyKsTCgD4U0mAaIpj75M
         uTs+TqFssSMbRVZyPD8sz+/JGq1XiPiWt6Uv5naSSFWMppt3DlpUaDiuDZvl0AYOVY1/
         BZLDuOM1zerk61WZcn410ZWa2lfXhL6rYPTeyrxaukyNglsGvt4j2aNWwvDT3JMB6lat
         S5jDhtZlOTSo7R2cBcxxqmdeO/ZfTaSRsXg/yaGOvEQ5h6dzyCLh+4vF/q5et/zgqKZn
         EKZ3RscYwqVjYikbZnMif3K+CWztEQvepm6LV+QgcCQbE4609bDpr+RdZBXQgp7Lm+02
         mfgw==
X-Gm-Message-State: AGi0PuZ8225p1qylk3x1wpAI7karOWuH4RuM+ecX7vDzGGUPyNOD2bId
        0cR/f6ygJV3GJwe+jrS54icBy6u2rL8=
X-Google-Smtp-Source: APiQypJvfbBsusLiO4aMQUZyDZaiL2beLstkyOYsDAsnSSXRrCDtVIAiTW4XcNJVdxbo/iotiywFWQ==
X-Received: by 2002:a63:c101:: with SMTP id w1mr10203522pgf.126.1586899279542;
        Tue, 14 Apr 2020 14:21:19 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id i13sm11701085pfa.113.2020.04.14.14.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 14:21:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585809534-11244-2-git-send-email-sanm@codeaurora.org>
References: <1585809534-11244-1-git-send-email-sanm@codeaurora.org> <1585809534-11244-2-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v5 1/3] dt-bindings: phy: qcom,qmp: Convert QMP PHY bindings to yaml
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>, robdclark@gmail.com,
        abhinavk@codeaurora.org, nganji@codeaurora.org,
        jsanka@codeaurora.org, aravindh@codeaurora.org,
        hoegsberg@google.com, dri-devel@lists.freedesktop.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Tue, 14 Apr 2020 14:21:17 -0700
Message-ID: <158689927748.105027.5367465616284167712@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-04-01 23:38:52)
> Convert QMP PHY bindings to DT schema format using json-schema.
>=20
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,qmp-phy.yaml      | 332 +++++++++++++++=
++++++
>  .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 242 ---------------
>  2 files changed, 332 insertions(+), 242 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qmp-phy.ya=
ml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
>=20
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Do=
cumentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> new file mode 100644
> index 0000000..18a8985
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -0,0 +1,332 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,qmp-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QMP PHY controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +description:
> +  QMP phy controller supports physical layer functionality for a number =
of
> +  controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq8074-qmp-pcie-phy
> +      - qcom,msm8996-qmp-pcie-phy
> +      - qcom,msm8996-qmp-ufs-phy
> +      - qcom,msm8996-qmp-usb3-phy
> +      - qcom,msm8998-qmp-pcie-phy
> +      - qcom,msm8998-qmp-ufs-phy
> +      - qcom,msm8998-qmp-usb3-phy
> +      - qcom,sdm845-qhp-pcie-phy
> +      - qcom,sdm845-qmp-pcie-phy
> +      - qcom,sdm845-qmp-ufs-phy
> +      - qcom,sdm845-qmp-usb3-phy
> +      - qcom,sdm845-qmp-usb3-uni-phy
> +      - qcom,sm8150-qmp-ufs-phy
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Address and length of PHY's common serdes block.
> +      - description: Address and length of the DP_COM control block.

This DP_COM block is only for one compatible. Is it possible to split
that compatible out of this binding so we can enforce the reg property
being either one or two items?

In addition, I don't quite understand how this binding is supposed to
work with the DP phy that sits inside qcom,sdm845-qmp-usb3-phy and then
gets muxed out on the USB pins on sdm845 and sc7180 SoCs. Can you fill
me in on how we plan to share the pins between the two phys so that all
the combinations of DP and USB over the type-c pins will work here? My
understanding is that the pins that are controlled by this hardware
block are basically a full USB type-c connector pinout[1] (except that
D+/D- isn't there and the VBUS and CC lines go to the PMIC). Either way,
we get the TX1/2 and RX1/2 pins to use, so we can do 4x lanes of DP or
2x lanes DP and 2x lanes of USB. There's also a type-c orientation
flipper bit that can flip the DP and USB phy lanes to the correct TX/RX
pins on the SoC. And then the DP phy has a lane remapper to change the
logical DP lane to the physical DP lane. It's a complex piece of
hardware that isn't fully represented by this binding.

[1] https://en.wikipedia.org/wiki/USB-C#/media/File:USB_Type-C_Receptacle_P=
inout.svg
