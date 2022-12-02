Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6B3A640F98
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 21:59:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234415AbiLBU7G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 15:59:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234237AbiLBU7B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 15:59:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E36FEAB48;
        Fri,  2 Dec 2022 12:59:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A5EE623E6;
        Fri,  2 Dec 2022 20:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2002C433B5;
        Fri,  2 Dec 2022 20:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670014740;
        bh=C+OOs3ift7Qn1hBldr6MW1vQyMByxjQ4Hd8vLs82VqY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ON2gfdUNbvJF+9zLAKiDPGcYptir1BFMnvYqnZ4lTzDy4M5ub6IcU1m+0eIW2n+9x
         hu2sIRqiKbHU2ZamAubiGrZjBC17bcC+jKuIBIz5LAdsd4H8kIax8MJFMQY7o0cx4Q
         HjyVDvACRTVdC1Av2p1GDUtL3vnaq3MM9KJrmyaJgHiaomB0PJyOeB1HId5UnTSuMU
         zuGwG11kl9vF/wyPsWikCG3lknvN6efqqHd62LqaDAnYW4EzdZt+bKZRBeYyj1DllS
         T9oRBkO+h+Oz+6obKPkqA8oaACc8MWgr0oCjliffYa6iOoO0Q4aI0CMY5NNSJOHr1N
         DAFbG65RzRfYw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, sboyd@kernel.org,
        quic_tdas@quicinc.com, Konrad Dybcio <konrad.dybcio@linaro.org>,
        agross@kernel.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, elder@linaro.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 0/8] clk: qcom: rpm/rpmh: drop platform names
Date:   Fri,  2 Dec 2022 14:58:46 -0600
Message-Id: <167001472432.2721945.15938867197458182832.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
References: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
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

On Fri, 2 Dec 2022 20:58:35 +0200, Dmitry Baryshkov wrote:
> Both RPM and RPMH clocks use platform (SoC) as a part of the clock
> definition. However there is nothing really SoC-specific in this
> part. Using it just leads to confusion and sometimes to duplication of
> definitions. Drop the SoC name where it is logical.
> 
> Changes since v2:
> - Additional rework of ARC/VRM clock handling as suggested by Alex
> 
> [...]

Applied, thanks!

[1/8] clk: qcom: rpmh: group clock definitions together
      commit: 82349cc0d1f70df9436da2f565ec10aadf1c3680
[2/8] clk: qcom: rpmh: reuse common duplicate clocks
      commit: 65b0c564a34f38832b25b0f5769e9cdf9e5faefd
[3/8] clk: qcom: rpmh: drop all _ao names
      commit: 012c226fc68afe32acd7da01a0c2d2e483143bd4
[4/8] clk: qcom: rpmh: remove platform names from BCM clocks
      commit: fe20294f4b7b180acc1ab7dcb7feff8601c76d7d
[5/8] clk: qcom: rpmh: support separate symbol name for the RPMH clocks
      commit: 49e4aa233c6c239f814e8872d6757455e49e8106
[6/8] clk: qcom: rpmh: rename ARC clock data
      commit: 166eb3eb3bb394255a9a8aa4cadbba5567ba184a
[7/8] clk: qcom: rpmh: rename VRM clock data
      commit: 6ad844d739ee57779d3814fe3c9f97dff68719b2
[8/8] clk: qcom: rpmh: remove usage of platform name
      commit: ec304d02b988132ac037c5b41fe375950c55de87

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
