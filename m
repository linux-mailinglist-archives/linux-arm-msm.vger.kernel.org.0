Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9B522E175
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 18:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbgGZQyl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 12:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbgGZQyk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 12:54:40 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701F1C0619D2;
        Sun, 26 Jul 2020 09:54:40 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id o18so14676225eje.7;
        Sun, 26 Jul 2020 09:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CBVgBFjkce72YAGTOc2I0NfR2QTyjZahMOR47tbfoe0=;
        b=WZYXiUPxENKn4QSxY7fPf+iBaAhsNwecbIqIua+YO2effyaCG04XLdhlYe/ugtAfun
         1fXbuueu1sL3HDK5Dtsz0YubABpEtjbQo7eptsxI/lBXgWB/3WVVVEEmE5w+FLXH6uKi
         ZIeZey8Cvr8anwVeJAwUu0rt41msmaOcLhKWamXZ4XPPQloplOSyM69HBfahGiFQeaKe
         VdrYrSXa5wP7b1gmFMJiWqd2K8TOxBosAvi2Z9c8hlyuujPC5uhKq+dgDVj4VMpUybxU
         kiYkfmIFSDy/R08StwIylDGo6dkk0/l7B5Clr00ZfG0Jw2OpT/++z7w9JMSJTwfmA6aD
         AyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CBVgBFjkce72YAGTOc2I0NfR2QTyjZahMOR47tbfoe0=;
        b=eU1/5pJJ/Y2cGdpiHfbQRzKvGY88AEUZ/0uLpQhgbFxWBcLlpToVVzyd4gjgDPeVxd
         7Gx41iUTW7lLgsQVPmXL/HcmdNAPLbQW7EYppYSZOerdPweKGXr6okcfF2I6csVhze51
         5UoDoSqgyPV1JTqbeU22/ARU63jFBUhBCgQIZMn/2BPKerlURuMZ/3XYLsjRhIV+7P6v
         ai3XV70obt//9JJa1XAy7XqzGmNR4OqaGbp0Q+jqIACN054CP3pZkXB9kB44RMR/OXh6
         522r90nCbMDte0w5xuneGgfNqQpPLvjPED69qaRfwTv4J+F+AbBaRU6wOTsxwAK1fKJX
         XfuA==
X-Gm-Message-State: AOAM530YLTH+/fyFXnKcMKzhVIhMtkdhb2OM9UPWb2q34x7j/zBEY1x6
        SFz95O16mFBDcp8BySgK52NdCaoKYECdWuh8F6k=
X-Google-Smtp-Source: ABdhPJwDnlAPaImQnrQAApbQ+w+cGsIt/2VZqafSu7Ti4+lytmzJqD4dBVNo+ZeSue4XBagNFOp/lX3pdQrzVmj/eOM=
X-Received: by 2002:a17:906:f199:: with SMTP id gs25mr1970599ejb.161.1595782478958;
 Sun, 26 Jul 2020 09:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200720154047.3611092-1-jcrouse@codeaurora.org> <20200720154047.3611092-8-jcrouse@codeaurora.org>
In-Reply-To: <20200720154047.3611092-8-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 26 Jul 2020 09:55:18 -0700
Message-ID: <CAF6AEGu50KtjFHJO3Txrbjnn1xoG5WDyuU_e__RsGPXe-5Z46g@mail.gmail.com>
Subject: Re: [PATCH v10 07/13] dt-bindings: arm-smmu: Add compatible string
 for Adreno GPU SMMU
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Will Deacon <will@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 20, 2020 at 8:41 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Every Qcom Adreno GPU has an embedded SMMU for its own use. These

minor detail: this is true for a3xx and later but not a2xx ;-)

> devices depend on unique features such as split pagetables,
> different stall/halt requirements and other settings. Identify them
> with a compatible string so that they can be identified in the
> arm-smmu implementation specific code.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index d7ceb4c34423..e52a1b146c97 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -38,6 +38,10 @@ properties:
>                - qcom,sc7180-smmu-500
>                - qcom,sdm845-smmu-500
>            - const: arm,mmu-500
> +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> +        items:
> +          - const: qcom,adreno-smmu
> +          - const: qcom,smmu-v2
>        - items:
>            - const: arm,mmu-500
>            - const: arm,smmu-v2
> --
> 2.25.1
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
