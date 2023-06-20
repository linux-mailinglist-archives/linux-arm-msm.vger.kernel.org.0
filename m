Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7122B73757B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 22:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjFTUA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 16:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjFTUAZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 16:00:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46FB11716;
        Tue, 20 Jun 2023 13:00:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CAC3E6119E;
        Tue, 20 Jun 2023 20:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D35C433C0;
        Tue, 20 Jun 2023 20:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687291223;
        bh=8ne3WggJibkcVDXdme/7YxBMV+tnAI6zpdWZ2KkFQB4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nYmNKWvADgzVHi8IV9OxofdL0beaMKMwaYTPpoEmSwlozu7JsFU0P4oKiqHKKPYS6
         wsosdFw7YDM0UgL9vyKWowssMyOd4waGyCfCzVHqr4NXYS0LpPFNZ+h01JOskEkgvr
         4Tk612OUZWxFaso9L+bYdonjeHKS8y/gbkeonfRyWyUNsscPvHvYXNd3KImTy3hhnC
         43bGFwIpx46yYjaUllN3wmgQfOOn/2xYZFoRzKphZzarO//yaVZHEi2Yxr5UfcH8UH
         4beWODq0QsX0KJTda4FbRTWNZJX4+GBE8bAsXNw/qjgvVQ39henJY6KlL6GRvr5kNM
         0PPXr5fiYpuvg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] clk: qcom: mmcc-msm8974: use clk_rcg2_shared_ops for mdp_clk_src clock
Date:   Tue, 20 Jun 2023 13:03:36 -0700
Message-ID: <168729141436.721186.9010041163444104014.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 07 May 2023 20:53:34 +0300, Dmitry Baryshkov wrote:
> The mdp_clk_src clock should not be turned off. Instead it should be
> 'parked' to the XO, as most of other mdp_clk_src clocks. Fix that by
> using the clk_rcg2_shared_ops.
> 
> 

Applied, thanks!

[2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
      commit: 4e13c7a55cf752887f2b8d8008711dbbc64ea796

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
