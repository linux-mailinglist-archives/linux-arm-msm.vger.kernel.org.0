Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9275E4B997E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 07:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235881AbiBQGzW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 01:55:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235847AbiBQGzO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 01:55:14 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC8227F297
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 22:54:59 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id qe15so4701598pjb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 22:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fbkjSAH5zzjT9bdkUEcfX+58XyqQCYr3PakKI23mckw=;
        b=jCBnYGr0FwYAETE7VlgSz7COIhTuOqqXUvkcjf30rbfBPxuuk08YKvaOQPVYt4UgHb
         FfNHWqxTe9rEjj3Qzmo5dVaJ9VS0shIflUfCiEbFtokKMjLM6qxMrkNcnR7AU50HiHxx
         GP5KznxEUasfAj7zlqi0aMCfJ8H9WPHdB4/HalHPmbR0v4Ywo07XT2+LHLYOk3OotlmA
         rZ+5JVE9CC4QqauK7OrfjE4N6aGvdyORyjg1WMtXhfMcIJeIElpgSoFGC5GR7ae4nlRr
         eMizuvpnlNy1C8kSJaGVN1jJtgPa5P+RFPeYgpvdXqPLWJWVwdX/kadRBxOsAMOookYq
         0aqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fbkjSAH5zzjT9bdkUEcfX+58XyqQCYr3PakKI23mckw=;
        b=zrIY8y3T+7xMfl8x5jA+ISmqalQl2HGL66ql3qzBQLg4iLE5Rnj0k8t29GMzLO2V02
         t3OqPMgNbFQpUAox+ex96js0KBXMz3DPs+38CgerseRsVSi3wvAtUIgSZSDjeB3FRjcH
         iCiu614v3uv+NgOIsS4L+4UEYRApwSsgwZOhpFxtN5HtlHQDX/MatVyVV1mz5IgqySnj
         lnMe8CA82TmQKJVT45oHV3Ay/wDTVYc2gzMnkj+dNGWb6JaB4y7vj8gkwF+WiLr0JEcM
         zwgCLgP2qlmzKa+A7xiyvCE1evYKj9yKK9duA9CNwoJen1+1AEYtiaBiuF4UuK/+IwYd
         KvdQ==
X-Gm-Message-State: AOAM531zbPldNOAPHHgg8KbdK9Ee5439GFGyMoGyMEJYSaMDnaE1cMwS
        yqmkIbPLOVlA/kSrfCy7/poJhg==
X-Google-Smtp-Source: ABdhPJyqT03tuQIizkw4NKuvMZCvYLmZOsIsuxvYN+JoBxu4Jal7bx4bH0PuqPgLP0/Oyt4zx3RGjw==
X-Received: by 2002:a17:90b:360e:b0:1b9:d9f0:b37 with SMTP id ml14-20020a17090b360e00b001b9d9f00b37mr1634420pjb.111.1645080899225;
        Wed, 16 Feb 2022 22:54:59 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id 8sm10115763pfl.164.2022.02.16.22.54.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Feb 2022 22:54:58 -0800 (PST)
Date:   Thu, 17 Feb 2022 14:54:51 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Maulik Shah <quic_mkshah@quicinc.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: interrupt-controller: Add Qualcomm
 MPM support
Message-ID: <20220217065447.GC31965@dragon>
References: <20220216132830.32490-1-shawn.guo@linaro.org>
 <20220216132830.32490-3-shawn.guo@linaro.org>
 <1645070363.942246.2266021.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645070363.942246.2266021.nullmailer@robh.at.kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 16, 2022 at 09:59:23PM -0600, Rob Herring wrote:
> On Wed, 16 Feb 2022 21:28:29 +0800, Shawn Guo wrote:
> > It adds DT binding support for Qualcomm MPM interrupt controller.
> > 
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  .../interrupt-controller/qcom,mpm.yaml        | 94 +++++++++++++++++++
> >  1 file changed, 94 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):

I ran dt_binding_check without DT_CHECKER_FLAGS=-m.  Will re-test and
fix.

Shawn

> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml: properties:qcom,mpm-pin-count: 'oneOf' conditional failed, one must be fixed:
> 	'type' is a required property
> 		hint: A vendor boolean property can use "type: boolean"
> 	Additional properties are not allowed ('maxItems' was unexpected)
> 		hint: A vendor boolean property can use "type: boolean"
> 	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml: properties:qcom,mpm-pin-count: 'oneOf' conditional failed, one must be fixed:
> 		'enum' is a required property
> 		'const' is a required property
> 		hint: A vendor string property with exact values has an implicit type
> 		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> 	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml: properties:qcom,mpm-pin-count: 'oneOf' conditional failed, one must be fixed:
> 		'$ref' is a required property
> 		'allOf' is a required property
> 		hint: A vendor property needs a $ref to types.yaml
> 		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> 	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
> 	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml: properties:qcom,mpm-pin-map: 'oneOf' conditional failed, one must be fixed:
> 	'type' is a required property
> 		hint: A vendor boolean property can use "type: boolean"
> 	'description' is a required property
> 		hint: A vendor boolean property can use "type: boolean"
> 	Additional properties are not allowed ('$ref', 'items' were unexpected)
> 		hint: A vendor boolean property can use "type: boolean"
> 	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml: properties:qcom,mpm-pin-map: 'oneOf' conditional failed, one must be fixed:
> 		'enum' is a required property
> 		'const' is a required property
> 		hint: A vendor string property with exact values has an implicit type
> 		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> 	'/schemas/types.yaml#/definitions/uint32-matrix' does not match '^#/(definitions|$defs)/'
> 		hint: A vendor property can have a $ref to a a $defs schema
> 	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
> 	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.yaml: ignoring, error in schema: properties: qcom,mpm-pin-count
> Documentation/devicetree/bindings/interrupt-controller/qcom,mpm.example.dt.yaml:0:0: /example-0/interrupt-controller@45f01b8: failed to match any schema with compatible: ['qcom,qcm2290-mpm']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1593741
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
