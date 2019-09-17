Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDA8B55BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 20:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726169AbfIQS40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 14:56:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:37646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725927AbfIQS40 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 14:56:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A4A8214AF;
        Tue, 17 Sep 2019 18:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568746585;
        bh=mbODalGRNQoWNnowm2tS1pcY2EbwBFAWll84phPGxbA=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=X2afMEBspYqrVXT0KNPzGo8hs6SqE7bnObaYtDnvMs7z38QOJlK4gbKabuaAqCbOP
         ECW6wcm77plYCjJXgCBwwyyI+0OSQOARJZVVveEUXUP3MPVeTbryP4q99Pt9Jmw6Ld
         HKuDFOJ+H+7HjkuwaGkz3B4DI6P4W2cia6BT6KaQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org> <1566327992-362-3-git-send-email-jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Joerg Roedel <joro@8bytes.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        freedreno@lists.freedesktop.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/7] dt-bindings: arm-smmu: Add Adreno GPU variant
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 11:56:24 -0700
Message-Id: <20190917185625.8A4A8214AF@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jordan Crouse (2019-08-20 12:06:27)
> Add a compatible string to identify SMMUs that are attached
> to Adreno GPU devices that wish to support split pagetables.
>=20
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>=20
>  Documentation/devicetree/bindings/iommu/arm,smmu.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.txt b/Docum=
entation/devicetree/bindings/iommu/arm,smmu.txt
> index 3133f3b..3b07896 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.txt
> @@ -18,6 +18,7 @@ conditions.
>                          "arm,mmu-500"
>                          "cavium,smmu-v2"
>                          "qcom,smmu-v2"
> +                       "qcom,adreno-smmu-v2"

Is the tabbing weird here or just my MUA is failing?

> =20
>                    depending on the particular implementation and/or the
>                    version of the architecture implemented.
> @@ -31,6 +32,12 @@ conditions.
>                    as below, SoC-specific compatibles:
>                    "qcom,sdm845-smmu-500", "arm,mmu-500"
> =20
> +                 "qcom,adreno-smmu-v2" is a special implementation for

Heh, special.

> +                 SMMU devices attached to the Adreno GPU on Qcom devices.
> +                 If selected, this will enable split pagetable (TTBR1)

Is this selected? Sounds like Kconfig here.

> +                 support. Only use this if the GPU target is capable of
> +                 supporting 64 bit addresses.
> +
>  - reg           : Base address and size of the SMMU.
> =20
