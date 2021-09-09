Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05C274051A0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 14:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354281AbhIIMhQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 08:37:16 -0400
Received: from mail-oo1-f42.google.com ([209.85.161.42]:38787 "EHLO
        mail-oo1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350381AbhIIMeF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 08:34:05 -0400
Received: by mail-oo1-f42.google.com with SMTP id m11-20020a056820034b00b0028bb60b551fso505877ooe.5;
        Thu, 09 Sep 2021 05:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=y0aka+VWvbqCJzSFSNT81xthX6LrDFWP/OIba3f6BGo=;
        b=a8rVEWv1RJhRGJD6Du0W0cBjA2jm9BbjiiW53RAq/5TJkoj59mq4z4gDjW1utFFpdM
         mHsm3Rm1pXxpQcAqwlzssM2ADJ7S/wSLjnfScM9offIy9mvAlDWD6MUelGIMCq9fQika
         yL2zCMi7wEze5JhGOJZ2g0fZ2uERWl/aucm1lz4/CpSpc8FlLS+Co6VF0i/F2XzcqZqQ
         dQlwOPspwVMJew8p4mkd7tdOQ5vhe7Q/kH/MWlE1q6etIP5Xwj7vUhumNOV+eU8V9yqE
         oiLzS/P1p+1c7irPxqWDbPxmhP9YmZpaAA4SHafRxZY0NusLfs26G2NmCI4uWevKP3ed
         8Mgg==
X-Gm-Message-State: AOAM530zaKaV/DqRe7d0Yn1kPhli5dwTYYXo6HTWKS9i3FRLfcHcIz33
        DE7pSha88DqtgsQketQhbA==
X-Google-Smtp-Source: ABdhPJwcccUKbw/CRKV6/kvGmhWbeC2lZht29aQ8XL27mN8hdoAyskJibVFo0uAYquLTymYq21wjtw==
X-Received: by 2002:a4a:d294:: with SMTP id h20mr2211588oos.60.1631190775303;
        Thu, 09 Sep 2021 05:32:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id g8sm402702otk.34.2021.09.09.05.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 05:32:54 -0700 (PDT)
Received: (nullmailer pid 200337 invoked by uid 1000);
        Thu, 09 Sep 2021 12:32:53 -0000
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20210908171453.53259-1-david@ixit.cz>
References: <20210908171453.53259-1-david@ixit.cz>
Subject: Re: [RFC PATCH] [v2] dt-bindings: arm/msm/qcom,idle-state convert to YAML
Date:   Thu, 09 Sep 2021 07:32:53 -0500
Message-Id: <1631190773.274764.200336.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 08 Sep 2021 19:14:53 +0200, David Heidelberg wrote:
> Switched maintainer from Lina to Bjorn.
> 
> Doesn't fix:
> ```
> idle-states: 'spc' does not match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
> ```
> from colliding arm/idle-states.yaml .
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> 
> v2
>  - maintainer is now Bjorn
>  - fixed some newlines
>  - specified exact state names (added $)
> 
>  .../bindings/arm/msm/qcom,idle-state.txt      |  84 ------------
>  .../bindings/arm/msm/qcom,idle-state.yaml     | 126 ++++++++++++++++++
>  2 files changed, 126 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,idle-state.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,idle-state.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/msm/qcom,idle-state.yaml:87:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/psci.example.dt.yaml: idle-states: 'cpu-power-down' does not match any of the regexes: '^(ret|spc|pc)$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: 'cluster-retention-0', 'cluster-retention-1', 'cluster-sleep-0', 'cluster-sleep-1', 'cpu-retention-0-0', 'cpu-retention-1-0', 'cpu-sleep-0-0', 'cpu-sleep-1-0', 'entry-method' do not match any of the regexes: '^(ret|spc|pc)$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.example.dt.yaml: idle-states: 'cluster-sleep-0', 'cluster-sleep-1', 'cpu-sleep-0-0', 'cpu-sleep-1-0' do not match any of the regexes: '^(ret|spc|pc)$', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/msm/qcom,idle-state.example.dt.yaml: idle-states: 'spc' does not match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/idle-states.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1525975

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

