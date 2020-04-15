Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916EA1AB211
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 21:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406367AbgDOTxG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 15:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2441892AbgDOTxF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 15:53:05 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF272C061A0F
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 12:53:04 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id v2so413954plp.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2020 12:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=wqYFqvgnJLp6jfCb/pT1ltjRniXVG7wFzSm2iZUIg6w=;
        b=GoFcaSGnLowNKUY4YRjMhjiMRBGA/jdKAlUVUZTQPxoBsFvIFSTTlnUehLhjTt6XW/
         pkYTbEE6cy80TR2qnidJEqejtnyMCFJlEJd5Ry68Rf8bPBDYeQI2nD1yeqTmG3b971Pj
         BWwmiYOx0iPDY1vbwU8QfuFYq/OFuzuNQYDwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=wqYFqvgnJLp6jfCb/pT1ltjRniXVG7wFzSm2iZUIg6w=;
        b=AkvxjuEIbGyrqW9oUAArvhVJiVzL0gQntrVtbdV1Ufp2B8A3d518hNHyyQkBIOcZhS
         ODYFXtqVJMUS/1INTzrp3BCOfJgUzWnfzPdhL1XEjR8XRLFjNokMsxOj5+t57XmT9tC+
         3pugKc025/S/q52H+K1nsfdzP0c58PCZ77NfMBO0ISuoIWj0cTCwSI6QObW/Qp36CaMq
         ZMLtlMQyhCl9ULFCQzKbVMs3eKCwPg35eWS2n5dcSS/HNPxWiZqLtUrDxjQjsKQeQutn
         M6m0mGKrFYkGoYsgSOHBJ6rudbj01ZRa82Zo0hPPqkUiMykW6q3F5l8w6tsv5osX0Abx
         5cRg==
X-Gm-Message-State: AGi0Puan+zlsrZ/HtjUtBEhixtV8kZ8lNTvLk7dCzXnEALan4Ds+bwZx
        8e/qNukXK3jqNUujEqD4QQruPA==
X-Google-Smtp-Source: APiQypKW2QCwYlYY+1tV4ZUdnxB7+EL5+2eKfXLs2OXbzTVeg9HjP9FGOirAs7OCA3jRywMzN3Tt7g==
X-Received: by 2002:a17:90a:17ce:: with SMTP id q72mr892159pja.139.1586980384222;
        Wed, 15 Apr 2020 12:53:04 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x76sm14312883pfc.190.2020.04.15.12.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 12:53:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid> <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios to the bindings
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     jonas@kwiboo.se, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jeffrey.l.hugo@gmail.com,
        jernej.skrabec@siol.net, linux-arm-msm@vger.kernel.org,
        robdclark@chromium.org, dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com,
        airlied@linux.ie, daniel@ffwll.ch, narmstrong@baylibre.com,
        robh+dt@kernel.org, spanda@codeaurora.org
Date:   Wed, 15 Apr 2020 12:53:02 -0700
Message-ID: <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-15 08:48:40)
> Allow people to specify to use a GPIO for hot-plug-detect.  Add an
> example.
>=20
> NOTE: The current patch adding support for hpd-gpios to the Linux
> driver for hpd-gpios only adds enough support to the driver so that
> the bridge can use one of its own GPIOs.  The bindings, however, are
> written generically.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  .../bindings/display/bridge/ti,sn65dsi86.yaml          | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
6.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index 8cacc6db33a9..554bfd003000 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -60,6 +60,10 @@ properties:
>      const: 1
>      description: See ../../pwm/pwm.yaml for description of the cell form=
ats.
> =20
> +  hpd-gpios:
> +    maxItems: 1
> +    description: If present use the given GPIO for hot-plug-detect.

Shouldn't this go in the panel node? And the panel driver should get the
gpio and poll it after powering up the panel? Presumably that's why we
have the no-hpd property in the simple panel binding vs. putting it here
in the bridge.
