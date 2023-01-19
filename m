Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69B10672ECD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 03:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbjASCRW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 21:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjASCRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 21:17:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0EDF4B188;
        Wed, 18 Jan 2023 18:17:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6634F61AA0;
        Thu, 19 Jan 2023 02:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5110C4339C;
        Thu, 19 Jan 2023 02:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674094625;
        bh=NwUQ5xIBukv5i4en356Co6TtUVTv9Rud5u+DKgS83BA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BYeLXohnxymuYwOxjwxo9/bqLkxrJB/xzz/zBxJ1ZUwW+mJFtDVOLHa+yswA5enp/
         NP2dikuGtml1yhzDs3T+OniZHGxO8G/sjmCHwF0iXGYrplSqUBGYMJHuBp1rPVs7ih
         vwHo1qYeZTQwYBe2/+5qRLwnuL3Ru1WqramG+azYsHr4+rbnpOLqH29ZkMcu5IVqCX
         +B7MY2DMl4eqVDfCWxKlb3X1wlXKqQpt66auHoxwckwAc28j/SHl163iFEc66PnPBe
         SzsvZYMRFvIR9L+cYjEIB+8qfT5KpAIIE5IykxYwWNFBll1DZB1Bo9oaFPUCEDKBwT
         Y0fymVdxslKHA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, Andy Gross <agross@kernel.org>,
        konrad.dybcio@linaro.org, quic_abhinavk@quicinc.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        sean@poorly.run, robdclark@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: (subset) [PATCH v5 0/4] dt-bindings: display/msm: convert MDP5 schema to YAML format
Date:   Wed, 18 Jan 2023 20:16:54 -0600
Message-Id: <167409461442.3017003.4468887487098275908.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
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

On Mon, 9 Jan 2023 07:01:48 +0200, Dmitry Baryshkov wrote:
> This patch concludes the conversion of display/msm schema from txt files
> to YAML format.
> 
> The per-SoC compat (new addition) is required to ease migrating platform
> support between mdp5 and dpu drivers.
> 
> Changes since v4:
> - Adjust qcom,mdss.yaml to follow the addition of per-SoC compatibles
> 
> [...]

Applied, thanks!

[3/4] ARM: dts: qcom-msm8974: add SoC specific compat string to mdp5 node
      commit: 11691dab82e135c9a13cda49234ff3e76bba48d3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
