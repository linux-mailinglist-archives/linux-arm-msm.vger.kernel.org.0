Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03786BC135
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 00:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbjCOXdg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 19:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233129AbjCOXdC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 19:33:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5C2A18A6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 16:32:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A77596140D
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 23:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2A5C4339E;
        Wed, 15 Mar 2023 23:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678923150;
        bh=ndJ03UslMYn0LWIWDMA/RJCyRkIlPJfZRLWWB9V4GsM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C4CjsWdx0lSzSgQFtWSuMAOq9wRRQEmY9C7xzwtpNv0dReM5RfsjcdEI9SzOxkMJF
         Ja9XsGlEpEhPTPrit+RUIzZfMsjWhVqo7lrcVQDGL2alPmKuTB4qIFTJJwBYO8/1wc
         +y9HJ/5nWaRUL7z0bWeABn1AmWeVlybGlb6/7ZLLQiwg9fiwwTiO38hSc940TD427s
         jPzP6KZiEvSDR6X1bIp4nOPNz0lR8BySbGz3XVuyRobbTRlIvkIXAJ7ZsvL0TvajVA
         r8r0CENA8n1W1b+W2fJhHPasVWo/7HdSpymk+T6ytFR5sFx68YVuc9VC9j1Ce3q6ww
         P25DQtJ1IvXAw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org
Subject: Re: [PATCH v2 0/9] RPMPD cleanup + parent PD
Date:   Wed, 15 Mar 2023 16:35:00 -0700
Message-Id: <167892332565.4030021.17038723487615681574.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230213143524.1943754-1-konrad.dybcio@linaro.org>
References: <20230213143524.1943754-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 13 Feb 2023 15:35:15 +0100, Konrad Dybcio wrote:
> v1 -> v2:
> - reorder the cleanup for better reviewability (read: redo the
>   thing from scratch with the only thing being shared is the idea)
> 
> - move parent pd patches to the end
> 
> - clean up even more duplicates (lpicx vs lpi_cx)
> 
> [...]

Applied, thanks!

[1/9] soc: qcom: rpmpd: Bring all definitions to the top
      commit: a5d0e2819fd013e3629d3fedcae877777214ed34
[2/9] soc: qcom: rpmpd: Unify Low Power Island definitions
      commit: d280f3d66d9a79b1bd50258ccb3fbb413216c1be
[3/9] soc: qcom: rpmpd: Remove vdd* from struct names
      commit: 1c940cc42aba5b27a259634f4aedb71e5f46dac1
[4/9] soc: qcom: rpmpd: Expand struct definition macros
      commit: 91c0bcef25f985fd974b6f1ba3d3d7383ac032d2
[5/9] soc: qcom: rpmpd: Improve the naming
      commit: 07df05025eb4cb65c1549d392f988aa5eeb9e758
[6/9] soc: qcom: rpmpd: Make bindings assignments consistent
      commit: d338fe40cf37c3f326b5cb743c6436369d452094
[7/9] soc: qcom: rpmpd: Add parent PD support
      commit: decd6e77e02eff517efe11dfc181ce1b5bef3405
[8/9] soc: qcom: rpmpd: Hook up VDDMX as parent of SM6375 VDDGX
      commit: ec90637c9946cc8e37afa4c1feb33fdb1fa15b68
[9/9] soc: qcom: rpmpd: Remove useless comments
      commit: e556c94e8c20bcfb6c910e93a0cfd2d0cce5adc8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
