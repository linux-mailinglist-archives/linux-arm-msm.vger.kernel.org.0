Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95E847D1E00
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Oct 2023 17:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjJUPy6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Oct 2023 11:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbjJUPy5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Oct 2023 11:54:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA32135;
        Sat, 21 Oct 2023 08:54:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B1DC433C9;
        Sat, 21 Oct 2023 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697903695;
        bh=rcEYEWKYNxS47UPMQRuxqJFK+sR94sFCOFCn6b91mRs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q8Qix3ePnoIddfIR+8Vsx5eXpvPP7imE26F4bbMGGMV+NPQ1ce39Ms1kETMNQG5l6
         pltvWjCIP2o2XTQenuNolhunYhQD+DQ/l0ON/9wj1IG5GzFNKvm1nASzOIplCp1WUS
         6RD5GCPfM93+OGWXkvZG2jL9ybyUSSfyA/DMVGWXtqY5+vveSVnTwBAczCw+vhTo7I
         5n1DbORKNViG2sI7cwcpHBfW9T2u09Rpa3Xhs0+TETQtEE5YUXNzD0f7lQsTzoMXd2
         +7Fn1pgcRmbpzyK7EzSCr8/H3v5Drnfp1z8VBL0zDFWn4OAbw6NZ78MDAdHk8RARxu
         t+ybrdPE0yBTQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Subject: Re: (subset) [PATCH 1/2] clk: qcom: gpucc-sm8550: switch to clk_lucid_ole_pll_configure
Date:   Sat, 21 Oct 2023 08:58:31 -0700
Message-ID: <169790390709.1690547.3509014745837126552.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
References: <20231016084356.1301854-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Mon, 16 Oct 2023 11:43:55 +0300, Dmitry Baryshkov wrote:
> Instead of manually specifying the RINGOSC_CAL_L and CAL_L values in the
> alpha_pll_config.l field, use the proper clk_lucid_ole_pll_configure()
> function to configure the PLL.
> 
> 

Applied, thanks!

[1/2] clk: qcom: gpucc-sm8550: switch to clk_lucid_ole_pll_configure
      commit: 21134ec8af94981b3127a691df2d73540ba4d8aa
[2/2] clk: qcom: videocc-sm8550: switch to clk_lucid_ole_pll_configure
      commit: a2620539ae2529916a98585c6d7311c48fb67e9f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
