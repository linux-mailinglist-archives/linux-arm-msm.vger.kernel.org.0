Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97CD95B7D3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Sep 2022 00:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiIMWsR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 18:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiIMWsP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 18:48:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8E156B9B;
        Tue, 13 Sep 2022 15:48:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5572EB81168;
        Tue, 13 Sep 2022 22:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4582FC433C1;
        Tue, 13 Sep 2022 22:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663109292;
        bh=QsKzCHOfcOY/N7RbhmCU+cRAOgjAtvoPBbhNVir4ubw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PmWhDoIuUyV4W2ZKqLfvoK+vt/H7JAR9h6Z0eRPrqbyPUJFffDpT1nehsnFMP1D6G
         UrDTR5w03hiq+kUgVf1aluDktGRe6x4a+OmOwY7jH7mDDZOsBhoib4a9lqOICWpe8C
         5STtaehrqG/NWslxCUnCL+r4r/56M25TCC+ep9Coj2KOjud6GL9tVzdyhZAy/vYWb1
         UmtTR9ve0ybIETMwDHZ1HtGXjGoLrZNbW2lOcRjCCovQKQAoarspyplOUCZhfEtzzv
         Jb9yoUwj1abdxTlfMRk5CEhGTZSNrokYFkQvZzhyU5p0M7jrOXOiILF5KjEVN+IYZY
         yHgV+lzKfPsnw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, mturquette@baylibre.com,
        agross@kernel.org, sboyd@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        quic_tdas@quicinc.com, robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] ARM: msm8660: change gcc to use parent_hws/data
Date:   Tue, 13 Sep 2022 17:48:04 -0500
Message-Id: <166310928497.670084.10905642574789152447.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
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

On Fri, 9 Sep 2022 13:51:31 +0300, Dmitry Baryshkov wrote:
> Follow the trend and convert gcc-msm8660 to use parent_hws/parent_data
> 
> Changes since v1:
>  - Added patch fixing clock node names for board fixed clocks.
> 
> Dmitry Baryshkov (5):
>   dt-bindings: clock: qcom,gcc-msm8660: separate GCC bindings for
>     MSM8660
>   clk: qcom: gcc-msm8660: use ARRAY_SIZE instead of specifying
>     num_parents
>   clk: qcom: gcc-msm8660: use parent_hws/_data instead of parent_names
>   ARM: dts: qcom: msm8660: add pxo/cxo clocks to the GCC node
>   ARM: dts: qcom-msm8660: fix node names for fixed clocks
> 
> [...]

Applied, thanks!

[4/5] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the GCC node
      commit: 6244e7da53dcdf0a5905f6ac2a2b643dd439a19c
[5/5] ARM: dts: qcom-msm8660: fix node names for fixed clocks
      commit: baecbda529331e146c7460e2aea8b54c20dcdea7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
