Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80C5D75F3FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 12:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233190AbjGXK4R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 06:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233169AbjGXK4Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 06:56:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51385BD;
        Mon, 24 Jul 2023 03:56:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A4958610A7;
        Mon, 24 Jul 2023 10:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01995C433C9;
        Mon, 24 Jul 2023 10:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690196171;
        bh=nhiYOOlqYWW6vzgECE0M6nDHju7clmLHW8qTMCC7aZU=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=jrC8yq/dHXAayYHzlJwe4D/32EaVTNbeCb8g9mYeP6aMu+GqrjpvYQNEwraOZzoNe
         U5/5UxiA7DdXj+3FPGHCvOvROlLOnCzci0fVAiAbfgvpLY3fV0YRHCLNiChegpZIYS
         0JB71pP1MRujoopQaR3pFSpXDyCtsfCaRX2fnLO3MBxmk8V7p8ZMiM6ORCFXAkYHxr
         Ca5oUpATvJ5r71KFkOu8YuQ3wrSs9nhT2oV3j6WFaBCpHfCcomb1oeXfwsAn+Ou/XM
         5Uqu4LZN7P8lpQc6Q6FJVsEBQjao9ji0iXRhvZcDymlLZXnAIa48xFBr8CBl+8NfnP
         Xn942CKLFs9NA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
References: <20230711120916.4165894-1-dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v4 00/10] phy: qcom-qmp-combo: convert to
 newer style of bindings
Message-Id: <169019616764.466601.16148746210108391264.b4-ty@kernel.org>
Date:   Mon, 24 Jul 2023 16:26:07 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 11 Jul 2023 15:09:06 +0300, Dmitry Baryshkov wrote:
> Reviewing several patchsets for newer platforms made me understand that
> having two styles of QMP PHY bindings causes confusion. Despite binding
> documents having notes telling that old bindings should be used for
> older platforms, it is too easy to attempt adding new platform with
> older QMP PHY binding. Thus let's have just a single documented style of
> bindings.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: phy: migrate combo QMP PHY bindings to qcom,sc8280xp-qmp-usb43dp-phy.yaml
        commit: 57a79ce964d76757c2fd21e097bcd9eb44884def
[02/10] phy: qcom-qmp-combo: simplify clock handling
        commit: 28e265bf84a8f885b3156f24dc246bf1d7bb40a5
[03/10] phy: qcom-qmp-combo: populate offsets for all combo PHYs
        commit: a542ae82dfdd1e84f84593161ffc586e72cc992d
[04/10] phy: qcom-qmp-combo: add qcom,sc7280-qmp-usb3-dp-phy compat entry
        commit: 486392f44dd96aeb34bbbc1b119bc5d332f1164f

Best regards,
-- 
~Vinod


