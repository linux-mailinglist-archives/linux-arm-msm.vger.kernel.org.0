Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9A47A702C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Sep 2023 04:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231835AbjITCKG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Sep 2023 22:10:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbjITCKE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Sep 2023 22:10:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6239BE
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Sep 2023 19:09:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1F3C433CB;
        Wed, 20 Sep 2023 02:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695175798;
        bh=kPXR+UXVZ0VUqE2ympbrGREBDM3xaV8v9dfBKtmEy6k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nx0P0H3RkFdheOnYYhN0PIhuWW9/vdQJmU7w6YHyBDRKdz/QZZ7bwPHmScB77quyC
         wNA4dng2SixGia8gSU3aiQwBH9zlTyGGX6CsnU/z9kPcFj7Ihj3id44YyvzbeHetRo
         S7fP0wo6RMqygW2CwwUzakApUuLMa9JFNdqsB+tgDeMLjmkg+HMw/6p77Ml0anFm5h
         adQoa9mkskNTtQwY6YqqN0NEMb2vTBi7arB5dLFSrwehv3fDhkaQwLAELXdce1jeB9
         iM/viZ1Bkyu9cnh7bVJMmpAtCAc7/k39z6hUQW5IAQwx9tg5lbrQqE3iTs1Q8J6lf/
         TsS1AkUXRhYjA==
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
Subject: Re: (subset) [PATCH 0/5] arm64: dts: qcom: qrb5165-rb5: enable DP support
Date:   Tue, 19 Sep 2023 19:13:58 -0700
Message-ID: <169517603985.822793.10273451924979552545.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Sun, 09 Jul 2023 07:19:21 +0300, Dmitry Baryshkov wrote:
> Implement DisplayPort support for the Qualcomm RB5 platform.
> 
> Note: while testing this, I had link training issues with several
> dongles with DP connectors. Other DisplayPort-USB-C dongles (with HDMI
> or VGA connectors) work perfectly.
> 
> Dependencies: [1]
> Soft-dependencies: [2], [3]
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: qcom: sm8250: Add DisplayPort device node
      commit: 956aa24b16350a50d3a6beb9237bc35aa2f447d6
[3/5] arm64: dts: qcom: qrb5165-rb5: add onboard USB-C redriver
      commit: d342e1c993bd7589cad9d2da099c6a9c652ecb9f
[4/5] arm64: dts: qcom: qrb5165-rb5: enable displayport controller
      commit: 96387ee7534dc449be35a9bb98b7668da2bed545
[5/5] arm64: dts: qcom: qrb5165-rb5: enable DP altmode
      commit: b3dea914127e9065df003002ed13a2ef40d19877

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
