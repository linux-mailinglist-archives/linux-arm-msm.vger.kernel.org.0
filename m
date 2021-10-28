Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 818FF43E8CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 21:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhJ1TLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 15:11:22 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:41915 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbhJ1TLV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 15:11:21 -0400
Received: by mail-oi1-f178.google.com with SMTP id y128so9692644oie.8;
        Thu, 28 Oct 2021 12:08:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=IkSb8C7GAFz/mAwKL4VgxHujgz4IrSq9GNcKcWkokn4=;
        b=Gr+lAm1vaZ5XkhEYGwJB6nfPv6MdRdUH+wknrEfdpVZwOogKhYi6h8QEIT9pZO25v0
         Tt80MW5fIQg0jcFlF3kK3dyna7N5Hkxbu6Uq0wKcQ9hVqQZ7hiw+O5j/XTjSvlTs1qRc
         bkdkq9lBsUsGSssaRyi/5w6/5q9MLd8F4VNx0Yxq7J4Dvu7H4kiBWzz6eNndoYFOhtpT
         ucQI1tHOYpuWkS7aUOYDhceuWPYhqQY52YnCkLZIjQHKpqU0cvkIxHN1Marr1jAeZKqp
         rsNv9G7XVB4lhRnxd6I8k28w86MSGiql5TRr0suodhRvFNz4ni1CEBUIvg91D/oMGOYn
         vIGQ==
X-Gm-Message-State: AOAM530+QB6vOZoeUGqf/S+ZOI/Q4XekTQg1Ejrem4YN8FfeD4xIlJoE
        nygEif9VZhpdsOZIX5jQNw==
X-Google-Smtp-Source: ABdhPJzqWUAFj8DoNRI5eeZsudzXO8D2foLGlfAb+RGGA12p5K/FSEre5UJJ5oKhdD2iQuUdrC/ahg==
X-Received: by 2002:aca:3b89:: with SMTP id i131mr2288170oia.102.1635448133600;
        Thu, 28 Oct 2021 12:08:53 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h91sm1242529otb.38.2021.10.28.12.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 12:08:53 -0700 (PDT)
Received: (nullmailer pid 409857 invoked by uid 1000);
        Thu, 28 Oct 2021 19:08:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     heikki.krogerus@linux.intel.com, linux@roeck-us.net,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, wcheng@codeaurora.org,
        gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        rdunlap@infradead.org, linux-usb@vger.kernel.org
In-Reply-To: <20211028164941.831918-3-bryan.odonoghue@linaro.org>
References: <20211028164941.831918-1-bryan.odonoghue@linaro.org> <20211028164941.831918-3-bryan.odonoghue@linaro.org>
Subject: Re: [RESEND PATCH v2 2/7] dt-bindings: usb: Add Qualcomm PMIC type C controller YAML schema
Date:   Thu, 28 Oct 2021 14:08:48 -0500
Message-Id: <1635448128.084388.409856.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 28 Oct 2021 17:49:36 +0100, Bryan O'Donoghue wrote:
> Add a YAML binding for the type-c silicon interface inside Qualcomm's
> pm8150b hardware block.
> 
> The type-c driver operates with a pdphy driver inside of a high level
> single TCPM device.
> 
> Based on original work by Wesley.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/usb/qcom,pmic-typec.example.dt.yaml:0:0: /example-0/pm8150b/typec@1500: failed to match any schema with compatible: ['qcom,pm8150b-typec']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1547612

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

