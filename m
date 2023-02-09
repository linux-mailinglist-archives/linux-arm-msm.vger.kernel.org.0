Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF3D68FE96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 05:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjBIEZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 23:25:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjBIEZ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 23:25:28 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 590E82C67B;
        Wed,  8 Feb 2023 20:24:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D33906189B;
        Thu,  9 Feb 2023 04:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0CAC433D2;
        Thu,  9 Feb 2023 04:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675916497;
        bh=7hADlf7WaR80LFc2sUCPw2x0mmHmPS5ZL/AgO1CMnsU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FnoR/kArGtgJNtDq6Rb7+4+QymHz9CLZj1UO3/8pIPZ8H1mludV3mbtJOGWhiFvEe
         3q5eembM1ibv6xT1ey67UPztktlG7TDvrlnFd/OEZXExgSfvqq0ZAsscRwW3MZOF2A
         JW+AlUFSQxAEFdsK9zmLgT2EiB8L52LV7LEoAIahIO3+vPLKASIKqW08CCpY3yS+ke
         /h4OCl9ObYTwFcnSgfXbnroscTv2BwghG9p5vOZ45VWuObSm9o2FXzLo0Oqb6XMb29
         OQ038dchOyF6KirPrGOkQXyW/zIC2P2qKlvr+/PQGC2WnX2aH/opF30Z0uLBqEiTXo
         Gm9PR30GyxFuQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/8] clk: qcom: msm8996: add support for the CBF clock
Date:   Wed,  8 Feb 2023 20:22:53 -0800
Message-Id: <167591660366.1230100.9301339036828175202.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
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

On Fri, 20 Jan 2023 08:14:09 +0200, Dmitry Baryshkov wrote:
> On MSM8996 two CPU clusters are interconnected using the Core Bus
> Fabric (CBF). In order for the CPU clusters to function properly, it
> should be clocked following the core's frequencies to provide adequate
> bandwidth. On the other hand the CBF's clock rate can be used by other
> drivers (e.g. by the pending SPDM driver to provide input on the CPU
> performance).
> 
> [...]

Applied, thanks!

[6/8] arm64: qcom: dts: msm8996 switch from RPM_SMD_BB_CLK1 to RPM_SMD_XO_CLK_SRC
      commit: 8ae72166c2b73b0f2ce498ea15d4feceb9fef50e
[7/8] arm64: dts: qcom: msm8996: add CBF device entry
      commit: 6701b173956a28858e5efd234e4dc35d1727a494

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
