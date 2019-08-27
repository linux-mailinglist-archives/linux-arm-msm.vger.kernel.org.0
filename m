Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD57A9F159
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 19:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfH0RSq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 13:18:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:51894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726871AbfH0RSp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 13:18:45 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6B1DC22CBB;
        Tue, 27 Aug 2019 17:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566926324;
        bh=YbmyFQvWPPBm+BaWP17iU3Sms15Xd37Y1fpKP/D4kPg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hCvsBI892nNXNldP+j4bkjmoqHNExIkA54MIHUyRi8CYiTwp/plwNOIwNQczbbgDb
         F4LRkwXzm94zpMrHhpx6kU4WtgDF/LEdN5whwBwTPiQqScQ6E5lsR4M/C9KArTKJRl
         KaPL07wRNMgIDDFNJoxTOlsMRgwkA7d10WZ66TUg=
Received: by mail-qt1-f170.google.com with SMTP id a13so1293800qtj.1;
        Tue, 27 Aug 2019 10:18:44 -0700 (PDT)
X-Gm-Message-State: APjAAAV2LWoAqIct3UphFJVzUTqhqGoSP7vMg55JK5AUvWtSml1UuKWJ
        KasIno3X3yxn96c94HmkzjKOjLrYqgr5Nd3zCQ==
X-Google-Smtp-Source: APXvYqwvYXe2ENR8q8H6koW7oBAu6bV7Nu8YoJrclhVLCbCStazsjbywGyg9mFNGaXkmr5i212kmzf9rRxSWw2KDqKw=
X-Received: by 2002:aed:22b3:: with SMTP id p48mr21848353qtc.136.1566926323540;
 Tue, 27 Aug 2019 10:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190821091132.14994-1-sibis@codeaurora.org> <20190821091132.14994-2-sibis@codeaurora.org>
In-Reply-To: <20190821091132.14994-2-sibis@codeaurora.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 27 Aug 2019 12:18:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ8h7fH_pnQp7OYpNXJexG_wvDvv5SNEEyxcrpXzJc_Jw@mail.gmail.com>
Message-ID: <CAL_JsqJ8h7fH_pnQp7OYpNXJexG_wvDvv5SNEEyxcrpXzJc_Jw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: Add OSM L3 DT bindings
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Evan Green <evgreen@chromium.org>, daidavid1@codeaurora.org,
        Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 21, 2019 at 4:11 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add bindings for Operating State Manager (OSM) L3 interconnect provider
> on SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,osm-l3.yaml    | 56 +++++++++++++++++++
>  .../dt-bindings/interconnect/qcom,osm-l3.h    | 12 ++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h
>
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> new file mode 100644
> index 0000000000000..dab2b6875ab27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: BSD-2-Clause

(GPL-2.0-only OR BSD-2-Clause) for new bindings please.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,osm-l3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Operating State Manager (OSM) L3 Interconnect Provider
> +
> +maintainers:
> +  - Sibi Sankar <sibis@codeaurora.org>
> +
> +description:
> +  L3 cache bandwidth requirements on Qualcomm SoCs is serviced by the OSM.
> +  The OSM L3 interconnect provider aggregates the L3 bandwidth requests
> +  from CPU/GPU and relays it to the OSM.
> +
> +properties:
> +  compatible:
> +    const: "qcom,sdm845-osm-l3"
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: xo clock
> +      - description: alternate clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: alternate
> +
> +  '#interconnect-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#interconnect-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    osm_l3: interconnect@17d41000 {
> +      compatible = "qcom,sdm845-osm-l3";
> +      reg = <0x17d41000 0x1400>;
> +
> +      clocks = <&rpmhcc 0>, <&gcc 165>;
> +      clock-names = "xo", "alternate";
> +
> +      #interconnect-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/interconnect/qcom,osm-l3.h b/include/dt-bindings/interconnect/qcom,osm-l3.h
> new file mode 100644
> index 0000000000000..54858ff7674d7
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/qcom,osm-l3.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
> +#define __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
> +
> +#define MASTER_OSM_L3_APPS     0
> +#define SLAVE_OSM_L3           1
> +
> +#endif
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
