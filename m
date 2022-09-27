Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B51555EB8AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 05:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbiI0DYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 23:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbiI0DXz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 23:23:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BB4356CF;
        Mon, 26 Sep 2022 20:23:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B5212B8190E;
        Tue, 27 Sep 2022 03:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9110AC43142;
        Tue, 27 Sep 2022 03:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664248988;
        bh=GxnDMzQbbhAML/JnZJiU/0txVvOk8zzFZ+asv3ZYxSU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PEWTOjuMyIKOMP0qzOWoO9vBRNV39fBlLc7WR++jVRL2X0yNCnth8mA2eHWVsB8mA
         vyfkLQXO0L2m+TleUfHZhgg+3ITZaHT4Wnc481e22jKO1Rs+/+S71J/zSGhaQQi7Lv
         M1XNUtG4kdjXmJMO7BCeXeTnsAZQ1DrqmAi/T4vHZjCIiW1efd5ZwDOh9RI8/7oMHK
         SUKtCBENso40Etrla7uMNk7+/Rv2/7odbxiXwQvJmX4156wRE6sa5iuFtEdAiQNrk+
         +kOMih4gSANR2ltSoSHaF1sFwKbNQHzc4DPc2aJs49TAe5Asd0i2s2A8OoNx1knOhK
         OXpGDfiT1Gaqw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        mturquette@baylibre.com, dmitry.baryshkov@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org,
        quic_tdas@quicinc.com, agross@kernel.org,
        Bjorn Andersson <andersson@kernel.org>
Cc:     yassine.oudjana@gmail.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] clk: qcom: cpu-8996: additional cleanup for the driver
Date:   Mon, 26 Sep 2022 22:22:59 -0500
Message-Id: <166424897968.1766486.6679070208949712424.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 14 Jul 2022 13:03:45 +0300, Dmitry Baryshkov wrote:
> This patch series depends on patches 1-5 from [1].
> 
> Path 1 is slightly fixed version of patch 6 from the mentioned
> patch series (fixed to use parent_hws where applicable). The rest is
> minor cleanup of the driver.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20220621160621.24415-1-y.oudjana@protonmail.com/
> 
> [...]

Applied, thanks!

[1/6] clk: qcom: msm8996-cpu: Use parent_data/_hws for all clocks
      commit: da5daae8b412c922e08f86979e84ea80b60092a1
[2/6] clk: qcom: cpu-8996: switch to devm_clk_notifier_register
      commit: a808c7848a52523cb758c844f642b3d9e059c0c3
[3/6] clk: qcom: cpu-8996: declare ACD clocks
      commit: f1e3fcc4fc81e2aa78f4af754c460468e3f19782
[4/6] clk: qcom: cpu-8996: move ACD logic to clk_cpu_8996_pmux_determine_rate
      commit: 81165aca05dc003ea41c9bc725238dc249d477fd
[5/6] clk: qcom: cpu-8996: don't store parents in clk_cpu_8996_pmux
      commit: f387d1c46f53457d0d9687295629f3db2f44d29b
[6/6] clk: qcom: cpu-8996: use constant mask for pmux
      commit: f9ea0f59f7eefe44d82bbd4e86d2fac353fcfcbe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
