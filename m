Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2703D288A3D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 16:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733271AbgJIOCq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Oct 2020 10:02:46 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:41808 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733094AbgJIOCq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Oct 2020 10:02:46 -0400
Received: by mail-ot1-f66.google.com with SMTP id q21so9057934ota.8;
        Fri, 09 Oct 2020 07:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CN5Jrnu+gIWgecJATx8xPG6kiZL3kXpcUvow4xgdW3E=;
        b=uMNAAoIYwrhY/wE8MY0tmjI8+0IRGtAmdeA/t10XnCyQl/UilLiozXv2JyXpG5oHJG
         13WHB/MCkj6ML4fFbabSK7DVk9NK5ZfSe+DcVUStxR42eMuiTCVRLVdCeqDpT0q7LdcR
         KhtomdebdxQB416WaumRGiuvTBkEtmV71ueTM9dCwJB8MdeDL15T1tP/v9fk+0KiRgrQ
         qjE6NA2GaC7imx8RdPITFth2HEr2uvlX0sz2m2FNH8gCC6hAC+5hwNOJqaZ0R9Ko/9fu
         Lp0RGwWQLXGpFJz65cGjjNkfzZRb9fiHoYZR7DTo5H2tAruvPjTtUHYA7iyfx3gbuva9
         DVZg==
X-Gm-Message-State: AOAM533RMdDfaSj0AeZdu5X2lcRtCbbofFe6B3NzU3+5e2PP/nONSZMZ
        9vvTzRxm49DlnbEZvPsciccY+e+ckR2R
X-Google-Smtp-Source: ABdhPJwr696vOEMkrUKZxSTAGV6kme0EZ2llEvyPP0cpkFOzhxtn65bbQ8oFusmIfFnar9qX9xHAVg==
X-Received: by 2002:a9d:3626:: with SMTP id w35mr9301024otb.206.1602252165140;
        Fri, 09 Oct 2020 07:02:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c200sm7482570oig.55.2020.10.09.07.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:02:44 -0700 (PDT)
Received: (nullmailer pid 4072341 invoked by uid 1000);
        Fri, 09 Oct 2020 14:02:43 -0000
Date:   Fri, 9 Oct 2020 09:02:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-msm@vger.kernel.org, David Airlie <airlied@linux.ie>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/5] dt-bindings: panel: add documentation for oneplus6
 panel
Message-ID: <20201009140243.GA4071736@bogus>
References: <20201007174736.292968-1-caleb@connolly.tech>
 <20201007174736.292968-3-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007174736.292968-3-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 07 Oct 2020 17:49:14 +0000, Caleb Connolly wrote:
> Document the OnePlus 6/T common panel driver, example from
> arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../display/panel/panel-oneplus6.yaml         | 73 +++++++++++++++++++
>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-oneplus6.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Error: Documentation/devicetree/bindings/display/panel/panel-oneplus6.example.dts:19.9-14 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/display/panel/panel-oneplus6.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1378187

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

