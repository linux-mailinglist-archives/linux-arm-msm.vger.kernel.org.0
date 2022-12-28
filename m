Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC2F165729D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 05:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbiL1EhP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 23:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbiL1EhE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 23:37:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4917ADF8A
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 20:37:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9A485B81230
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 04:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05102C4339B;
        Wed, 28 Dec 2022 04:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672202220;
        bh=2QsBZONAZdMcMPHAGz7g7QvtPNvzVcdvrGcv466VfaM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QZLnF0OeKjkxIh0GF4LffwvJEi4q94z7QI5kO0aeSrJeXhHwFQ+/ZXa4C0NAZ8c0D
         0KLJoFh4iwlGoX0gWY3cudFnGFKwxK3OXc6P5296W171Wtz49dGCqYcx9IaJO0Pgag
         Xjl7yu7R0BfMTgkVJC27HEbbYHnWdO93tzD5MQtrX5LvFMelvJ/yB/YiquWcfRpvoK
         QPf/PZw8mfiMjR2tXU3kmsm/17Dm8DtvFB7QO1R6Ypiob7Wk5yQRZBU+wtYu3DKRV4
         jT8QFxrcyk/m2zwZhf+Grcozdcz91KhDZl/tVeYs6vmL1OyB1lgQ0CvJXpP9auiY8X
         UmFF0JCn8NsTw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     krzysztof.kozlowski@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, konrad.dybcio@linaro.org
Cc:     marijn.suijten@somainline.org
Subject: Re: (subset) [PATCH 0/5] MSM8996 eMMC boot fix
Date:   Tue, 27 Dec 2022 22:36:34 -0600
Message-Id: <167220221235.833009.5921577222984374915.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221210200353.418391-1-konrad.dybcio@linaro.org>
References: <20221210200353.418391-1-konrad.dybcio@linaro.org>
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

On Sat, 10 Dec 2022 21:03:48 +0100, Konrad Dybcio wrote:
> In a very unfortunate turn of events, enabling interconnect on non-UFS
> devices (or more precisely devices-with-UFS-clocks-disabled-from-
> bootloader) crashes the device, as a memory read to an unlocked peripheral
> is attempted. This series tries to fix that with the least amount of
> casualties..
> 
> Konrad Dybcio (5):
>   dt-bindings: interconnect: Add UFS clocks to MSM8996 A2NoC
>   interconnect: qcom: msm8996: Provide UFS clocks to A2NoC
>   interconnect: qcom: msm8996: Fix regmap max_register values
>   interconnect: qcom: rpm: Use _optional func for provider clocks
>   arm64: dts: qcom: msm8996: Add additional A2NoC clocks
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: qcom: msm8996: Add additional A2NoC clocks
      commit: 67fb53745e0b38275fa0b422b6a3c6c1c028c9a2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
