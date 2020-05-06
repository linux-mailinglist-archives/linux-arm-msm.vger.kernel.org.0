Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0034E1C79B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 20:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730006AbgEFS4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 14:56:09 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:46108 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729882AbgEFS4J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 14:56:09 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 7B2FE804F6;
        Wed,  6 May 2020 20:56:06 +0200 (CEST)
Date:   Wed, 6 May 2020 20:56:00 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        sean@poorly.run, seanpaul@chromium.org
Subject: Re: [PATCH v12 2/2] dt-bindings: documenting compatible string
 vendor "visionox"
Message-ID: <20200506185559.GA8227@ravnborg.org>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
 <20200429054515.4976-2-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429054515.4976-2-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8 a=e5mUnYsNAAAA:8
        a=yl7qcXnr7a4LJ7TjansA:9 a=CjuIK1q_8ugA:10 a=pioyyrs4ZptJ924tMmac:22
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 29, 2020 at 11:15:15AM +0530, Harigovindan P wrote:
> Documenting compatible string vendor "visionox" in vendor-prefix yaml file.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>

Thanks, applied.

	Sam

> ---
> Changes in v11:
> 	- Added compatible string in vendor-prefix yaml file
> 
> Changes in v12:
> 	- Fixed the string to clear dt_binding_check errors.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 66a7382add95..1c86ebbeae20 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1047,6 +1047,8 @@ patternProperties:
>      description: Tronsmart
>    "^truly,.*":
>      description: Truly Semiconductors Limited
> +  "^visionox,.*":
> +    description: Visionox
>    "^tsd,.*":
>      description: Theobroma Systems Design und Consulting GmbH
>    "^tyan,.*":
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
