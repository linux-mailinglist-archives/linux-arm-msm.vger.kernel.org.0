Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40155665343
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 06:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbjAKFTF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 00:19:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjAKFR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 00:17:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65F8713D5E;
        Tue, 10 Jan 2023 21:09:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 23C6AB80B50;
        Wed, 11 Jan 2023 05:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3678BC433D2;
        Wed, 11 Jan 2023 05:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413784;
        bh=xvD6Co8a5BfWP/r6edIdVi2Mhy/yToGKhVVzL0nLDf4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hLUy42Zy9qnYiDK4k5258UssUT8NR089YsP/eFNIr+5TtGg7XJaM62qzpp/f0RgoD
         tDdkkosbvOIzVl7d2D7TB1oQRNJf6pEVYEsDDEyOlQZucOr+GHElDUWZOhR7CIGkx/
         d7HwPhH83WL/fC8czOm22/qnKznXwPuEd8YnP/pu+IbBOVoK1OCWUW81JY2KQ6xg9O
         q72D8VUsT1cWe4MhNu/hxFnQOB29LsvGERRkzBo0CF1IAY4rLYOuCwZd91c+plVLzf
         3fpIVc/J7faE2rgoTcjxpS3pUCCNYMJU7314MUBwnMpfRtF3mJU6bvTymXo+vDQCsE
         LlhgMk+hyS7sQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org,
        agross@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] arm64: dts: qcom: sm8450-{hdk,qrd}: add PMICs support
Date:   Tue, 10 Jan 2023 23:09:08 -0600
Message-Id: <167341377729.2246479.6596418780940145807.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
References: <20221217003349.546852-1-dmitry.baryshkov@linaro.org>
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

On Sat, 17 Dec 2022 02:33:44 +0200, Dmitry Baryshkov wrote:
> Now as the SPMI ARB v7 support is going to be merged for 6.2, it's time
> to merge support for PMICs on SM8450-HDK and QRD boards.
> 
> Dependencies:
> - https://lore.kernel.org/linux-arm-msm/20221213191036.611241-1-konrad.dybcio@linaro.org/
> 
> Dmitry Baryshkov (3):
>   dt-bindings: mfd: qcom-spmi-pmic: add pm8450 entry
>   arm64: dts: qcom: sm8450-qrd: add missing PMIC includes
>   arm64: dts: qcom: sm8450-hdk: add missing PMIC includes
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: qcom: sm8450-qrd: add pmic files
      commit: b070c7493bb1dafeb1dd22e3b666300aa42f956b
[3/5] arm64: dts: qcom: sm8450-qrd: add missing PMIC includes
      commit: 69d46573ca29d1f9f6036bb551062c1db9c647f4
[4/5] arm64: dts: qcom: sm8450-hdk: add pmic files
      commit: 30464456a1eaddfa4363edf5e2334ed91acd265c
[5/5] arm64: dts: qcom: sm8450-hdk: add missing PMIC includes
      commit: 7438bb31ba570c9f43eae6f79f9e70bb4e22170c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
