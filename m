Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9CE2132AC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 17:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgAGQL0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 11:11:26 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:36742 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727974AbgAGQL0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 11:11:26 -0500
Received: by mail-qv1-f66.google.com with SMTP id m14so81627qvl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 08:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9iHDp/IoA33Qqf8hH53ThtaevJGMMIDFJpqoSccVc7w=;
        b=AZhfGDDhg9Bq+QVHH0R62kUactCgUteglH/sdtUQOcxkW8+STcoFoBNzDQzE65DxBN
         THXbyOShAAqP7yUsEdKyuFkAiklsRtZugoS8MGqgUp4v8OvdgAC3LqqftVJEgXc8yHlU
         Pm16qLIWp59y6acwbOQsTPh9v28/W9h9gAFEuo/8Gl06MFkEpB3v6+6XTdZ7cHNWycBJ
         9OpDJuZJ8Yerqw7VqBYCoWq25/BgBT2SwAsd3Hegc4MYF4Ad6wjxkmBnkxXp1v/gy+Io
         zKEWrlaoZiFysVfvCjoApFkpy4FVyASdDJTuj55yvMyPCH8ISk5t2RlKEf2GhMPkw6cP
         8ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9iHDp/IoA33Qqf8hH53ThtaevJGMMIDFJpqoSccVc7w=;
        b=WB2reTPY6ByPCFd10EjSxhNzloyOM9Pfs5hw/fCBmZOu2z9I+FSUyKm4MRgbWTH3EZ
         JI6gyhM3IyhaZD8Af5qZYykh83HpcvIGmplDbUumPtBS07FSA06SMNq/45bvbQB7GpUX
         hsu48+KndUPc4ODt9NCVor0Cc/HxKcyRis0jWipyIAZl75YrfbNEP+BMenFQvU7x3wdH
         PqD1BhrrLZy6BOLpniB9mVkNILQy3mTaO+YMzZHLswiurysj5Ld113JptsCUbibM0gT6
         7yymMgmoNvlPLvLZrg/lAcDsuKXK1G+X44n9BzL7n9ge6jCOoOBtZbfLQ4igF0Q4E78/
         hxLg==
X-Gm-Message-State: APjAAAVA0Pd47giwx1PHX4Ceaf6uybmqGuEMh8igIlcnMDJ8MkHCdux6
        jBzU2UyYqlD7+EdYu8/WuQIh4f8Mr8sQHpZOw1ehMw==
X-Google-Smtp-Source: APXvYqzupYXLHoy5ObehA5nPD8wjHKBrBebIUvmCcGRCNVlFm7XHhliBOiD4tTaqiJc71WVi0w8pBmdNabr7It4rHQ0=
X-Received: by 2002:a05:6214:965:: with SMTP id do5mr143933qvb.202.1578413484847;
 Tue, 07 Jan 2020 08:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20191230164138.28137-1-mike.leach@linaro.org> <20200103222359.GA7211@bogus>
In-Reply-To: <20200103222359.GA7211@bogus>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Tue, 7 Jan 2020 16:11:14 +0000
Message-ID: <CAJ9a7ViLioi64oARqM2-kR=0hq4xSvBvaZCAefm9YkuXUiXSeA@mail.gmail.com>
Subject: Re: [PATCH v7 05/15] dt-bindings: arm: Adds CoreSight CTI hardware definitions.
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org,
        Coresight ML <coresight@lists.linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Suzuki K. Poulose" <suzuki.poulose@arm.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thanks for the feedback.

On Fri, 3 Jan 2020 at 22:24, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Dec 30, 2019 at 04:41:37PM +0000, Mike Leach wrote:
> > Adds new coresight-cti.yaml file describing the bindings required to define
> > CTI in the device trees.
> >
> > Adds an include file to dt-bindings/arm to define constants describing
> > common signal functionality used in CoreSight and generic usage.
>
> What's going on with the message threading in this series?
>

