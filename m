Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB95E5663BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jul 2022 09:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbiGEHGv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jul 2022 03:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbiGEHGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jul 2022 03:06:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A17113D60
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 00:06:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7BD39B815D1
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jul 2022 07:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BD5C341C7;
        Tue,  5 Jul 2022 07:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657004762;
        bh=JuxPHcscnCdhBmCyzUqLY6LtYcRD7zdj6liGaoCfEeA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mYCrqfiYj6j9LTbVm48v9QaE7rXnoIzm/SuvR17kK/uUVeuTFW1s+XXnZ6EcJe/jq
         oNPDP/n9r2FBNQuOpKbiRzzF+GyUCBBxM92RBiBTwrWiDPck2H+9eQ/A1epagOBfnU
         1hbMdOd8VayqWJmpa1dzC7CR1HVByljcMvKWSSQGCJ++0EY2D2+NWRciV7j4GoHC4u
         vsgW6KJ1P+6xjmGky1B0lpLpgXEnpfUno6NJFrIKqdLAi6qSP+9XZ9hYiX7UA/JIw5
         sr/oG1f2jZyC2ySj3uS5WE4LB5eAghG+0gu32HvZkZ9d3pCCZ2Nu6Sabl8Xj57lsXA
         cClfmPVi3w5VQ==
Date:   Tue, 5 Jul 2022 12:35:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan@kernel.org>
Subject: Re: [RFC PATCH 00/28] phy: qcom-qmp: split register tables
Message-ID: <YsPi1jI2nWfxGOyH@matsya>
References: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610190925.3670081-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-06-22, 22:08, Dmitry Baryshkov wrote:
> As discussed during sc8280xp PHY review, rework and split QMP register
> tables. Create separate files for most of QMP register kinds. The only
> things left are various DP registers, which will be handled separately.

This fails for me on patch 2, can you please rebase on my next later
today and resend. I would like to merge this for current cycle..

-- 
~Vinod
