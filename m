Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2758561E8F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 04:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbiKGDMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Nov 2022 22:12:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbiKGDMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Nov 2022 22:12:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B42DF9E;
        Sun,  6 Nov 2022 19:12:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F100E60E98;
        Mon,  7 Nov 2022 03:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BF4C433C1;
        Mon,  7 Nov 2022 03:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667790762;
        bh=wSGw+1ab0M0hKgWXdmnc430Sc24IHBbcUGFcWPL0QwM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XLX1Ki5lGjwO/KGG/AdqOInGVZX3fKiY2rjf8ytrME1jfDNeCnFBT1iS1Ghr5tciH
         CuOS5N07fJDCQQoQm6uw2blbs22bBjJXrLQMrE4pS8qsa6tgtHVw2ojirKKipczsd2
         F76nlTVsvvO7aduRjwkQvnstm8nWcG9svDOchNCqoCN5aVO96MekqDoUZEgAE51T/z
         S4DgBrCzzq36mo1vw0w2ufSO0y1ki7ILpsgGFhxzNnPqz20jhvP9kyF1wn+HDwjxAD
         6rpI3m8hXFXj97u55KSCW1u3iGme6GxPAfrdrOQt4v1sL0jDn9nmk7VuriboYvG9Uz
         bMQ1LyDnC0c/w==
From:   Bjorn Andersson <andersson@kernel.org>
To:     krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
        sean@poorly.run, Rob Herring <robh+dt@kernel.org>,
        quic_abhinavk@quicinc.com, konrad.dybcio@somainline.org,
        robdclark@gmail.com, Andy Gross <agross@kernel.org>
Cc:     devicetree@vger.kernel.org, swboyd@chromium.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        daniel@ffwll.ch, airlied@linux.ie, freedreno@lists.freedesktop.org
Subject: Re: (subset) [PATCH 0/2] arm: dts: qcom: rename HDMI PHY nodes
Date:   Sun,  6 Nov 2022 21:12:00 -0600
Message-Id: <166779074251.500303.3874190524418032312.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
References: <20220924094347.178666-1-dmitry.baryshkov@linaro.org>
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

On Sat, 24 Sep 2022 12:43:45 +0300, Dmitry Baryshkov wrote:
> Historically HDMI PHY device tree nodes used the hdmi-phy@ names.
> Replace them with generic phy@ names.
> 
> While there is no such requirement in the DT schema, it's worth doing
> that because:
> 
> 1) The recent qcom DT files already use just phy@ for most of PHY nodes
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: qcom-apq8064: change HDMI PHY node name to generic one
      commit: 5743efe0e73e4e1c8d042e982e31bb8145e35baf

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
