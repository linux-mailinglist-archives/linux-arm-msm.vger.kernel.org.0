Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 904D3666402
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235870AbjAKTtl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235022AbjAKTta (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:49:30 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8924EC21;
        Wed, 11 Jan 2023 11:49:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id AE4F4CE1BB1;
        Wed, 11 Jan 2023 19:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C968C433F1;
        Wed, 11 Jan 2023 19:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673466551;
        bh=hR9gicPlyQiFsf85VdDJGh4EoIBO+8Y9gUPxlPQfCEA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eBOGbVLJQMz6ORMnZIIM1FqpbwFRRnzCjbsQtUtDwcX1C8iEg+zI1zYklY7ye/1x5
         FBKTzMx8v3DksQOr7mHyupEECXiJjCMDMFBSlovR8WeJnu2SxpnBypwI82LdxqzIJa
         xUuLtZ+9KySVJ0MN/rdunPW/H6g9GaiTzHXdlF8AFddYkgCQeZZcfJ6JJyvOVtZTwo
         vizSh/nyqvP1PkrU4mW/rJcWrOTb7S/eokxSlA6gLojvzl2gbPqEI/t4U4hu0hgQY9
         PIKtgVpD5injiCX9bh1d/kequeO5FbjZ3ZDyzoH3iZFRdnoJcWEIBSQSgjHttxzK+k
         rchE0vbV/SGFQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     quic_tdas@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
        dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org,
        agross@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: mark apcs as clock provider
Date:   Wed, 11 Jan 2023 13:49:00 -0600
Message-Id: <167346654440.2315924.11284041931895696178.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230111191634.2509616-1-dmitry.baryshkov@linaro.org>
References: <20230111191634.2509616-1-dmitry.baryshkov@linaro.org>
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

On Wed, 11 Jan 2023 22:16:34 +0300, Dmitry Baryshkov wrote:
> Now as we added the APCS clock controller support, mark apcs device as
> clock provider by adding #clock-cells property.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: msm8996: mark apcs as clock provider
      commit: 2e3015c2d190760ff59e41336a0a27d6caaacf3b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
