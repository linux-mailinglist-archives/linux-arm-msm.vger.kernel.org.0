Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43CEF24D06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 12:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbfEUKmS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 06:42:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:52598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727571AbfEUKmS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 06:42:18 -0400
Received: from localhost (unknown [223.186.130.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E2CF2173E;
        Tue, 21 May 2019 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558435337;
        bh=rVM3KmjOp0zK7/WO0Do7OaoRxedBm1NHHJ8zm8Mz0M0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0/xS6lfDoYXfzlDvsgRro4RFoQ2YBk3FFxStoiSPFrKZ1Pqax59Go7YMi67M9vGeM
         SvLpkqjz2i3L09HtDC6FiVbiGEfffMfe1kXxMb+obkVMmRC3G19lLFJWVy4Jfke0Yz
         heUaSiFJmDHL6+GXeVZnXGVp5+3YXv4/Ee3jqPBg=
Date:   Tue, 21 May 2019 16:12:11 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/4] dt-bindings: soc: qcom: Add AOSS QMP binding
Message-ID: <20190521104211.GF15118@vkoul-mobl>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190501043734.26706-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-04-19, 21:37, Bjorn Andersson wrote:
> Add binding for the QMP based side-channel communication mechanism to
> the AOSS, which is used to control resources not exposed through the
> RPMh interface.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v6:
> - Added #clock-cells
> 
>  .../bindings/soc/qcom/qcom,aoss-qmp.txt       | 81 +++++++++++++++++++
>  include/dt-bindings/power/qcom-aoss-qmp.h     | 14 ++++
>  2 files changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
>  create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> new file mode 100644
> index 000000000000..14a45b3dc059
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> @@ -0,0 +1,81 @@
> +Qualcomm Always-On Subsystem side channel binding
> +
> +This binding describes the hardware component responsible for side channel
> +requests to the always-on subsystem (AOSS), used for certain power management
> +requests that is not handled by the standard RPMh interface. Each client in the
> +SoC has it's own block of message RAM and IRQ for communication with the AOSS.
> +The protocol used to communicate in the message RAM is known as Qualcomm
> +Messagin Protocol (QMP)

s/Messagin/Messaging?

Rest lgtm:
Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
