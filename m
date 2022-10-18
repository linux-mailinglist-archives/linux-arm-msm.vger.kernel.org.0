Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A40766021A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbiJRDGj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbiJRDGc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:06:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B7289AF6;
        Mon, 17 Oct 2022 20:06:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 72924B81C55;
        Tue, 18 Oct 2022 03:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD41C433C1;
        Tue, 18 Oct 2022 03:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062387;
        bh=dsrah5p4heQiZh4NCpw2wclF+zYgn+7iEEG5PXJM4j4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BXuCCbBaYL78irnSRdjyfjDfvSIqTflEyPo6l0T+MiSq5hq2ySgjfKIWoUEk767To
         vOBh36S4hi2C7x5Ad32ZVDkfzRHzsxPG7ERR0dQJlXnItUSHO88/KYrMmlmcnGFt2D
         yhtoGVlj1YXxhRGZE6OPzM64jmQ58aTmS48WtbP0Iw5Su7YYJeVQRVp2jY+jN1BNlC
         UXI7iLSv2DS3A0d2G88+dAoEkirhc69HMCWbSiNWnO/0QxIs/YcNyRZ8rwHMlLwq/Y
         BpDfwjMkhlllilGOi3Cj980pK9xbLXOW4hp+nj0EtT3FCvwOHpsDv1N4O61YrDIo/m
         gsQtiEsbygMMg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robh+dt@kernel.org,
        agross@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 00/23] ARM: dts: qcom: rework DT for apq8064, msm8960 and msm8660
Date:   Mon, 17 Oct 2022 22:05:08 -0500
Message-Id: <166606235841.3553294.10137709245017789256.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 30 Sep 2022 21:52:13 +0300, Dmitry Baryshkov wrote:
> Rework DT files for older 32-bit MSM Snapdragon platforms. Use links
> rather than replicating the whole DT structure, cleanup several DT
> issues (like erroneous node names).
> 
> Dmitry Baryshkov (23):
>   ARM: dts: qcom: apq8064: disable HDMI nodes by default
>   ARM: dts: qcom: apq8064-ifc6410: use labels to patch device tree
>   ARM: dts: qcom: apq8064-ifc6410: pull ext-3p3v regulator from soc node
>   ARM: dts: qcom: apq8064-ifc6410: fix user1 LED node name
>   ARM: dts: qcom: apq8064-ifc6410: pull SDCC pwrseq node up one level
>   ARM: dts: qcom: apq8064-flo: use labels to patch device tree
>   ARM: dts: qcom: apq8064-nexus7-flo: fix node name for ext 3p3v
>     regulator
>   ARM: dts: qcom: apq8064-cm-qs600: use labels to patch device tree
>   ARM: dts: qcom: apq8064-cm-qs600: pull 3p3v regulator from soc node
>   ARM: dts: qcom: apq8064-cm-qs600: pull SDCC pwrseq node up one level
>   ARM: dts: qcom: apq8064-sony-xperia-lagan-yuga: use labels to patch
>     device tree
>   ARM: dts: qcom: apq8064: drop amba device node
>   ARM: dts: qcom: apq8064: drop unit ids from PMIC nodes
>   ARM: dts: qcom: apq8064: drop qcom, prefix from SSBI node name
>   ARM: dts: qcom: apq8064: fix the riva-pil node id
>   ARM: dts: qcom: msm8960: drop unit ids from PMIC nodes
>   ARM: dts: qcom: msm8960: drop qcom, prefix from SSBI node name
>   ARM: dts: qcom: msm8960-cdp: drop unit ids from regulator node
>   ARM: dts: qcom: msm8960: drop amba device node
>   ARM: dts: qcom: msm8660: move pm8058 LED devices to the main DT file
>   ARM: dts: qcom: apq8060-dragonboard: use labels to patch device tree
>   ARM: dts: qcom: msm8660: drop unit ids from PMIC nodes
>   ARM: dts: qcom: msm8660: drop qcom, prefix from SSBI node name
> 
> [...]

Applied, thanks!

