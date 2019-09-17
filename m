Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9D6B55B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Sep 2019 20:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfIQSzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 14:55:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:37130 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726169AbfIQSzn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 14:55:43 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 29EB5214AF;
        Tue, 17 Sep 2019 18:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568746542;
        bh=GES6jY4SrgchwiFDLmCd0LxgVWZjnEk+gbEGOc928XQ=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=k9LwQx38N2BdNc66+3x/viHSY2juEQIkGNDwqC7RC5qWXwJi29ZVStsSdAb4mMl/s
         QwXwITGlVNF3gB3KQrxck1nkk79fvRSbAffQgGL0DxcRj6yvF6E3eUh8Ik6KDGZqrp
         keQixx7YXQIb8U8MUxG+ZkXC3m274H2HeGOHSe6E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566327992-362-4-git-send-email-jcrouse@codeaurora.org>
References: <1566327992-362-1-git-send-email-jcrouse@codeaurora.org> <1566327992-362-4-git-send-email-jcrouse@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
To:     Jordan Crouse <jcrouse@codeaurora.org>,
        freedreno@lists.freedesktop.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 3/7] iommu/arm-smmu: Add a SMMU variant for the Adreno GPU
User-Agent: alot/0.8.1
Date:   Tue, 17 Sep 2019 11:55:41 -0700
Message-Id: <20190917185542.29EB5214AF@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jordan Crouse (2019-08-20 12:06:28)
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 39e81ef..3f41cf7 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -1858,6 +1858,7 @@ ARM_SMMU_MATCH_DATA(arm_mmu401, ARM_SMMU_V1_64K, GE=
NERIC_SMMU);
>  ARM_SMMU_MATCH_DATA(arm_mmu500, ARM_SMMU_V2, ARM_MMU500);
>  ARM_SMMU_MATCH_DATA(cavium_smmuv2, ARM_SMMU_V2, CAVIUM_SMMUV2);
>  ARM_SMMU_MATCH_DATA(qcom_smmuv2, ARM_SMMU_V2, QCOM_SMMUV2);
> +ARM_SMMU_MATCH_DATA(qcom_adreno_smmuv2, ARM_SMMU_V2, QCOM_ADRENO_SMMUV2);
> =20
>  static const struct of_device_id arm_smmu_of_match[] =3D {
>         { .compatible =3D "arm,smmu-v1", .data =3D &smmu_generic_v1 },
> @@ -1867,6 +1868,7 @@ static const struct of_device_id arm_smmu_of_match[=
] =3D {
>         { .compatible =3D "arm,mmu-500", .data =3D &arm_mmu500 },
>         { .compatible =3D "cavium,smmu-v2", .data =3D &cavium_smmuv2 },
>         { .compatible =3D "qcom,smmu-v2", .data =3D &qcom_smmuv2 },
> +       { .compatible =3D "qcom,adreno-smmu-v2", .data =3D &qcom_adreno_s=
mmuv2 },

Can this be sorted on compat?

>         { },
>  };
> =20
> diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> index 91a4eb8..e5a2cc8 100644
> --- a/drivers/iommu/arm-smmu.h
> +++ b/drivers/iommu/arm-smmu.h
> @@ -222,6 +222,7 @@ enum arm_smmu_implementation {
>         ARM_MMU500,
>         CAVIUM_SMMUV2,
>         QCOM_SMMUV2,
> +       QCOM_ADRENO_SMMUV2,

Can this be sorted alphabetically?

