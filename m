Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97291434F20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 17:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhJTPgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 11:36:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:53820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230156AbhJTPgA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 11:36:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33CFB6138D;
        Wed, 20 Oct 2021 15:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634744026;
        bh=jBdWab4OKhYc8JaRPHjIC13TNSnNaWnujTT2HR8+MKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B9idrXL7JpUuXPnOOCwXygUCkvEED4EztCPUYeEKntUYf26Hvo2zODzUwx1NCxjMd
         y/+QGzCd4UfPUwIB7fS0PdGZufeejaL/q8495wnjhMynw80plzsc2znJVG1MsnExnX
         6/qMPpe0Y8/WdWBo2Pjucjyz0LA0nKwS2tafQXRDXT6vzqzAAxWqxn6GlEKNYbUn09
         7QQH06EeVyxaY6k4yUKQuWXiwk/zV697ptqCa0sUjFB69vhUMNzPS9z4MxmSQJsPIW
         qpTKyEwP2orU1+n8i3kMbR1tCYy3UODUVwj9ccpOaIUxkHJcMoFIOAeHIr/D3LOO5Z
         dVi8I3uY4d/aA==
Date:   Wed, 20 Oct 2021 21:03:42 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 02/10] dt-bindings: phy: qcom,qmp: IPQ6018 and
 IPQ8074 PCIe PHY require no supply
Message-ID: <YXA21jWvAugDZikX@matsya>
References: <20210929034253.24570-3-shawn.guo@linaro.org>
 <20211020130634.26194-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020130634.26194-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-10-21, 21:06, Shawn Guo wrote:
> The qmp-phy driver suggests that 'vdda-phy-supply' and 'vdda-pll-supply'
> are not required for IPQ6018 and IPQ8074 QMP PCIe PHY.  Update the
> bindings to reflect it.
> 
> While at it, also correct the clock properies for IPQ8074 QMP PCIe PHY.

s/properies/properties

> And as the result, 'qcom,ipq8074-qmp-pcie-phy' and
> 'qcom,ipq6018-qmp-pcie-phy' share the same clock, reset and supply
> bindings.

I have fixed that up while applying and also picked the Ack from Rob
(please pick those when resending)

Thanks
-- 
~Vinod
