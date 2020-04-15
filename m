Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E4441AB1FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 21:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406383AbgDOTuT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 15:50:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2406348AbgDOTuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 15:50:13 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22CC5C061A0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 12:50:13 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id o1so312989pjs.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 12:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=V6l2X70ea3XCzQRMPtn3nNECLb1DlkpL6KAzQKMivmc=;
        b=QDHfG7KGee7J1KR47wIe2BcCVaIwOUy359B1jIpJK6V6RZdEZTsG1tC/zWVGD6eoAy
         zqXsKEdsGmvzvqZ/h5rNFAlGDTU5LGgrT2ZlkqHpVKAIH7CwFw8824U2wR7hNIGtXebO
         lhm2pA1hLKA8lC23UcRJlY1avXPMOsYoEwweY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=V6l2X70ea3XCzQRMPtn3nNECLb1DlkpL6KAzQKMivmc=;
        b=BfvHRw03ux+oSh0yYIFSvDWgU5MzE/9VaWtFDKTZ1rkbvszqeozJ6+683FR7uHGX8/
         hdsRjc0XS/SFj8dIhCjcteeD306MI4ESJddYKRTDTN3eaz8Pm/AJE5O6KhkgZbHYkJ0p
         4rs4bFVEp0/vr2auypQJ4Eaj59U39eyMq4BK5jRNX4tTffMutghSn3HEo8bkccgLo6n+
         IyhR5Y9WdL8dTYAqOOwtnzX8Sf9GIrDjE2K94btcJocatNzurq8g42ahnD03sr9g5Ry6
         X3A4DkkSBFDWt70KcGtCxH6NqxUw1p3MJIY2+0UPgWcDEnxvPg2sNI9K91vsEDNVVZiX
         NMIQ==
X-Gm-Message-State: AGi0PuZ1FYaKVtJpztjSab1nhNL6rIkxMpEHbiiQODihB6ScsdGIU7Pz
        RHtVITzpoLIYaygeDL2o4qm8Wg==
X-Google-Smtp-Source: APiQypKKY/tI8Uw1isr1iQMILFKeueLoYBL4RBrGVZULxPvpuI/+LxZFeV9xNIXzn0OzVsvK+vHMbw==
X-Received: by 2002:a17:902:a40f:: with SMTP id p15mr1132482plq.154.1586980212402;
        Wed, 15 Apr 2020 12:50:12 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id r189sm13505392pgr.31.2020.04.15.12.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 12:50:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     jonas@kwiboo.se, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jeffrey.l.hugo@gmail.com,
        swboyd@chromium.org, jernej.skrabec@siol.net,
        linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        airlied@linux.ie, daniel@ffwll.ch, narmstrong@baylibre.com,
        robh+dt@kernel.org, spanda@codeaurora.org
Date:   Wed, 15 Apr 2020 12:50:10 -0700
Message-ID: <158698021097.105027.12960498982161983978@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-15 08:48:39)
> This moves the bindings over, based a lot on toshiba,tc358768.yaml.
> Unless there's someone known to be better, I've set the maintainer in
> the yaml as the first person to submit bindings.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Awesome!

> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
6.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> new file mode 100644
> index 000000000000..8cacc6db33a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -0,0 +1,188 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi86.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SN65DSI86 DSI to eDP bridge chip
> +
> +maintainers:
> +  - Sandeep Panda <spanda@codeaurora.org>
> +
> +description: |
> +  The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs e=
DP.
> +  http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=
=3Dsn65dsi86&fileType=3Dpdf
> +
> +properties:
> +  compatible:
> +    const: ti,sn65dsi86
> +
> +  reg:
> +    const: 0x2d
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specification for bridge_en pin (active high).

s/specification/specifier/ ? I know the previous binding said
specification but I don't know what that is. It's a specifier.

> +
> +  vccio-supply:
> +    description: A 1.8V supply that powers up the digital IOs.
> +
> +  vpll-supply:
> +    description: A 1.8V supply that powers up the DisplayPort PLL.
> +
> +  vcca-supply:
> +    description: A 1.2V supply that powers up the analog circuits.
> +
> +  vcc-supply:
> +    description: A 1.2V supply that powers up the digital core.

Nitpick: Can we remove 'up' from these descriptions?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Specification for input reference clock. The reference clock rate =
must

Clock specifier for input reference clock?

> +      be 12 MHz, 19.2 MHz, 26 MHz, 27 MHz or 38.4 MHz.
> +
> +  clock-names:
> +    const: refclk
> +
