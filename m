Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 559E11C046C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 20:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgD3SMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 14:12:48 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:53326 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726355AbgD3SMr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 14:12:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588270366; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=pPcbnLkLayy2Rm6j200c+uFP70JSkmmB+Gfck54oXYM=; b=kv2qM9HjBVYqwn66uiyNskrOszI9GIlhIAvuKHuuEUd8i7MydbGphmVZFMNrLBam2tNUEWAC
 1GoZkt+lPWmpdMAd6CbhzsOU8LP0G0zgGniCtQsOEqmmccyAbFTAn017Y0e1x/Yuptbx5TwK
 bhi7m164kCZJyz17YfYhmQ3jXMA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eab1516.7f27703a0650-smtp-out-n04;
 Thu, 30 Apr 2020 18:12:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31282C433F2; Thu, 30 Apr 2020 18:12:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4822C433D2;
        Thu, 30 Apr 2020 18:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4822C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 30 Apr 2020 12:12:33 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, robh@kernel.org, robin.murphy@arm.com,
        saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Add sc7180 compatible string
 and mem_iface clock
Message-ID: <20200430181233.GA21991@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sharat Masetty <smasetty@codeaurora.org>,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        dianders@chromium.org, robh@kernel.org, robin.murphy@arm.com,
        saiprakash.ranjan@codeaurora.org
References: <1588219187-19295-1-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588219187-19295-1-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 30, 2020 at 09:29:47AM +0530, Sharat Masetty wrote:
> This patch adds a new compatible string for sc7180 and also an
> additional clock listing needed to power the TBUs and the TCU.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
> v2: Addressed review comments from Doug
> 
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 6515dbe..ba5dba4 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -28,6 +28,7 @@ properties:
>            - enum:
>                - qcom,msm8996-smmu-v2
>                - qcom,msm8998-smmu-v2
> +              - qcom,sc7180-smmu-v2
>                - qcom,sdm845-smmu-v2
>            - const: qcom,smmu-v2
> 
> @@ -113,16 +114,23 @@ properties:
>        present in such cases.
> 
>    clock-names:
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - const: bus
>        - const: iface
> +      - const: mem_iface

Hi Sharat -

I think there was a bit of confusion due to renaming between downstream and
upstream.  Currently for the sdm845 and friends we have:

  clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
     <&gcc GCC_GPU_CFG_AHB_CLK>;
  clock-names = "bus", "iface";

Confusingly these same clocks downstream are "mem_iface_clk" and "iface_clk"
respectively.

It looks like you are trying to add GCC_DDRSS_GPU_AXI_CLK as "mem_iface" which
was formerly "mem_clk" downstream. I'm not sure if the naming change is
intentional or you were trying to make upstream and downstream match and didn't
realize that they were renamed.

I'm not sure if we need DDRSS_GPU_AXI_CLK or not. Empirically it works without
it for sdm845 (I don't have a sc7180 to test) but we should probably loop back
with either the clock team or the hardware designers to be sure there isn't a
corner case that is missing. I agree with Doug that its always best if we don't
need to add a clock.

Jordan
> 
>    clocks:
> +    minItems: 2
> +    maxItems: 3
>      items:
>        - description: bus clock required for downstream bus access and for the
>            smmu ptw
>        - description: interface clock required to access smmu's registers
>            through the TCU's programming interface.
> +      - description: clock required for the inner working of SMMU TBUs and the
> +          TCU like the pagetable walks and the TLB flushes.
> 
>    power-domains:
>      maxItems: 1
> --
> 1.9.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
