Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8F85631C4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 12:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235392AbiGAKpH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 06:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236915AbiGAKpG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 06:45:06 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5867F7C190
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jul 2022 03:45:03 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id h15-20020a17090a648f00b001ef3c529d77so4797680pjj.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 03:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8HWloTp9oIW+iED/Acv+r40kfMWwjhdwx51xoQB8x2M=;
        b=YriKxqUoLyKSQMhBXSe8hPKWTboA5dURd/roSsXCPkAI+Z0netr66pQQKho4SZSoh/
         Tldlrl6NcmqjV/PxVdvd6Dyk1dmq081fZJfjDYAYzhc2rpIp+mppLjZpuKfsbkOJGdUW
         I9ZCTkS2sJlfpREWb/rhakDnAHGjUtVRotb5N9zkSeecZEnAVRoKBZ8/glM4FGin+RcL
         n8fPB1WpUkBOM3JYG/xrplz8ELNpa+Ki917dgpC+wOit3HAVl5DGdOqTP1zllkSdT4nR
         ylknha+FmEIptwcCiSvY2ky6wUY0Q2fhDAV9r6KEXUqeuVRT7FatbSlJRmz4KJlIfMUj
         PV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8HWloTp9oIW+iED/Acv+r40kfMWwjhdwx51xoQB8x2M=;
        b=x12kk6Lm4oNSgaJI8t9EYLag+lbTPg/ojgwMy4E0+e3Xs+VoEbX4pSu4/QaY6EksR2
         tajEYs3c1Xvvu8nXu2nNuta8fJMuIGqfFg8pPpC+1Y3sOiuqtrTIEnvaoGl66hsG1suW
         +sB2ZdaDRsoV3GrO5w/BSMMNBDF8qIJtYs0905etq5jQ5p7R76+pQsCXRmMQY4CR62kO
         xQXu4RXo2wm4rd4IPonLA8JDX905/wyLmWeCAYAPkGP65OSaVfcaqcG91+pLA5Uv+HYV
         3XS9KXVrEIsGklF6yDtUjjSnbAFomfVAhbywvVme7ec7bg4ETheNcQinp+uRYX+A8z1J
         466A==
X-Gm-Message-State: AJIora9W9RhvNTla56fXn5NljUYA6FRs4XJvG6H4tNbrmTJkNdfBY6mN
        5PWdc8+aLgjYzcPcZNJjirSTjg==
X-Google-Smtp-Source: AGRyM1vnkxC7wr6GobJACvzyiQPZYMOquCQ92Ie8YKbxEOvEN+epGRlgQSZ1NX/pwKyL4tSasYaTBQ==
X-Received: by 2002:a17:902:c944:b0:16a:3ed0:e60b with SMTP id i4-20020a170902c94400b0016a3ed0e60bmr20311897pla.7.1656672302591;
        Fri, 01 Jul 2022 03:45:02 -0700 (PDT)
Received: from leoy-ThinkPad-X240s (n058152077154.netvigator.com. [58.152.77.154])
        by smtp.gmail.com with ESMTPSA id x7-20020aa79567000000b0052524b1bfc3sm15979507pfq.147.2022.07.01.03.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:45:01 -0700 (PDT)
Date:   Fri, 1 Jul 2022 18:44:57 +0800
From:   Leo Yan <leo.yan@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     linux-pm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: interconnect: Update property for
 icc-rpm path tag
Message-ID: <20220701104457.GC659023@leoy-ThinkPad-X240s>
References: <20220630055723.704605-1-leo.yan@linaro.org>
 <20220630055723.704605-2-leo.yan@linaro.org>
 <1656596665.853599.2569463.nullmailer@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1656596665.853599.2569463.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Thu, Jun 30, 2022 at 07:44:25AM -0600, Rob Herring wrote:

[...]

> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml:49:11: [error] syntax error: expected <block end>, but found '<scalar>' (syntax)
> 
> dtschema/dtc warnings/errors:
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/interconnect/qcom,rpm.example.dts'
> Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml:49:11: did not find expected key
> make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/interconnect/qcom,rpm.example.dts] Error 1
> make[1]: *** Waiting for unfinished jobs....
> ./Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml:49:11: did not find expected key
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml: ignoring, error parsing file
> make: *** [Makefile:1404: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/
> 
> This check can fail if there are any dependencies. The base for a patch
> series is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade

Sorry that I did not run 'make dt_binding_check', will check it.

> Please check and re-submit.

Yeah, will do it.

Thanks a lot for the tips.

Leo
