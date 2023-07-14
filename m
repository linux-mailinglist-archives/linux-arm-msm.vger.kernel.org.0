Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E724F753128
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jul 2023 07:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234016AbjGNFam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jul 2023 01:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234778AbjGNFal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jul 2023 01:30:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8088F19B4;
        Thu, 13 Jul 2023 22:30:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 112B461C0A;
        Fri, 14 Jul 2023 05:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A629C433CA;
        Fri, 14 Jul 2023 05:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689312639;
        bh=Zmn4NeheusfOk3tm5PX2lZHGmvP/Ct+fKQyBjBgdVT8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=b59UApgjxctYKqLTMw5dpvyKH+L+luO0L14Jbi+NwMAnkJgpd6urUBhq4yxT/V83w
         KqUjJYJTGLA24mwfrUiBjInhA9iVIn/jH5EIvevx8mya3tCARsE4evg63LaQDT519v
         eIqA5Pi7EWWV7oyntjgt1KLj/KUXI8aIYv6SyxoTMjpdT70mTrxRQYmE7MR8QUvWxF
         ShLRgWZPpUAEqsVboF1hgiUNUFajQ5V3nqGijMUc+YjjF0NW5vzqSR4iNPAD/XYW4i
         tYFbxl4MPeYyBry2qHOYHc1u1lgEwUeQDzW1BgvOJ/TKUM2xxxR7346geCQWaqFpl6
         v914/2rKxyIxQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: (subset) [PATCH v2 0/8] MDSS reg bus interconnect
Date:   Thu, 13 Jul 2023 22:33:55 -0700
Message-ID: <168931284127.1538684.17964708755226748693.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Wed, 12 Jul 2023 15:11:37 +0300, Dmitry Baryshkov wrote:
> Per agreement with Konrad, picked up this patch series.
> 
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects. from none to otherwise
> inexplicable DSI timeouts.
> 
> [...]

Applied, thanks!

[8/8] arm64: dts: qcom: sm8450: provide MDSS cfg interconnect
      commit: 4e125191e6cb00d6c3f3a8e1b67fd242e639b3c3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
