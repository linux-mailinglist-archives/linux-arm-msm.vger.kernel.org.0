Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0576B68A2DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Feb 2023 20:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjBCTVo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Feb 2023 14:21:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232618AbjBCTVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Feb 2023 14:21:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8FB571987;
        Fri,  3 Feb 2023 11:21:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8A54FB82BA2;
        Fri,  3 Feb 2023 19:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F9EC433EF;
        Fri,  3 Feb 2023 19:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675452078;
        bh=a0GsiNBZfOuCuESojYNwJ1g3/tM+bS7UT/gPekmd0Q8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=crVgcvrIPGgF+lQkCFF5Sr+6Z9yj4qF40B4XrR0wMUv9thYcEcreaj2/wW4uqLnze
         RGV+331O3KN+nXb94w10VFjH8VhcBX/2TsqTPH6UbevtTxPCDDkcUkuwAjz4YFtp2e
         x6UjXMjmpezYlS8iFSKFqq3c69rkkeNpdw7a33H3GeZZWI9pR2mK8mHCl7RHeoyJXX
         Bir0bxvhMHotuW4uGb1go0LMUOkkbyyoUjKfYmoSizw26j12G7tNqlzNI8c8VCoIVF
         H7DYcdJqKWlatnCYZZBOC6IkBB5Bo9UjovU5fDDBJo/ffnUSAyAq/icDCvV78XLniA
         G9DHcjd3aqfWg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>, Sean Paul <sean@poorly.run>,
        Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl compatibles
Date:   Fri,  3 Feb 2023 13:21:14 -0600
Message-Id: <167545206738.231526.12336122899683141674.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230118032024.1715857-1-dmitry.baryshkov@linaro.org>
References: <20230118032024.1715857-1-dmitry.baryshkov@linaro.org>
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


On Wed, 18 Jan 2023 05:20:24 +0200, Dmitry Baryshkov wrote:
> Add the per-SoC (qcom,sm8350-dsi-ctrl) compatible strings to DSI nodes
> to follow the pending DSI bindings changes.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl compatibles
      commit: d7133d6d25fbc9374447e2ca4e23a04023824779

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
