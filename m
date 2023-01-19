Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1845674C94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 06:37:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbjATFhY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 00:37:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230174AbjATFgs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 00:36:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 286D5CA31;
        Thu, 19 Jan 2023 21:33:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 176D9B81FB5;
        Thu, 19 Jan 2023 04:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8D2C433D2;
        Thu, 19 Jan 2023 04:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674104041;
        bh=eVKf7wBSxj2O+ou6CTudQ1D1waWBQ7x4QXBha4ovRpc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L/Cn/f/g8kUyS6s/hP/vCE36U2PCAW3EZxVhCACYJVM6eVK+Q67AqxgvD3fl4GgjE
         ScJWAM3L+AkbZF5sfbHCvEXaewZiTis5kFQSHipAqc3nq04vZOLqU1LPme8c4xcMrH
         izdZQw240KE7dZVqNHGhwx+1LsiuRo8tP0OOEdJuaAAZAU+Q+K5Yd7HWi4Lzh3/pQJ
         Ab9JRGJhfkJVPYENKHy/tdWOARJkZT8Ngwhws7x7l4NgK4FJTbpcv6RpnQpzsx/qEh
         yjxDNRzXuhazVL3tyXeAiU30Ok0Xs3EV3EkU9rFgzyY7HbkHJuH3rjCOp6wwW2IA4G
         r/S1H7W8300Bg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     quic_tdas@quicinc.com, dmitry.baryshkov@linaro.org,
        sboyd@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: (subset) [PATCH v3 00/14] clk: qcom: cpu-8996: stability fixes
Date:   Wed, 18 Jan 2023 22:53:56 -0600
Message-Id: <167410403675.3048186.784444647776183552.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
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

On Fri, 13 Jan 2023 14:05:30 +0200, Dmitry Baryshkov wrote:
> This series provides stability fixes for the MSM8996 boot process. It
> changes the order of calls during the CPU PLL setup, makes it use GPLL0
> (through sys_apcs_aux) during PLL init, finetunes the ACD, etc.
> 
> Dependency: [1]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/
> 
> [...]

Applied, thanks!

[14/14] arm64: dts: qcom: msm8996: support using GPLL0 as kryocc input
        commit: ac0d84d4556cecf81ba0b1631d25d9a395235a5c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
