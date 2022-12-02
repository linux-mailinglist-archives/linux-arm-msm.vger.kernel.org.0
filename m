Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88F7A640F9E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 21:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbiLBU7N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 15:59:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234319AbiLBU7E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 15:59:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3D4EAB55;
        Fri,  2 Dec 2022 12:59:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E8EBCB822A2;
        Fri,  2 Dec 2022 20:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0788DC433C1;
        Fri,  2 Dec 2022 20:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670014739;
        bh=5hsKpdDv+OFOgzPGmYUjuTiAonqUL4Afvn9DTR2jNn0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=azNplClg1A+FyBP9UrM+yWewmw2a61SAe8gBAIu+TvMXDapX/tD6aeugKwcupS7/c
         idEFb+PCuNtUVC04Bit5HjrHoNkmFoU2cd7Q3zWApJQ+PvWtaiuZCpZ5hCw2ccy0fb
         1kZFZBQTinYmpcM93o2GmE7VW3GngCEjJJDt2zS1JkL0vkFd37oQqBwApuBi4nNHNS
         PTLlHREaV/TM/kHisUkOQFpbFgN3h0s278VwdTmQZUPh1thZyo6+JFxGxBak1rLeRU
         /90DoLAdWwapzReis1qbswRwzbe1+/HuAhHvP/m7X3cNyYfuy+0VBHuMLQow8pW3wc
         sgsXyT7LH09wA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, sboyd@kernel.org,
        quic_tdas@quicinc.com, Konrad Dybcio <konrad.dybcio@linaro.org>,
        agross@kernel.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: qcom: rpm: drop platform names
Date:   Fri,  2 Dec 2022 14:58:45 -0600
Message-Id: <167001472430.2721945.8935373244721361408.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
References: <20221202070814.482470-1-dmitry.baryshkov@linaro.org>
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

On Fri, 2 Dec 2022 09:08:10 +0200, Dmitry Baryshkov wrote:
> The RPM clocks driver uses platform (SoC) as a part of the clock
> definition. However there is nothing really SoC-specific in this
> part. Using it just leads to confusion and sometimes to duplication of
> definitions. Drop the SoC name where it is logical.
> 
> Changes since v2:
> - Split from the RPMH patchset
> - Dropped superfluous active-only clock names when there are no actual
>   clocks behind
> - Removed the _clk and _a_clk suffixes, moving them to preprocessor
>   macro, no need to have them all over the code.
> 
> [...]

Applied, thanks!

[1/4] clk: qcom: rpm: remove unused active-only clock names
      commit: fbd5a2cbdab5fe7678a823209c76bf9f876f1448
[2/4] clk: qcom: rpm: drop separate active-only names
      commit: 35a57cdae7433e1aab1a8c0e06197d368bc4de8a
[3/4] clk: qcom: rpm: drop the _clk suffix completely
      commit: e9bf411a5deeb86379ca94bdb64067656ae5e138
[4/4] clk: qcom: rpm: drop the platform from clock definitions
      commit: 3de1c1fd6189c64e6e026780bb244f878fdb0a23

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
