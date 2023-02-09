Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12A1D68FF01
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 05:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229891AbjBIEcG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 23:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbjBIEbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 23:31:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB133F2B3;
        Wed,  8 Feb 2023 20:31:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BC7A9B81FFE;
        Thu,  9 Feb 2023 04:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34B2C433D2;
        Thu,  9 Feb 2023 04:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675916495;
        bh=cmAAlaggc8+dInkzVG1qeauvQxpytHMiQu8/X/ywRuw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bMGQHqq5+pqC1jX4yBL4KMgoKi8xdk6oQ/4Zl/tGr1zqRBi6q2WmCvqU/UJroJPxG
         x9g4jmsgoU66v+AwonJpOmzAzcECJNvg5OM/8SEySlBNV4xxiOeNf/TL3nECKGFcXL
         5Klx/PVFfsc1gay2v7lPOQa7ucGWAb+ChxBJgAVZ6QxGTSXtyb7/tvcz2W1r4uMF0g
         Pdj/Qf1yia6ud7hLHVhl03VnJm2rdCGe8dI+xmh6c6SKFeiE4+9C2xeKqhesg8Yf2h
         kYbE+AXdsS5Usr7rsJauN/vSCBhWz3Hq2oxZzuUuwlN0MKMwenzDLJkIh966HYMuZH
         c1D9wQwxbi17w==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/2] clk: qcom: gpucc-sc7180: fix clk_dis_wait being programmed for CX GDSC
Date:   Wed,  8 Feb 2023 20:22:51 -0800
Message-Id: <167591660370.1230100.9603650327967651533.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201172305.993146-1-dmitry.baryshkov@linaro.org>
References: <20230201172305.993146-1-dmitry.baryshkov@linaro.org>
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

On Wed, 1 Feb 2023 19:23:04 +0200, Dmitry Baryshkov wrote:
> The gdsc_init() function will rewrite the CLK_DIS_WAIT field while
> registering the GDSC (writing the value 0x2 by default). This will
> override the setting done in the driver's probe function.
> 
> Set cx_gdsc.clk_dis_wait_val to 8 to follow the intention of the probe
> function.
> 
> [...]

Applied, thanks!

[1/2] clk: qcom: gpucc-sc7180: fix clk_dis_wait being programmed for CX GDSC
      commit: 658c82caffa042b351f5a1b6325819297a951a04
[2/2] clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
      commit: cb81719e3c1165ef1bc33137dc628f750eed8ea4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
