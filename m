Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82BD0288A44
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 16:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731368AbgJIOFr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 10:05:47 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43914 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727737AbgJIOFq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 10:05:46 -0400
Received: by mail-oi1-f193.google.com with SMTP id l85so10268804oih.10;
        Fri, 09 Oct 2020 07:05:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dyalSiZn45S4a+6jujOvfnO/RK2cFb+Vq+tH54TVFEA=;
        b=OrrYY7vVISeonzwsacIdzEOQf56DjKpWlQv5EDS2le38irl6yLKGAeXfccHncH6diD
         fukfEdV4iCn3dgih9FYU2cjMq7qROqLlfOGYtKO1ihLk97GRKf+bdAntcpQYMxQGKb4N
         MA6w0/LEyG2SltYQcqeTUQzs/ebIjhY/Qe7KAKX7oEe12vB6rwQrtWWeJS6GSteAlJfG
         joWAvvYo7lBNTVQmQ4L0sXN1YYPqHW3gz9lxYrYHJKIXxPJ8hFbRk1PVTkV14Sa7wDhN
         8Os7Qv7oF/AhQCXjwtu2L2x7ReZ7H9LJdjebkJ1CzErZy5/KRX1J2MblVN+2nVZ4rG5d
         wn9w==
X-Gm-Message-State: AOAM530/+UByLI9iK7zBAcRG+h//h7lcADU1RoHvQ2+o0ByBgUBbD6jd
        RVNX/FU8BCOyDG0MLsR8CHfepBHDdTx0
X-Google-Smtp-Source: ABdhPJxsTciM9UAO+e8EG/rRkxLowDeJJ0mpmhUvP/1Yu/QRYdwZcSle050QqMWzNTlwohesQKoIlg==
X-Received: by 2002:aca:a810:: with SMTP id r16mr2673248oie.114.1602252345680;
        Fri, 09 Oct 2020 07:05:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r188sm44078oia.13.2020.10.09.07.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:05:44 -0700 (PDT)
Received: (nullmailer pid 4076255 invoked by uid 1000);
        Fri, 09 Oct 2020 14:05:44 -0000
Date:   Fri, 9 Oct 2020 09:05:44 -0500
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: panel: add documentation for oneplus6
 panel
Message-ID: <20201009140544.GB4071736@bogus>
References: <20201007174736.292968-1-caleb@connolly.tech>
 <20201007174736.292968-3-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007174736.292968-3-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 07, 2020 at 05:49:14PM +0000, Caleb Connolly wrote:
> Document the OnePlus 6/T common panel driver, example from
> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../display/panel/panel-oneplus6.yaml         | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
> new file mode 100644
> index 000000000000..23ba369cc2f5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-oneplus6.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: OnePlus 6/T panel driver
> +
> +description: |
> +  The OnePlus 6 panel driver encompasses the display panels found in the
> +  OnePlus 6 and 6T devices, the panels have almost identical behaviour and
> +  are not used by any other devices.
> +
> +maintainers:
> +  - Caleb Connolly <caleb@connolly.tech>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,sofef00
> +      - samsung,s6e3fc2x01
> +
> +  reg: true
> +  reset-gpios: true
> +  port: true
> +
> +  vddio-supply:
> +    description: VDDIO regulator

A panel with a single supply can use panel-simple-dsi.yaml.

'reset-gpios' was missing, but has been added recently.

Rob
