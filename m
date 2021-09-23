Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C96E416425
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 19:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242190AbhIWRPC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Sep 2021 13:15:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34696 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242674AbhIWROl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Sep 2021 13:14:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632417189; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=t12LN+auGI7Arv82FZVp1Ofzyzc2dN9VIovd2p44XXU=; b=NX7bXdYg2H4PM7TMEZNrX22Y6CkCZjUsARO5PgCARM4FCciGyhiT7LqtGa83prHdcIf0Fqkd
 YPV29aBIDsT8IGWscb5WkDADI/m/zK+NTsuMT7aiJW5M7jPQSdDc4Y9pgSoQtx4gVZMgVgLv
 3M+IhYVEzolIWHEOUUN2z7Oq2/0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 614cb58bb585cc7d245ca0f8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Sep 2021 17:12:43
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43F25C43637; Thu, 23 Sep 2021 17:12:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [103.155.222.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24B08C4361C;
        Thu, 23 Sep 2021 17:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 24B08C4361C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Rob Herring'" <robh+dt@kernel.org>
Cc:     "'Gross, Andy'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Ohad Ben-Cohen'" <ohad@wizery.com>,
        "'Mathieu Poirier'" <mathieu.poirier@linaro.org>,
        "'Philipp Zabel'" <p.zabel@pengutronix.de>,
        "'Stephen Boyd'" <swboyd@chromium.org>,
        "'linux-arm-msm'" <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "'sibis'" <sibis@codeaurora.org>, <mpubbise@codeaurora.org>,
        <kuabhs@chromium.org>
References: <1631874941-5262-1-git-send-email-pillair@codeaurora.org> <1631874941-5262-2-git-send-email-pillair@codeaurora.org> <CAL_Jsq+khyhbwJ5-GPZ5ZGkY4nX_obq4t92Z0V6sZH3Oyj4Fow@mail.gmail.com>
In-Reply-To: <CAL_Jsq+khyhbwJ5-GPZ5ZGkY4nX_obq4t92Z0V6sZH3Oyj4Fow@mail.gmail.com>
Subject: RE: [PATCH v4 1/2] dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
Date:   Thu, 23 Sep 2021 22:42:30 +0530
Message-ID: <004601d7b09e$35ff63d0$a1fe2b70$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQF0eSZL6xbdu6QNcc0QXvoTc0aaAwNauk2NAmrNx3usSh1b4A==
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Rob Herring <robh+dt@kernel.org>
> Sent: Wednesday, September 22, 2021 10:59 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: Gross, Andy <agross@kernel.org>; Bjorn Andersson
> <bjorn.andersson@linaro.org>; Ohad Ben-Cohen <ohad@wizery.com>;
> Mathieu Poirier <mathieu.poirier@linaro.org>; Philipp Zabel
> <p.zabel@pengutronix.de>; Stephen Boyd <swboyd@chromium.org>; linux-
> arm-msm <linux-arm-msm@vger.kernel.org>; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org; sibis <sibis@codeaurora.org>;
> mpubbise@codeaurora.org; kuabhs@chromium.org
> Subject: Re: [PATCH v4 1/2] dt-bindings: remoteproc: qcom: Add SC7280
> WPSS support
>=20
> On Fri, Sep 17, 2021 at 5:36 AM Rakesh Pillai <pillair@codeaurora.org> =
wrote:
> >
> > Add WPSS PIL loading support for SC7280 SoCs.
> >
> > Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> > ---
> >  .../bindings/remoteproc/qcom,sc7280-wpss-pil.yaml  | 198
> > +++++++++++++++++++++
> >  1 file changed, 198 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-
> pil.yaml
>=20
> What happened to converting the existing binding? Given you already =
did
> that, please don't drop it.

Hi Rob,
Thanks for the review.
Sure, let me post v5 with other comments on this patch-series addressed.
I will also include the yaml conversion for existing dt-bindings.

Thanks,
Rakesh Pillai.


>=20
> >
> > diff --git
> > a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-
> pil.ya
> > ml
> > b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-wpss-
> pil.ya
> > ml
> > new file mode 100644
> > index 0000000..896d5f47
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-
> wpss-pi
> > +++ l.yaml
> > @@ -0,0 +1,198 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/remoteproc/qcom,sc7280-wpss-pil.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SC7280 WPSS Peripheral Image Loader
> > +
> > +maintainers:
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +description:
> > +  This document defines the binding for a component that loads and
> > +boots firmware
> > +  on the Qualcomm Technology Inc. WPSS.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,sc7280-wpss-pil
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      The base address and size of the qdsp6ss register
> > +
> > +  interrupts-extended:
>=20
> Use 'interrupts'. The tooling supports either.
>=20
> > +    minItems: 6
>=20
> Don't need minItems unless it is less than 'items' length.
>=20
> > +    items:
> > +      - description: Watchdog interrupt
> > +      - description: Fatal interrupt
> > +      - description: Ready interrupt
> > +      - description: Handover interrupt
> > +      - description: Stop acknowledge interrupt
> > +      - description: Shutdown acknowledge interrupt
> > +
> > +  interrupt-names:
> > +    minItems: 6
> > +    items:
> > +      - const: wdog
> > +      - const: fatal
> > +      - const: ready
> > +      - const: handover
> > +      - const: stop-ack
> > +      - const: shutdown-ack
> > +
> > +  clocks:
> > +    minItems: 4
> > +    items:
> > +      - description: GCC WPSS AHB BDG Master clock
> > +      - description: GCC WPSS AHB clock
> > +      - description: GCC WPSS RSCP clock
> > +      - description: XO clock
> > +
> > +  clock-names:
> > +    minItems: 4
> > +    items:
> > +      - const: gcc_wpss_ahb_bdg_mst_clk
> > +      - const: gcc_wpss_ahb_clk
> > +      - const: gcc_wpss_rscp_clk
>=20
> ahb_bdg, ahb, rscp is sufficient. Or use the same names as prior =
versions (did
> the h/w clocks change?).
>=20
> > +      - const: xo
> > +
> > +  power-domains:
> > +    minItems: 2
> > +    items:
> > +      - description: CX power domain
> > +      - description: MX power domain
> > +
> > +  power-domain-names:
> > +    minItems: 2
> > +    items:
> > +      - const: cx
> > +      - const: mx
> > +
> > +  resets:
> > +    minItems: 2
> > +    items:
> > +      - description: AOSS restart
> > +      - description: PDC SYNC
> > +
> > +  reset-names:
> > +    minItems: 2
> > +    items:
> > +      - const: restart
> > +      - const: pdc_sync
> > +
> > +  memory-region:
> > +    maxItems: 1
> > +    description: Reference to the reserved-memory for the Hexagon
> > + core
> > +
> > +  qcom,halt-regs:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      Phandle reference to a syscon representing TCSR followed by =
the
> > +      three offsets within syscon for q6, modem and nc halt =
registers.
> > +
> > +  qcom,qmp:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: Reference to the AOSS side-channel message RAM.
> > +
> > +  qcom,smem-states:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description: States used by the AP to signal the Hexagon core
> > +    items:
> > +      - description: Stop the modem
> > +
> > +  qcom,smem-state-names:
> > +    $ref: /schemas/types.yaml#/definitions/string-array
>=20
> string or string-array?
>=20
> > +    description: The names of the state bits used for SMP2P output
> > +    items:
> > +      - const: stop
>=20
> This says only 1 entry, so 'string'.
>=20
> > +
> > +  glink-edge:
> > +    type: object
> > +    description:
> > +      Qualcomm G-Link subnode which represents communication edge,
> channels
> > +      and devices related to the ADSP.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts-extended
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - power-domain-names
> > +  - reset
> > +  - reset-names
> > +  - qcom,halt-regs
> > +  - memory-region
> > +  - qcom,qmp
> > +  - qcom,smem-states
> > +  - qcom,smem-state-names
> > +  - glink-edge
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/qcom,gcc-sc7280.h>
> > +    #include <dt-bindings/clock/qcom,rpmh.h>
> > +    #include <dt-bindings/power/qcom-rpmpd.h>
> > +    #include <dt-bindings/reset/qcom,sdm845-aoss.h>
> > +    #include <dt-bindings/reset/qcom,sdm845-pdc.h>
> > +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> > +    remoteproc@8a00000 {
> > +        compatible =3D "qcom,sc7280-wpss-pil";
> > +        reg =3D <0x08a00000 0x10000>;
> > +
> > +        interrupts-extended =3D <&intc GIC_SPI 587 =
IRQ_TYPE_EDGE_RISING>,
> > +                              <&wpss_smp2p_in 0 =
IRQ_TYPE_EDGE_RISING>,
> > +                              <&wpss_smp2p_in 1 =
IRQ_TYPE_EDGE_RISING>,
> > +                              <&wpss_smp2p_in 2 =
IRQ_TYPE_EDGE_RISING>,
> > +                              <&wpss_smp2p_in 3 =
IRQ_TYPE_EDGE_RISING>,
> > +                              <&wpss_smp2p_in 7 =
IRQ_TYPE_EDGE_RISING>;
> > +        interrupt-names =3D "wdog", "fatal", "ready", "handover",
> > +                          "stop-ack", "shutdown-ack";
> > +
> > +        clocks =3D <&gcc GCC_WPSS_AHB_BDG_MST_CLK>,
> > +                 <&gcc GCC_WPSS_AHB_CLK>,
> > +                 <&gcc GCC_WPSS_RSCP_CLK>,
> > +                 <&rpmhcc RPMH_CXO_CLK>;
> > +        clock-names =3D "gcc_wpss_ahb_bdg_mst_clk",
> > +                      "gcc_wpss_ahb_clk",
> > +                      "gcc_wpss_rscp_clk",
> > +                      "xo";
> > +
> > +        power-domains =3D <&rpmhpd SC7280_CX>,
> > +                        <&rpmhpd SC7280_MX>;
> > +        power-domain-names =3D "cx", "mx";
> > +
> > +        memory-region =3D <&wpss_mem>;
> > +
> > +        qcom,qmp =3D <&aoss_qmp>;
> > +
> > +        qcom,smem-states =3D <&wpss_smp2p_out 0>;
> > +        qcom,smem-state-names =3D "stop";
> > +
> > +        resets =3D <&aoss_reset AOSS_CC_WCSS_RESTART>,
> > +                 <&pdc_reset PDC_WPSS_SYNC_RESET>;
> > +        reset-names =3D "restart", "pdc_sync";
> > +
> > +        qcom,halt-regs =3D <&tcsr_mutex 0x37000>;
> > +
> > +        status =3D "disabled";
> > +
> > +        glink-edge {
> > +            interrupts-extended =3D <&ipcc IPCC_CLIENT_WPSS
> > +                                         =
IPCC_MPROC_SIGNAL_GLINK_QMP
> > +                                         IRQ_TYPE_EDGE_RISING>;
> > +            mboxes =3D <&ipcc IPCC_CLIENT_WPSS
> > +                            IPCC_MPROC_SIGNAL_GLINK_QMP>;
> > +
> > +            label =3D "wpss";
> > +            qcom,remote-pid =3D <13>;
> > +        };
> > +    };
> > --
> > 2.7.4
> >

