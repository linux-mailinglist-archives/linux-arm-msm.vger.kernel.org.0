Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A93D666412
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:51:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237663AbjAKTuD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235347AbjAKTtc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:49:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED79B12ABE;
        Wed, 11 Jan 2023 11:49:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89A6761E16;
        Wed, 11 Jan 2023 19:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 640ACC433F1;
        Wed, 11 Jan 2023 19:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673466559;
        bh=Z00n9eOgTZbSv/ICYABmr9WTAxMps8CU7HJ+VEJgUPQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NxykMgGTnNJT6c3Fb6PyeMLThaqK1Q4SlWQA7TkOoBtwRcbZHvUMrnb7PYRCcPoQC
         GIzYOnJL0WrBInklryz1Mz2snzhm3Q+AYnV7TiBjJ9t/eHO8Oxd/+VNp+MJiXBnUWf
         C8ritT3vbiMUaEwsRjOKp6bQkXYZwMLBrwoYQVDTaLSbDbgXPwZwtHqvJCkd0U0c89
         ZDpCzLXjf8f8CcpR3jGAjwc4d9RO8I4yltMJxKq0mS6PNAG+lO5j3eKarmJRE13CX4
         BzafnoA9vbpiimAq0GXlNTjEDR5YuR5xmvhBy4axV118DOCZOF+r/pvLSWGWz4o8WE
         Dxx1XFGVun1sg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     stephan@gerhold.net
Cc:     krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@linaro.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 0/2] arm64: dts: qcom: msm8916: Enable DMA by default
Date:   Wed, 11 Jan 2023 13:49:08 -0600
Message-Id: <167346654443.2315924.3362718111931117029.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230107110958.5762-1-stephan@gerhold.net>
References: <20230107110958.5762-1-stephan@gerhold.net>
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

On Sat, 7 Jan 2023 12:09:56 +0100, Stephan Gerhold wrote:
> Add the DMA channels for all I2C controllers in msm8916.dtsi and enable
> the DMA controller by default (this is necessary because otherwise the
> i2c-qup driver will no longer probe with the DMAs added).
> 
> Stephan Gerhold (2):
>   arm64: dts: qcom: msm8916: Enable blsp_dma by default
>   arm64: dts: qcom: msm8916: Add DMA for all I2C controllers
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: msm8916: Enable blsp_dma by default
      commit: 0154d3594af3c198532ac7b4ab70f50fb5207a15
[2/2] arm64: dts: qcom: msm8916: Add DMA for all I2C controllers
      commit: 389d2c9926b3a81791e23a25fc1b85928139d40b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
