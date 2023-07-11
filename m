Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECE9E74E850
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 09:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbjGKHp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 03:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231528AbjGKHpQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 03:45:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF6EE75
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 00:45:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D16361365
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699D7C433C7;
        Tue, 11 Jul 2023 07:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689061505;
        bh=TtqMpM4hW9AyV/Tt+Gydfd5XB5pw625KQ3mnbG3pd44=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=qPjCG+heQ/6Lr135KxiYrFt07VW7BfjXXzHEfKRbDcx8eFfxVfBoF67MpxEKYYALP
         mKzZQAzfXWH78LKfbO27R2FHXSfGxsC0qBXX1fz5CIkq3vxAzVbtBdz0v37cjPPdhM
         0Ux4AJvyLrfZlUHtspdwEh2pdzPQV6BK6Z0gjMzu8HFQ7NGYhn6M74oAJhC8wLgwZy
         MqpOylsvpUVqJP5deghUAC1Rdckwpuo+Vvv12UQsDwGRPPPUM4gaWL6vbkU4fNtUyr
         Vaqn8lqzLbgxppmjXISmqiqEQdF0WFao1iiV2Nw9IUlVpK1RUwB0AyRuQ8ZvHlJ1WC
         3IoJu2ivsK4Og==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        freedreno@lists.freedesktop.org
In-Reply-To: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
References: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
Subject: Re: [RESEND PATCH 0/7] phy: qcom: qmp-combo: rework register
 access
Message-Id: <168906150192.189433.12057457685611728687.b4-ty@kernel.org>
Date:   Tue, 11 Jul 2023 13:15:01 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 21 Jun 2023 18:33:10 +0300, Dmitry Baryshkov wrote:
> For some reason I used the wrong script to send this patchset, resend it
> including proper (linux-phy & maintainers) recipients.
> 
> The patch at [1], which added another function just to have v4 vs v6
> register address difference prompted me to take a look at the combo PHY
> driver. We already have mechanism, register layout descriptions, for
> coping with register address differences, which I ignored while adding
> v4 support. It looks like nowadays this has exploded somehow, resulting
> inseveral almost-identicatical functions.
> 
> [...]

Applied, thanks!

[1/7] phy: qcom: qmp-combo: correct bias0_en programming
      commit: 8fa60f5ab940ba732644c996c3570b78b10b8fdc
[2/7] phy: qcom: qmp-combo: reuse register layouts for more registers
      commit: 211ddf1d89cfb6be8aead2092c95bb285bf790b6
[3/7] phy: qcom: qmp-combo: reuse register layouts for even more registers
      commit: 01f363f4eb0c0c35aa88a0ff2a329c4d88dc1da0
[4/7] phy: qcom: qmp-combo: reuse register layouts for some more registers
      commit: 245fa640ea46ad430cd962351fef0618f71ffda9
[5/7] phy: qcom: qmp-combo: drop similar functions
      commit: f4ed3532ca7422811083d15a204f91b8f5f8b49a
[6/7] phy: qcom: qmp-combo: drop qmp_v6_dp_aux_init()
      commit: 8e4137dc4eac0982aeb4f3fd103598a41c4f165d
[7/7] phy: qcom: qmp-combo: extract common function to setup clocks
      commit: 315a1a400d9c6533823e3e3af9b07cb4d0555f77

Best regards,
-- 
~Vinod


