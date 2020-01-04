Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 428D61304B7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 22:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgADVgu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jan 2020 16:36:50 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:40157 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgADVgt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jan 2020 16:36:49 -0500
Received: by mail-io1-f65.google.com with SMTP id x1so44756019iop.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jan 2020 13:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=e6NIkJehX5PQPcR5AGeQlXeeI6cS9FMXt1VVPV226sY=;
        b=Menh0nrzc7Nu37LpE/BS09z9H85EHanznjeCOkGy7r5BD5Xlw/CLBv9/gkUcKNXn8/
         X8zTwy9MnFGq2f5DFxaYRekPxsnibZLi4Jb6KfiAT+ToLc9JqvXdKZu03GLdrJ6u0eCp
         BefyypA+LwC4IYs34+i5A5IE6A24HFKZPVM/s+jtj9UXptuB5XVfRjJy+hl/rliZML+5
         DIum7Afc6Kzy4Fy/njJ22vmD/mhTAcUNionC8iBp01ywF1FgFLuAvHDlRbZUMCctI0Mg
         ufCpxpOWgl5rv8kwx7y2UIkIVS2WQVZtShB2QAznxGK/O68zrq748AB2UAa0ZCCfMyCa
         5uFA==
X-Gm-Message-State: APjAAAWojsAxaM2z9i19qmotTy/7xMtXIJguYpo+flYtaRfcq141teAj
        f59b7glmEz/Pm1FyBH+swdN3VCE=
X-Google-Smtp-Source: APXvYqxPbXu/yDSL3sNUvbMTsie1g2AkkVtPqL6QiO6sh9HxUJ9E5hZsbnQuA9sgpg1vPFyTh2ad3A==
X-Received: by 2002:a6b:1587:: with SMTP id 129mr61423403iov.117.1578173807918;
        Sat, 04 Jan 2020 13:36:47 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id r14sm22511998ilg.59.2020.01.04.13.36.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:36:46 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:36:45 -0700
Date:   Sat, 4 Jan 2020 14:36:45 -0700
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
Message-ID: <20200104213645.GA25711@bogus>
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
 <1577421760-1174-2-git-send-email-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1577421760-1174-2-git-send-email-tdas@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 27, 2019 at 10:12:38AM +0530, Taniya Das wrote:
> The MSS clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,mss.yaml        | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> new file mode 100644
> index 0000000..05efe2b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Modem Clock Controller Binding
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm modem clock control module which supports the clocks.
> +
> +properties:
> +  compatible :

drop space     ^

> +    enum:
> +       - qcom,sc7180-mss
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  additionalItems: false

With the indentation here, you are defining a property. Should be no 
indent.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +
> +examples:
> +  # Example of MSS with clock nodes properties for SC7180:
> +  - |
> +    clock-controller@41aa000 {
> +      compatible = "qcom,sc7180-mss";
> +      reg = <0x041aa000 0x100>;
> +      #clock-cells = <1>;
> +    };
> +...
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
