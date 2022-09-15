Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156165B933E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 05:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbiIODhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Sep 2022 23:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiIODhQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Sep 2022 23:37:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BEB092F7E;
        Wed, 14 Sep 2022 20:37:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7EFABB81D75;
        Thu, 15 Sep 2022 03:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF13EC4347C;
        Thu, 15 Sep 2022 03:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663213031;
        bh=KxdZUKe1FhFDeqYOXN6BYRfxXZGj21xAg5hE3J+Cd5k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kWKUEfmG+e/tYxbHra/T7k7GOJ/jZCv4yTs8pwDMCc2cibgNiws5zwPshLWp3CQF1
         DL6zmPDYq/RtwvemGwmWY9EoHq7DySOQaBpOOMWpHSnhTWH9QpWx3Zj2oNa8fllGBU
         mYO3fslzKWCE2akRA45YWXL6Z4xDBngzO/tvyniiE7iQFkwSm/3C9CLmUnURbN7kJx
         KxPNrLv9ynMVsDDNUVEunM3SnqTOBEakbcBw6vvhSLKm1eB6vY8T77zhoUL7+OaKis
         X/ESlHNH1+bFH6WcjtVHyjPm09L3F7vPLSzJ3gxjOSPF1AVXU8TnN/9XvIg426mOVI
         ZOp1J9HTH6qQA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, Bjorn Andersson <andersson@kernel.org>,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
        swboyd@chromium.org, airlied@linux.ie, vkoul@kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        daniel@ffwll.ch, kishon@ti.com, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] drm/msm/hdmi: turn MSM8996 HDMI PHY into OF clock provider
Date:   Wed, 14 Sep 2022 22:36:53 -0500
Message-Id: <166321302054.788007.13905269452519533105.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
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

On Mon, 4 Jul 2022 19:11:45 +0300, Dmitry Baryshkov wrote:
> On MSM8996 the HDMI PHY is the QMP PHY, it provides an HDMI PLL clock
> used by the MMCC. Add support for providing this clock to the OF
> framework by registerding the clock provider and adding #clock-cells
> property to the DT node.
> 
> The dt-bindings from this series depends on changes from [1] (part of
> linux-next, but not of the msm-next yet).
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO clock to the HDMI PHY node
      commit: 157b615066288f84e1812964a439603cfe8c1a19

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
