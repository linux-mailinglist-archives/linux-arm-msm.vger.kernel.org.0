Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95082BFBBA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2019 01:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbfIZXQ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 19:16:56 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40852 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728441AbfIZXQz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 19:16:55 -0400
Received: by mail-wr1-f67.google.com with SMTP id l3so588430wru.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 16:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EjCi2EVKEO9MNaLzSFEPFOS+gH77W2l8Y4dxTk44W7g=;
        b=HsC6hIg2jBQDPOwnYUdM++he3ysu/qvXKFyuQ6nYtzHS9bkuw5037MDlbXSpSMcczo
         yQG0/JsOJUrwCxjqMuvc505Z29diKoJ45ReBJIZsL7e7Y6fmPZ4wWelBuPIibEXoHE6A
         haEOPWBjloRXJ7WactVoXb/LahjqH7wQvv3uk8aVM5/vd3AMl09wFIHwxjTv8LQfcI4K
         D+HRIIvSICJrNV+6un8jNUjMx55HmiDIAPPHhkik3lVMhHFlw321OzmnfHTxY3uVNTyF
         LiVhZzSX+y539lY4A3b9t6CDyr3h6Ktkgsm6/M9EHNP8itmcl3Hfq6qKehRzJKhTrtso
         daXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EjCi2EVKEO9MNaLzSFEPFOS+gH77W2l8Y4dxTk44W7g=;
        b=suPvg4q1fw9S1d0rRK1/glKmYZp1o4CMnVEsAfWYoI3h8sAbNjzgoVQHEzT5mwlHpT
         cW1x/rFiadvzt/ti8xcu4XVVJFKh6d2AvT5nIGqltvmqaXwnaSp+VaVGn/lnhT+L15t/
         sQm7G+H++K/dX+lugHG49RAb1XR/qRjePNGeQGW6YryIMFnmZIVPflUJQe4dIHyy+g0c
         cPhnpJ5XVke08blOuIPk02rsCvgCdkNWwYXEvcg7Zn1pA+QyOBa5MTj5L5mCV62Nm0by
         xiNqRq+Z9yLoe/Wy3Sm+W7pCRjr8wk50ustLQrNtLmnlfzbJECD1CdEoeDOxvA4G6axx
         MGnA==
X-Gm-Message-State: APjAAAVGeSPKwf50jhK/nKAPPr6+uY4PD2s2i6wcPDGIMmnYk1ahoXcZ
        qSI5357st1/zMR0YPqccCyjiMg==
X-Google-Smtp-Source: APXvYqzdx4pJgp/+Ml1Bkt9bsB1vDr2MP1XIHb71Z8dzF4eRLaWIkEDtTHvJAqj8sJ2bf2HNCfqMiA==
X-Received: by 2002:a5d:6049:: with SMTP id j9mr615213wrt.213.1569539812909;
        Thu, 26 Sep 2019 16:16:52 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id c10sm582111wrf.58.2019.09.26.16.16.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 16:16:52 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] dt-bindings: interconnect: Add OSM L3 DT bindings
To:     Sibi Sankar <sibis@codeaurora.org>, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mark.rutland@arm.com,
        evgreen@chromium.org, daidavid1@codeaurora.org,
        saravanak@google.com
References: <20190821091132.14994-1-sibis@codeaurora.org>
 <20190821091132.14994-2-sibis@codeaurora.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <53e76100-b7c9-1069-b571-b17271fe41c5@linaro.org>
Date:   Thu, 26 Sep 2019 16:16:47 -0700
MIME-Version: 1.0
In-Reply-To: <20190821091132.14994-2-sibis@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

On 8/21/19 02:11, Sibi Sankar wrote:
> Add bindings for Operating State Manager (OSM) L3 interconnect provider
> on SDM845 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  .../bindings/interconnect/qcom,osm-l3.yaml    | 56 +++++++++++++++++++
>  .../dt-bindings/interconnect/qcom,osm-l3.h    | 12 ++++
>  2 files changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
>  create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> new file mode 100644
> index 0000000000000..dab2b6875ab27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,osm-l3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Operating State Manager (OSM) L3 Interconnect Provider
> +
> +maintainers:
> +  - Sibi Sankar <sibis@codeaurora.org>
> +
> +description:
> +  L3 cache bandwidth requirements on Qualcomm SoCs is serviced by the OSM.
> +  The OSM L3 interconnect provider aggregates the L3 bandwidth requests
> +  from CPU/GPU and relays it to the OSM.
> +
> +properties:
> +  compatible:
> +    const: "qcom,sdm845-osm-l3"
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: xo clock
> +      - description: alternate clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: alternate
> +
> +  '#interconnect-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#interconnect-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    osm_l3: interconnect@17d41000 {
> +      compatible = "qcom,sdm845-osm-l3";
> +      reg = <0x17d41000 0x1400>;
> +
> +      clocks = <&rpmhcc 0>, <&gcc 165>;
> +      clock-names = "xo", "alternate";
> +
> +      #interconnect-cells = <1>;
> +    };

Are we going to do the bandwidth scaling from some cpufreq driver? Under which
DT node will we put the "interconnects" property?

Thanks,
Georgi

> diff --git a/include/dt-bindings/interconnect/qcom,osm-l3.h b/include/dt-bindings/interconnect/qcom,osm-l3.h
> new file mode 100644
> index 0000000000000..54858ff7674d7
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/qcom,osm-l3.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2019 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
> +#define __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
> +
> +#define MASTER_OSM_L3_APPS	0
> +#define SLAVE_OSM_L3		1
> +
> +#endif
> 
