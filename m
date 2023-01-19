Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D94D4674260
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 20:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbjASTLo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 14:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbjASTLN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 14:11:13 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F18966C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 11:10:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A15F2CE2559
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 19:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CFDC433F1;
        Thu, 19 Jan 2023 19:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674155348;
        bh=p6pSRjdhVEqeRi6tJhOA+RGxKAPsEV2V2/zzeEJsqtw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E8whAV9PBO8uRK/S6HEblp+MuihLZZKIiGTHWY9SkcbF0T5LcyQjzU+YcKbca2pKk
         MGlcnkHYYiWNnj45+UUvw0vmYpgIN3whBtlsLRbDoy+bauoyfXG947a0Fvjq8DOAhs
         aIr4OzwxIJqMOc6DHPQ9hV1GhzO6VyNBZmrvmDRRHBuidElNQCKBoID2/k+lWyzAfN
         CA4lpYvP1e/HaQKd6h5SYrHbYT46Qk2jqI4/i0RP1Z3DBY/Fvnj133bBetWU/EuOOt
         VzApmw718GVbIQO+D0RCgpQ8D7dYTN/VUipeAON/d+1J3FCrklBU3KpnILfOreC0Gq
         hb3L/OsBwYgXQ==
From:   Will Deacon <will@kernel.org>
To:     krzysztof.kozlowski@linaro.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
        andersson@kernel.org
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>, patches@linaro.org
Subject: Re: [PATCH v3 0/9] SM6375/PDX225 GPI DMA, QUPs & PMIC peripherals
Date:   Thu, 19 Jan 2023 19:08:37 +0000
Message-Id: <167414907282.2377779.13271611567110196121.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20221115152727.9736-1-konrad.dybcio@linaro.org>
References: <20221115152727.9736-1-konrad.dybcio@linaro.org>
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

On Tue, 15 Nov 2022 16:27:18 +0100, Konrad Dybcio wrote:
> This series adds support for:
> 
> - GPI DMA for 6375
> - QUP hosts & I2C / SPI controllers for 6375
> - pinctrl for SOME (check commit message of 05/10) of ^
> - pmk8350 on arbitrary SID
> - touchscreen & SMD regulators on PDX225 (depends on [1])
> - pmic peripherals on PDX225
> 
> [...]

Applied to will (for-joerg/arm-smmu/bindings), thanks!

[1/9] dt-bindings: arm-smmu: Allow 3 power domains on SM6375 MMU500
      https://git.kernel.org/will/c/5cc1842372bf
[2/9] arm64: dts: qcom: pmk8350: Allow specifying arbitrary SID
      (no commit info)
[3/9] arm64: dts: qcom: sm6375: Add GPI DMA nodes
      (no commit info)
[4/9] arm64: dts: qcom: sm6375: Add pin configs for some QUP configurations
      (no commit info)
[5/9] arm64: dts: qcom: sm6375: Add QUPs and corresponding SPI/I2C hosts
      (no commit info)
[6/9] arm64: dts: qcom: sm6375-pdx225: Enable QUPs & GPI DMA
      (no commit info)
[7/9] arm64: dts: qcom: sm6375-pdx225: Add PMIC peripherals
      (no commit info)
[8/9] arm64: dts: qcom: sm6375-pdx225: Configure SMD RPM regulators
      (no commit info)
[9/9] arm64: dts: qcom: sm6375-pdx225: Configure Samsung touchscreen
      (no commit info)

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