Not entirely sure what is expected here.

> >
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > ---
> >  .../bindings/arm/coresight-cti.yaml           | 326 ++++++++++++++++++
> >  .../devicetree/bindings/arm/coresight.txt     |   7 +
> >  MAINTAINERS                                   |   2 +
> >  include/dt-bindings/arm/coresight-cti-dt.h    |  37 ++
> >  4 files changed, 372 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
> >  create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h
> >
> > diff --git a/Documentation/devicetree/bindings/arm/coresight-cti.yaml b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
> > new file mode 100644
> > index 000000000000..e4d28cee5dfd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
> > @@ -0,0 +1,326 @@
> > +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> > +# Copyright 2019 Linaro Ltd.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/arm/coresight-cti.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: ARM Coresight Cross Trigger Interface (CTI) device.
> > +
> > +description: |
> > +  The CoreSight Embedded Cross Trigger (ECT) consists of CTI devices connected
> > +  to one or more CoreSight components and/or a CPU, with CTIs interconnected in
> > +  a star topology via the Cross Trigger Matrix (CTM), which is not programmable.
> > +  The ECT components are not part of the trace generation data path and are thus
> > +  not part of the CoreSight graph described in the general CoreSight bindings
> > +  file coresight.txt.
> > +
> > +  The CTI component properties define the connections between the individual
> > +  CTI and the components it is directly connected to, consisting of input and
> > +  output hardware trigger signals. CTIs can have a maximum number of input and
> > +  output hardware trigger signals (8 each for v1 CTI, 32 each for v2 CTI). The
> > +  number is defined at design time, the maximum of each defined in the DEVID
> > +  register.
> > +
> > +  CTIs are interconnected in a star topology via the CTM, using a number of
> > +  programmable channels, usually 4, but again implementation defined and
> > +  described in the DEVID register. The star topology is not required to be
> > +  described in the bindings as the actual connections are software
> > +  programmable.
> > +
> > +  In general the connections between CTI and components via the trigger signals
> > +  are implementation defined, except when the CTI is connected to an ARM v8
> > +  architecture core and optional ETM.
> > +
> > +  In this case the ARM v8 architecture defines the required signal connections
> > +  between CTI and the CPU core and ETM if present. In the case of a v8
> > +  architecturally connected CTI an additional compatible string is used to
> > +  indicate this feature (arm,coresight-cti-v8-arch).
> > +
> > +  When CTI trigger connection information is unavailable then a minimal driver
> > +  binding can be declared with no explicit trigger signals. This will result
> > +  the driver detecting the maximum available triggers and channels from the
> > +  DEVID register and make them all available for use as a single default
> > +  connection. Any user / client application will require additional information
> > +  on the connections between the CTI and other components for correct operation.
> > +  This information might be found by enabling the Integration Test registers in
> > +  the driver (set CONFIG_CORESIGHT_CTI_INTEGRATION_TEST in Kernel
> > +  configuration). These registers may be used to explore the trigger connections
> > +  between CTI and other CoreSight components.
> > +
> > +  Certain triggers between CoreSight devices and the CTI have specific types
> > +  and usages. These can be defined along with the signal indexes with the
> > +  constants defined in <dt-bindings/arm/coresight-cti-dt.h>
> > +
> > +  For example a CTI connected to a core will usually have a DBGREQ signal. This
> > +  is defined in the binding as type PE_EDBGREQ. These types will appear in an
> > +  optional array alongside the signal indexes. Omitting types will default all
> > +  signals to GEN_IO.
> > +
> > +  Note that some hardware trigger signals can be connected to non-CoreSight
> > +  components (e.g. UART etc) depending on hardware implementation.
> > +
> > +maintainers:
> > +  - Mike Leach <mike.leach@linaro.org>
> > +
> > +allOf:
> > +  - $ref: /schemas/arm/primecell.yaml#
> > +
> > +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        enum:
> > +          - arm,coresight-cti
> > +  required:
> > +    - compatible
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^cti(@[0-9a-f]+)$"
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +        - const: arm,coresight-cti
> > +        - const: arm,primecell
> > +      - items:
> > +        - const: arm,coresight-cti-v8-arch
> > +        - const: arm,coresight-cti
> > +        - const: arm,primecell
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  cpu:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Handle to cpu this device is associated with. This must appear in the
> > +      base cti node if compatible string arm,coresight-cti-v8-arch is used,
> > +      or may appear in a trig-conns child node when appropriate.
> > +
> > +  arm,cti-ctm-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Defines the CTM this CTI is connected to, in large systems with multiple
> > +      separate CTI/CTM nets. Typically multi-socket systems where the CTM is
> > +      propagated between sockets.
> > +
> > +  arm,cs-dev-assoc:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      defines a phandle reference to an associated CoreSight trace device.
> > +      When the associated trace device is enabled, then the respective CTI
> > +      will be enabled. Use in a trig-conns node, or in CTI base node when
> > +      compatible string arm,coresight-cti-v8-arch used. If the associated
> > +      device has not been registered then the node name will be stored as
> > +      the connection name for later resolution. If the associated device is
> > +      not a CoreSight device or not registered then the node name will remain
> > +      the connection name and automatic enabling will not occur.
> > +
> > +patternProperties:
> > +  '^trig-conns@([0-9]+)$':
> > +    type: object
> > +    description:
> > +      A trigger connections child node which describes the trigger signals
> > +      between this CTI and another hardware device. This device may be a CPU,
> > +      CoreSight device, any other hardware device or simple external IO lines.
> > +      The connection may have both input and output triggers, or only one or the
> > +      other.
> > +
> > +    properties:
> > +
> > +      arm,trig-in-sigs:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of CTI trigger in signal numbers in use by a trig-conns node.
> > +
> > +      arm,trig-in-types:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of constants representing the types for the CTI trigger in
> > +          signals. Types in this array match to the corresponding signal in the
> > +          arm,trig-in-sigs array. If the -types array is smaller, or omitted
> > +          completely, then the types will default to GEN_IO.
> > +
> > +      arm,trig-out-sigs:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of CTI trigger out signal numbers in use by a trig-conns node.
> > +
> > +      arm,trig-out-types:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of constants representing the types for the CTI trigger out
> > +          signals. Types in this array match to the corresponding signal
> > +          in the arm,trig-out-sigs array. If the "-types" array is smaller,
> > +          or omitted completely, then the types will default to GEN_IO.
> > +
> > +      arm,trig-filters:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> > +        description:
> > +          List of CTI trigger out signals that will be blocked from becoming
> > +          active, unless filtering is disabled on the driver.
> > +
> > +      arm,trig-conn-name:
> > +        allOf:
> > +          - $ref: /schemas/types.yaml#/definitions/string
> > +        description:
> > +          Defines a connection name that will be displayed, if the cpu or
> > +          arm,cs-dev-assoc properties are not being used in this connection.
> > +          Principle use for CTI that are connected to non-CoreSight devices, or
> > +          external IO.
> > +
> > +    anyOf:
> > +      - required:
> > +        - arm,trig-in-sigs
> > +      - required:
> > +        - arm,trig-out-sigs
> > +    oneOf:
> > +      - required:
> > +        - arm,trig-conn-name
> > +      - required:
> > +        - cpu
> > +      - required:
> > +        - arm,cs-dev-assoc
> > +    required:
> > +      - reg
>
> You need 'reg' defined as a property too along with any constraints.
>

