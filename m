Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFF7B5912BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 17:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbiHLPOa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 11:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238865AbiHLPOE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 11:14:04 -0400
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182ACA7A81;
        Fri, 12 Aug 2022 08:14:01 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id j20so618447ila.6;
        Fri, 12 Aug 2022 08:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=1WsMbz5AGoLL+HweBLDrsmHvwbn+QXCLHU8aJ9T7JDY=;
        b=h9w/+WQ2OHdLkt4kWPrgsu6JcDs0oIwTN8FFALpCjHHb2NrZsDnQumxkZjO+k+e8fy
         ZEynGkHTdaslHDlMcBSHPYFNBw5xXwhR/GVBSlONMjUl/tFFoAS5KRUmS6JUv4Vx8eEp
         Iwm3qz6qJbxu7rMWxdXbBNCK1Aq2ENmqyZ+EwlXSuhU53mckjxCNfVwcJd9VnMs+eGWr
         5mOh+rjCKRZceerIJrFXRuiGrop+mAChYwKOYznron7HPi7mBwsGZzaKEnWAkqmAivnL
         9iMXDvjVK3dAQkmT/VZBFU1WuEQpmsNb4/2YAgcJewfFmOzUmWf3CTTv4XVdixD7nlXh
         qUJg==
X-Gm-Message-State: ACgBeo0vrLgZyyp/TQrgPQdG9IC/x/GgqlQONdvcaksZHVTA5yqJUsfQ
        T+IOv5wbQk3xfU3jzZRVCg==
X-Google-Smtp-Source: AA6agR4sqC61aVa5dnLieL0KiDAar/jFwxxRLGzdoKsO+ZuDxnJAc0hntGFUda6k9fSR4Pgf0Rjurw==
X-Received: by 2002:a92:cda3:0:b0:2e3:e214:5fa5 with SMTP id g3-20020a92cda3000000b002e3e2145fa5mr1370026ild.306.1660317241129;
        Fri, 12 Aug 2022 08:14:01 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id q130-20020a6b2a88000000b0068000bfea64sm1050841ioq.14.2022.08.12.08.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Aug 2022 08:14:00 -0700 (PDT)
Received: (nullmailer pid 168980 invoked by uid 1000);
        Fri, 12 Aug 2022 15:13:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
        devicetree@vger.kernel.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20220811214107.1074343-4-quic_eberman@quicinc.com>
References: <20220811214107.1074343-1-quic_eberman@quicinc.com> <20220811214107.1074343-4-quic_eberman@quicinc.com>
Subject: Re: [PATCH v3 03/12] dt-bindings: Add binding for gunyah hypervisor
Date:   Fri, 12 Aug 2022 09:13:53 -0600
Message-Id: <1660317233.437369.168979.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Aug 2022 14:40:58 -0700, Elliot Berman wrote:
> When Linux is booted as a guest under the Gunyah hypervisor, the Gunyah
> Resource Manager applies a devicetree overlay describing the virtual
> platform configuration of the guest VM, such as the message queue
> capability IDs for communicating with the Resource Manager. This
> information is not otherwise discoverable by a VM: the Gunyah hypervisor
> core does not provide a direct interface to discover capability IDs nor
> a way to communicate with RM without having already known the
> corresponding message queue capability ID. Add the DT bindings that
> Gunyah adheres for the hypervisor node and message queues.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
> Changes since v2:
>  - Add newlines as suggested
>  - Fixed typo in example (gunyah-resource-mgr@0 -> gunyah-resource-mgr@1)
> 
>  .../bindings/firmware/gunyah-hypervisor.yaml  | 87 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml: properties:compatible: [{'items': [{'const': 'gunyah-hypervisor-1.0'}, {'const': 'gunyah-hypervisor'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml: patternProperties:^gunyah-resource-mgr(@.*)?:properties:compatible: [{'items': [{'const': 'gunyah-resource-manager-1-0'}, {'const': 'gunyah-resource-manager'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/firmware/gunyah-hypervisor.example.dtb:0:0: /example-0/hypervisor: failed to match any schema with compatible: ['gunyah-hypervisor-1.0', 'gunyah-hypervisor']
Documentation/devicetree/bindings/firmware/gunyah-hypervisor.example.dtb:0:0: /example-0/hypervisor: failed to match any schema with compatible: ['gunyah-hypervisor-1.0', 'gunyah-hypervisor']
Documentation/devicetree/bindings/firmware/gunyah-hypervisor.example.dtb:0:0: /example-0/hypervisor/gunyah-resource-mgr@0: failed to match any schema with compatible: ['gunyah-resource-manager-1-0', 'gunyah-resource-manager']
Documentation/devicetree/bindings/firmware/gunyah-hypervisor.example.dtb:0:0: /example-0/hypervisor/gunyah-resource-mgr@0: failed to match any schema with compatible: ['gunyah-resource-manager-1-0', 'gunyah-resource-manager']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

