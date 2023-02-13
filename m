Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85B6F6953B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 23:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjBMWVG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 17:21:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjBMWVF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 17:21:05 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE4161C5BE;
        Mon, 13 Feb 2023 14:21:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6AA856131A;
        Mon, 13 Feb 2023 22:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB4CC433A0;
        Mon, 13 Feb 2023 22:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676326863;
        bh=MAFEEpooP81rHga3hyR7q68TKMP8X0VWoBWQ9cj/IzA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oY5aS8mtACHUYH8oywWM6PjXK2+FSJBLfIVpkFu2Jdb+zxScYYMPG8EciOaW4TYKW
         6SFFbpineQMZPTgCG1eGylsVifVPfhJywExsLjKGoQy9ED197UcBhOlqq3qH42kpxd
         Wba2KBUMwAniSj3T0B6O5Txu2V1k9yXDwXycuqYFJxtWpZM+vUY89fQf2fx/wBGsU3
         O4QJZBJiaAwJ/iHkuRCWttpA1yuzII8YnX4i3sgLZekmNNL1FO3m5pWYin6NxuySHS
         PtpJloWMCtKfIDSpWCR7zHS0Se0dcSFN4Q/Z9WKltWTJTf2HrpGo1yvP91LgvDf0AB
         e5kZCxnxMo9Ww==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: sm8350: enable GPU on the HDK board
Date:   Mon, 13 Feb 2023 14:23:00 -0800
Message-Id: <167632698310.557014.3960232028013864693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
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

On Thu, 9 Feb 2023 15:38:33 +0200, Dmitry Baryshkov wrote:
> Add A660 device to the Qualcomm SM8350 platform and enable it for the
> sm8350-hdk board. Unfortunately while adding the GPU & related devices I
> noticed that DT nodes on SM8350 are greatly out of the adress sorting
> order, so patches 2-4 reorder DT nodes to follow the agreement.
> 
> Changes since v1:
> - Dropped merged patches
> - Expanded commit messages to mention the sort order (by the node
>   address)
> - Rebased on top of latest Bjorn's tree
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: display/msm/gmu: add Adreno 660 support
      (no commit info)
[2/6] arm64: dts: qcom: sm8350: reorder device nodes
      commit: f5f6bd58186afa4ec1ebcd074bc30255826e8480
[3/6] arm64: dts: qcom: sm8350: move more nodes to correct place
      commit: 1417372f4f846fbc28b4306370eb011d1f0853ca
[4/6] arm64: dts: qcom: sm8350: finish reordering nodes
      commit: 51f83fbbf1c8d7a09885099f9a8f25b3c9139797
[5/6] arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
      commit: 54af0ceb75958a8b7e62138646cfa6c114e71a77
[6/6] arm64: dts: qcom: sm8350-hdk: enable GPU
      commit: a8ecd17bb681d1743309b0d2a4622b643b61d69c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
