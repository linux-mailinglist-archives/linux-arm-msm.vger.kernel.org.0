Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93DFB423767
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 07:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbhJFFLa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 01:11:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20361 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230080AbhJFFLa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 01:11:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633496978; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=+kyodXuHFG7FzF09R13HJQkRJAU5Fcpb+u3xxEOyrpY=; b=w4bh9oLnep1lOxbM8UK+HL90N1pTGdj2DKSR6hyWSKR3aqJFKAoWpEI4CWtWuo4jZpg41dbz
 9fGFL+DUz8/HejQ/kDd02O5kEdQfIAbL/aCYR8jhlJ7AiSnsVBITpMoqNALpRFKacjRPS7/y
 +flURLtNHtX42TUktfLO2pxNEnE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 615d2f884ccc4cf2c79a7f87 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Oct 2021 05:09:28
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 62080C43460; Wed,  6 Oct 2021 05:09:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [103.155.223.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61C10C4338F;
        Wed,  6 Oct 2021 05:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 61C10C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Rob Herring'" <robh@kernel.org>
Cc:     <mathieu.poirier@linaro.org>, <swboyd@chromium.org>,
        <p.zabel@pengutronix.de>, <devicetree@vger.kernel.org>,
        <bjorn.andersson@linaro.org>, <linux-kernel@vger.kernel.org>,
        <robh+dt@kernel.org>, <sibis@codeaurora.org>,
        <kuabhs@chromium.org>, <agross@kernel.org>, <ohad@wizery.com>,
        <linux-arm-msm@vger.kernel.org>, <mpubbise@codeaurora.org>
References: <1633330133-29617-1-git-send-email-pillair@codeaurora.org> <1633330133-29617-3-git-send-email-pillair@codeaurora.org> <1633350086.759437.1051509.nullmailer@robh.at.kernel.org>
In-Reply-To: <1633350086.759437.1051509.nullmailer@robh.at.kernel.org>
Subject: RE: [PATCH v6 2/3] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Wed, 6 Oct 2021 10:39:18 +0530
Message-ID: <006801d7ba70$54daae00$fe900a00$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
thread-index: AQKwJKLJ4tjmgoIJWycFdR/OOcUEpAEIhLzCAlTlvmOp+auOkA==
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Monday, October 4, 2021 5:51 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: mathieu.poirier@linaro.org; swboyd@chromium.org;
> p.zabel@pengutronix.de; devicetree@vger.kernel.org;
> bjorn.andersson@linaro.org; linux-kernel@vger.kernel.org;
> robh+dt@kernel.org; sibis@codeaurora.org; kuabhs@chromium.org;
> agross@kernel.org; ohad@wizery.com; linux-arm-msm@vger.kernel.org;
> mpubbise@codeaurora.org
> Subject: Re: [PATCH v6 2/3] dt-bindings: remoteproc: qcom: Add SC7280
> WPSS support
> 
> On Mon, 04 Oct 2021 12:18:52 +0530, Rakesh Pillai wrote:
> > Add WPSS PIL loading support for SC7280 SoCs.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> >  .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 196
> > +++++++++++++++++++++
> >  1 file changed, 196 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-
> pil.yaml
> >
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m
> dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-
> wpss-pil.yaml: properties:interrupts: 'oneOf' conditional failed, one must
be
> fixed:
> 	[{'description': 'Watchdog interrupt'}, {'description': 'Fatal
interrupt'},
> {'description': 'Ready interrupt'}, {'description': 'Handover interrupt'},
> {'description': 'Stop acknowledge interrupt'}, {'description': 'Shutdown
> acknowledge interrupt'}] is too long
> 	[{'description': 'Watchdog interrupt'}, {'description': 'Fatal
interrupt'},
> {'description': 'Ready interrupt'}, {'description': 'Handover interrupt'},
> {'description': 'Stop acknowledge interrupt'}, {'description': 'Shutdown
> acknowledge interrupt'}] is too short
> 	False schema does not allow 6
> 	1 was expected
> 	6 is greater than the maximum of 2
> 	6 is greater than the maximum of 3
> 	6 is greater than the maximum of 4
> 	6 is greater than the maximum of 5
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-
> wpss-pil.yaml: properties:interrupt-names: 'oneOf' conditional failed, one
> must be fixed:
> 	[{'const': 'wdog'}, {'const': 'fatal'}, {'const': 'ready'},
{'const':
> 'handover'}, {'const': 'stop-ack'}, {'const': 'shutdown-ack'}] is too long
> 	[{'const': 'wdog'}, {'const': 'fatal'}, {'const': 'ready'},
{'const':
> 'handover'}, {'const': 'stop-ack'}, {'const': 'shutdown-ack'}] is too
short
> 	False schema does not allow 6
> 	1 was expected
> 	6 is greater than the maximum of 2
> 	6 is greater than the maximum of 3
> 	6 is greater than the maximum of 4
> 	6 is greater than the maximum of 5
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-
> wpss-pil.yaml: properties:clocks: 'oneOf' conditional failed, one must be
> fixed:
> 	[{'description': 'GCC WPSS AHB BDG Master clock'}, {'description':
> 'GCC WPSS AHB clock'}, {'description': 'GCC WPSS RSCP clock'},
{'description':
> 'XO clock'}] is too long
> 	[{'description': 'GCC WPSS AHB BDG Master clock'}, {'description':
> 'GCC WPSS AHB clock'}, {'description': 'GCC WPSS RSCP clock'},
{'description':
> 'XO clock'}] is too short
> 	False schema does not allow 4
> 	1 was expected
> 	4 is greater than the maximum of 2
> 	4 is greater than the maximum of 3
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-
> wpss-pil.yaml: properties:clock-names: 'oneOf' conditional failed, one
must
> be fixed:
> 	[{'const': 'ahb_bdg'}, {'const': 'ahb'}, {'const': 'rscp'},
{'const': 'xo'}] is
> too long
> 	[{'const': 'ahb_bdg'}, {'const': 'ahb'}, {'const': 'rscp'},
{'const': 'xo'}] is
> too short
> 	False schema does not allow 4
> 	1 was expected
> 	4 is greater than the maximum of 2
> 	4 is greater than the maximum of 3
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-
> wpss-pil.yaml: properties:power-domains: 'oneOf' conditional failed, one
> must be fixed:
> 	[{'description': 'CX power domain'}, {'description': 'MX power
> domain'}] is too long
> 	[{'description': 'CX power domain'}, {'description': 'MX power
> domain'}] is too short
> 	False schema does not allow 2
> 	1 was expected
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-
> wpss-pil.yaml: properties:power-domain-names: 'oneOf' conditional failed,
> one must be fixed:
> 	[{'const': 'cx'}, {'const': 'mx'}] is too long
> 	[{'const': 'cx'}, {'const': 'mx'}] is too short
> 	False schema does not allow 2
> 	1 was expected
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-
> wpss-pil.yaml: properties:resets: 'oneOf' conditional failed, one must be
> fixed:
> 	[{'description': 'AOSS restart'}, {'description': 'PDC SYNC'}] is
too long
> 	[{'description': 'AOSS restart'}, {'description': 'PDC SYNC'}] is
too short
> 	False schema does not allow 2
> 	1 was expected
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-
> wpss-pil.yaml: properties:reset-names: 'oneOf' conditional failed, one
must
> be fixed:
> 	[{'const': 'restart'}, {'const': 'pdc_sync'}] is too long
> 	[{'const': 'restart'}, {'const': 'pdc_sync'}] is too short
> 	False schema does not allow 2
> 	1 was expected
> 	hint: "minItems" is only needed if less than the "items" list length
> 	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> /builds/robherring/linux-dt-
> review/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-
> wpss-pil.yaml: ignoring, error in schema: properties: interrupts
> warning: no schema found in file:
> ./Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-
> pil.yaml
> Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-
> pil.example.dt.yaml:0:0: /example-0/remoteproc@8a00000: failed to match
> any schema with compatible: ['qcom,sc7280-wpss-pil']
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/patch/1535950
> 
> This check can fail if there are any dependencies. The base for a patch
series
> is generally the most recent rc1.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
error(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.


I have updated the dtschema (2021.7) and still not seeing these errors. I
will fix the errors mentioned in this log though.
Is there any other flag/setting, which is to be enabled ?

Thanks,
Rakesh Pillai.


