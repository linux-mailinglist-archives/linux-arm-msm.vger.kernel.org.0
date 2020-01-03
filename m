Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C48012FD18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 20:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgACTfL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 14:35:11 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:59338 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbgACTfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 14:35:11 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 0538D20021;
        Fri,  3 Jan 2020 20:35:07 +0100 (CET)
Date:   Fri, 3 Jan 2020 20:35:06 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add AUO B116XAK01 panel
 bindings
Message-ID: <20200103193506.GB21515@ravnborg.org>
References: <20200103183025.569201-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103183025.569201-1-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=cm27Pg_UAAAA:8
        a=gEfo2CItAAAA:8 a=MT032UGNHt8PcIUx_u8A:9 a=CjuIK1q_8ugA:10
        a=xmb-EsYY8bH0VWELuYED:22 a=sptkURWiP4Gy88Gu7hUp:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob.

On Fri, Jan 03, 2020 at 10:30:23AM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  .../bindings/display/panel/auo,b116xa01.yaml  | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml b/Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml
> new file mode 100644
> index 000000000000..6cb8ed9b2c0a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/auo,b116xa01.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/auo,b116xa01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AUO B116XAK01 eDP TFT LCD Panel
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - auo,b116xa01
> +  port: true
Add an empty line before listing the other properties.

> +
> +required:
> +  - compatible
The panel needs power - so power-supply is required too.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    panel {
> +        compatible = "auo,b116xa01";
> +        port {
> +            panel_in: endpoint {
> +                remote-endpoint = <&edp_out>;
> +            };
> +        };
> +    };
For simple panels the example is more or less noise.
We are discusing to move all binding info to a few files for the simple
(dumb) panels.
This is a candidate for this as well.

But there is not yet a conclusion.

	Sam
