Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE7EF71311E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 May 2023 03:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235395AbjE0BDv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 21:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237793AbjE0BDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 21:03:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0297C135;
        Fri, 26 May 2023 18:03:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7DF10654BE;
        Sat, 27 May 2023 01:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8371C4339B;
        Sat, 27 May 2023 01:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685149426;
        bh=BqcK/Mp9xfjkP5h5iC/zjmOQm3zi/cUUxCRRE2beHfE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=twA+8CW4mcIbaUKarSSIwDDvxIDM8Ka+yudxOZReiXLEFLz5S0NEZkRQ+fVI4nkRS
         ni8yQyjJrflAS22N5NZ7dSLz3FL6hGzgRD4WFMfVrzm4aF5FVhS9U+AC9deOJ9cPCt
         F/A9b2KHHG9I0+uQC6tdCdr/0sw+51woGJsADLSL/NVLwROX4ihaPQ3VhzOBM0+g+y
         4pF6CLcbCDNXc12TIHNEO5XIPx+bRe1L3G2biJEZt8wV8Xu0ABmByHHn4Ptf/JO2Jk
         rDFDPyuHBeasxAqOFBE8kiBS+NOK/tP8w3WDONOQ99gQAI4A0R/NJsfedyc7Ibj4KJ
         U9OQp+TUr8fhA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>
Subject: Re: (subset) [PATCH 0/4] ARM: dts: qcom: apq8074-dragonboard enable DSI and remoteproc
Date:   Fri, 26 May 2023 18:07:21 -0700
Message-Id: <168514964951.348612.5598702836053862046.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 7 May 2023 22:07:31 +0300, Dmitry Baryshkov wrote:
> Enable GPU, DSI panel and remoteprocs on the APQ8074 dragonboard device.
> 
> Dmitry Baryshkov (4):
>   ARM: dts: qcom: msm8974: add ocmem clock to GPU
>   ARM: dts: qcom: apq8074-dragonboard: Set DMA as remotely controlled
>   ARM: dts: qcom: apq8074-dragonboard: enable adsp and MSS
>   ARM: dts: qcom: apq8074-dragonboard: enable DSI panel
> 
> [...]

Applied, thanks!

[2/4] ARM: dts: qcom: apq8074-dragonboard: Set DMA as remotely controlled
      commit: d184f79bd075871e2d16ce1ef739b22dedd3d928
[3/4] ARM: dts: qcom: apq8074-dragonboard: enable adsp and MSS
      commit: 3a0dda1a2553f97c0c8aebd181cd33e0eee5094d
[4/4] ARM: dts: qcom: apq8074-dragonboard: enable DSI panel
      commit: ac366501f64f83e03a0f6fd21b87188f92ce0e57

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
