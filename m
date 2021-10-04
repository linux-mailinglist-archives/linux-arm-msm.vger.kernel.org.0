Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41FED420AD2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Oct 2021 14:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232958AbhJDMXY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 08:23:24 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:40645 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhJDMXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 08:23:20 -0400
Received: by mail-oi1-f174.google.com with SMTP id t189so21287400oie.7;
        Mon, 04 Oct 2021 05:21:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=qS2akTv9YqsMuUb53B7mFgtOnLLKGm85YgY9TacMqmY=;
        b=OA9hKiJa20/+5uy2tZR1OY0CN4GqZYlO9q+VBn6zlwwRFuxXINI307nT4k0N2Oz77U
         gYOfgarCQfaZTzscd7ZIDNIy/I6nHr8vQ5ta8PwysxbaBIDE5wxIWpjid45Op70q6OKa
         qn7vp5R9kSVTckXlPa99NQggA+KuGpVTPDh/SaAWYKTAhSYeV4cunQiIfg2gjCZwEcQD
         qrap5lI9czjVs6itjppb8SZO0vyobGv4e9U8u1nS4cpfz+7pYhChCh33S8AnNRxk8v0c
         5FYsdMjlZRKOczN2a0LbAooadlWUo6XbDjUTosvTmWv8VnaHmX7dQ/CUgqaTp3cB5vNE
         c7+g==
X-Gm-Message-State: AOAM530hg19p7M1hv/m9UlDg59OLud+msLwnaXUJ5vcLd/gkkrgqdH6F
        VF+iaV2N+cZ9yY77X/RkDg==
X-Google-Smtp-Source: ABdhPJzdnf2EwPxql4AYBhnzBsgk6qkV3+X2Uxf8FueJAo4KwgFZRmGtkLyaP4ruJo+LENqN8yIKHw==
X-Received: by 2002:a05:6808:43:: with SMTP id v3mr13704443oic.115.1633350091397;
        Mon, 04 Oct 2021 05:21:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w1sm2895408ote.41.2021.10.04.05.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 05:21:30 -0700 (PDT)
Received: (nullmailer pid 1051510 invoked by uid 1000);
        Mon, 04 Oct 2021 12:21:26 -0000
From:   Rob Herring <robh@kernel.org>
To:     Rakesh Pillai <pillair@codeaurora.org>
Cc:     mathieu.poirier@linaro.org, swboyd@chromium.org,
        p.zabel@pengutronix.de, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, sibis@codeaurora.org, kuabhs@chromium.org,
        agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        mpubbise@codeaurora.org
In-Reply-To: <1633330133-29617-3-git-send-email-pillair@codeaurora.org>
References: <1633330133-29617-1-git-send-email-pillair@codeaurora.org> <1633330133-29617-3-git-send-email-pillair@codeaurora.org>
Subject: Re: [PATCH v6 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Mon, 04 Oct 2021 07:21:26 -0500
Message-Id: <1633350086.759437.1051509.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 04 Oct 2021 12:18:52 +0530, Rakesh Pillai wrote:
> Add WPSS PIL loading support for SC7280 SoCs.
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---
>  .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 196 +++++++++++++++++++++
>  1 file changed, 196 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml: properties:interrupts: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'Watchdog interrupt'}, {'description': 'Fatal interrupt'}, {'description': 'Ready interrupt'}, {'description': 'Handover interrupt'}, {'description': 'Stop acknowledge interrupt'}, {'description': 'Shutdown acknowledge interrupt'}] is too long
	[{'description': 'Watchdog interrupt'}, {'description': 'Fatal interrupt'}, {'description': 'Ready interrupt'}, {'description': 'Handover interrupt'}, {'description': 'Stop acknowledge interrupt'}, {'description': 'Shutdown acknowledge interrupt'}] is too short
	False schema does not allow 6
	1 was expected
	6 is greater than the maximum of 2
	6 is greater than the maximum of 3
	6 is greater than the maximum of 4
	6 is greater than the maximum of 5
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml: properties:interrupt-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'wdog'}, {'const': 'fatal'}, {'const': 'ready'}, {'const': 'handover'}, {'const': 'stop-ack'}, {'const': 'shutdown-ack'}] is too long
	[{'const': 'wdog'}, {'const': 'fatal'}, {'const': 'ready'}, {'const': 'handover'}, {'const': 'stop-ack'}, {'const': 'shutdown-ack'}] is too short
	False schema does not allow 6
	1 was expected
	6 is greater than the maximum of 2
	6 is greater than the maximum of 3
	6 is greater than the maximum of 4
	6 is greater than the maximum of 5
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'GCC WPSS AHB BDG Master clock'}, {'description': 'GCC WPSS AHB clock'}, {'description': 'GCC WPSS RSCP clock'}, {'description': 'XO clock'}] is too long
	[{'description': 'GCC WPSS AHB BDG Master clock'}, {'description': 'GCC WPSS AHB clock'}, {'description': 'GCC WPSS RSCP clock'}, {'description': 'XO clock'}] is too short
	False schema does not allow 4
	1 was expected
	4 is greater than the maximum of 2
	4 is greater than the maximum of 3
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'ahb_bdg'}, {'const': 'ahb'}, {'const': 'rscp'}, {'const': 'xo'}] is too long
	[{'const': 'ahb_bdg'}, {'const': 'ahb'}, {'const': 'rscp'}, {'const': 'xo'}] is too short
	False schema does not allow 4
	1 was expected
	4 is greater than the maximum of 2
	4 is greater than the maximum of 3
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml: properties:power-domains: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'CX power domain'}, {'description': 'MX power domain'}] is too long
	[{'description': 'CX power domain'}, {'description': 'MX power domain'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml: properties:power-domain-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'cx'}, {'const': 'mx'}] is too long
	[{'const': 'cx'}, {'const': 'mx'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml: properties:resets: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'AOSS restart'}, {'description': 'PDC SYNC'}] is too long
	[{'description': 'AOSS restart'}, {'description': 'PDC SYNC'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml: properties:reset-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'restart'}, {'const': 'pdc_sync'}] is too long
	[{'const': 'restart'}, {'const': 'pdc_sync'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml: ignoring, error in schema: properties: interrupts
warning: no schema found in file: ./Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.yaml
Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-pil.example.dt.yaml:0:0: /example-0/remoteproc@8a00000: failed to match any schema with compatible: ['qcom,sc7280-wpss-pil']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1535950

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

