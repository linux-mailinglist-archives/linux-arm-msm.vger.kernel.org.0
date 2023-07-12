Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51ECD74FE91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 07:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbjGLFCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 01:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231886AbjGLFCF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 01:02:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED9B91BD1;
        Tue, 11 Jul 2023 22:01:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 668D5616DF;
        Wed, 12 Jul 2023 05:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8715FC433C7;
        Wed, 12 Jul 2023 05:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689138117;
        bh=6KG17KUo8h820ZSa4mo8RX5Kp4K+MmsavBtP+yo27Fo=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=CT8b7w6nZPbtqdNRxfk9LMN2tBFnTl9hqy/S1MgnGC1gQBuosPhlAuYGx8A7OZBKX
         LN6eU3mJGsksA73NBWarH+0w+S8BSX/Y7/qMlNPcB4cipIm4bY1uMvqHWWcxvPOk0l
         cRWQT7UZ7hRXmOIzp1OKQ2RLvDB5rVQMTroCjvPMwPWibcsab/hH08Gwrw/yHl/Z8y
         Ou8JfI7g+Q/FsXDNHnfRwpSH/pTq3Zu2vcv3Y3okDGlDK6KCa4Jpk3Q7OdgxHBXrpk
         e+PSPYV9XXGDy6eprjdB1JJQG1IT8QE87lbAi1t2XkG7v3Hzt5oMIeqnffwyjZAaGt
         iXRymamONa0kg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
In-Reply-To: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
References: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v3 00/11] phy: qcom-qmp-ufs: convert to newer
 style of bindings
Message-Id: <168913811417.211971.4997836227104181246.b4-ty@kernel.org>
Date:   Wed, 12 Jul 2023 10:31:54 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 23 May 2023 17:06:11 +0300, Dmitry Baryshkov wrote:
> Reviewing several patchsets for newer platforms made me understand that
> having two styles of QMP PHY bindings causes confusion. Despite binding
> documents having notes telling that old bindings should be used for
> older platforms, it is too easy to attempt adding new platform with
> older QMP PHY binding. Thus let's have just a single documented style of
> bindings.
> 
> [...]

Applied, thanks!

[01/11] dt-bindings: phy: migrate QMP UFS PHY bindings to qcom,sc8280xp-qmp-ufs-phy.yaml
        commit: cd296e74242918f91bb86da0c67d8456338cbb16
[02/11] phy: qcom-qmp-ufs: populate offsets configuration
        commit: e2d9dbc01cb305af625c6db83c451645eef64470

Best regards,
-- 
~Vinod


