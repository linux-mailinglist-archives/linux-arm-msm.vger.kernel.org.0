Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60541B4D7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 21:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbgDVTkH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 15:40:07 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39176 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgDVTkG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 15:40:06 -0400
Received: by mail-oi1-f194.google.com with SMTP id m10so2951522oie.6;
        Wed, 22 Apr 2020 12:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z8YCrPzH7bEfhD/XkAeainySJPOSuJ7nJpltH8wRYvo=;
        b=dyiOIQA1NcIu0PJ2ySV3ULUlS386hJHiXHYHDA+JeISdUrD2nHZMDZre45KvjBrr+z
         gPd4VWW26pvauONtr9U1SBosIXeWLMDUK/p0zsBzXZthgE72asW3yGx46sXQAtG0ZGHW
         UCPgDMbScODRhn0h1ctkT5rWTUdr2+Pjdq9O7qmIiOcRoGgLu4LPWbnhfI4z+pQ4qo6T
         /9D76Y4a9G1+AZqG9jyaXAiAsigxeWGSLnK8/is0KUemC1KXYIpNn4/BvH4J+0heoWUN
         zIs4UMbWTo4WNXLS+WNRzZ9fSMPhX3halH8Rf6GkpKKcdWF2VXmlqra/wQALxU8t3qCs
         Cv+g==
X-Gm-Message-State: AGi0PuYOpJS1YEvHUnccRGyoH9RVka53TRXqgy/Z7XsT72VnJVH11tVh
        U220WgpQie5IbgzKFOi8SENpDx0=
X-Google-Smtp-Source: APiQypL5TS8AlWHNE3HLmqbpzzM0B1ncKTbOmg75+Dduyj7CjMKgq9i2LgrvXa8y3GvDgtAYhrVM5A==
X-Received: by 2002:aca:c3c1:: with SMTP id t184mr404747oif.171.1587584405664;
        Wed, 22 Apr 2020 12:40:05 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x17sm45506oif.28.2020.04.22.12.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 12:40:05 -0700 (PDT)
Received: (nullmailer pid 4724 invoked by uid 1000);
        Wed, 22 Apr 2020 19:40:04 -0000
Date:   Wed, 22 Apr 2020 14:40:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Harigovindan P <harigovi@codeaurora.org>, robdclark@gmail.com,
        seanpaul@chromium.org, sean@poorly.run
Subject: Re: [PATCH v11 2/2] dt-bindings: documenting compatible string
 vendor "visionox"
Message-ID: <20200422194004.GA2197@bogus>
References: <20200421045508.21137-1-harigovi@codeaurora.org>
 <20200421045508.21137-3-harigovi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421045508.21137-3-harigovi@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Apr 2020 10:25:08 +0530, Harigovindan P wrote:
> Documenting compatible string vendor "visionox" in vendor-prefix yaml file.
> 
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
> Changes in v11:
> 	- Added visionox compatible string in vendor-prefixes.yaml
> 	- Added as a part of checkpatch script error for panel driver.
> 
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml: patternProperties:visionox,.*: {'description': 'Visionox'} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml: patternProperties:visionox,.*: 'not' is a required property

Documentation/devicetree/bindings/Makefile:11: recipe for target 'Documentation/devicetree/bindings/vendor-prefixes.example.dts' failed
make[1]: *** [Documentation/devicetree/bindings/vendor-prefixes.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
warning: no schema found in file: Documentation/devicetree/bindings/vendor-prefixes.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error in schema: patternProperties: visionox,.*
warning: no schema found in file: Documentation/devicetree/bindings/vendor-prefixes.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/vendor-prefixes.yaml: ignoring, error in schema: patternProperties: visionox,.*
Makefile:1300: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

See https://patchwork.ozlabs.org/patch/1273941

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
