Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2BCEABBBD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2019 17:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393219AbfIFPHK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Sep 2019 11:07:10 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35362 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393048AbfIFPHJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Sep 2019 11:07:09 -0400
Received: by mail-pg1-f194.google.com with SMTP id n4so3673868pgv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Sep 2019 08:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:to:from:cc:subject:user-agent:date;
        bh=+47qpBpazZIBGuGKgsWya4eK9WdkPz4DOTOftkf8OFg=;
        b=TuHyc2zoGm9nLStyAsR7Su82znAgsbLVQ6jQMwNMmztmzOdTsZCxgYLiiYBjFTWsif
         RgLHaeE6kO/EEler4Zgfjbn4IEb5vLyOWNVgGqMjslvuaPog0nuCLd8UMoIn/KH4AsUp
         69JPSguudgs3fPCDTSOpnaq4N/J3HjZfg9/fY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:to:from:cc:subject
         :user-agent:date;
        bh=+47qpBpazZIBGuGKgsWya4eK9WdkPz4DOTOftkf8OFg=;
        b=dFHmVauI6Ys2bbYQ0ePRLuTmXWWSjHVgJNy8rBjubcxQGz949+f3Lldo8dcRxqiPnl
         1kKBpRsua/6BRV24K3+obXf/5rGfgKoacoip5dfKLRsIGVw+a87DGez8Jb0Tna+rkCM8
         9EVA6uJHBlNa5KWFudIXxBdWn5DaMXjrFTpSLHsVtn9FnxzPR4YDKFoPnzn5u2iZfnV7
         KYw8gUO0po+ZkuYugHrLjV2hyDx+GwKqq+cbFKURJWnFt0QO5TkuhNVWTIWJn+/FxOoQ
         zMgDFSNdybuukkdi4Itkmjr1ohiE5rdf7Fj32ned2tvDW5Nf6/guHHn3DQ+09agAv0Nl
         wHDg==
X-Gm-Message-State: APjAAAXtz227TYRS79Xw/DbLKrpnoaQrbyJCAe0QTAjJNZgWVYy5f0Ny
        wBGHbWqUvEKfgFnOWdQYhXKG4w==
X-Google-Smtp-Source: APXvYqwZ2rHe7Zo6jvG+upg00KU4a7AuVmmkFz0bxJn3Ukk6w7jlpeOkbdOZ+PRu0WjsOaO4e0prrQ==
X-Received: by 2002:a17:90a:17cb:: with SMTP id q69mr9997781pja.135.1567782428950;
        Fri, 06 Sep 2019 08:07:08 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j7sm6286162pfi.96.2019.09.06.08.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2019 08:07:08 -0700 (PDT)
Message-ID: <5d72761c.1c69fb81.bf5be.09b4@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190823063248.13295-4-vivek.gautam@codeaurora.org>
References: <20190823063248.13295-1-vivek.gautam@codeaurora.org> <20190823063248.13295-4-vivek.gautam@codeaurora.org>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>, agross@kernel.org,
        iommu@lists.linux-foundation.org, joro@8bytes.org,
        robin.murphy@arm.com, will.deacon@arm.com
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: Re: [PATCH v4 3/3] iommu: arm-smmu-impl: Add sdm845 implementation hook
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 08:07:07 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vivek Gautam (2019-08-22 23:32:48)
> diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
> index 3f88cd078dd5..0aef87c41f9c 100644
> --- a/drivers/iommu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm-smmu-impl.c
> @@ -102,7 +103,6 @@ static struct arm_smmu_device *cavium_smmu_impl_init(=
struct arm_smmu_device *smm
>         return &cs->smmu;
>  }
> =20
> -
>  #define ARM_MMU500_ACTLR_CPRE          (1 << 1)
> =20
>  #define ARM_MMU500_ACR_CACHE_LOCK      (1 << 26)

Drop this hunk?=20

> @@ -147,6 +147,28 @@ static const struct arm_smmu_impl arm_mmu500_impl =
=3D {
>         .reset =3D arm_mmu500_reset,
>  };
> =20
> +static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
> +{
> +       int ret;
> +
> +       arm_mmu500_reset(smmu);
> +
> +       /*
> +        * To address performance degradation in non-real time clients,
> +        * such as USB and UFS, turn off wait-for-safe on sdm845 based bo=
ards,
> +        * such as MTP and db845, whose firmwares implement secure monitor
> +        * call handlers to turn on/off the wait-for-safe logic.
> +        */
> +       ret =3D qcom_scm_qsmmu500_wait_safe_toggle(0);
> +       if (ret)
> +               dev_warn(smmu->dev, "Failed to turn off SAFE logic\n");
> +
> +       return 0;

return ret? Or intentionally don't return an error for failure?

> +}
> +
> +const struct arm_smmu_impl qcom_sdm845_smmu500_impl =3D {

static?

> +       .reset =3D qcom_sdm845_smmu500_reset,
> +};
> =20
>  struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>  {
