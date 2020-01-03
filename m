Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A78C312FEB2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 23:24:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728730AbgACWYC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 17:24:02 -0500
Received: from mail-il1-f193.google.com ([209.85.166.193]:40507 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbgACWYC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 17:24:02 -0500
Received: by mail-il1-f193.google.com with SMTP id c4so37859711ilo.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jan 2020 14:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kLWMYAsnHrMk4Fwr7b+kPGYE925WbE2+M256Mb7A2Ss=;
        b=VdRnMarqc/svltUepRnwVH6BDzwii+S5DOOw58tz17yuRG/pfati51qoCn5Oyr93gG
         M+pxGBknb8qQZbJmYREmShIOoCtsHgYzNMluko5FNpe0tyyyumLqSFju3qIsb/AvnYCp
         rzSnCUSMJts0k/d7ouhChvpiqQ09VuNOTJ4zdfnfNYljVcCWY5jj5HFQaIly/H+ZReDa
         v3fuzGCbfeAxek3JMJxEmv+1216304GbBWhtkLVzfRZm+Ri3rKN1tpims41A2KJFWWyV
         wKzyto0084lkEP5wOIuvZA3aMzXGUxT32KasZAhOtteXzcsVNqDXjSJbrKkoOsJcxCRA
         UpHA==
X-Gm-Message-State: APjAAAX9ClAxu4l/6NyCoQqheviMLbP+cuEF1Xder7u0sKQwVR0wtdKb
        RcdmCtVSs5DImJDFbR27d1RRpso=
X-Google-Smtp-Source: APXvYqzCRfBt/Tj6lysHinzWTylMqiHPne50mZ45wNm6yagU4OkPa7b1u6mYg25SSCzoc3TU7mjoeA==
X-Received: by 2002:a92:485a:: with SMTP id v87mr74939312ila.128.1578090241281;
        Fri, 03 Jan 2020 14:24:01 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id a18sm21178381ilf.43.2020.01.03.14.24.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 14:24:00 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a5
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Fri, 03 Jan 2020 15:23:59 -0700
Date:   Fri, 3 Jan 2020 15:23:59 -0700
From:   Rob Herring <robh@kernel.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-arm-msm@vger.kernel.org,
        mathieu.poirier@linaro.org, suzuki.poulose@arm.com,
        maxime@cerno.tech, liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org
Subject: Re: [PATCH v7 05/15] dt-bindings: arm: Adds CoreSight CTI hardware
 definitions.
Message-ID: <20200103222359.GA7211@bogus>
References: <20191230164138.28137-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191230164138.28137-1-mike.leach@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 30, 2019 at 04:41:37PM +0000, Mike Leach wrote:
> Adds new coresight-cti.yaml file describing the bindings required to define
> CTI in the device trees.
> 
> Adds an include file to dt-bindings/arm to define constants describing
> common signal functionality used in CoreSight and generic usage.

What's going on with the message threading in this series?

> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  .../bindings/arm/coresight-cti.yaml           | 326 ++++++++++++++++++
>  .../devicetree/bindings/arm/coresight.txt     |   7 +
>  MAINTAINERS                                   |   2 +
>  include/dt-bindings/arm/coresight-cti-dt.h    |  37 ++
>  4 files changed, 372 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight-cti.yaml
>  create mode 100644 include/dt-bindings/arm/coresight-cti-dt.h
> 
> diff --git a/Documentation/devicetree/bindings/arm/coresight-cti.yaml b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
> new file mode 100644
> index 000000000000..e4d28cee5dfd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/coresight-cti.yaml
> @@ -0,0 +1,326 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +# Copyright 2019 Linaro Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/coresight-cti.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Coresight Cross Trigger Interface (CTI) device.
> +
> +description: |
> +  The CoreSight Embedded Cross Trigger (ECT) consists of CTI devices connected
> +  to one or more CoreSight components and/or a CPU, with CTIs interconnected in
> +  a star topology via the Cross Trigger Matrix (CTM), which is not programmable.
> +  The ECT components are not part of the trace generation data path and are thus
> +  not part of the CoreSight graph described in the general CoreSight bindings
> +  file coresight.txt.
> +
> +  The CTI component properties define the connections between the individual
> +  CTI and the components it is directly connected to, consisting of input and
> +  output hardware trigger signals. CTIs can have a maximum number of input and
> +  output hardware trigger signals (8 each for v1 CTI, 32 each for v2 CTI). The
> +  number is defined at design time, the maximum of each defined in the DEVID
> +  register.
> +
> +  CTIs are interconnected in a star topology via the CTM, using a number of
> +  programmable channels, usually 4, but again implementation defined and
> +  described in the DEVID register. The star topology is not required to be
> +  described in the bindings as the actual connections are software
> +  programmable.
> +
> +  In general the connections between CTI and components via the trigger signals
> +  are implementation defined, except when the CTI is connected to an ARM v8
> +  architecture core and optional ETM.
> +
> +  In this case the ARM v8 architecture defines the required signal connections
> +  between CTI and the CPU core and ETM if present. In the case of a v8
> +  architecturally connected CTI an additional compatible string is used to
> +  indicate this feature (arm,coresight-cti-v8-arch).
> +
> +  When CTI trigger connection information is unavailable then a minimal driver
> +  binding can be declared with no explicit trigger signals. This will result
> +  the driver detecting the maximum available triggers and channels from the
> +  DEVID register and make them all available for use as a single default
> +  connection. Any user / client application will require additional information
> +  on the connections between the CTI and other components for correct operation.
> +  This information might be found by enabling the Integration Test registers in
> +  the driver (set CONFIG_CORESIGHT_CTI_INTEGRATION_TEST in Kernel
> +  configuration). These registers may be used to explore the trigger connections
> +  between CTI and other CoreSight components.
> +
> +  Certain triggers between CoreSight devices and the CTI have specific types
> +  and usages. These can be defined along with the signal indexes with the
> +  constants defined in <dt-bindings/arm/coresight-cti-dt.h>
> +
> +  For example a CTI connected to a core will usually have a DBGREQ signal. This
> +  is defined in the binding as type PE_EDBGREQ. These types will appear in an
> +  optional array alongside the signal indexes. Omitting types will default all
> +  signals to GEN_IO.
> +
> +  Note that some hardware trigger signals can be connected to non-CoreSight
> +  components (e.g. UART etc) depending on hardware implementation.
> +
> +maintainers:
> +  - Mike Leach <mike.leach@linaro.org>
> +
> +allOf:
> +  - $ref: /schemas/arm/primecell.yaml#
> +
> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - arm,coresight-cti
> +  required:
> +    - compatible
> +
> +properties:
> +  $nodename:
> +    pattern: "^cti(@[0-9a-f]+)$"
> +  compatible:
> +    oneOf:
> +      - items:
> +        - const: arm,coresight-cti
> +        - const: arm,primecell
> +      - items:
> +        - const: arm,coresight-cti-v8-arch
> +        - const: arm,coresight-cti
> +        - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  cpu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Handle to cpu this device is associated with. This must appear in the
> +      base cti node if compatible string arm,coresight-cti-v8-arch is used,
> +      or may appear in a trig-conns child node when appropriate.
> +
> +  arm,cti-ctm-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Defines the CTM this CTI is connected to, in large systems with multiple
> +      separate CTI/CTM nets. Typically multi-socket systems where the CTM is
> +      propagated between sockets.
> +
> +  arm,cs-dev-assoc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      defines a phandle reference to an associated CoreSight trace device.
> +      When the associated trace device is enabled, then the respective CTI
> +      will be enabled. Use in a trig-conns node, or in CTI base node when
> +      compatible string arm,coresight-cti-v8-arch used. If the associated
> +      device has not been registered then the node name will be stored as
> +      the connection name for later resolution. If the associated device is
> +      not a CoreSight device or not registered then the node name will remain
> +      the connection name and automatic enabling will not occur.
> +
> +patternProperties:
> +  '^trig-conns@([0-9]+)$':
> +    type: object
> +    description:
> +      A trigger connections child node which describes the trigger signals
> +      between this CTI and another hardware device. This device may be a CPU,
> +      CoreSight device, any other hardware device or simple external IO lines.
> +      The connection may have both input and output triggers, or only one or the
> +      other.
> +
> +    properties:
> +
> +      arm,trig-in-sigs:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 32
> +        description:
> +          List of CTI trigger in signal numbers in use by a trig-conns node.
> +
> +      arm,trig-in-types:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 32
> +        description:
> +          List of constants representing the types for the CTI trigger in
> +          signals. Types in this array match to the corresponding signal in the
> +          arm,trig-in-sigs array. If the -types array is smaller, or omitted
> +          completely, then the types will default to GEN_IO.
> +
> +      arm,trig-out-sigs:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 32
> +        description:
> +          List of CTI trigger out signal numbers in use by a trig-conns node.
> +
> +      arm,trig-out-types:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 32
> +        description:
> +          List of constants representing the types for the CTI trigger out
> +          signals. Types in this array match to the corresponding signal
> +          in the arm,trig-out-sigs array. If the "-types" array is smaller,
> +          or omitted completely, then the types will default to GEN_IO.
> +
> +      arm,trig-filters:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 32
> +        description:
> +          List of CTI trigger out signals that will be blocked from becoming
> +          active, unless filtering is disabled on the driver.
> +
> +      arm,trig-conn-name:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/string
> +        description:
> +          Defines a connection name that will be displayed, if the cpu or
> +          arm,cs-dev-assoc properties are not being used in this connection.
> +          Principle use for CTI that are connected to non-CoreSight devices, or
> +          external IO.
> +
> +    anyOf:
> +      - required:
> +        - arm,trig-in-sigs
> +      - required:
> +        - arm,trig-out-sigs
> +    oneOf:
> +      - required:
> +        - arm,trig-conn-name
> +      - required:
> +        - cpu
> +      - required:
> +        - arm,cs-dev-assoc
> +    required:
> +      - reg

You need 'reg' defined as a property too along with any constraints.

You also need #size-cells and #address-cells in the parent. And are they 
required?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: arm,coresight-cti-v8-arch
> +
> +then:
> +  required:
> +    - cpu
> +
> +examples:
> +  # minimum CTI definition. DEVID register used to set number of triggers.
> +  - |
> +    cti@20020000 {
> +      compatible = "arm,coresight-cti", "arm,primecell";
> +      reg = <0x20020000 0x1000>;
> +
> +      clocks = <&soc_smc50mhz>;
> +      clock-names = "apb_pclk";
> +    };
> +  #  v8 architecturally defined CTI - CPU + ETM connections generated by the
> +  #  driver according to the v8 architecture specification.
> +  - |
> +    cti@859000 {
> +      compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +                   "arm,primecell";
> +      reg = <0x859000 0x1000>;
> +
> +      clocks = <&soc_smc50mhz>;
> +      clock-names = "apb_pclk";
> +
> +      cpu = <&CPU1>;
> +      arm,cs-dev-assoc = <&etm1>;
> +    };
> +  # Implementation defined CTI - CPU + ETM connections explicitly defined..
> +  # Shows use of type constants from dt-bindings/arm/coresight-cti-dt.h
> +  - |
> +    #include <dt-bindings/arm/coresight-cti-dt.h>
> +
> +    cti@858000 {
> +      compatible = "arm,coresight-cti", "arm,primecell";
> +      reg = <0x858000 0x1000>;
> +
> +      clocks = <&soc_smc50mhz>;
> +      clock-names = "apb_pclk";
> +
> +      arm,cti-ctm-id = <1>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      trig-conns@0 {
> +            reg = <0>;
> +            arm,trig-in-sigs = <4 5 6 7>;
> +            arm,trig-in-types = <ETM_EXTOUT
> +                                 ETM_EXTOUT
> +                                 ETM_EXTOUT
> +                                 ETM_EXTOUT>;
> +            arm,trig-out-sigs = <4 5 6 7>;
> +            arm,trig-out-types = <ETM_EXTIN
> +                                  ETM_EXTIN
> +                                  ETM_EXTIN
> +                                  ETM_EXTIN>;
> +            arm,cs-dev-assoc = <&etm0>;
> +      };
> +
> +      trig-conns@1 {
> +            reg = <1>;
> +            cpu = <&CPU0>;
> +            arm,trig-in-sigs = <0 1>;
> +            arm,trig-in-types = <PE_DBGTRIGGER
> +                                 PE_PMUIRQ>;
> +            arm,trig-out-sigs=<0 1 2 >;
> +            arm,trig-out-types = <PE_EDBGREQ
> +                                  PE_DBGRESTART
> +                                  PE_CTIIRQ>;
> +
> +            arm,trig-filters = <0>;
> +      };
> +    };
> +  # Implementation defined CTI - non CoreSight component connections.
> +  - |
> +    cti@20110000 {
> +      compatible = "arm,coresight-cti", "arm,primecell";
> +      reg = <0 0x20110000 0 0x1000>;
> +
> +      clocks = <&soc_smc50mhz>;
> +      clock-names = "apb_pclk";
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      trig-conns@0 {
> +        reg = <0>;
> +        arm,trig-in-sigs=<0>;
> +        arm,trig-in-types=<GEN_INTREQ>;
> +        arm,trig-out-sigs=<0>;
> +        arm,trig-out-types=<GEN_HALTREQ>;
> +        arm,trig-conn-name = "sys_profiler";
> +      };
> +
> +      trig-conns@1 {
> +        reg = <1>;
> +        arm,trig-out-sigs=<2 3>;
> +        arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +        arm,trig-conn-name = "watchdog";
> +      };
> +
> +      trig-conns@2 {
> +        reg = <2>;
> +        arm,trig-in-sigs=<1 6>;
> +        arm,trig-in-types=<GEN_HALTREQ GEN_RESTARTREQ>;
> +        arm,trig-conn-name = "g_counter";
> +      };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index d02c42d21f2f..846f6daae71b 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -45,6 +45,10 @@ its hardware characteristcs.
>  		- Coresight Address Translation Unit (CATU)
>  			"arm,coresight-catu", "arm,primecell";
>  
> +		- Coresight Cross Trigger Interface (CTI):
> +			"arm,coresight-cti", "arm,primecell";
> +			See coresight-cti.yaml for full CTI definitions.
> +
>  	* reg: physical base address and length of the register
>  	  set(s) of the component.
>  
> @@ -72,6 +76,9 @@ its hardware characteristcs.
>  	* reg-names: the only acceptable values are "stm-base" and
>  	  "stm-stimulus-base", each corresponding to the areas defined in "reg".
>  
> +* Required properties for Coresight Cross Trigger Interface (CTI)
> +	See coresight-cti.yaml for full CTI definitions.
> +
>  * Required properties for devices that don't show up on the AMBA bus, such as
>    non-configurable replicators and non-configurable funnels:
>  
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd5847e802de..77f5d28fa84b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1645,9 +1645,11 @@ R:	Suzuki K Poulose <suzuki.poulose@arm.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	drivers/hwtracing/coresight/*
> +F:	include/dt-bindings/arm/coresight-cti-dt.h
>  F:	Documentation/trace/coresight/*
>  F:	Documentation/devicetree/bindings/arm/coresight.txt
>  F:	Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
> +F:	Documentation/devicetree/bindings/arm/coresight-cti.yaml
>  F:	Documentation/ABI/testing/sysfs-bus-coresight-devices-*
>  F:	tools/perf/arch/arm/util/pmu.c
>  F:	tools/perf/arch/arm/util/auxtrace.c
> diff --git a/include/dt-bindings/arm/coresight-cti-dt.h b/include/dt-bindings/arm/coresight-cti-dt.h
> new file mode 100644
> index 000000000000..61e7bdf8ea6e
> --- /dev/null
> +++ b/include/dt-bindings/arm/coresight-cti-dt.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * This header provides constants for the defined trigger signal
> + * types on CoreSight CTI.
> + */
> +
> +#ifndef _DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H
> +#define _DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H
> +
> +#define GEN_IO		0
> +#define GEN_INTREQ	1
> +#define GEN_INTACK	2
> +#define GEN_HALTREQ	3
> +#define GEN_RESTARTREQ	4
> +#define PE_EDBGREQ	5
> +#define PE_DBGRESTART	6
> +#define PE_CTIIRQ	7
> +#define PE_PMUIRQ	8
> +#define PE_DBGTRIGGER	9
> +#define ETM_EXTOUT	10
> +#define ETM_EXTIN	11
> +#define SNK_FULL	12
> +#define SNK_ACQCOMP	13
> +#define SNK_FLUSHCOMP	14
> +#define SNK_FLUSHIN	15
> +#define SNK_TRIGIN	16
> +#define STM_ASYNCOUT	17
> +#define STM_TOUT_SPTE	18
> +#define STM_TOUT_SW	19
> +#define STM_TOUT_HETE	20
> +#define STM_HWEVENT	21
> +#define ELA_TSTART	22
> +#define ELA_TSTOP	23
> +#define ELA_DBGREQ	24
> +#define CTI_TRIG_MAX	25
> +
> +#endif /*_DT_BINDINGS_ARM_CORESIGHT_CTI_DT_H */
> -- 
> 2.17.1
> 
