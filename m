Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48B7C68FEF1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 05:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbjBIEbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 23:31:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbjBIEb3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 23:31:29 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 111493D092;
        Wed,  8 Feb 2023 20:31:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 768B1B81FFB;
        Thu,  9 Feb 2023 04:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10239C433A4;
        Thu,  9 Feb 2023 04:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675916493;
        bh=4BCwhIYTUP4n4Ju6LjJ1nXxVbLUcHs6EEQNOTxDnQtU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jso6jYn770iijmJitbMXK+G2t6tVeft2Xljmm4DT7BqN2lQdVqMuu2mPT2UIP5Ytr
         on8a0gwxYdECRNTo03tcJ22Wd54JKFbrHi69vEya3N/9EO6xm5QDXwQQClWcGJ4+2G
         0RAqnHs1G4ENv9rfmQXhUGUPG3s8Z2Pfp1PDNq/oOEEKcvQDBvRVOVsEwdztVIRi/d
         Cy8Im9FSZPnk5vuH0nav6EoqccicUQ/apydDgCV8s54aCSMJv9qc4xjY2cbBH02lF/
         vOm74+n9yiuAvQlEfhB714fREv7AWl3ozflxBZfqMRReFpx5wb4mQAplkmBRS1V4/d
         9vmU9IxE1PHiA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 0/6] drm/msm/hdmi: integrate msm8960 HDMI PHY with DT clocks infrastructure
Date:   Wed,  8 Feb 2023 20:22:49 -0800
Message-Id: <167591660365.1230100.2084751703451374585.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
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

On Thu, 19 Jan 2023 15:22:13 +0200, Dmitry Baryshkov wrote:
> Make msm8960's HDMI PHY accept clocks from DT and also register it as a
> DT clock provider.
> 
> Dmitry Baryshkov (6):
>   dt-bindings: phy: qcom,hdmi-phy-other: use pxo clock
>   dt-bindings: phy: qcom,hdmi-phy-other: mark it as clock provider
>   drm/msm/hdmi: switch hdmi_pll_8960 to use parent_data
>   drm/msm/hdmi: make hdmi_phy_8960 OF clk provider
>   ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
>   ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock
> 
> [...]

Applied, thanks!

[5/6] ARM: dts: qcom: apq8064: add #clock-cells to the HDMI PHY node
      commit: c9f678afe0bbdfb3748c1db5ac94d1c02a6eb64b
[6/6] ARM: dts: qcom: apq8064: use hdmi_phy for the MMCC's hdmipll clock
      commit: f1a359db6d9d198b84877e2340dd7c37809a4882

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
