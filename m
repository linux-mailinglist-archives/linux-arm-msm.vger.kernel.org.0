Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27903294F06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 16:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443333AbgJUOta (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 10:49:30 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:39510 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442644AbgJUOta (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 10:49:30 -0400
Received: by mail-oi1-f194.google.com with SMTP id u127so2344555oib.6;
        Wed, 21 Oct 2020 07:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NtlmBu5h4iBh+zHC2TUxv/prMu3eprBos0xHpsw4cig=;
        b=K4iy6uMlrvnAYqBbLyCBojyC0e0+vGJm9bSIu+/KItua83wMUbkf2djbk+QQ/iYYQF
         oLARrBNoLaxNP+342AlYLBAtsydflIR3pdMualQWbk9eI5E53j2IZTgzHLT05nFsVv5c
         1aeCWLFs0kbUyH6MahbdJD7sBZOTRkX/RroQZTX8I+rZ05XebuVidBBDpOqW3jSNnILa
         IlWLWF3bEtNBBVyAfru5v55mcrdwPHP8j8bmY/GPTGp/AqnplPxsFOnnzHHqwalKkSM+
         I40eTOTlEfA2q3TRUAhpW80D9FioJZieTQqKOVmtXNUwWL2vv3thbRbkvIRI5hZuVxbK
         yImQ==
X-Gm-Message-State: AOAM533mN2TFI3UlmMDO8YWDM9lVNCf7xdutJIW+KtOPS88emUMHpSg7
        CAvasMPDqiamqV4715OHf/+Ka1YH4g==
X-Google-Smtp-Source: ABdhPJwO0ZRqPMszwKp5Dk5j2KSjbKG9sYl+Mws9bBotwxs921MNAUZKWIdI040bfSmMgcNWQNflgQ==
X-Received: by 2002:aca:cdc4:: with SMTP id d187mr2672003oig.19.1603291769336;
        Wed, 21 Oct 2020 07:49:29 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q7sm737163oig.42.2020.10.21.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 07:49:28 -0700 (PDT)
Received: (nullmailer pid 2769342 invoked by uid 1000);
        Wed, 21 Oct 2020 14:49:27 -0000
Date:   Wed, 21 Oct 2020 09:49:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        devicetree@vger.kernel.org,
        David Collins <collinsd@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [RESEND PATCH v2 1/2] bindings: pm8941-misc: Convert to YAML and
 add support for VBUS detection
Message-ID: <20201021144927.GA2768609@bogus>
References: <cover.1603231949.git.gurus@codeaurora.org>
 <1407c8a264de11cb9cd7a13b8f7b5f66ca957127.1603231949.git.gurus@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407c8a264de11cb9cd7a13b8f7b5f66ca957127.1603231949.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 20 Oct 2020 15:17:24 -0700, Guru Das Srinagesh wrote:
> From: Anirudh Ghayal <aghayal@codeaurora.org>
> 
> Convert bindings to YAML. Also add compatible string that adds support
> for reporting the VBUS status that can be detected via a dedicated PMIC
> pin.
> 
> Signed-off-by: Anirudh Ghayal <aghayal@codeaurora.org>
> Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> ---
>  .../bindings/extcon/qcom,pm8941-misc.txt           | 41 ----------------
>  .../bindings/extcon/qcom,pm8941-misc.yaml          | 56 ++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 41 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.txt
>  create mode 100644 Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml: properties:compatible:oneOf:0:const: ['qcom,pm8941-misc', 'qcom,pmd-vbus-det'] is not of type 'string'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml: properties:interrupt-names:anyOf:0:const: ['usb_id', 'usb_vbus'] is not of type 'string'
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml: ignoring, error in schema: properties: compatible: oneOf: 0: const
warning: no schema found in file: ./Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
Error: Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.example.dts:23.49-50 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1385252

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

