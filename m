Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40AD260B01
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 19:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfGERXn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 13:23:43 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:41944 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfGERXn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 13:23:43 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 89D6980513;
        Fri,  5 Jul 2019 19:23:39 +0200 (CEST)
Date:   Fri, 5 Jul 2019 19:23:38 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch, bjorn.andersson@linaro.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Sharp LD-D5116Z01B
Message-ID: <20190705172338.GB2788@ravnborg.org>
References: <20190705165450.329-1-jeffrey.l.hugo@gmail.com>
 <20190705165655.456-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705165655.456-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
        a=X-qxmLeW_QAlauPjm30A:9 a=CjuIK1q_8ugA:10
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeffrey.

On Fri, Jul 05, 2019 at 09:56:55AM -0700, Jeffrey Hugo wrote:
> The Sharp LD-D5116Z01B is a 12.3" eDP panel with a 1920X1280 resolution.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  .../display/panel/sharp,ld-d5116z01b.txt      | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
> new file mode 100644
> index 000000000000..3938c2847fe5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/sharp,ld-d5116z01b.txt
> @@ -0,0 +1,27 @@
> +Sharp LD-D5116Z01B 12.3" WUXGA+ eDP panel
> +
> +Required properties:
> +- compatible: should be "sharp,ld-d5116z01b"
> +- power-supply: regulator to provide the VCC supply voltage (3.3 volts)
> +
> +This binding is compatible with the simple-panel binding.
> +
> +The device node can contain one 'port' child node with one child
> +'endpoint' node, according to the bindings defined in [1]. This
> +node should describe panel's video bus.
> +
> +[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
> +
> +Example:
> +
> +	panel: panel {
> +		compatible = "sharp,ld-d5116z01b";
> +		power-supply = <&vlcd_3v3>;
> +		no-hpd
The binding do not mention no-hpd - but it is part of panel-simple
binding. Is it included in the example for any special reason?

Also there is a syntax error, ";" is missing.


	Sam

> +
> +		port {
> +			panel_ep: endpoint {
> +				remote-endpoint = <&bridge_out_ep>;
> +			};
> +		};
> +	};
> -- 
> 2.17.1
