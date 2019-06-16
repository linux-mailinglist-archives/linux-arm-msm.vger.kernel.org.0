Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01A4547621
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2019 19:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbfFPRm4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 13:42:56 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38823 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbfFPRmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 13:42:55 -0400
Received: by mail-pf1-f196.google.com with SMTP id a186so4359358pfa.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jun 2019 10:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VO7zaCyhtYCv5/pYPEOpaqTuj9RzI+pPqxayb3u5KrQ=;
        b=E6ypAV7ah+6QPhVC+81/TmriH5kiwIW3yBefIT6/UZalvKxhpZ5qv33YYJG5Ha5pd9
         /+Bb5+4iaqzNqexvspAViIRLQ/2DjzNk17I9h9DaKbIHuN/Mb61q6wgdqPw7o0Oi23KQ
         XLYGKAhfheQYTmD7AWUEuNP219C/tfsBo4+IV9Yd0QzvQOzsXCgqWL4ApGonFglOW1gO
         uIfvQJkW+i4eWuHCQou9gMmjMukpCYUsy4bKOUyFjtnVpPDDiJtc9LKWyKTLnlzKLCvn
         +2/Drz9CSNCdfZLs7iQHwuYespDAW9ThxF56eaHQJp8tLxRDAcyNzWVbyhzc5IvXye2q
         mxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VO7zaCyhtYCv5/pYPEOpaqTuj9RzI+pPqxayb3u5KrQ=;
        b=Ut25noj5utFqVxTv0lYKzv6cf7UZNCHQiE3PNIP8UzXI0UkCzDWdcQbIOqhDtISrmq
         o+/0XlFmCmjZae7idZ8UvyIEkBOg/FIyt4RusmSOIStdOQV6U281HKeQTxmf3o3l8vNN
         kcVIQyFlJ4hDzh4ksefqwhEsDPNvTK47TMFpq6/QaKZBJE1WQa6r0phyAaLXZrB2hYu7
         utFzKQefI8Sk4mRRszmz4uTZYD2JNUtYLge3Jt2VOdhLGoUICn1wsoD2GJR3k/vUYcLh
         lbpUGXau6AT4JGUUtD15nQ326nIy0o5ZLLtF2RFXn0P7EEqeAUx2lK1XxU6FykWnlajN
         w7Qg==
X-Gm-Message-State: APjAAAXCXXaej2temzE4G8zIb7IYe8SeOnEl9X5B6BIgGZlm/zH4qdav
        rv9bpcLJqXk8kF5i1Xjqyn/jdQ==
X-Google-Smtp-Source: APXvYqyvq8iUKBGDlzVU0jxWwFc6QWJYExh3pNkXSN2atfAMzIvwO4vh8OKBBUYkG5sVg2kbv5VUcg==
X-Received: by 2002:a17:90b:f0e:: with SMTP id br14mr7923991pjb.117.1560706975061;
        Sun, 16 Jun 2019 10:42:55 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 12sm8736073pfi.60.2019.06.16.10.42.53
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 10:42:54 -0700 (PDT)
Date:   Sun, 16 Jun 2019 10:43:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM)
 bindings
Message-ID: <20190616174341.GP22737@tuxbook-pro>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190616132930.6942-2-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 16 Jun 06:29 PDT 2019, Brian Masney wrote:

> Add device tree bindings for the On Chip Memory (OCMEM) that is present
> on some Qualcomm Snapdragon SoCs.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  .../bindings/soc/qcom/qcom,ocmem.yaml         | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
> new file mode 100644
> index 000000000000..5e3ae6311a16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,ocmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: On Chip Memory (OCMEM) that is present on some Qualcomm Snapdragon SoCs.
> +
> +maintainers:
> +  - Brian Masney <masneyb@onstation.org>
> +
> +description: |
> +  The On Chip Memory (OCMEM) allocator allows various clients to allocate memory
> +  from OCMEM based on performance, latency and power requirements. This is
> +  typically used by the GPU, camera/video, and audio components on some
> +  Snapdragon SoCs.
> +
> +properties:
> +  compatible:
> +    const: qcom,ocmem-msm8974

qcom,msm8974-ocmem

> +
> +  reg:
> +    items:
> +      - description: Control registers
> +      - description: OCMEM address range
> +
> +  reg-names:
> +    items:
> +      - const: ocmem_ctrl_physical
> +      - const: ocmem_physical

Drop the "_physical" part, it's given by this being "reg".

Regards,
Bjorn

> +
> +  clocks:
> +    items:
> +      - description: Core clock
> +      - description: Interface clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +      #include <dt-bindings/clock/qcom,rpmcc.h>
> +      #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> +
> +      ocmem: ocmem@fdd00000 {
> +        compatible = "qcom,ocmem-msm8974";
> +
> +        reg = <0xfdd00000 0x2000>,
> +               <0xfec00000 0x180000>;
> +        reg-names = "ocmem_ctrl_physical",
> +                    "ocmem_physical";
> +
> +        clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> +                  <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> +        clock-names = "core",
> +                      "iface";
> +      };
> -- 
> 2.20.1
> 
