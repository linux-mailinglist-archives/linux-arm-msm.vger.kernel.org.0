Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE96C623C5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 08:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbiKJHIV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 02:08:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbiKJHIV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 02:08:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF5614016;
        Wed,  9 Nov 2022 23:08:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0889061D9F;
        Thu, 10 Nov 2022 07:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88273C433C1;
        Thu, 10 Nov 2022 07:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668064099;
        bh=KlgwPbPJdZlbA8h/JRcQCOsToBsF/L88achaEzvG5/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fo4bQ/F4Ws1IPuNAtjxXf5aZUSsjkOUm3DhuNsBXthMvIw0DcaBd1L37Fbu6RgjAa
         IfSuHbY9tw0V3Of65prbZV/uZIEetT2QeFDbGo5ZU2CghUcIZ76sLbR5z0bPv7xf1P
         tRFEyBNEUNxKp315eDz9+Ms2a0aW9HQaqA8vpOX4Pv7MiBw0cGWNtsPpGU07vnB02/
         xVLXb9BiCiDuvQOAAnNDVnt2kO9+Kx8AONLB0HVGOX3GtH7GAHr+8bwGgHN3zX9sEm
         sgI2oWAvxESSBYEHjmxR3TokLpboyiuzYIzRm3322X961si8XMgwcTH0oCC1OIU8rN
         h9SwevURL7ZYQ==
Date:   Thu, 10 Nov 2022 12:38:15 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Robert Marko <robimarko@gmail.com>
Subject: Re: [PATCH 1/2] phy: qcom-qmp-pcie: split pcs_misc init cfg for
 ipq8074 pcs table
Message-ID: <Y2yjX+iVbE0CRE6n@matsya>
References: <20221103212125.17156-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103212125.17156-1-ansuelsmth@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03-11-22, 22:21, Christian Marangi wrote:
> Commit af6643242d3a ("phy: qcom-qmp-pcie: split pcs_misc region for ipq6018
> pcie gen3") reworked the pcs regs values and removed the 0x400 offset
> for each pcs_misc regs.
> 
> This change caused the malfunction of ipq8074 downstream since it still
> has the legacy pcs table where pcs_misc are not placed on a different
> table and instead put together assuming the offset of 0x400 for the
> related pcs_misc regs.
> 
> Split pcs_misc init cfg from the ipq8074 pcs init table to be handled
> correctly to prepare for actual support for gen3 pcie for ipq8074.

Applied, thanks

-- 
~Vinod
