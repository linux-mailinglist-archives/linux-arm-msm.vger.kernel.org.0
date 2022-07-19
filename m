Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8555857A7C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jul 2022 21:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239739AbiGST6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jul 2022 15:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240013AbiGST5p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jul 2022 15:57:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 839715F998
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 12:57:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E15E561927
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Jul 2022 19:57:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A024C36AE2;
        Tue, 19 Jul 2022 19:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658260636;
        bh=YhW21QMLwSVKvPPwBDPq0FP9/l/ZC8heG1iNknMTX9Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CME/D3RLyVJKigtZx6kw9wcQLFAbZH78IWR8rW7OWDjaOX9EaBfgj4aMA43r5G7wS
         6Q6/3BDbsxxZBpHLghfGaR6slRxQdnK0eJLdGuutojlAwmlZqLOK1oh3ce6tYQP4OJ
         a0nHoDuY8LnRvzIDOh1c3IA3RFDU7tGli2Laqv8WNo4L3wV+N+X5lBvTt0i5k3SE9+
         flKxcBGOwk+v6LyKUJ7+1BuY9PcQC2Vn28ACGDSu4UGw134pKz1Z4FCPrmMKjSuuUc
         enmWHWDhu97HNoGoOX/v0RpUVUMszkW+QxzRqcbFcvTJ29FTpqTVGkc8DBPrdvTltU
         8ihND0dZRW7Tg==
From:   Will Deacon <will@kernel.org>
To:     robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, joro@8bytes.org, Liang He <windhl@126.com>,
        robdclark@gmail.com
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu: qcom_iommu: Add of_node_put() when breaking out of loop
Date:   Tue, 19 Jul 2022 20:56:55 +0100
Message-Id: <165825181062.2951540.268101544682654909.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220719124955.1242171-1-windhl@126.com>
References: <20220719124955.1242171-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 19 Jul 2022 20:49:55 +0800, Liang He wrote:
> In qcom_iommu_has_secure_context(), we should call of_node_put()
> for the reference 'child' when breaking out of for_each_child_of_node()
> which will automatically increase and decrease the refcount.
> 
> 

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu: qcom_iommu: Add of_node_put() when breaking out of loop
      https://git.kernel.org/will/c/a91eb6803c1c 

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
