Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44F6CBFA64
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 22:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfIZUGQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 16:06:16 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42681 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbfIZUGQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 16:06:16 -0400
Received: by mail-ed1-f68.google.com with SMTP id y91so351037ede.9;
        Thu, 26 Sep 2019 13:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L4g0OlMIEPfSG1EvFtoZmVR71TkVEEjE9tngR9VbY+k=;
        b=cuUMwz7llVDA8xBOBlRlV9PxtH15BdZEWv9Ktgr0mAHsTACitBgTbXylS7HVATC4aE
         CP4Hsn2Rzv+M3MBiNSR4VZOjGYSg1FscXnXgo9GuWDVe8Eytr3WegLqfl/oxvBNbqau9
         HAow9zC8sGqu1fNLs1omYthATkkRzFMQJqWMhunTCiL901WTWMXem1pjECwNuyc3fDC9
         BXyKoM7bVIZDTXAJdwMwpcSqSD12lndF9nX9hbPkGUDeMwBDiWey0fYtHkZlYw6gE3FL
         KVUTQdOez+lut8+NhPXXHW/nZx8UFyhRcRcHtU/d1hnTMjc1zwuqIQ/pB4FE1InG4jmr
         I5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L4g0OlMIEPfSG1EvFtoZmVR71TkVEEjE9tngR9VbY+k=;
        b=U+J+6xeEWc9hbpq1moo8Jj9JYA/FwR92Fc7OaH36ZILUnWQZlqXn85QJGcC+iothW4
         zLJ4T0v4TdJe4tPHGiQMZxJSTbyw8Rph+kYwHUXI650WeGBb1ek6vylDZDgNPboNSQ5q
         JTiMqpNQ1olCNQ+mYr1TPWeeHlcQ8CV9SehDN01P8+1OrK1TzazDcXLoO8mBA0dobphg
         hXSCmtlDUsCNAA1MefZz/g2ic4bSkYSIPXGQd1tLNGCG1BGU/iU/4j7YSq4qSO0R/dVj
         SzQa37sFGRU9LE/5BYN/6MHVFHhEMoWsHtGFvAE2qZFxEjcR+Zvj+xSGA4j21fRcr4Sx
         f7BA==
X-Gm-Message-State: APjAAAUTEZjUtd5CSHb9iqWK4tthTwiJD2xINJByh/WsicAoCXquRViD
        Mu/PJCrKE9afgBsnehsO8Ho067SATBvdbq3ANeM=
X-Google-Smtp-Source: APXvYqxD7haHkKiWJOBTMNuhd/IDHgpHF/JGgC0pHOi/KcXpvT1c5VHC+8mXNwGpu+dTYGEABlcCXblggdbo2JLewwc=
X-Received: by 2002:a17:906:4c4c:: with SMTP id d12mr4817068ejw.174.1569528374345;
 Thu, 26 Sep 2019 13:06:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190926120516.4981-1-kholk11@gmail.com> <20190926120516.4981-2-kholk11@gmail.com>
In-Reply-To: <20190926120516.4981-2-kholk11@gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 26 Sep 2019 13:06:03 -0700
Message-ID: <CAF6AEGs-+SGEJYA4FgGcMXVghLoXmDWbBMjS_BHm=7+9FfYv5g@mail.gmail.com>
Subject: Re: [PATCH 1/6] iommu/qcom: Use the asid read from device-tree if specified
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        marijns95@gmail.com, Andy Gross <agross@kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <joro@8bytes.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 26, 2019 at 5:05 AM <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> As specified in this driver, the context banks are 0x1000 apart.
> Problem is that sometimes the context number (our asid) does not
> match this logic and we end up using the wrong one: this starts
> being a problem in the case that we need to send TZ commands
> to do anything on a specific context.
>
> For this reason, read the ASID from the DT if the property
> "qcom,ctx-num" is present on the IOMMU context node.
>
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  .../devicetree/bindings/iommu/qcom,iommu.txt    |  1 +
>  drivers/iommu/qcom_iommu.c                      | 17 ++++++++++++++---
>  2 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> index 059139abce35..98102b323196 100644
> --- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> +++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> @@ -38,6 +38,7 @@ to non-secure vs secure interrupt line.
>          - "qcom,msm-iommu-v1-sec" : secure context bank
>    - reg            : Base address and size of context bank within the iommu
>    - interrupts     : The context fault irq.
> +  - qcom,ctx-num   : The number associated to the context bank


I guess this should be more like:

+  and the following optional properties:
+  - qcom,ctx-num   : The number associated to the context bank

(since this is an optional property)

BR,
-R

>
>  ** Optional properties:
>
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index dadc707573a2..5837556af147 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -557,7 +557,8 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>          * index into qcom_iommu->ctxs:
>          */
>         if (WARN_ON(asid < 1) ||
> -           WARN_ON(asid > qcom_iommu->num_ctxs))
> +           WARN_ON(asid > qcom_iommu->num_ctxs) ||
> +           WARN_ON(qcom_iommu->ctxs[asid - 1] == NULL))
>                 return -EINVAL;
>
>         if (!fwspec->iommu_priv) {
> @@ -665,7 +666,8 @@ static int qcom_iommu_sec_ptbl_init(struct device *dev)
>
>  static int get_asid(const struct device_node *np)
>  {
> -       u32 reg;
> +       u32 reg, val;
> +       int asid;
>
>         /* read the "reg" property directly to get the relative address
>          * of the context bank, and calculate the asid from that:
> @@ -673,7 +675,16 @@ static int get_asid(const struct device_node *np)
>         if (of_property_read_u32_index(np, "reg", 0, &reg))
>                 return -ENODEV;
>
> -       return reg / 0x1000;      /* context banks are 0x1000 apart */
> +       /* Context banks are 0x1000 apart but, in some cases, the ASID
> +        * number doesn't match to this logic and needs to be passed
> +        * from the DT configuration explicitly.
> +        */
> +       if (of_property_read_u32(np, "qcom,ctx-num", &val))
> +               asid = reg / 0x1000;
> +       else
> +               asid = val;
> +
> +       return asid;
>  }
>
>  static int qcom_iommu_ctx_probe(struct platform_device *pdev)
> --
> 2.21.0
>
