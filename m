Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AAD168A2DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 20:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbjBCTVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 14:21:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbjBCTVU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 14:21:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71FC970D58;
        Fri,  3 Feb 2023 11:21:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 32197B82BA0;
        Fri,  3 Feb 2023 19:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C651AC433D2;
        Fri,  3 Feb 2023 19:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675452076;
        bh=f9xPi+aq/606+CoCRxhTO/FL3gpDkGLdJ6xO+uL+cTM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=azwQTOJlwMoQfXFW4d9g7DhIt2957Y0c/KpCviXGkGJp5m+qnHXspUmWKcMZYlcmn
         6DaElSxluoHCv/DiEfgAPF4it2jLXxR/wE1VxfGAiVsOLG7Kby8amOeYJP/py7hEQA
         bpYelbMq5n3dcxX+Q3s62+8ReNYWjRNxthaX7WSH/LpAh5PL5DIDtd7UViotQsW0za
         1qca0oysud8Q5U+MACXlOlP8Y1Q7PYNJ3LW5pzPClHOSITXk1K8miwl/X4o6iHGW4i
         QuCLuz2P4zIPYKcGRUGyLSEblYpeQG2q8vNarI2sohJmhRSHTTZN6ddd161ADBu2+Y
         BPUpukVLA518w==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: (subset) [PATCH 1/4] dt-bindings: display/msm: add qcom,sc8280xp-edp to list of eDP devices
Date:   Fri,  3 Feb 2023 13:21:13 -0600
Message-Id: <167545206737.231526.17174699314671078466.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
References: <20230118031718.1714861-1-dmitry.baryshkov@linaro.org>
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


On Wed, 18 Jan 2023 05:17:15 +0200, Dmitry Baryshkov wrote:
> Add qcom,sc8280xp-edp to the list of eDP devices, unblocking `aux-bus'
> property and fobidding `#sound-dai-cells' property. Also since
> sc8280xp-edp, overriding sc8280xp-dp, will contain 5 reg resources, drop
> the reg contraint (as it will become equivalent to the top-level one,
> requiring min 4 and max 5 reg entries).
> 
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: sc8280xp-crd: drop #sound-dai-cells from eDP node
      commit: 3cfa9e245d71f498a27f2dd8d09bbaaf50738723
[4/4] arm64: dts: qcom: sc8280xp: add p1 register blocks to DP nodes
      commit: 19eee67386fe68b8f39dc947d15711a5b5cef6ac

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
