Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0372D66534B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 06:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235848AbjAKFTI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 00:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbjAKFSB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 00:18:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74D5913D6E;
        Tue, 10 Jan 2023 21:09:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5657361A36;
        Wed, 11 Jan 2023 05:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31ACFC433F0;
        Wed, 11 Jan 2023 05:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413788;
        bh=vNqGe0ixFONl/HbH6m0D+zXrAnunWaWXC9ii2nGTRkI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TW8QTjXTrNkpxk29V0XX9D03wy2hXRdWIGfZhnc/C7C154vFzJJAjELDswaLWfF6m
         Y2yOVCJuQUHDttQi+CIsgUGXcTCl6wAIvbVjLI2zrNPwHGoTrMutbZ1MZgN2VJveYX
         NpBm9cH9zyZjS5z7fV3VW6tpnQqAQjYDDLqQjbHkoerLiekuUKSj6xXI/8FgnsnT7k
         gW+CIW/70kFBcg5YxmyiwhnozcTeAovaS4n63y8LZjcve6x/Orfrt7Y+2WhOybQ0a1
         ieZQx3CDAKwPSNvVf+HYDsT7zH8T/qrvUBA64N9QaZAuiiSHOoi5LDy4tYfq791rI2
         BZH/WdscjHtrQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/3] clk: qcom: dispcc-sm6115: use parent_hws for disp_cc_mdss_rot_clk
Date:   Tue, 10 Jan 2023 23:09:13 -0600
Message-Id: <167341377720.2246479.16270801401587317592.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
References: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 10 Dec 2022 22:07:10 +0300, Dmitry Baryshkov wrote:
> Rework disp_cc_mdss_rot_clk to use parent_hws instead of parent_names.
> 
> 

Applied, thanks!

[1/3] clk: qcom: dispcc-sm6115: use parent_hws for disp_cc_mdss_rot_clk
      commit: 4c261dfd5e39ab7512f8df8fc459663bab55488c
[2/3] clk: qcom: gcc-sm6375: use parent_hws for gcc_disp_gpll0_div_clk_src
      commit: 7069b91ac2cd682a681ed2f0125bccd76b777d86
[3/3] clk: qcom: gcc-sm6375: use parent_hws where possible
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
