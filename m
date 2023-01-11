Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6DAF66533D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 06:19:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235752AbjAKFTB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 00:19:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbjAKFRx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 00:17:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893EFEE13;
        Tue, 10 Jan 2023 21:09:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4C379B81AC7;
        Wed, 11 Jan 2023 05:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6424FC433F0;
        Wed, 11 Jan 2023 05:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413784;
        bh=GEC0JQH87H858q8GAXq/MIF3wsD1y0o4oewzOkpAZxA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rWz6NUpYnJPbypZae+uubV+oj5JTFGU/AruG/75igWwFzeVHVydm02LMIeAoH0yIB
         bUEEqWOm4ef8G5qU6pOYyNbfripIoyGHcG4Y0JZHgVc9YPDihP0HwpMaN0lJoY2l+x
         GpFnL7unX3ZHI0PepK9kD1RTsee5bsJFjiXzok2mGzt4K1fkfS3O63gXWFA04MgVWy
         2vsTNqMK9TYLrYJCsFtn/Afy2J7JT89OIfSm8wG2gIkQubRA1Gz0TLC60JhZtSQY+/
         xyAojWSl7ma2xOK4tDSdNw4bk2hWeYItMn9/BHgl7x1FvrK8r+hKAplHorGWTrQnYF
         8SKsvCf1pzJ9w==
From:   Bjorn Andersson <andersson@kernel.org>
To:     quic_tdas@quicinc.com, dmitry.baryshkov@linaro.org,
        konrad.dybcio@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 00/21] clk: qcom: small cleanup
Date:   Tue, 10 Jan 2023 23:09:07 -0600
Message-Id: <167341377717.2246479.15825009712395547724.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
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

On Tue, 3 Jan 2023 16:54:54 +0200, Dmitry Baryshkov wrote:
> While reviewing dispcc-sm8550 I noticed that existing drivers also have
> several small points for improvement.
> 
> Dmitry Baryshkov (21):
>   clk: qcom: dispcc-sm8450: switch to parent_hws
>   clk: qcom: dispcc-sc7180: switch to parent_hws
>   clk: qcom: dispcc-sm6375: switch to parent_hws
>   clk: qcom: camcc-sc7280: switch to parent_hws
>   clk: qcom: camcc-sm8450: switch to parent_hws
>   clk: qcom: gcc-msm8939: switch to parent_hws
>   clk: qcom: gcc-msm8976: switch to parent_hws
>   clk: qcom: gcc-sc7180: switch to parent_hws
>   clk: qcom: gcc-sc7280: switch to parent_hws
>   clk: qcom: gcc-sdx65: switch to parent_hws
>   clk: qcom: gcc-sm6375: switch to parent_hws
>   clk: qcom: gcc-sm8250: switch to parent_hws
>   clk: qcom: gcc-sm8450: switch to parent_hws
>   clk: qcom: gcc-sm8550: switch to parent_hws
>   clk: qcom: gpucc-msm8998: switch to parent_hws
>   clk: qcom: gpucc-sc7180: switch to parent_hws
>   clk: qcom: lpasscc-sc7180: switch to parent_hws
>   clk: qcom: dispcc-sm8250: switch to devm_pm_runtime_enable
>   clk: qcom: dispcc-sm8450: switch to devm_pm_runtime_enable
>   clk: qcom: lpasscc-sc7280: switch to devm_pm_runtime_enable
>   clk: qcom: videocc-sm8250: switch to devm_pm_runtime_enable
> 
> [...]

Applied, thanks!

[01/21] clk: qcom: dispcc-sm8450: switch to parent_hws
        commit: 5c0df30cb3e431b9bcc10b457bb9fda388842035
[02/21] clk: qcom: dispcc-sc7180: switch to parent_hws
        commit: a9e46af1718a206b79f8801ad258e773cec81c49
[03/21] clk: qcom: dispcc-sm6375: switch to parent_hws
        commit: 0e042233bd56e8731fc9455cca391fce9e7468ec
[04/21] clk: qcom: camcc-sc7280: switch to parent_hws
        commit: 17f0b48f8de68776f1ba7498695f26262016cb44
[05/21] clk: qcom: camcc-sm8450: switch to parent_hws
        commit: a2a796c1d6859b32c686388d762612b03d9a2bdb
[06/21] clk: qcom: gcc-msm8939: switch to parent_hws
        commit: 3f1c24b9674a1cd30fdd3d66f9244a08c8f0f728
[07/21] clk: qcom: gcc-msm8976: switch to parent_hws
        commit: fec6a7b5454baa41b5879b2763e952efc57c6ba6
[08/21] clk: qcom: gcc-sc7180: switch to parent_hws
        commit: bbedddafa069773fdb085155117c873343959b50
[09/21] clk: qcom: gcc-sc7280: switch to parent_hws
        commit: a28c07fc915bebc0f79ab9957f7a7a4077cef22a
[10/21] clk: qcom: gcc-sdx65: switch to parent_hws
        commit: 76ffb1921084ae64ccfe107bef5e5d4b351ebc55
[11/21] clk: qcom: gcc-sm6375: switch to parent_hws
        commit: 5d0e6922b8a300de941bd552d95365ec2892f7ad
[12/21] clk: qcom: gcc-sm8250: switch to parent_hws
        commit: 6df8ecd018ae6012ee8f402c342ad5bb23106487
[13/21] clk: qcom: gcc-sm8450: switch to parent_hws
        commit: 1b299e87b1c731a77ec397da15cefc5acbeb1f15
[14/21] clk: qcom: gcc-sm8550: switch to parent_hws
        commit: 18aa0dc22d2b09eda19312aed82fe02f80d616e2
[15/21] clk: qcom: gpucc-msm8998: switch to parent_hws
        commit: 353b18dca2c0abf7db85e59c6bdc459543317b43
[16/21] clk: qcom: gpucc-sc7180: switch to parent_hws
        commit: 77e1e697cf380ab970613d517fa1df79ec5d5e54
[17/21] clk: qcom: lpasscc-sc7180: switch to parent_hws
        commit: 7e5c218f33a4e10f982e08556ab1a9aacc4d008e
[18/21] clk: qcom: dispcc-sm8250: switch to devm_pm_runtime_enable
        commit: 009d43686ec6cfd6ceb7ef6a940132232268aa8e
[19/21] clk: qcom: dispcc-sm8450: switch to devm_pm_runtime_enable
        commit: b69069c3ff68ff39aa182a901db89b0fdcfefa02
[20/21] clk: qcom: lpasscc-sc7280: switch to devm_pm_runtime_enable
        commit: f9048217a48cd86c1dd32e0e9b5ad204896b1343
[21/21] clk: qcom: videocc-sm8250: switch to devm_pm_runtime_enable
        commit: 68714ad80829dc34b7db71819bd8b908ecdd7222

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