[01/23] ARM: dts: qcom: apq8064: disable HDMI nodes by default
        commit: 9707fc66ab40c62b459cf83fa9a32c4b7f39dc0c
[02/23] ARM: dts: qcom: apq8064-ifc6410: use labels to patch device tree
        commit: 3c9c03cf5033f5a7d5f455f1223fa99f43799b1e
[03/23] ARM: dts: qcom: apq8064-ifc6410: pull ext-3p3v regulator from soc node
        commit: 632546ad232761b65ffc8cca5499c6e8b6d67222
[04/23] ARM: dts: qcom: apq8064-ifc6410: fix user1 LED node name
        commit: 5564d5337f839a24439dda4dbd9477e52a0eeaf5
[05/23] ARM: dts: qcom: apq8064-ifc6410: pull SDCC pwrseq node up one level
        commit: 36e9b3420768e2c883eaa443de53df167c589922
[06/23] ARM: dts: qcom: apq8064-flo: use labels to patch device tree
        commit: 2aadb0e9835962fb1d4e0a214293b0592c5e8b70
[07/23] ARM: dts: qcom: apq8064-nexus7-flo: fix node name for ext 3p3v regulator
        commit: 5998a762981ad77b44d4389b501a7c114d08a65e
[08/23] ARM: dts: qcom: apq8064-cm-qs600: use labels to patch device tree
        commit: efbc351abf4770a84e36b1c58ee76ba1cd699864
[09/23] ARM: dts: qcom: apq8064-cm-qs600: pull 3p3v regulator from soc node
        commit: 5586f54d62237580c58ca0d432a9d17c72fb650d
[10/23] ARM: dts: qcom: apq8064-cm-qs600: pull SDCC pwrseq node up one level
        commit: ab1605f45421a1ef112cc917dab8d3b3367813f8
[11/23] ARM: dts: qcom: apq8064-sony-xperia-lagan-yuga: use labels to patch device tree
        commit: e10c147eb6ad997288b4ff33289791cf167336b6
[12/23] ARM: dts: qcom: apq8064: drop amba device node
        commit: 967b4b52bfd1dc1490fa8a38a91df1a30a5c66ca
[13/23] ARM: dts: qcom: apq8064: drop unit ids from PMIC nodes
        commit: db259c5e5a995ed02028615d7d3fa85c7b9ae096
[14/23] ARM: dts: qcom: apq8064: drop qcom, prefix from SSBI node name
        commit: d36ee0683d86c66b5705de23ab8b3d466671de4f
[15/23] ARM: dts: qcom: apq8064: fix the riva-pil node id
        commit: 8041a9be6f3862062d26d951d9f9c74823a76595
[16/23] ARM: dts: qcom: msm8960: drop unit ids from PMIC nodes
        commit: 44c6b2c22bd350b4a2cd93367deed21adc6143c0
[17/23] ARM: dts: qcom: msm8960: drop qcom, prefix from SSBI node name
        commit: 0ccc49d643d6d80126e6949def3f63f2586d43d8
[18/23] ARM: dts: qcom: msm8960-cdp: drop unit ids from regulator node
        commit: e0fec2efd508e57e7370ee1cd89a60217ece5205
[19/23] ARM: dts: qcom: msm8960: drop amba device node
        commit: 07573320d7df01914453e52307744f8011e9430e
[20/23] ARM: dts: qcom: msm8660: move pm8058 LED devices to the main DT file
        commit: cdaf1f11809257b8c5c1fe417c6e0764721b0cf3
[21/23] ARM: dts: qcom: apq8060-dragonboard: use labels to patch device tree
        commit: be60ae9be73fb6463a0687d4aa1fb40418faa3b2
[22/23] ARM: dts: qcom: msm8660: drop unit ids from PMIC nodes
        commit: 621f3a4fe0282d2e60eed4a81e9f9e84b34f18ab
[23/23] ARM: dts: qcom: msm8660: drop qcom, prefix from SSBI node name
        commit: 963c336ef8a76b235fea1a77d8d6075f2618de01

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
