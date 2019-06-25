Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A91EE52638
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 10:15:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727338AbfFYIPG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 04:15:06 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40884 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726663AbfFYIPG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 04:15:06 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D6BAF6119C; Tue, 25 Jun 2019 08:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561450504;
        bh=tF5NPZ0H/3FHb44lXZyZY+m/e8WunM2g9yK7vFajX7k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=KOdR5GcC3Prkqbk66qruXBXCkFPwX0R1HocvQstA6yp6v+1tVY+74THSoOzFsTM6o
         9cDBTKsLP28CkD7eH+AH0AoYbPNZ5PfBrfk4ZBe8EaHX8HtrHBgRHwxtuPrkE4F1eH
         s782NKRsGwlaegD209RUMLIMUb2F9Yl9e1TPeiTg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96B8D6119D;
        Tue, 25 Jun 2019 08:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561450503;
        bh=tF5NPZ0H/3FHb44lXZyZY+m/e8WunM2g9yK7vFajX7k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HIalXy1ANOXrfiLZ8dbVWHqQbiwwOP5qyzDp0PEMZDaClsygmIdN/RdLYTyJYxA8e
         BWCdev+QjKtpjKFERuW+j14CgXjmq+fI+AZcVDuOM2hMNXtWMMUw+nCfVDujdMGDSf
         tommX8rKI9PDPayM311EfbbzFjZeWy97uySWKIco=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 96B8D6119D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Received: by mail-ed1-f46.google.com with SMTP id k8so25767647edr.11;
        Tue, 25 Jun 2019 01:15:03 -0700 (PDT)
X-Gm-Message-State: APjAAAXjJzXQ7GVwbpqZcmzxbX4ByH0YRjlpyTTAwKwBTgKnegJab0Cr
        47ai7IDzRnm1NQqD/mKW23QnQteH3vD3933akzY=
X-Google-Smtp-Source: APXvYqw34jrrW75pGQVi4um9K7uzDN64ryGaJmYyhFFoItu6JCD/57g2dKkPOZZeKk7TZsBB45DPi2yBrYQOhQDSXw0=
X-Received: by 2002:a05:6402:12d2:: with SMTP id k18mr51404888edx.197.1561450502322;
 Tue, 25 Jun 2019 01:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190619001602.4890-1-bjorn.andersson@linaro.org>
In-Reply-To: <20190619001602.4890-1-bjorn.andersson@linaro.org>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Date:   Tue, 25 Jun 2019 13:44:51 +0530
X-Gmail-Original-Message-ID: <CAFp+6iH3z2_2ZaNYjP7q7504+khgVNiozuKHq3BVLrEwQBz5sg@mail.gmail.com>
Message-ID: <CAFp+6iH3z2_2ZaNYjP7q7504+khgVNiozuKHq3BVLrEwQBz5sg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8996: Rename smmu nodes
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 19, 2019 at 5:46 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Node names shouldn't include a vendor prefix and should whenever
> possible use a generic identifier. Resolve this by renaming the smmu
> nodes "iommu".

The bindings too say so :)
Reviewed-by: Vivek Gautam <vivek.gautam@codeaurora.org>

>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Updated commit message to talk about vendor prefix rather than qcom,
>
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 2ecd9d775d61..c934e00434c7 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1163,7 +1163,7 @@
>                         };
>                 };
>
> -               vfe_smmu: arm,smmu@da0000 {
> +               vfe_smmu: iommu@da0000 {
>                         compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>                         reg = <0xda0000 0x10000>;
>
> @@ -1314,7 +1314,7 @@
>                         };
>                 };
>
> -               adreno_smmu: arm,smmu@b40000 {
> +               adreno_smmu: iommu@b40000 {
>                         compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>                         reg = <0xb40000 0x10000>;
>
> @@ -1331,7 +1331,7 @@
>                         power-domains = <&mmcc GPU_GDSC>;
>                 };
>
> -               mdp_smmu: arm,smmu@d00000 {
> +               mdp_smmu: iommu@d00000 {
>                         compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>                         reg = <0xd00000 0x10000>;
>
> @@ -1347,7 +1347,7 @@
>                         power-domains = <&mmcc MDSS_GDSC>;
>                 };
>
> -               lpass_q6_smmu: arm,smmu-lpass_q6@1600000 {
> +               lpass_q6_smmu: iommu@1600000 {
>                         compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
>                         reg = <0x1600000 0x20000>;
>                         #iommu-cells = <1>;
> --
> 2.18.0
>


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
