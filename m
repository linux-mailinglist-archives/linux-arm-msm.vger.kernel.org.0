Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A357571311D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 May 2023 03:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237904AbjE0BDu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 21:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237823AbjE0BDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 21:03:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9FD189;
        Fri, 26 May 2023 18:03:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5CF9E654BC;
        Sat, 27 May 2023 01:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23315C433D2;
        Sat, 27 May 2023 01:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685149427;
        bh=GJ7cYJWeQJhb+HiYmRPVbCUSxJILCqAnWPeUSMTkPSs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I/hd52c7c04bxzJEsSYAgD07T/FAowXoJZtfJT0fxvy17aUL2PfC7DZnuvdCMdycf
         l4IoC0pE7tum/j7PMX1Qc0dFsH89hQbV38QjkYW+ruc4xQYui3ynTF04DvcZVXw+v9
         Atk/ChCq297jPqRYILWrgqNVaQKR7A3/xs6xq9Y4bCURp8c7JJnK/P8pPLtEfQDsny
         xb5JhsJnMO2dwYuEho59BRDKhf75RddILP1Zso4v6GcOy6aZmu1IDSOvrbo3iMjey9
         JYHxhra3L7oLbVxVDxxcAQVIbnhR1vZZHeOF3dXnOYe59cNMaZ1hfLUaMbVTIcZVHf
         eJznlQfIrjZqw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH 1/2] clk: qcom: mmcc-msm8974: use clk_rcg2_shared_ops for mdp_clk_src clock
Date:   Fri, 26 May 2023 18:07:22 -0700
Message-Id: <168514964951.348612.13154960593914344306.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 7 May 2023 20:53:34 +0300, Dmitry Baryshkov wrote:
> The mdp_clk_src clock should not be turned off. Instead it should be
> 'parked' to the XO, as most of other mdp_clk_src clocks. Fix that by
> using the clk_rcg2_shared_ops.
> 
> 

Applied, thanks!

[1/2] clk: qcom: mmcc-msm8974: use clk_rcg2_shared_ops for mdp_clk_src clock
      commit: 8fd492e77ff71f68f7311c22f7bc960182465cd7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
