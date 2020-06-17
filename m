Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49F201FD0B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 17:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgFQPSr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 11:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbgFQPSr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 11:18:47 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF31DC06174E
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 08:18:46 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id c3so2726145wru.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ONScAretSBCH7wAr+8ANmv5HsgfH9nA7aZy8T5VKxWg=;
        b=hSfdEG1eeLaNlXQww1U4Fy8i1vvi4w8ZtfN2wm2DaucDaEsiE90lK9nXIlh4mkXuy6
         fnh+htuCSaiG/t03q7KMFKmpsI63GidJcfXteDKWOxYIPZ2tkG0OdqoYaDXoTYI5Oq7v
         C67bYNlAlgxfeXKrbCVjvtTEA3d6GWtGwKjjDgqe2+HAEgcfmQ3jXYCdwq+KrxC3PcBu
         cPvmAtbtj++WEy3F/8UB7IHQXqmV3rAXRd+PiJc5ofFNoFVYplKoxldSJ4eaq3oBP5ka
         AZCyqfk0i6VYRNge9RURTbeobE9NqIkrwc9XPvd+3bCusVtIMyxOzdUP/vq4FgBo4qum
         Ntbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ONScAretSBCH7wAr+8ANmv5HsgfH9nA7aZy8T5VKxWg=;
        b=XpAqsY698TZF2PPgwz6ev97+xOR11y1CIqRtzsAMsYmgeeOrTYAVF7pXHnf61MVOMx
         7lVWqfyTOSYcZav5sj+2tr4WyLAcLpBW7mxZgFVcyhcje+b6efp4Boa+uRwnzVpTLOq7
         Km8F4AOuNQ2SFP2a5LF4X6K65emvn+BYFkylPrfkC+F+0HFwPH+ON9P5yaoLfCtVlnpy
         q7FJKLONuQHoPCwnxuB2qpewubvRZtnEsfS5olkCN1a+a7nTDwYrthhr+Jy3sllfXdGJ
         gupbHZHs2H+0Bm+YL+e5k3vhiTQOF9KiGCkj7KltCPYncSHAbZeIT3qSMFyFwdS15yC7
         sU7w==
X-Gm-Message-State: AOAM530ws66CxZxB+Wyvrz0JmXyOF6tzu7WIceXHU3TYM7lrFcsCc5/1
        w1Pq8vN+g3koreXCk7koDbTlSA==
X-Google-Smtp-Source: ABdhPJxWd4oOb2dfVwKqckj6ab2Z8u6X+WmHzU1ARFhF7bdzQdJ3r+sF4A7z2Cr3jfCcn6zZgRv1Xw==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr8695376wrq.140.1592407125441;
        Wed, 17 Jun 2020 08:18:45 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id j4sm116215wma.7.2020.06.17.08.18.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jun 2020 08:18:44 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] dt-bindings: nvmem: qfprom: Convert to yaml
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     dhavalp@codeaurora.org, mturney@codeaurora.org,
        rnayak@codeaurora.org, Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.1.Iea2704ec2cb40c00eca47781c310a6330ac5dd41@changeid>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ed6d22a1-0d38-9874-d5cc-efe39f360baa@linaro.org>
Date:   Wed, 17 Jun 2020 16:18:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200617074930.v3.1.Iea2704ec2cb40c00eca47781c310a6330ac5dd41@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17/06/2020 15:51, Douglas Anderson wrote:
> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
> 
> This switches the bindings over from txt to yaml.
> 
> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v3:
> - Split conversion to yaml into separate patch new in v3.
> - Use 'const' for compatible instead of a 1-entry enum.
> - Changed filename to match compatible string.
> - Add #address-cells and #size-cells to list of properties.
> - Fixed up example.
> 
>   .../bindings/nvmem/qcom,qfprom.yaml           | 45 +++++++++++++++++++
>   .../devicetree/bindings/nvmem/qfprom.txt      | 35 ---------------
>   2 files changed, 45 insertions(+), 35 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>   delete mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.txt
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> new file mode 100644
> index 000000000000..5efa5e7c4d81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc, QFPROM Efuse bindings
> +
> +maintainers:
> +  - Ravi Kumar Bokka <rbokka@codeaurora.org>
> +

Am not sure this was intentional, but the old maintainer name is totally 
lost in this patch!

Please fix this!



> +allOf:
> +  - $ref: "nvmem.yaml#"
> +
> +properties:
> +  compatible:
> +    const: qcom,qfprom
> +
> +  reg:
> +    items:
> +      - description: The corrected region.
> +
> +  # Needed if any child nodes are present.
> +  "#address-cells":
> +    const: 1
> +  "#size-cells":
> +    const: 1
> +
> +required:
> +   - compatible
> +   - reg
> +
> +examples:
> +  - |
> +    efuse@784000 {
> +      compatible = "qcom,qfprom";
> +      reg = <0 0x00784000 0 0x8ff>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      hstx-trim-primary@1eb {
> +        reg = <0x1eb 0x1>;
> +        bits = <1 4>;
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/nvmem/qfprom.txt b/Documentation/devicetree/bindings/nvmem/qfprom.txt
> deleted file mode 100644
> index 26fe878d5c86..000000000000
> --- a/Documentation/devicetree/bindings/nvmem/qfprom.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -= Qualcomm QFPROM device tree bindings =
> -
> -This binding is intended to represent QFPROM which is found in most QCOM SOCs.
> -
> -Required properties:
> -- compatible: should be "qcom,qfprom"
> -- reg: Should contain registers location and length
> -
> -= Data cells =
> -Are child nodes of qfprom, bindings of which as described in
> -bindings/nvmem/nvmem.txt
> -
> -Example:
> -
> -	qfprom: qfprom@700000 {
> -		compatible 	= "qcom,qfprom";
> -		reg		= <0x00700000 0x8000>;
> -		...
> -		/* Data cells */
> -		tsens_calibration: calib@404 {
> -			reg = <0x4404 0x10>;
> -		};
> -	};
> -
> -
> -= Data consumers =
> -Are device nodes which consume nvmem data cells.
> -
> -For example:
> -
> -	tsens {
> -		...
> -		nvmem-cells = <&tsens_calibration>;
> -		nvmem-cell-names = "calibration";
> -	};
> 
