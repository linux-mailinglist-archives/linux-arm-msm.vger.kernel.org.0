Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB4CE153566
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 17:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgBEQkw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 11:40:52 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:54614 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgBEQkv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 11:40:51 -0500
Received: by mail-wm1-f65.google.com with SMTP id g1so3195595wmh.4;
        Wed, 05 Feb 2020 08:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YRyho1A5PtF4sCFUVKeESMDn8UQwlv3lsWB4C+ixlEY=;
        b=tgM0TUxfJdyQ7p7KSFnEsuZoCy4/PQiDOhw5OVtfxekOV3HasqTm032biU/mTZlTL+
         Damz+cyVRwiGUDjV9eJ6CgaJt0OEkh+qULV3oJFT3cTDSV9LaMzN/dV7qrf9LCns1b7v
         nBh8XLFaF9GtccacaOTQe/gDScJAFLidgJT2v49cXouCZfUwUXc4XR+EBwIlCdpHnp6G
         MiISaMIx3+XUrvHKV2JXAWBToQ1C6O9ktJuGC8mcwJXm+5UDEyFKpP3JWoIt1/elISPX
         2Vs45xkVKaIUxps3CX/fmaXXidjgZdWZPytIT7tzHYx4HtsNAHvl92+RhNshfYhXY2NX
         7ClQ==
X-Gm-Message-State: APjAAAViG4yiNZmQHVm2xoVR/ALiXeNJYmoGW2JbzKiFfzB6Jbzbhi/I
        7ldcaqecwO+YXWS/wOZn2Q==
X-Google-Smtp-Source: APXvYqwgSBNbRA19+O3qYDxG+xq/bkC9e2Rnn786m+qvq+3WemWWG3Fq4I2R9vkXdBpW7/tUBRMRSg==
X-Received: by 2002:a7b:cbd6:: with SMTP id n22mr6942375wmi.118.1580920849090;
        Wed, 05 Feb 2020 08:40:49 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id g15sm469526wro.65.2020.02.05.08.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 08:40:48 -0800 (PST)
Received: (nullmailer pid 3886 invoked by uid 1000);
        Wed, 05 Feb 2020 16:40:48 -0000
Date:   Wed, 5 Feb 2020 16:40:48 +0000
From:   Rob Herring <robh@kernel.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
        seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCHv3 1/2] dt-bindings: display: add visionox rm69299 panel
 variant
Message-ID: <20200205164048.GA3452@bogus>
References: <1580907990-32108-1-git-send-email-harigovi@codeaurora.org>
 <1580907990-32108-2-git-send-email-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580907990-32108-2-git-send-email-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed,  5 Feb 2020 18:36:29 +0530, Harigovindan P wrote:
> Add bindings for visionox rm69299 panel.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> 
> Changes in v1:
> 	- Added a compatible string to support sc7180 panel version.
> Changes in v2:
> 	- Removed unwanted properties from description.
> 	- Creating source files without execute permissions(Rob Herring).
> Changes in v3:
> 	- Changing txt file into yaml
> 
>  .../bindings/display/visionox,rm69299.yaml         | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/visionox,rm69299.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/visionox,rm69299.yaml:  while scanning for the next token
found character that cannot start any token
  in "<unicode string>", line 83, column 1
Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/display/visionox,rm69299.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/display/visionox,rm69299.example.dts] Error 1
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1233831
Please check and re-submit.
