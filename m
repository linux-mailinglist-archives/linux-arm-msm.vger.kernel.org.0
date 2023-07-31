Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E2B76A508
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Aug 2023 01:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbjGaXtp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jul 2023 19:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230342AbjGaXto (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jul 2023 19:49:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE30710C7;
        Mon, 31 Jul 2023 16:49:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B5426135F;
        Mon, 31 Jul 2023 23:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6408C433C7;
        Mon, 31 Jul 2023 23:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690847382;
        bh=ECkEowFpkaaLto02+wiVoqQdhyB1FQrgZ3V0QXeCg3M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wy+0dLBsSRuO1VKv8GHW9+7XPfcJwu3+A2/1bhxn0eNQFqhvRqFg0GEx0IYqr1xvt
         h5MzVdrNt2EZ7OHvQaKZzqdjYja86HM9xYVFjtlGFctpwHJq2gw+cuvltOgUbkwiJn
         r5E6egsPw2MTE+ffPl9avZIaLtU9RIl0o23zN5us17bvIX4O2UnYKXFwLgC0Vcby0+
         +wfAMlOwxroeM0p3ybPdh4FBQxON/Z2WhvTPTZFcE/sav4mSnHsm9apPRUkSX5sZNY
         m3cEaGLTz+lP1VcCtvVw8bwgUsqEEaiHxg69dN7VZjSrrFyCa4YAkbj1HhhGhx5kfO
         hZxV89M0cIRfQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 00/10] clk: qcom: convert mdm9615 to parent_hws/_data
Date:   Mon, 31 Jul 2023 16:52:40 -0700
Message-ID: <169084756380.3010488.16111757339753616481.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
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


On Sat, 13 May 2023 00:17:17 +0300, Dmitry Baryshkov wrote:
> This series concludes the conversion of Qualcomm clock controller
> drivers to using the parent_hws/parent_data and declaring all the used
> clocks in DT.
> 
> Changes since v2:
> - Fixed gcc-mdm9615 schema example (Krzysztof)
> 
> [...]

Applied, thanks!

[09/10] ARM: dts: qcom-mdm9615: specify clocks for the lcc device
        commit: 174b934c3dc4fc7bd1d2075745bba829a743553f
[10/10] ARM: dts: qcom-mdm9615: specify gcc clocks
        commit: d988aa8cd09653d9607788e9d1c98f0d7a55e731

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
