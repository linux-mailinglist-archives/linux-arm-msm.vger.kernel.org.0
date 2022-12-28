Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0212D657295
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 05:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiL1EhJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 23:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbiL1EhE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 23:37:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95D68DF84
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 20:37:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 35A71612FC
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 04:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE61C433F2;
        Wed, 28 Dec 2022 04:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672202221;
        bh=7zTNvvjxK3k9zI7Rkxi7fADfvpWy4Akdvx8LO8aDHPM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QddVAObokr8shu+cR33kq3+DQ35P16GxlMYuUXOWQxJgsrawl0QmGCuxIDPzpcDY0
         zWtRf6x5HiGYLQdKKprWf405+ZIJgg+hBJ/zJ8olF8dzdMJ7NW6qHagaiuQh7S1RvQ
         hZaaXcKzYnO814BksooJ8pmIUlWevAZW8AiWmdiFWBpDN8iBYgVk9tivNh3RZODf0n
         dndzVtc+B2JwoA/8msYbBJgeXaFsNp0EnwleqNmIHf/T73h7AGviwZgnir/cxHbrpt
         W/BdGPssKI/H/Qq1WsHutx6909wxg5F1ICefak1HKZAaxU35x+Pno4lmHj/Z7UUjvD
         beYM+jI1vknpg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     krzysztof.kozlowski@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org
Cc:     marijn.suijten@somainline.org
Subject: Re: [PATCH 0/9] Lowercase hexification of arm64/dts/qcom
Date:   Tue, 27 Dec 2022 22:36:35 -0600
Message-Id: <167220221238.833009.6893154679300207856.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221212111037.98160-1-konrad.dybcio@linaro.org>
References: <20221212111037.98160-1-konrad.dybcio@linaro.org>
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

On Mon, 12 Dec 2022 12:10:28 +0100, Konrad Dybcio wrote:
> Almost all device trees use lowercase hex, fix up the remaining ones to
> match the style and prevent introduction of more uppercase hex from
> copypasting and referencing.
> 
> Konrad Dybcio (9):
>   arm64: dts: qcom: ipq6018: Use lowercase hex
>   arm64: dts: qcom: msm8996: Use lowercase hex
>   arm64: dts: qcom: msm8998: Use lowercase hex
>   arm64: dts: qcom: sdm630: Use lowercase hex
>   arm64: dts: qcom: sdm660: Use lowercase hex
>   arm64: dts: qcom: sdm845: Use lowercase hex
>   arm64: dts: qcom: sm8250: Use lowercase hex
>   arm64: dts: qcom: sm8150: Use lowercase hex
>   arm64: dts: qcom: sdm845: Fix some whitespace/newlines
> 
> [...]

Applied, thanks!

[1/9] arm64: dts: qcom: ipq6018: Use lowercase hex
      commit: 0431dba3733bf52dacf7382e7b0c1b4c0b59e88d
[2/9] arm64: dts: qcom: msm8996: Use lowercase hex
      commit: 21dd43fda18a21ddcc7567bbadc831c179e98c67
[3/9] arm64: dts: qcom: msm8998: Use lowercase hex
      commit: d6882340d019607ceabbf2f20f81bc376c4deff5
[4/9] arm64: dts: qcom: sdm630: Use lowercase hex
      commit: 5442632899f40ecfea2c7b4400f93966b04d5b6a
[5/9] arm64: dts: qcom: sdm660: Use lowercase hex
      commit: 5c9d77725069df48c1c0e682e64143cb6a62b165
[6/9] arm64: dts: qcom: sdm845: Use lowercase hex
      commit: 7b5cb47afda7d602b1335e7a6eef5d6ce82d0c8e
[7/9] arm64: dts: qcom: sm8250: Use lowercase hex
      commit: 74f9165935218db8348f24eeb01769b605a47e2d
[8/9] arm64: dts: qcom: sm8150: Use lowercase hex
      commit: 51f748c62358cf878feb2b9177017b67f3f6c9bc
[9/9] arm64: dts: qcom: sdm845: Fix some whitespace/newlines
      commit: 20e954411c9e59b61eacd1822a0aa0e4676a43f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
