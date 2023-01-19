Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72E2F672ED0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 03:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbjASCRX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 21:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjASCRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 21:17:11 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2FF65EE7;
        Wed, 18 Jan 2023 18:17:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E46E5B81FBC;
        Thu, 19 Jan 2023 02:17:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB59C4339E;
        Thu, 19 Jan 2023 02:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674094623;
        bh=qfp2ZX7D6n+PcY6wypfWJ12w2hBmcOnALcPvzZR0X/E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZYOhMk2KIOyv+e8RrmmOlN3eG6Oept//073MIJxE3iuGfMXKNIdA/u92fdSu78lWF
         1Y+5waRBecoaiafcuLR6f0JWCu9XoCn4mLk1iSId/VcGd5s5QrMLDjGT4S8/ngUhvp
         vhu8TcVR3/20RmAMFlPG7cpXgTNp4+tQoJvlPHRCZ769lGpkLjzruQ3IvLizr0/jN4
         42n6XrPxSpmvgUfO86yaczAVkSF7ylxQgHG6YvdpCEvltm8rk15ioQh3ohAVwSeDj3
         6vJ1MQTnv5QyJzEUbC+i9YW5Fhf6tUxktpcHTUmIhkyrdMuD9gBV3Jdx7Aga+Ei170
         YyIZo4Z1keD5w==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, Andy Gross <agross@kernel.org>,
        konrad.dybcio@linaro.org, quic_abhinavk@quicinc.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        sean@poorly.run, robdclark@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH 0/6] dt-bindings: display/msm: rename mdss and mdp nodes
Date:   Wed, 18 Jan 2023 20:16:52 -0600
Message-Id: <167409461442.3017003.17675083884610037348.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
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

On Mon, 9 Jan 2023 07:13:56 +0200, Dmitry Baryshkov wrote:
> Finish the process of renaming display-related nodes on Qualcomm
> systems. Fix it in the schema that MDSS (Mobile Display SubSystem)
> devices are named `display-subsystem' and both MDP (Mobile Display
> Processor) and DPU (Display Processor Unit) nodes are named
> `display-controller'.
> 
> Dmitry Baryshkov (6):
>   dt-bindings: display/msm: rename mdss nodes to display-sybsystem
>   dt-bindings: display/msm: rename mdp nodes to display-controller
>   arm64: dts: qcom: rename mdss nodes to display-subsystem
>   ARM: dts: qcom-msm8974: rename mdss node to display-subsystem
>   arm64: dts: qcom: rename mdp nodes to display-controller
>   ARM: dts: qcom: rename mdp nodes to display-controller
> 
> [...]

Applied, thanks!

[4/6] ARM: dts: qcom-msm8974: rename mdss node to display-subsystem
      commit: 19230930286005d7c733a5cb0ed8ebce9cad4423
[6/6] ARM: dts: qcom: rename mdp nodes to display-controller
      commit: 858b0d4b04ead05cdfec094a1e4b18865f28cedc

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
