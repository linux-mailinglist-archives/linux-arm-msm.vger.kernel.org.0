Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75EF614125C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2020 21:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729774AbgAQUhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jan 2020 15:37:17 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39623 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729748AbgAQUhQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jan 2020 15:37:16 -0500
Received: by mail-pj1-f66.google.com with SMTP id e11so3837861pjt.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2020 12:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5+F24Ve03N3iru6WLb9O9UGGQzx5QThGIigVPheCHEI=;
        b=Px4A/Lo9Bx1gRoPpdJ45NRqKxxRBroCMy/4BAe8VHJRFpq3AhWgpAh6IN5B10IV4mM
         np3DXIhTiaCxtuEkflx/In1YydznNrGshqXioqtR6MkXsP9kltHDfDmSKAFChXnml7n6
         Y6IMTxMLTxfEMCqXxZPT/2/nm5jUrEkwRZqyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5+F24Ve03N3iru6WLb9O9UGGQzx5QThGIigVPheCHEI=;
        b=O+gXgqnYQM0AZ860ZucXHtuf3l99HKTkL0I5nqaPWi6qBvdtF1RsvpOSFzRSSUhXMy
         LB9PuEe7x+5BpB85DNa9Aj5BXdnlIBLL3sls8fA4R1PFiILTjrdAHBGNiMmzrzci3Wdt
         Wnv3rT2QeEK2aUzFDnnBTihXqZJx8M01zt4cLvOPxAhg53ru+frm/UmoomSX5YzEzf9U
         nB1nIq0JWhgXtaYzP+JU19FOWJtJhbp0bPi44JIFmOajlCxRVdurjLK8/AJBwa55J/+u
         V/xjIfu8+xsXSgn+iUM/0zGNeo6G6TkMXEBkLZo6UJ870MkKjiqhA/qJtqx8BicJYf0V
         ZP/g==
X-Gm-Message-State: APjAAAVABXGL/ej8TXpnHXEymMgreCLilJak1OevtOTpAW/gmCNyJ1Se
        rcFQcxjHi6UTLuSzYQAB5CzjVw==
X-Google-Smtp-Source: APXvYqzqDjmjRyDoSEVHKOIZxsyaBgmKTK4HpsmjC1fvt5QMTcaJQ7R7T3INoHxNfIDw364kwCy+pg==
X-Received: by 2002:a17:90a:31cc:: with SMTP id j12mr7730223pjf.103.1579293436306;
        Fri, 17 Jan 2020 12:37:16 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id r20sm29058711pgu.89.2020.01.17.12.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2020 12:37:15 -0800 (PST)
Date:   Fri, 17 Jan 2020 12:37:14 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy
 bindings to yaml
Message-ID: <20200117203714.GQ89495@google.com>
References: <1578658699-30458-1-git-send-email-sanm@codeaurora.org>
 <1578658699-30458-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1578658699-30458-3-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jan 10, 2020 at 05:48:16PM +0530, Sandeep Maheswaram wrote:
> Convert QUSB2 phy  bindings to DT schema format using json-schema.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 152 +++++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 ---------
>  2 files changed, 152 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> new file mode 100644
> index 0000000..83cd01d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QUSB2 phy controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +description:
> +  QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
> +
> +properties:
> +  compatible:
> +    anyOf:
> +      - items:
> +        - const: qcom,msm8996-qusb2-phy
> +      - items:
> +        - const: qcom,msm8998-qusb2-phy
> +      - items:
> +        - const: qcom,sc7180-qusb2-phy
> +      - items:
> +        - const: qcom,sdm845-qusb2-phy
> +      - items:
> +        - enum:
> +          - qcom,sc7180-qusb2-phy
> +          - qcom,sdm845-qusb2-phy
> +        - const: qcom,qusb2-v2-phy

The subject says this patch converts the binding to YAML, however you are also
changing the binding (by adding 'qcom,sc7180-qusb2-phy' and 'qcom,qusb2-v2-phy'),
which is misleading. Please change this to one patch that does the 1:1 conversion
to YAML, and another that adds the new compatible strings.

Thanks

Matthias
