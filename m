Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9667072F088
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 01:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbjFMXrp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 19:47:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbjFMXrX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 19:47:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4742A2D46;
        Tue, 13 Jun 2023 16:46:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30DF863C80;
        Tue, 13 Jun 2023 23:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9921C433C8;
        Tue, 13 Jun 2023 23:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686699939;
        bh=gi9VwfohvAu8uIbRR1YC83biv422tk7wrtlzmAaldZo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FHqqWp9uQ0SqOJtd9G+9kc4DBpO+4qbDjwEcpg4mshKzl1atsfaX7T9unA9AXboqU
         STOVtYK7NL6r/psgt25GPXsFFYl06hqvfjXICeOh/fKv1Ao84Gn9/SNP/slqOdDrqY
         K//fE0Aa3B2NN7bxMMIIVLqwl6X0Y/zxY8OxDXY++U+SKRLYoFclKRzNbLZe2ykUPo
         43Q1GS9wbr6wiJ8UZaWN34FhEYSaohPRzIHP7z6r3+XvrIjf1cD2g+y7yVPI4BnBPl
         pnPW4Je8WjLzOJoN2o5dSwPN3tNgBbwPpjdzmt5RGFeCR02NpLhkgb+7QUdHOVkwr3
         Kn78R4Do3hqTw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 00/14] arm/arm64: dts: qcom: MDSS nodes cleanup
Date:   Tue, 13 Jun 2023 16:48:43 -0700
Message-Id: <168670013503.1400697.5591337352533649379.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
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

On Wed, 31 May 2023 04:16:09 +0300, Dmitry Baryshkov wrote:
> Conclude several ongoing cleanups of display-related nodes for Qualcomm
> platforms:
> 
> - Don't disable MDP/DPU node, it is enough to disable MDSS device itself
> - Remove useless mdss_mdp enablements
> - Change labels for DSI and HDMI nodes to start with mdss_ prefix
> 
> [...]

Applied, thanks!

[14/14] ARM: dts: qcom: msm8974: rename labels for DSI nodes
        commit: d59b294874c7f51317dc7edfc12ff950260ed2b9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
