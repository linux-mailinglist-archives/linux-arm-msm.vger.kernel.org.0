Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03277A9EA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Sep 2023 22:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230046AbjIUUH5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Sep 2023 16:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbjIUUHr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Sep 2023 16:07:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1A326A1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Sep 2023 10:02:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9743C4E758;
        Thu, 21 Sep 2023 14:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695306566;
        bh=i7yPeuk2Yj5yCsGwQ+SXnhbxyv502egxjv2oc9SFNmE=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=PCZ16C3C4Dbv8TEe8702mLOtUgACJfVB5x0outhchQVYNtesPJMUye/gHbkGDyXR+
         P5ZVpxRfVNMZBl8VLIC59dERUnVdSsBy/EMkIZ2dV/PMqV0TIBS45ofEPTHtbdezB3
         5Jb2qJZCTea3xOZ9eIwZtcTpH2hJyY0lrdE+r7M4k7Fykm0cGcI6l3ELkhtmOVuJ0T
         Qfvb0QTm2Az1/rQuYtFXs7JKSmXl5THRc86wn7o8tfQgOqI/zAd4SAquhHygZPS7yE
         CNPanpj9Q3Br/q8g+SLoDG/lxaw61miuswZ0ImVGlF6SQFjxW6RDK/wX0fv99xAJ2l
         WmgeNvrRlPWkQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
References: <20230824211952.1397699-1-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v3 00/16] phy: qcom-qmp-usb: convert to newer
 style of bindings
Message-Id: <169530656347.106263.14330882289989442266.b4-ty@kernel.org>
Date:   Thu, 21 Sep 2023 16:29:23 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Fri, 25 Aug 2023 00:19:36 +0300, Dmitry Baryshkov wrote:
> Reviewing several patchsets for newer platforms made it clear that
> having two styles of QMP PHY bindings causes confusion. Despite binding
> documents having notes telling that old bindings should be used for
> older platforms, it is too easy to attempt adding new platform with
> older QMP PHY binding. Thus let's have just a single documented style of
> bindings.
> 
> [...]

Applied, thanks!

[01/16] dt-bindings: phy: migrate QMP USB PHY bindings to qcom,sc8280xp-qmp-usb3-uni-phy.yaml
        commit: 15c83637402c3654dbc7aac368119c3809a119fa
[02/16] phy: qcom-qmp-usb: simplify clock handling
        commit: 7233090aba54d82a1ed64f125b32c3ac0b91803c
[03/16] phy: qcom-qmp-usb: rework reset handling
        commit: fcf63482f6a9d383f04e409bc50f00eecb74ae73
[04/16] phy: qcom-qmp-usb: make QPHY_PCS_MISC_CLAMP_ENABLE access conditional
        commit: 6e9402261e8c85ec386b473ce3738d6e9d3e5013
[05/16] phy: qcom-qmp: move PCS MISC V4 registers to separate header
        commit: dc32762214e4bb683bfb21dcb4ade10e27e11c6d
[06/16] phy: qcom-qmp-usb: populate offsets configuration
        commit: 2be22aae6b18326426443d6c0cc9ac6985183a89

Best regards,
-- 
~Vinod


