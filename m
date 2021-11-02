Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D09B9442E51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 13:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbhKBMlc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 08:41:32 -0400
Received: from mail-oi1-f179.google.com ([209.85.167.179]:44841 "EHLO
        mail-oi1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbhKBMlb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 08:41:31 -0400
Received: by mail-oi1-f179.google.com with SMTP id t38so2579099oiw.11;
        Tue, 02 Nov 2021 05:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=vX7tWdjvUh/n8P+ZM1cqLkwBY2iECa34Sj2X0s5E99w=;
        b=0dfo5DQBTz1IhwmM1H1IyTFB+Sjcw7bGYK4L9nNz00raH2o8SEA+DqNoFuusnitTGZ
         yxt2MSPSGBqHY5IGey+uB998TEETOmeRvPDTmwPsAGOQiKYzC0huTmnMBKZF2+c6IalT
         ZEIqs8gf+PN430uXgTjhD3gxPK+YFX4kTE/0Xpa6kk8P/EveyWRkrt39V1BB8ZZzK4lr
         ol5tHVq/+6T+OJOxwyGNwu/8OLF62NUuYeq3JVbDko4Xj9WAmEdNinYUNoNxkrQHK10U
         PGs+xcem9U6MYj4Dv3VH2FpVIu3nIyNGsSz3MnrYE5fZtSXTjpjDWhIw34XA5xlbSZSe
         Fzug==
X-Gm-Message-State: AOAM533/E8YByf6LSfykvnocqYkZo4KcMETikd9oS1NGdBH26R5zjzyI
        8I/A4jQiaKz+Lw7cOb1TiQ==
X-Google-Smtp-Source: ABdhPJzoVPMiX3nMunzERDDXuZ7mJ4SspBwHfVenvCVSNdkdkQw52/a9hWdrWooA7zpr/PHz0br3Ag==
X-Received: by 2002:a54:4391:: with SMTP id u17mr4814704oiv.15.1635856735813;
        Tue, 02 Nov 2021 05:38:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 126sm4826933oih.36.2021.11.02.05.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 05:38:55 -0700 (PDT)
Received: (nullmailer pid 2636027 invoked by uid 1000);
        Tue, 02 Nov 2021 12:38:52 -0000
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org
In-Reply-To: <1635847013-3220-4-git-send-email-tdas@codeaurora.org>
References: <1635847013-3220-1-git-send-email-tdas@codeaurora.org> <1635847013-3220-4-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v1 3/4] dt-bindings: clock: Add YAML schemas for LPASS clocks on SC7280
Date:   Tue, 02 Nov 2021 07:38:52 -0500
Message-Id: <1635856732.621453.2636026.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 02 Nov 2021 15:26:52 +0530, Taniya Das wrote:
> The LPASS(Low Power Audio Subsystem) clock provider have a bunch of generic
> properties that are needed in a device tree. Also add clock ids for
> LPASS core clocks and audio clock IDs for LPASS client to request for
> the clocks.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../bindings/clock/qcom,sc7280-lpasscorecc.yaml    | 137 +++++++++++++++++++++
>  .../dt-bindings/clock/qcom,lpassaudiocc-sc7280.h   |  43 +++++++
>  .../dt-bindings/clock/qcom,lpasscorecc-sc7280.h    |  26 ++++
>  3 files changed, 206 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,lpassaudiocc-sc7280.h
>  create mode 100644 include/dt-bindings/clock/qcom,lpasscorecc-sc7280.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3c00000: clocks: [[4294967295, 169]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3c00000: clock-names: ['iface'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3c00000: clocks: [[4294967295, 169]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3900000: clocks: [[4294967295, 169], [4294967295, 0]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3900000: clock-names: ['iface', 'bi_tcxo'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3900000: clocks: [[4294967295, 169], [4294967295, 0]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3380000: clocks: [[4294967295, 3], [4294967295, 0]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3380000: clock-names: ['iface', 'bi_tcxo'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3380000: clocks: [[4294967295, 3], [4294967295, 0]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3300000: clocks: [[4294967295, 0], [4294967295, 6]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3300000: clock-names:0: 'iface' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3300000: clock-names:1: 'bi_tcxo' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3300000: clock-names: ['bi_tcxo', 'lpass_aon_cc_main_rcg'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.example.dt.yaml: clock-controller@3300000: clocks: [[4294967295, 0], [4294967295, 6]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/qcom,sc7280-lpasscorecc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1549550

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