OK - will do.

> You also need #size-cells and #address-cells in the parent. And are they
> required?
>

Size cells/ address cells can be defined and limited to appropriate values.

However they are only required if the binding defines optional child
nodes per the patternProperties:  '^trig-conns@([0-9]+)$': pattern.
I have not been able to find a form a .yaml that can encode this requirement.
if ( element matches "trig-conns")
then required (#size-cells, #address-cells.)

What I do find is that if a trig-conns element has been defined, then
the binding will not compile correctly without #size-cells and
#address-cells.


Regards

Mike




> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: arm,coresight-cti-v8-arch
> > +
> > +then:
> > +  required:
> > +    - cpu
> > +
> > +examples:
> > +  # minimum CTI definition. DEVID register used to set number of triggers.
> > +  - |
> > +    cti@20020000 {
> > +      compatible = "arm,coresight-cti", "arm,primecell";
> > +      reg = <0x20020000 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +    };
> > +  #  v8 architecturally defined CTI - CPU + ETM connections generated by the
> > +  #  driver according to the v8 architecture specification.
> > +  - |
> > +    cti@859000 {
> > +      compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> > +                   "arm,primecell";
> > +      reg = <0x859000 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +
> > +      cpu = <&CPU1>;
> > +      arm,cs-dev-assoc = <&etm1>;
> > +    };
> > +  # Implementation defined CTI - CPU + ETM connections explicitly defined..
> > +  # Shows use of type constants from dt-bindings/arm/coresight-cti-dt.h
> > +  - |
> > +    #include <dt-bindings/arm/coresight-cti-dt.h>
> > +
> > +    cti@858000 {
> > +      compatible = "arm,coresight-cti", "arm,primecell";
> > +      reg = <0x858000 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +
> > +      arm,cti-ctm-id = <1>;
> > +
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      trig-conns@0 {
> > +            reg = <0>;
> > +            arm,trig-in-sigs = <4 5 6 7>;
> > +            arm,trig-in-types = <ETM_EXTOUT
> > +                                 ETM_EXTOUT
> > +                                 ETM_EXTOUT
> > +                                 ETM_EXTOUT>;
> > +            arm,trig-out-sigs = <4 5 6 7>;
> > +            arm,trig-out-types = <ETM_EXTIN
> > +                                  ETM_EXTIN
> > +                                  ETM_EXTIN
> > +                                  ETM_EXTIN>;
> > +            arm,cs-dev-assoc = <&etm0>;
> > +      };
> > +
> > +      trig-conns@1 {
> > +            reg = <1>;
> > +            cpu = <&CPU0>;
> > +            arm,trig-in-sigs = <0 1>;
> > +            arm,trig-in-types = <PE_DBGTRIGGER
> > +                                 PE_PMUIRQ>;
> > +            arm,trig-out-sigs=<0 1 2 >;
> > +            arm,trig-out-types = <PE_EDBGREQ
> > +                                  PE_DBGRESTART
> > +                                  PE_CTIIRQ>;
> > +
> > +            arm,trig-filters = <0>;
> > +      };
> > +    };
> > +  # Implementation defined CTI - non CoreSight component connections.
> > +  - |
> > +    cti@20110000 {
> > +      compatible = "arm,coresight-cti", "arm,primecell";
> > +      reg = <0 0x20110000 0 0x1000>;
> > +
> > +      clocks = <&soc_smc50mhz>;
> > +      clock-names = "apb_pclk";
> > +
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      trig-conns@0 {
> > +        reg = <0>;
> > +        arm,trig-in-sigs=<0>;
> > +        arm,trig-in-types=<GEN_INTREQ>;
> > +        arm,trig-out-sigs=<0>;
> > +        arm,trig-out-types=<GEN_HALTREQ>;
> > +        arm,trig-conn-name = "sys_profiler";
> > +      };
> > +
> > +      trig-conns@1 {
> > +        reg = <1>;
> > +        arm,trig-out-sigs=<2 3>;
> > +        arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> > +        arm,trig-conn-name = "watchdog";
> > +      };
> > +
> > +      trig-conns@2 {
> > +        reg = <2>;
> > +        arm,trig-in-sigs=<1 6>;
> > +        arm,trig-in-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> > +        arm,trig-conn-name = "g_counter";
> > +      };
> > +    };
> > +
> > +...
> > diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> > index d02c42d21f2f..846f6daae71b 100644
> > --- a/Documentation/devicetree/bindings/arm/coresight.txt
> > +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> > @@ -45,6 +45,10 @@ its hardware characteristcs.
> >               - Coresight Address Translation Unit (CATU)
> >                       "arm,coresight-catu", "arm,primecell";
> >
> > +             - Coresight Cross Trigger Interface (CTI):
> > +                     "arm,coresight-cti", "arm,primecell";
> > +                     See coresight-cti.yaml for full CTI definitions.
> > +
> >       * reg: physical base address and length of the register
> >         set(s) of the component.
> >
> > @@ -72,6 +76,9 @@ its hardware characteristcs.
> >       * reg-names: the only acceptable values are "stm-base" and
> >         "stm-stimulus-base", each corresponding to the areas defined in "reg".
> >
> > +* Required properties for Coresight Cross Trigger Interface (CTI)
> > +     See coresight-cti.yaml for full CTI definitions.
> > +
> >  * Required properties for devices that don't show up on the AMBA bus, such as
> >    non-configurable replicators and non-configurable funnels:
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index bd5847e802de..77f5d28fa84b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1645,9 +1645,11 @@ R:     Suzuki K Poulose <suzuki.poulose@arm.com>
> >  L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:   Maintained
> >  F:   drivers/hwtracing/coresight/*
> > +F:   include/dt-bindings/arm/coresight-cti-dt.h
> >  F:   Documentation/trace/coresight/*
> >  F:   Documentation/devicetree/bindings/arm/coresight.txt
> >  F:   Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> > +F:   Documentation/devicetree/bindings/arm/coresight-cti.yaml
> >  F:   Documentation/ABI/testing/sysfs-bus-coresight-devices-*
> >  F:   tools/perf/arch/arm/util/pmu.c
> >  F:   tools/perf/arch/arm/util/auxtrace.c
> > diff --git a/include/dt-bindings/arm/coresight-cti-dt.h b/include/dt-bindings/arm/coresight-cti-dt.h
> > new file mode 100644
> > index 000000000000..61e7bdf8ea6e
> > --- /dev/null
> > +++ b/include/dt-bindings/arm/coresight-cti-dt.h
> > @@ -0,0 +1,37 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * This header provides constants for the defined trigger signal
> > + * types on CoreSight CTI.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H
> > +#define _DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H
> > +
> > +#define GEN_IO               0
> > +#define GEN_INTREQ   1
> > +#define GEN_INTACK   2
> > +#define GEN_HALTREQ  3
> > +#define GEN_RESTARTREQ       4
> > +#define PE_EDBGREQ   5
> > +#define PE_DBGRESTART        6
> > +#define PE_CTIIRQ    7
> > +#define PE_PMUIRQ    8
> > +#define PE_DBGTRIGGER        9
> > +#define ETM_EXTOUT   10
> > +#define ETM_EXTIN    11
> > +#define SNK_FULL     12
> > +#define SNK_ACQCOMP  13
> > +#define SNK_FLUSHCOMP        14
> > +#define SNK_FLUSHIN  15
> > +#define SNK_TRIGIN   16
> > +#define STM_ASYNCOUT 17
> > +#define STM_TOUT_SPTE        18
> > +#define STM_TOUT_SW  19
> > +#define STM_TOUT_HETE        20
> > +#define STM_HWEVENT  21
> > +#define ELA_TSTART   22
> > +#define ELA_TSTOP    23
> > +#define ELA_DBGREQ   24
> > +#define CTI_TRIG_MAX 25
> > +
> > +#endif /*_DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H */
> > --
> > 2.17.1
> >



--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
