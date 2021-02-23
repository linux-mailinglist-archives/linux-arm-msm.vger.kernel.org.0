Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278AA322F32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 17:58:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbhBWQ6T convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 11:58:19 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:51107 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233654AbhBWQ6P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 11:58:15 -0500
Received: from relay9-d.mail.gandi.net (unknown [217.70.183.199])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id DE6803A92AC
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 16:50:33 +0000 (UTC)
X-Originating-IP: 86.210.203.113
Received: from xps13 (lfbn-tou-1-972-113.w86-210.abo.wanadoo.fr [86.210.203.113])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AEFDBFF808;
        Tue, 23 Feb 2021 16:49:23 +0000 (UTC)
Date:   Tue, 23 Feb 2021 17:49:22 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        boris.brezillon@collabora.com
Subject: Re: [PATCH 2/3] dt-bindings: mtd: Add a property to declare secure
 regions in Qcom NANDc
Message-ID: <20210223174922.052f9776@xps13>
In-Reply-To: <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
        <20210222120259.94465-3-manivannan.sadhasivam@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Manivannan,

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Mon,
22 Feb 2021 17:32:58 +0530:

> On a typical end product, a vendor may choose to secure some regions in
> the NAND memory which are supposed to stay intact between FW upgrades.
> The access to those regions will be blocked by a secure element like
> Trustzone. So the normal world software like Linux kernel should not
> touch these regions (including reading).
> 
> So let's add a property for declaring such secure regions so that the
> driver can skip touching them.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom,nandc.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> index 84ad7ff30121..7500e20da9c1 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> +++ b/Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
> @@ -48,6 +48,13 @@ patternProperties:
>          enum:
>            - 512
>  
> +      qcom,secure-regions:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description:
> +          Regions in the NAND memory which are protected using a secure element
> +          like Trustzone. This property contains the start address and size of
> +          the secure regions present (optional).

What does this "(optional)" means? If you mean the property is optional
then it should be described accordingly in the yaml file, or am I
missing something?

I wonder if it wouldn't be better to make this a NAND chip node
property. I don't think a qcom prefix is needed as potentially many
other SoCs might have the same "feature".

I'm fine adding support for it in the qcom driver only though.

> +
>  allOf:
>    - $ref: "nand-controller.yaml#"
>  

Thanks,
Miquèl
