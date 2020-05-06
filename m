Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8F931C66AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2020 06:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgEFERh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 May 2020 00:17:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:57498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725300AbgEFERh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 May 2020 00:17:37 -0400
Received: from localhost (unknown [122.181.213.114])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 40E57206D5;
        Wed,  6 May 2020 04:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588738657;
        bh=naqyp/H03c6y4iLNNY9qG1yMwqkqKKJO6Juu0Kr3MXI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eyh+xxkUnMKs8UNQTwVOGAznBrv+Cz2ViPf6RD+unlnTEZkU9EIttDjVHxdZXqN9C
         xWcOZ8NsPEMwCbJ756utNRX6RlRGBKxXUWgDtVC2CmIwHD7BGCnjH2M+uvxuToMm86
         di8GKLOnviCzLvLfMpUPAaKEQSUALYkdqm64d2AA=
Date:   Wed, 6 May 2020 09:47:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, kishon@ti.com, robh+dt@kernel.org,
        mark.rutland@arm.com, p.zabel@pengutronix.de,
        mgautam@codeaurora.org, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, jackp@codeaurora.org
Subject: Re: [PATCH v8 1/5] dt-bindings: phy: Add binding for
 qcom,usb-snps-femto-v2
Message-ID: <20200506041732.GY1375924@vkoul-mobl>
References: <1588636467-23409-1-git-send-email-wcheng@codeaurora.org>
 <1588636467-23409-2-git-send-email-wcheng@codeaurora.org>
 <20200505133408.GA24731@bogus>
 <d1b6c7f2-69d8-027d-267d-22018484441e@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1b6c7f2-69d8-027d-267d-22018484441e@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-05-20, 12:38, Wesley Cheng wrote:
> 
> 
> On 5/5/2020 6:34 AM, Rob Herring wrote:
> > On Mon,  4 May 2020 16:54:23 -0700, Wesley Cheng wrote:
> >> This binding shows the descriptions and properties for the
> >> Synopsis Femto USB PHY V2 used on QCOM platforms.
> >>
> >> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> Reviewed-by: Stephen Boyd <sboyd@kernel.org>
> >> ---
> >>  .../bindings/phy/qcom,usb-snps-femto-v2.yaml       | 77 ++++++++++++++++++++++
> >>  1 file changed, 77 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
> >>
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.example.dt.yaml: phy@88e2000: 'vdda-pll-supply' is a required property
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.example.dt.yaml: phy@88e2000: 'vdda18-supply' is a required property
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.example.dt.yaml: phy@88e2000: 'vdda33-supply' is a required property
> > 
> > See https://patchwork.ozlabs.org/patch/1283143
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure dt-schema is up to date:
> > 
> > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> > 
> > Please check and re-submit.
> > 
> 
> Hi Rob,
> 
> I updated the dt-schema version, and I can see the same error.  Will fix
> and resubmit.  I also realized that the dt_binding_check doesn't stop if

No, pls submit the fix against already applied patches and also give
credit to Rob by adding a "Reported-by: ..."

> errors are detected in the example DT checking phase, and that was
> probably why I missed this initially.  I'll pass the DT_SCHEMA_FILES
> argument to my specific binding next time to help verify my file.
> Thanks again!
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 
~Vinod
