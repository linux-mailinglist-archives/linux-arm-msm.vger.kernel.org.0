Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF5D74EC8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 13:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbjGKLZS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 07:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230490AbjGKLZR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 07:25:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27548121
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 04:25:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B032161486
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 11:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B12FC433C8;
        Tue, 11 Jul 2023 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689074716;
        bh=B6phPNqzIaq0BhTQWkIhptX4KmZ9kRiP1aL2cvc5Gkg=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=qz1dRCymngPoqUZwy0zDX1KfSzJMWsF4lkNhDWsGyH27I3v62fAk3UxAbdhLiTY60
         Ol6LU3QndjyVSez+dN9munpgfM5PN8jpIRwBqNsG7H85Y8pPXvcNTeYfjTQsWaBUzG
         cjj1bnsNzhjNnWzULdQafJy7nXL7+Z4x9XdJqKvoT34iWuB+neYm0IPkOlxgmFiYvu
         nkIL0RVTZD+pVdJFCTXR4GwG9Marn4NNIwnerdvR/4ChVyFnEJwJ8DKUl28B+Gx+ta
         Lfw+0vyRtckE/ReFY1XmvCRVd4fZdxq8nnyB20Z9ai0RUdjH0a9yKARUl3m40GkjI8
         9mWwTeynfCoRQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Philipp Zabel <pza@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Adrien Thierry <athierry@redhat.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20230629144542.14906-1-athierry@redhat.com>
References: <20230629144542.14906-1-athierry@redhat.com>
Subject: Re: [PATCH v4 0/3] Fixes for qcom-snps-femto-v2 PHY driver
Message-Id: <168907471205.198334.16545339744877573162.b4-ty@kernel.org>
Date:   Tue, 11 Jul 2023 16:55:12 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Thu, 29 Jun 2023 10:45:37 -0400, Adrien Thierry wrote:
> This series contains a few fixes for the qcom-snps-femto-v2 driver, mostly
> clock-related.
> 
> v3 -> v4
> - remove commit that added system sleep PM ops
> - add commit "phy: qcom-snps-femto-v2: keep cfg_ahb_clk enabled during
>   runtime suspend"
> - "phy: qcom-snps-femto-v2: properly enable ref clock"
>   - dropped "HACK:" comment (Bjorn Andersson)
>   - check for IS_ERR() for the optional cfg_ahb clock (Bjorn Andersson)
>   - don't print an error message in case clk_bulk_prepare() fails (Bjorn
>     Andersson)
> 
> [...]

Applied, thanks!

[1/3] phy: qcom-snps-femto-v2: keep cfg_ahb_clk enabled during runtime suspend
      commit: 825c6d29f129e3e74dc2b4a7435bc64ff34ab5f6
[2/3] phy: qcom-snps-femto-v2: properly enable ref clock
      commit: d621660a1d5bba54494367a2fa8c5bb294ad002b
[3/3] phy: qcom-snps-femto-v2: use qcom_snps_hsphy_suspend/resume error code
      commit: 0383f66b80733c90fd841836ca541ad4c1fc203f

Best regards,
-- 
~Vinod


