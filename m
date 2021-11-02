Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5B7A44305F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 15:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231314AbhKBO3B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 10:29:01 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:42641 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhKBO3A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 10:29:00 -0400
Received: by mail-ot1-f43.google.com with SMTP id v19-20020a9d69d3000000b00555a7318f31so18123536oto.9;
        Tue, 02 Nov 2021 07:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ybDM+hUM3xOM5lhSEIQCqJAJ0LZBOaNAwK7NDmERGn8=;
        b=dITorztgljXZvk4QUvmfTT3HOU8+j+qU79JTYtaVKZSMIWUu7cigdHaU9zx03uWWBi
         Z05vXHFc53EDB7X61rkqRb2+azxhhhxilyVDr8lC8Er2gHCGs5PycVubDU9/oSxAmTxu
         h8GXouMfQKAIBlFRKVHHpVtnGddbdA2bhTuk73Ka7h0c2ARTFx2xNvLngv1fJriHd4cY
         fDU3/CaQoJGcJd8CT7bdzYxf5CGT4QmC6h5krKXOCvkYgdk+ErZS/HuQzTh65bW0THMr
         la4IoQL+7v6SCfMNBbRxNUtE4j1w4dcmixdu4C4buRHv8PCCy2mDaqzCX6TXupImNYfI
         xb5Q==
X-Gm-Message-State: AOAM5311jWQOcz1mTwrr2ygHTd7UKbDET17P62s23x5sGV7rnrWCA/f+
        B32tMaSJnSyb8xHZZ3FCBw==
X-Google-Smtp-Source: ABdhPJwPx1RNRtMRuC19qCVctPzJYibBZo7/4LuTyrqlqLE8XI2fj3QxePUMZDVWuKGqsyglTrhizg==
X-Received: by 2002:a9d:67d2:: with SMTP id c18mr12508564otn.185.1635863185541;
        Tue, 02 Nov 2021 07:26:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id a6sm484535otl.33.2021.11.02.07.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 07:26:25 -0700 (PDT)
Received: (nullmailer pid 2820996 invoked by uid 1000);
        Tue, 02 Nov 2021 14:26:23 -0000
Date:   Tue, 2 Nov 2021 09:26:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org
Subject: Re: [PATCH v7 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS
 support
Message-ID: <YYFKj4ySpEz3Usvr@robh.at.kernel.org>
References: <1635408817-14426-1-git-send-email-pillair@codeaurora.org>
 <1635408817-14426-3-git-send-email-pillair@codeaurora.org>
 <CAE-0n50z=h-avn+K-weZnZFVN7nsR=fLAtge7jFZ0JLx2JvP2w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50z=h-avn+K-weZnZFVN7nsR=fLAtge7jFZ0JLx2JvP2w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 28, 2021 at 03:08:24PM -0700, Stephen Boyd wrote:
> Quoting Rakesh Pillai (2021-10-28 01:13:36)
> > diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> > new file mode 100644
> > index 0000000..96d11a4
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> > @@ -0,0 +1,194 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/remoteproc/qcom,sc7280-wpss-pil.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SC7280 WPSS Peripheral Image Loader
> > +
> > +maintainers:
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +description:
> > +  This document defines the binding for a component that loads and boots firmware
> > +  on the Qualcomm Technology Inc. WPSS.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,sc7280-wpss-pil
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      The base address and size of the qdsp6ss register
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Watchdog interrupt
> > +      - description: Fatal interrupt
> > +      - description: Ready interrupt
> > +      - description: Handover interrupt
> > +      - description: Stop acknowledge interrupt
> > +      - description: Shutdown acknowledge interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: wdog
> > +      - const: fatal
> > +      - const: ready
> > +      - const: handover
> > +      - const: stop-ack
> > +      - const: shutdown-ack
> > +
> > +  clocks:
> > +    items:
> > +      - description: GCC WPSS AHB BDG Master clock
> > +      - description: GCC WPSS AHB clock
> > +      - description: GCC WPSS RSCP clock
> > +      - description: XO clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ahb_bdg
> > +      - const: ahb
> > +      - const: rscp
> > +      - const: xo
> > +
> > +  power-domains:
> > +    items:
> > +      - description: CX power domain
> > +      - description: MX power domain
> > +
> > +  power-domain-names:
> > +    items:
> > +      - const: cx
> > +      - const: mx
> > +
> > +  resets:
> > +    items:
> > +      - description: AOSS restart
> > +      - description: PDC SYNC
> > +
> > +  reset-names:
> > +    items:
> > +      - const: restart
> > +      - const: pdc_sync
> > +
> > +  memory-region:
> 
> Does it need
> 
>     $ref: /schemas/types.yaml#/definitions/phandle
> 
> because it's a phandle?

No, standard property that already has a type.

Rob
