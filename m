Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91DC26021AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 05:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiJRDGn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Oct 2022 23:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiJRDGd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Oct 2022 23:06:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44758A7F0;
        Mon, 17 Oct 2022 20:06:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9D1C2B81C62;
        Tue, 18 Oct 2022 03:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D990C43143;
        Tue, 18 Oct 2022 03:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666062389;
        bh=Hfd9BIUtESFczsoFDl8f6ULWns+IQqKn5CHgXX7RyWk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j0B0zfNmIrRExnUHPCdO+e7tRqm+HHe30oPWZtCXqOAtdl4Pj6mpADlzivNvjbjpZ
         n7/I3bbbHgN2XBkYTToqcD5kAA5aUmf/pgdH/vtbusFLAjRQbGaPSxoWYGbaEl8QcA
         FAxt84zTgxi3A1vpPu0p6f0qEdk4rLBe216cCnJJDYnw94WB4tGxm9/B5johfSdmtQ
         S8j0hV2buZYydK46ScZ+v9m9CNZUCVheSZzApzGA7IapQ0dGDcKsO7Lehv/4j8SIif
         H7tg5nv+n2oCGukikIuxUB2kIRqGZPXTDWIREljtY9uD91XsiChHzQX9mpR6tqRLu9
         yeIo7R7SCg8qQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, robh+dt@kernel.org,
        agross@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, airlied@linux.ie,
        devicetree@vger.kernel.org, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: (subset) [PATCH 0/9] arm: dts: qcom: rename DSI PHY nodes
Date:   Mon, 17 Oct 2022 22:05:10 -0500
Message-Id: <166606235857.3553294.1408675874980992171.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
References: <20220924090108.166934-1-dmitry.baryshkov@linaro.org>
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

On Sat, 24 Sep 2022 12:00:59 +0300, Dmitry Baryshkov wrote:
> Historically DSI PHY device tree nodes used the dsi-phy@ names. Replace
> them with generic phy@ names.
> 
> Dmitry Baryshkov (9):
>   ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
>   ARM: dts: qcom-msm8974: change DSI PHY node name to generic one
>   arm64: dts: qcom: msm8916: change DSI PHY node name to generic one
>   arm64: dts: qcom: msm8996: change DSI PHY node name to generic one
>   arm64: dts: qcom: sc7180: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm630: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm660: change DSI PHY node name to generic one
>   arm64: dts: qcom: sdm845: change DSI PHY node name to generic one
>   arm64: dts: qcom: sm8250: change DSI PHY node name to generic one
> 
> [...]

Applied, thanks!

[1/9] ARM: dts: qcom-apq8064: change DSI PHY node name to generic one
      commit: cf6cea98662dc9ecf7707076b10499785870ff23
[2/9] ARM: dts: qcom-msm8974: change DSI PHY node name to generic one
      commit: 798e65cdd910a59a34de365ff9e00c186fb568b4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
