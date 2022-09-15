Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD30B5B9351
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 05:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbiIODh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 23:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbiIODhp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 23:37:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1096C9322B;
        Wed, 14 Sep 2022 20:37:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 96E1E6206E;
        Thu, 15 Sep 2022 03:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFB3C43142;
        Thu, 15 Sep 2022 03:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663213042;
        bh=oZK4TmRjdWUzhH8K3J+wY8ciuZJRIg5qg2U1p3zyxus=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FFw0cXZTS889EJdJXf8zO8IruuBSdCmNK/aMORosutG98bJ6FFhHl3nmMNULwz+Um
         futDfJnYk0Yq+JTBf89DiD6YYt3jfvovqlxwvaG3fU4kLVJY1x4Q5nod8dTe0EMQpY
         S685Qs1F9cvyL8DyI0YPnmRGcWFgefFtlndCFxYI/cZbz4qahySJlcwZndLtrV4fTv
         JQA8OF8s5HnY+iXppn+m5T7TJowuMgBE0KOygMRO2QDAzLNVwwPU/35uFKQ+JJIO56
         TRw69Usp4vX+2fWV05t7NzpSlababks3LmKQIkFp/+vS5armtpgULwiPdlD/jd2QfB
         u9PDjjKd/lRVA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        stephan.gerhold@kernkonzept.com
Cc:     agross@kernel.org, mturquette@baylibre.com,
        dominikkobinski314@gmail.com, sboyd@kernel.org,
        konrad.dybcio@somainline.org, p.zabel@pengutronix.de,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        stephan@gerhold.net, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/6] clk: qcom: Add clocks for MSM8909
Date:   Wed, 14 Sep 2022 22:37:03 -0500
Message-Id: <166321302055.788007.16496767011703935092.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
References: <20220706134132.3623415-1-stephan.gerhold@kernkonzept.com>
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

On Wed, 6 Jul 2022 15:41:26 +0200, Stephan Gerhold wrote:
> Add a driver for the Global Clock Controller (GCC) that provides clocks,
> resets and power domains for the various hardware blocks in the MSM8909
> SoC. Make it possible to have longer delay between assertion/deassertion
> of particular reset signals (this is needed for the USB PHY on MSM8909).
> Finally, add the necessary definitions for the clocks controlled by the
> RPM firmware on MSM8909.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: clock: Add schema for MSM8909 GCC
      commit: c40668048f236da6f7725998f93f0d6180003da3
[2/6] clk: qcom: Add driver for MSM8909 GCC
      commit: bf37a05744ebc6a488e3cfd3ec6d502d626740cc
[3/6] clk: qcom: reset: Allow specifying custom reset delay
      commit: 2cb8a39b6781ea23accd1fa93b3ad000d0948aec
[4/6] clk: qcom: gcc-msm8909: Increase delay for USB PHY reset
      commit: dcc6c9fb712875bf1897eaeb0c9d4e4237861723
[5/6] dt-bindings: clock: qcom,rpmcc: Add MSM8909
      commit: 1727a402c1fcf2594923be47ed03fab2db0eacfb
[6/6] clk: qcom: smd-rpm: Add clocks for MSM8909
      commit: 94a70c873d56e8bb7bce52cfb68d004be174dfff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
