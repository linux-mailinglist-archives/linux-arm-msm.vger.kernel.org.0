Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B746542777
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 09:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232242AbiFHHEz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 03:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350628AbiFHF7b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 01:59:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDA24198DA
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jun 2022 21:45:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C76CF6193E
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jun 2022 04:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38246C34116;
        Wed,  8 Jun 2022 04:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654663525;
        bh=R6Xo1YvH0iFNdmL0mjGM5aiDNUJDlpFLuABV7ZxFy3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ac6o6WfkLerqFddjOq9ta1T8t7eaQkrbRahFgXV9P0JxlXI8xY2MOVqtQvE9guXD1
         kcsL1YAkxjMeG4MH52tk57ojHBr3c1bdU9TioU4DFbiaz6rL7j4uPDPtZ/4XpIRSb4
         k+JXHiX61g9yeqxZYC+7eKMa7UZHBs2yvA+bQpmIxE/Z74qNO6KbOBedoegj0zJmVo
         9urHzGbfMTU+s3ulZLTzaV4csYL5AW15nBlFJCTCvlXJciSI6KBuCjzZhcchj6fDOY
         XEYltArAZ4sxXu4lhpo6wF2IA/p4F3blj1LNm64CpAKKF7vpBhKjxg+R6Ug2YhG07l
         HYy1E7WeABuvA==
Date:   Wed, 8 Jun 2022 10:15:20 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v1 00/30] phy: qcom-qmp: split the QMP PHY driver
Message-ID: <YqApYChLEIbvHbbz@matsya>
References: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607213203.2819885-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-06-22, 00:31, Dmitry Baryshkov wrote:
> While adding support for the PCIe EP mode support to the QMP driver I
> couldn't help but notice that the QMP PHY driver has slowly become the a
> beast with tons of conditions and corner cases being inserted here and
> there.r
> 
> This an RFC for an attempt to to cleanup the QMP driver by splitting the
> QMP PHY driver into five smaller drivers, each targeting a particular
> family of PHY backends (DP/combo, PCIe, UFS, USB and a separate driver
> for the MSM8996 PCIe PHY). Yes, this results in some code duplication,
> but I hope that the end result is still better than the current
> situation.

I have applied this to testing and if all good should be in next in a
day or so.

Thanks for doing the big change

-- 
~Vinod
