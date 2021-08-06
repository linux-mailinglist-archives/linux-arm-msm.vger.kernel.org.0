Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7E53E2B20
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Aug 2021 15:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343960AbhHFNFa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Aug 2021 09:05:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242837AbhHFNF3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Aug 2021 09:05:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F33C6108D;
        Fri,  6 Aug 2021 13:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628255114;
        bh=Zd789UenWRtQvSgkx9CiMDX4rF3YK1hK1iZn2TMubQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RJsX2ly9M9pX0z33O7ytp8UTrW934KjJRYQcPakhtTL6rO0axQ7ABhZtPK7aCCo/0
         qBH68ztc5cU5NMOql46nV1ivqi3ZldVlI4NFNdAOeE8mYzeYIXR7HM2XY2KFKsKcot
         pIvC/6rx3mqp6TpGQX2DGWjKB/Ul8iMHYhFnQ8/93aJVF+WDVn9DJG+tqQdVoFzgfs
         paiBZVHrfe8P6H+4gYj0B8gCrPAHTwk4NUCbXgF7xdEkcG0K7cqMfItLR6vFbIzkJG
         SKuNYgOmdGQ3P3eQSx5+2wUazX9j+fJT8VPb+RH3RDi3UsHDu8qJPRct3JnAr1HXlS
         IXJjLpBC+0siQ==
Date:   Fri, 6 Aug 2021 18:35:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Balaji Prakash J <bjagadee@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,qmp: Add IPQ6018 USB3 PHY
Message-ID: <YQ0zhaTVI8KVNpVR@matsya>
References: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d86f45004fe2fcbae0a2cd197df81a1fd076a1e.1628085910.git.baruch@tkos.co.il>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-08-21, 17:05, Baruch Siach wrote:
> Add compatible string for USB3 PHY in Qualcomm IPQ6018 SoC.

Applied, thanks

-- 
~Vinod
