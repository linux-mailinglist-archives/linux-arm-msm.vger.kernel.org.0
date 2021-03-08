Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 238DA330A04
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 10:12:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhCHJLd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 04:11:33 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44016 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhCHJLE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 04:11:04 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BE6CB1F44CCF;
        Mon,  8 Mar 2021 09:11:02 +0000 (GMT)
Date:   Mon, 8 Mar 2021 10:10:59 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     miquel.raynal@bootlin.com, richard@nod.at, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniele.Palmas@telit.com, bjorn.andersson@linaro.org
Subject: Re: [PATCH v4 2/3] dt-bindings: mtd: Add a property to declare
 secure regions in NAND chips
Message-ID: <20210308101059.08658fbe@collabora.com>
In-Reply-To: <20210308054447.28418-3-manivannan.sadhasivam@linaro.org>
References: <20210308054447.28418-1-manivannan.sadhasivam@linaro.org>
        <20210308054447.28418-3-manivannan.sadhasivam@linaro.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon,  8 Mar 2021 11:14:46 +0530
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote:

> On a typical end product, a vendor may choose to secure some regions in
> the NAND memory which are supposed to stay intact between FW upgrades.
> The access to those regions will be blocked by a secure element like
> Trustzone. So the normal world software like Linux kernel should not
> touch these regions (including reading).
> 
> So let's add a property for declaring such secure regions so that the
> drivers can skip touching them.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  Documentation/devicetree/bindings/mtd/nand-controller.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> index d0e422f4b3e0..15a674bedca3 100644
> --- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
> @@ -143,6 +143,13 @@ patternProperties:
>            Ready/Busy pins. Active state refers to the NAND ready state and
>            should be set to GPIOD_ACTIVE_HIGH unless the signal is inverted.
>  
> +      secure-regions:
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        description:
> +          Regions in the NAND chip which are protected using a secure element
> +          like Trustzone. This property contains the start address and size of
> +          the secure regions present.
> +

Since you declare this as a generic property, I think it'd be simpler
to do the check at the core level.

>      required:
>        - reg
>  

