Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3563C1A6FC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 01:13:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389956AbgDMXN0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 19:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389929AbgDMXNZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 19:13:25 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C363C0A3BDC
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 16:13:24 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id m8so10529943lji.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 16:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zXGNQQP4X3VX81J+kdAMQQHyCz96RnLdOdy+FSwZIMU=;
        b=c4eu2TsEdrQ5/05Gmd4JKvLX1E9PqFEvEqAm++vbEwjW5ViflcKiCykyDvWlCsMKip
         Ln9fa5zS5CzsUazSEwGQuS6uLeUtQXeuUsRs8rHx/ZSgb7malGhvFYaTAW3dqdWegXYF
         NDNnFSbGrDUe+wgoG3LKqKNwlWDWgWIuod6Ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zXGNQQP4X3VX81J+kdAMQQHyCz96RnLdOdy+FSwZIMU=;
        b=HG9pd07CveEcc2IucKDxw/gLE88YPI4iOujAOFEFPzRMsSa0tTcjXIu745SyDx8kPu
         RcvssPcJhMRdPAdX28s4ZbsLDKiyTSMrOaE13H54Zlo3GGK96F3UiqnlDjxgijjOyStg
         KqZdt7eraEZIGslHCls4JV5HKuMOyNk92a+KoOHgrYPvMSP/qTkR71TUMXt7qsXSFrgO
         c0o2yxDIn2xW019Puzb04KzwJAf43TQUUGwa2g2oOabO7I/l2gGvDZlGX/2qGAXwOQA/
         4KKvphJMBzQGmJWZSpSQMu1VrNxIMbd5UX/bNwAQNRRysbf9Ix2wiua/WKQVFauMNByj
         Ggtw==
X-Gm-Message-State: AGi0PubUDWEF3ZrLbvixe8W1CNyREer43d2DliqNqKaZsWEhYMYu1ccb
        laxg4F4XmdDmiHyWSAkYUzLtkqqsn+Q=
X-Google-Smtp-Source: APiQypJ1Kb0LCTpuw+opTmUpQYrnZAXhj6ckaHyauCUuX+HAXgiMX84TJT+tXVnEmnx4YsvNer0tKQ==
X-Received: by 2002:a2e:b446:: with SMTP id o6mr11917702ljm.80.1586819602641;
        Mon, 13 Apr 2020 16:13:22 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id k16sm7960696ljk.64.2020.04.13.16.13.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 16:13:22 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id j14so2520981lfg.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 16:13:22 -0700 (PDT)
X-Received: by 2002:a19:4a03:: with SMTP id x3mr11835226lfa.159.1586819601453;
 Mon, 13 Apr 2020 16:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1579692800.git.saiprakash.ranjan@codeaurora.org> <813cc5b2da10c27db982254b274bf26008a9e6da.1579692800.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <813cc5b2da10c27db982254b274bf26008a9e6da.1579692800.git.saiprakash.ranjan@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 13 Apr 2020 16:12:44 -0700
X-Gmail-Original-Message-ID: <CAE=gft7HFBc7XtgiV1hkG-m3ONMUiE2vu8Vg_7Mu1dfe2BjYpA@mail.gmail.com>
Message-ID: <CAE=gft7HFBc7XtgiV1hkG-m3ONMUiE2vu8Vg_7Mu1dfe2BjYpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Allow client devices to select direct mapping
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        iommu@lists.linux-foundation.org,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 22, 2020 at 3:48 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> From: Jordan Crouse <jcrouse@codeaurora.org>
>
> Some client devices want to directly map the IOMMU themselves instead
> of using the DMA domain. Allow those devices to opt in to direct
> mapping by way of a list of compatible strings.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm-smmu-qcom.c | 39 +++++++++++++++++++++++++++++++++++
>  drivers/iommu/arm-smmu.c      |  3 +++
>  drivers/iommu/arm-smmu.h      |  5 +++++
>  3 files changed, 47 insertions(+)
>
> diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
> index 64a4ab270ab7..ff746acd1c81 100644
> --- a/drivers/iommu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm-smmu-qcom.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>   */
>
> +#include <linux/of_device.h>
>  #include <linux/qcom_scm.h>
>
>  #include "arm-smmu.h"
> @@ -11,6 +12,43 @@ struct qcom_smmu {
>         struct arm_smmu_device smmu;
>  };
>
> +static const struct arm_smmu_client_match_data qcom_adreno = {
> +       .direct_mapping = true,
> +};
> +
> +static const struct arm_smmu_client_match_data qcom_mdss = {
> +       .direct_mapping = true,

I don't actually see direct_mapping being used. Shouldn't this member
be checked somewhere?

-Evan
