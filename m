Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEC101B905
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2019 16:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730910AbfEMOsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 May 2019 10:48:06 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36015 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbfEMOsG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 May 2019 10:48:06 -0400
Received: by mail-qt1-f196.google.com with SMTP id a17so13761354qth.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 May 2019 07:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8IHMOkhmEb6QT/ZiWX3DdDfZLIknej7rKf5m2D6xNuc=;
        b=gilxhSCldOJPRo4SMSKe6WlhN7JItK+oQioLxN8lSziUeONl5Y/Y8STILpTSOUhhMU
         DyTKkxvSUFOLOt3yBLSenRYoZHKnOgX10A2zizp9IxWx3HVCpRbhHd3yH4CT1Ydsqhhz
         YX8h4KWHHSU+gRbGwEIXP6UG6sBabn8tDeUSoNlyvm5ba/2z58W1dJMOJFWQ9wgpk0ap
         IrKOlg4dEYpHpDifZ/kaNjyVI8evx3Xr/R66baPU71WCa8FnP4U+7GE5ZlVACa2ds2im
         e8mDbcRkn/By+hPdkKROpknY+9Qn7Z2JsEBKIDxCnhJ9/tExJHH1Kv0W9N0lP5xbS/jq
         Kscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8IHMOkhmEb6QT/ZiWX3DdDfZLIknej7rKf5m2D6xNuc=;
        b=plHi5oEBr9wHWqJUTjAqw48uGklCBqDYomu1EPXq8vmrpXqo+UFErjwVvPrxLyAed+
         daYxtrR0R+XLYalrJXgNFAU00HfoQ3N9IebpiX/LKiIEPEmtcXLkGQAi1FpfTr5HvUKI
         igwi1JbuljOP1LCVJmz3+CKUi0XNQNpAWZNesc18R/s7fa1gsB9k4PREA4DC1uPhfAY7
         hxSFboGi1beDSKsN0YZN43VPhu8Apx7WGZtf96pcz0Nh7c/W1Zg9MokBnZ0gEQOsX2bC
         O+0hEGJXzDnE+BIM057oo4wDbkqOhrnpHmFiKfGCU9V0wb7paszyPTdVk4EJyMDrPh3k
         lsyA==
X-Gm-Message-State: APjAAAVV2hcnd35PI7gwOVaxyXrt+NfyM1WpvPGE4bRG8+iPcbfuYleW
        Threq9KonsJwHPsc/RHO7YigYQ==
X-Google-Smtp-Source: APXvYqxNdvAKxfxX7AKNCeVbrRHlGE3pAiuxcTmOZ5y5s0sru4T1T0lw8xsnCCgpIxTSa2x70VK59w==
X-Received: by 2002:ac8:3509:: with SMTP id y9mr24571513qtb.336.1557758885215;
        Mon, 13 May 2019 07:48:05 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id 22sm4038205qkl.4.2019.05.13.07.48.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 07:48:04 -0700 (PDT)
Date:   Mon, 13 May 2019 10:48:03 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: msm/disp: Introduce interconnect
 bindings for MDSS on SDM845
Message-ID: <20190513144803.GP17077@art_vandelay>
References: <20190508204219.31687-1-robdclark@gmail.com>
 <20190508204219.31687-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508204219.31687-4-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 08, 2019 at 01:42:13PM -0700, Rob Clark wrote:
> From: Jayant Shekhar <jshekhar@codeaurora.org>
> 
> Add interconnect properties such as interconnect provider specifier
> , the edge source and destination ports which are required by the
> interconnect API to configure interconnect path for MDSS.
> 
> Changes in v2:
> 	- None
> 
> Changes in v3:
> 	- Remove common property definitions (Rob Herring)
> 
> Changes in v4:
> 	- Use port macros and change port string names (Georgi Djakov)
> 
> Changes in v5-v7:
> 	- None
> 
> Signed-off-by: Sravanthi Kollukuduru <skolluku@codeaurora.org>
> Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Sean Paul <sean@poorly.run>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dpu.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> index ad2e8830324e..a61dd40f3792 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> @@ -28,6 +28,11 @@ Required properties:
>  - #address-cells: number of address cells for the MDSS children. Should be 1.
>  - #size-cells: Should be 1.
>  - ranges: parent bus address space is the same as the child bus address space.
> +- interconnects : interconnect path specifier for MDSS according to
> +  Documentation/devicetree/bindings/interconnect/interconnect.txt. Should be
> +  2 paths corresponding to 2 AXI ports.
> +- interconnect-names : MDSS will have 2 port names to differentiate between the
> +  2 interconnect paths defined with interconnect specifier.
>  
>  Optional properties:
>  - assigned-clocks: list of clock specifiers for clocks needing rate assignment
> @@ -86,6 +91,11 @@ Example:
>  		interrupt-controller;
>  		#interrupt-cells = <1>;
>  
> +		interconnects = <&rsc_hlos MASTER_MDP0 &rsc_hlos SLAVE_EBI1>,
> +				<&rsc_hlos MASTER_MDP1 &rsc_hlos SLAVE_EBI1>;
> +
> +		interconnect-names = "mdp0-mem", "mdp1-mem";
> +
>  		iommus = <&apps_iommu 0>;
>  
>  		#address-cells = <2>;
> -- 
> 2.20.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
