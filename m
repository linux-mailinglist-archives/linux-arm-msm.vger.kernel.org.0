Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30728672ED7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 03:17:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjASCRZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 21:17:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjASCRW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 21:17:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 913DC6797C
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 18:17:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B5B9AB81FBF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 02:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C58C433D2;
        Thu, 19 Jan 2023 02:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674094626;
        bh=O4SeJEN0t3hoiZCdVQ7Bor5MKwg1kyB0aYemKFYyMiw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BPsuLdi+8e/DIo+BJB4OJjH35zjYOSlA6B714wW78AulllLm+loGdTpddCXxVQX6V
         3J1MOA9Uq8ik7mRNqGOF7wKDBNkb0gV0PPS+eSk/tyWcOhUgHgK4riO1ZWBlEd36wI
         3MJT2y04us4Km6ZfLQOoxnDy0mSKaIdN0I+I6Col5xnQ2c9ls9CeFxw4yZ70H6iEUh
         IzGDJ2bC5YV+PnMI6LBGBF38Nv5uC75Vbc4rDKJx6MxpV04L8QO2jT5pt7Zrbr4fLb
         89dTYmxby4bdnbcjNQ7z156cEEDcHnWA/swqIuppURHMWD19swMY+vOQq3SCSINsKV
         bE6tvxvayWOLw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski@linaro.org, agross@kernel.org
Cc:     marijn.suijten@somainline.org
Subject: Re: [PATCH v2 00/17] Misc DT style fixes
Date:   Wed, 18 Jan 2023 20:16:55 -0600
Message-Id: <167409461436.3017003.4130039569017410177.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230102094642.74254-1-konrad.dybcio@linaro.org>
References: <20230102094642.74254-1-konrad.dybcio@linaro.org>
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

On Mon, 2 Jan 2023 10:46:25 +0100, Konrad Dybcio wrote:
> As part of trying to write up everything we care about when reviewing
> DTs [1], I put my regex to a test and removed some reg inconsistencies,
> among fixing up some other things in ipq6018.
> 
> v1 available at [2].
> 
> No dependencies as far as I'm aware.
> 
> [...]

Applied, thanks!

[01/17] arm64: dts: qcom: ipq6018: Pad addresses to 8 hex digits
        commit: 647380e41520c7dbd651ebf0d9fd7dfa4928f42d
[02/17] arm64: dts: qcom: ipq6018: Fix up indentation
        commit: c2596b717e9d96ae57c45481acfbafe9d3d54e56
[03/17] arm64: dts: qcom: ipq6018: Sort nodes properly
        commit: 2c6e322a41c5e1ca45be50b9d5fbcda62dc23a0d
[04/17] arm64: dts: qcom: ipq6018: Add/remove some newlines
        commit: 6db9ed9a128cbae1423d043f3debd8bfa77783fd
[05/17] arm64: dts: qcom: ipq6018: Use lowercase hex
        commit: 7356ae3e10abd1d71f06ff0b8a8e72aa7c955c57
[06/17] arm64: dts: qcom: sc8280xp: Pad addresses to 8 hex digits
        commit: 8d5bf0b2dca784f0c1003d754556276ec2d54c75
[07/17] arm64: dts: qcom: sm8150: Pad addresses to 8 hex digits
        commit: f69732296a7426afcb5153cf4475a10bc8f15516
[08/17] arm64: dts: qcom: sm6350: Pad addresses to 8 hex digits
        commit: f48dbb34e4e0fd9bcd22c82e4610e0b426a3f1f3
[09/17] arm64: dts: qcom: sdm845: Pad addresses to 8 hex digits
        commit: 524ac48fcccd9e99b4d106049445186e9cb604b6
[10/17] arm64: dts: qcom: sm8250: Pad addresses to 8 hex digits
        commit: 81f43efce4e1fdd2c65143dd05bd69fae563c3f0
[11/17] arm64: dts: qcom: sm8350: Pad addresses to 8 hex digits
        commit: f3c08ae6fea78fc1bd9b633e494b3d60cc1844db
[12/17] arm64: dts: qcom: sc7180: Pad addresses to 8 hex digits
        commit: 26c471991dc852cf2df9bf857f93734390ae3c34
[13/17] arm64: dts: qcom: sc7280: Pad addresses to 8 hex digits
        commit: 94ca994d7e932cd36b7e19ff4bdd3aec8f04330e
[14/17] arm64: dts: qcom: msm8994-octagon: Pad addresses to 8 hex digits
        commit: 426900a959b361b97890a66166c1183d58731a58
[15/17] arm64: dts: qcom: sm8450: Pad addresses to 8 hex digits
        commit: a58cde4d66e18a1b1f270488a03b471bdbb956c1
[16/17] arm64: dts: qcom: msm8994-kitakami: Pad addresses to 8 hex digits
        commit: 690e8993ccac24e9b15d550a6db9ce7e3fc5a51b
[17/17] arm64: dts: qcom: sm6115: Pad addresses to 8 hex digits
        commit: 1d09705a6456ade74734f408e09a033c1542d426

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
