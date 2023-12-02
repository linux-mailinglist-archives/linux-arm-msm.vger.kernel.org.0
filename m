Return-Path: <linux-arm-msm+bounces-3033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB989801E7A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 21:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A23A51C209A9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 20:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E35621352;
	Sat,  2 Dec 2023 20:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vLrCoNhe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5F211F
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 12:27:56 -0800 (PST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-5cfc3a48ab2so34884157b3.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 12:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701548875; x=1702153675; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uvT4z76Po6/5Y4/ji/3Hekn4vEQQ+QLQOwThlnNRg+s=;
        b=vLrCoNhe+1S0XvXo1nUrtCyOaPBRCZBwWcIyvUZRmJVTIXL8WwYrwrR7iGKGCDvBag
         JYAy9WdA+ALqs7WLN9QWrz4n4zLtztt+njb6dzbU2/roF+3EKRBic9syQtPs5Ob+1Bzs
         b0j21k3TCpYg07b2BRJsiTAkqjFijEU+DGkUHWWItNRH4o3tDuRnz+FPXXMRrmSb4Gw9
         DI61khc4pcAJ+eItTz5FxuEzMWmFLsSszpk9LbL1Y0OvQWXohXSx8JC09QJtnJDbv6oa
         031Oy1vMJ4MOXLwQ88JcCKEWAmZoA3DGPluYXTzv2Cx4Xiw2BdtKPEkhBPVIV3WpQ7tr
         GeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701548875; x=1702153675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvT4z76Po6/5Y4/ji/3Hekn4vEQQ+QLQOwThlnNRg+s=;
        b=BdqITsyUCjR/TKZ6utgfHaV4O+lunYuUuTunwtszyZKgJOUftHhoyY8WG0OKZX/vOG
         yiFOuaUr1SnH2RnuAIqmgDf8ewrPagaCkrYeeGPfG1DCTvSr063z1yy7w9xtdqnnpuWb
         6f8gsMgXG025q2JLylUt9imXVKS8xlZxa4LLQXlYOcYfb39Od0F5WIqM7zmqD9juXhIk
         QL+cZrsMZ3REiOA391wWnD6OGklIOLnUEhi4mXJjEoURXQJ3g/azFtm7T8GiOPSaqTWp
         TrxywgHfdK3ZD1V1BPKTt0PkwaQJmqeE/P3ZhR1n8qglVtncbFQ8+UC/HzVjBriaMgCD
         LObQ==
X-Gm-Message-State: AOJu0YzEIUYUDFqPNmG7qjb5hd4KnCoBKx8lfpjCQqEEFn14MFbRgM48
	Zrs+oxBmjcNRGNrHP25N9rECrU9Owb7xNzGKEP/dZA==
X-Google-Smtp-Source: AGHT+IH1Bi46zI+abA7XowSzg7eAQSNdMduiBzR2eJj0NkSKqxmlcaCcQ8HWp9J2PVu1uH7bwYUGeeRqo5iERm/gCtk=
X-Received: by 2002:a81:7904:0:b0:5d7:1941:ac0 with SMTP id
 u4-20020a817904000000b005d719410ac0mr1384290ywc.91.1701548875589; Sat, 02 Dec
 2023 12:27:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1701520577-31163-1-git-send-email-quic_cang@quicinc.com> <1701520577-31163-11-git-send-email-quic_cang@quicinc.com>
In-Reply-To: <1701520577-31163-11-git-send-email-quic_cang@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 2 Dec 2023 22:27:44 +0200
Message-ID: <CAA8EJpqp3=wnShnjnLgeWt+TuVjEVOWW7QcACjZq2JD3AcoYGQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] phy: qualcomm: phy-qcom-qmp-ufs: Add High Speed
 Gear 5 support for SM8550
To: Can Guo <quic_cang@quicinc.com>
Cc: bvanassche@acm.org, mani@kernel.org, adrian.hunter@intel.com, 
	vkoul@kernel.org, beanhuo@micron.com, avri.altman@wdc.com, 
	junwoo80.lee@samsung.com, martin.petersen@oracle.com, 
	linux-scsi@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Dec 2023 at 14:37, Can Guo <quic_cang@quicinc.com> wrote:
>
> On SM8550, two sets of UFS PHY settings are provided, one set is to support
> HS-G5, another set is to support HS-G4 and lower gears. The two sets of PHY
> settings are programming different values to different registers, mixing
> the two sets and/or overwriting one set with another set is definitely not
> blessed by UFS PHY designers.
>
> To add HS-G5 support for SM8550, split the two sets of PHY settings into
> their dedicated overlay tables, only the common parts of the two sets of
> PHY settings are left in the .tbls.
>
> Consider we are going to add even higher gear support in future, to avoid
> adding more tables with different names, rename the .tbls_hs_g4 and make it
> an array, a size of 2 is enough as of now.
>
> In this case, .tbls alone is not a complete set of PHY settings, so either
> tbls_hs_overlay[0] or tbls_hs_overlay[1] must be applied on top of the
> .tbls to become a complete set of PHY settings.
>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v6.h     |   2 +
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v6.h |   2 +
>  .../qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v6.h    |   8 +
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c            | 169 ++++++++++++++++++---
>  4 files changed, 159 insertions(+), 22 deletions(-)

-- 
With best wishes
Dmitry

