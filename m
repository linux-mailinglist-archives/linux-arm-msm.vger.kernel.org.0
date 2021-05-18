Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33AA3877F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 13:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348842AbhERLp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 07:45:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:50606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232135AbhERLpZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 07:45:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E348D60BD3;
        Tue, 18 May 2021 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621338247;
        bh=GQE2pVO9cx/yFT3UleJdC34JYrbkS1RYkOi16h4iQ4o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Oc/uCeMizAfzxGtZv/0hlMAxKzwGS8/rMB2vG9biUNe5LO8SX7ywB/HsE1kCOvXqv
         1ntuxA2Q0xHYlrm+MQEOMYKqk8dZpxXIDcnReKF7EG/Z+Je/FNPdjMRuvscsXBcxWj
         CiUSA14aImGDLJb7GQ0TQBZNgqPOdZpo1PjxzVqwpC/SkS3M6HGOKtgcK9aTUvnZT9
         ohNgIMblP6pz7d622xJaPrFyNUnk0RxAEGzR5FQfdrc5bmNIB0dd+i5DaTxi265OZ4
         IYFtL3Iv4lr30miUl8Joa5x+pbHIg3RC++hLf7BVyaY8SOdMEPHHucVSjl7PjAh5V2
         qKS8Z1FnXmSpA==
Date:   Tue, 18 May 2021 17:14:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V4 2/8] arm64: dts: qcom: sc7280: Add
 thermal-zones node
Message-ID: <YKOog43JZghth3Np@vkoul-mobl.Dlink>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
 <1621318822-29332-3-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621318822-29332-3-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-05-21, 11:50, satya priya wrote:
> Add thermal-zones node for SC7280 SoC.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in RESEND V4:
>  - No Changes.
> 
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 2cc4785..2a7d488 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1125,4 +1125,7 @@
>  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
>  	};
> +
> +	thermal_zones: thermal-zones {
> +	};

Empty node..? what am i missing here...

-- 
~Vinod
