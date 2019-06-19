Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 787B14C080
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 20:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfFSSGp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 14:06:45 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34970 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbfFSSGp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 14:06:45 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EBC4960E7A; Wed, 19 Jun 2019 18:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560967604;
        bh=cRtFEDEdDY9qsoG0YiGJNOgq+ZtfuWbo77zTDOq85pc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h8boX3gfLvHoD8JdAII+iqLZgXN94ujkMws7Iw1Xs2y+qJN03j0bx8lO191jkhuFN
         M7aDsrRPTVkVycLjXKPf79NoKd5BgB2NZrCEc0KE0nxeUwq/6vs/BiWPue+y3yXU2n
         8prf7UaWzqV2+zP/UwZpx3g+DgTKnNtAY/FzZtQ8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6AC5E60767;
        Wed, 19 Jun 2019 18:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560967599;
        bh=cRtFEDEdDY9qsoG0YiGJNOgq+ZtfuWbo77zTDOq85pc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=chg/Ig6T36Zu2mJ+jaUuwXT7prZ20QYxzrpLnZeHwBzVxdn/36etOP0FWgkY7yFWX
         ++O1Gkqp7x90PwUN1sI65+ui+frWbhHLbDNxHtSXoJgoSKsYK7xBjcUXNl/yvqj2qC
         4mzpmqT4Dvj/+YwrN37+lrGy2JLjBpvJgTrILZVw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6AC5E60767
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 19 Jun 2019 12:06:36 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, jonathan@marek.ca, airlied@linux.ie,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
        daniel@ffwll.ch, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 2/6] dt-bindings: display: msm: gmu: add
 optional ocmem property
Message-ID: <20190619180636.GB17590@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Brian Masney <masneyb@onstation.org>, agross@kernel.org,
        david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, jonathan@marek.ca, airlied@linux.ie,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
        daniel@ffwll.ch, freedreno@lists.freedesktop.org
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-3-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190616132930.6942-3-masneyb@onstation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 16, 2019 at 09:29:26AM -0400, Brian Masney wrote:
> Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> optional ocmem property to the Adreno Graphics Management Unit bindings.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> index 90af5b0a56a9..c746b95e95d4 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> @@ -31,6 +31,10 @@ Required properties:
>  - iommus: phandle to the adreno iommu
>  - operating-points-v2: phandle to the OPP operating points
>  
> +Optional properties:
> +- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> +         SoCs. See Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml.
> +
>  Example:

You should add a full-fledged a4xx example here including a ocmem phandle.

Jordan

>  / {

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
