Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC0474CB84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jul 2023 07:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbjGJFEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Jul 2023 01:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbjGJFEV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Jul 2023 01:04:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7BB0D1
        for <linux-arm-msm@vger.kernel.org>; Sun,  9 Jul 2023 22:04:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74B6D60DE8
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jul 2023 05:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23264C433C8;
        Mon, 10 Jul 2023 05:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688965459;
        bh=EEazyYzwv94vK4UozXw7Z2fToNTIzaQb4VVVdvkrhpM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cLc5aexWwBsxPYzgKIbhhvv0FfWMKyQkhXC9bd0cOmilkm8DnKCtAJ6fL2rwramfI
         ijjxgHvoQpFp+xcECg4zV7W15tSDFXi+lyplR/ELf+r97gGc7KnLc6rmrDYvgE5WFL
         tyuoRmpUEWrcdthMuUPM5Ezh3a2FiXlgb3c2Bx3ErP2hbyccUrfY/sPOxVLdVT+Wco
         aEnjvk0f/I8K0eqD1sC0IhdVnvS/z50ny1oZ6z5X4NI+ZPWbKCQ4kXdyFaUitS3Lmr
         BcvdCA86IAHuRjKCqTEgbgxrPrxhRlvaEjCeNnF9gighPER/RTSxOSZxdwHFtgynQ/
         Z+JYwZv56pcfQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: enable Qualcomm MSM8996 Global Clock Controller as built-in
Date:   Sun,  9 Jul 2023 22:07:03 -0700
Message-ID: <168896565961.1376307.13506103671319786605.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619125404.562137-1-dmitry.baryshkov@linaro.org>
References: <20230619125404.562137-1-dmitry.baryshkov@linaro.org>
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


On Mon, 19 Jun 2023 15:54:04 +0300, Dmitry Baryshkov wrote:
> The commit 8f680c287445 ("arm64: defconfig: Switch msm8996 clk drivers
> to module") switched CONFIG_MSM_MMCC_8996 to module, which also resulted
> in CONFIG_MSM_GCC_8996 being switched to module. This breaks useful
> bootflow for Qualcomm MSM8996 / APQ8096 platforms, because the serial is
> not enabled anymore until the GCC module is loaded.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: defconfig: enable Qualcomm MSM8996 Global Clock Controller as built-in
      commit: dc015a3a6d6986c41a7bd12fb205a282f685e328

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
