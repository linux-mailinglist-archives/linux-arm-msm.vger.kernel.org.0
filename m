Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2419665345
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 06:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235809AbjAKFTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 00:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjAKFR7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 00:17:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02FF13D62;
        Tue, 10 Jan 2023 21:09:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8C0FC61A35;
        Wed, 11 Jan 2023 05:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57187C433F1;
        Wed, 11 Jan 2023 05:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413787;
        bh=I+5Qhk1YGIPItiodgq6H4vX2IEHQ/URpEnwNpNjAFuk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e7AjA8P5/3CzgPXBfuUNDo8ykEP4a8mlFfPMnETH0/FUKtcUoOW0li213AD7NttKf
         z+zXia8GKhvaHLiDz9v9Drx3KMpp44xyDth6Rz27IE1OZ3CyA6rbZ0KGb3GVz/qdLJ
         c0z3GVnFsnTezHRvfFsaIUHB17EpzFEdfaW4wFjifrO02XXeYN/X5+2Aih8mlSP6Qj
         Q6tw7OwMOuL6AGMvXySBlrq6Btat6vNl3OISODgUTximqlO18/h4v418qzPZJlWP8m
         PK+NUww4v7edDStcn0vfIM7JC8ryxVyk84bmJquITRYQWVk9b63d5+NMJ5/eSf7DC5
         azeGTtgZAXf1A==
From:   Bjorn Andersson <andersson@kernel.org>
To:     quic_tdas@quicinc.com, dmitry.baryshkov@linaro.org,
        konrad.dybcio@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-msm8974: switch from sleep_clk_src to sleep_clk
Date:   Tue, 10 Jan 2023 23:09:11 -0600
Message-Id: <167341377731.2246479.9359454249644729965.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221228203725.3131237-1-dmitry.baryshkov@linaro.org>
References: <20221228203725.3131237-1-dmitry.baryshkov@linaro.org>
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

On Wed, 28 Dec 2022 22:37:25 +0200, Dmitry Baryshkov wrote:
> gcc-msm8974 uses the registered sleep_clk_src clock, which is just a 1:1
> fixed factor clock register on top of the board's sleep_clk. Switch the
> driver to use the board sleep_clk directly.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-msm8974: switch from sleep_clk_src to sleep_clk
      commit: e09327d7be354e2fbc9232b1906b993ead872431

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
