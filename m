Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5788C72F0A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 01:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240997AbjFMXr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 19:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239762AbjFMXrZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 19:47:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB39A1FCA
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 16:46:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 933FA63C8D
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 23:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B890C433CB;
        Tue, 13 Jun 2023 23:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686699958;
        bh=3gt4IXmigNvmNSWr6odmSbZUTjK0GB6h2JT4R4LoepE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cv+SUwDFTKOUhN/aOMp2pKmjEBRTRDzn4iwPFMT8/gzh11ovyrmPomx8XSmFos7qP
         s/ZiDMVoLgKkPDaSKQN3T1UliwGjt9H7dNL9umizMC/PTB7AHp10eW+mRv77toWbym
         3Prj80Y6Fniln9WIZCWHIg9yiAT36NFPqQzDHXQOeadnI5gVyzGQFFk50s3ZPJk4o/
         KkkQQkB66bqR9pVo4dh5xzzwm0bHBpe0jhe+VgS89mOnVzPEirzgXTNJ9x0PFU/T5A
         vDcySnQagLGOtGkttIGGyhA4RYhw0aZxXil7XB5rfgiuMBmHv+YlMa2QrCL6pGQqMY
         w0aINJpZ4angw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 0/5] arm64: defconfig: build some essential Qualcomm platform drivers
Date:   Tue, 13 Jun 2023 16:49:00 -0700
Message-Id: <168670013502.1400697.2349736200474810083.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601075650.1437184-1-vladimir.zapolskiy@linaro.org>
References: <20230601075650.1437184-1-vladimir.zapolskiy@linaro.org>
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

On Thu, 1 Jun 2023 10:56:45 +0300, Vladimir Zapolskiy wrote:
> It's discovered that a kernel image for Qualcomm QCM2290/SM6115 built
> from a defconfig misses a few important platform device drivers, the
> changeset enables them.
> 
> Changes from v1 to v2:
> - due to review comments changed building QCM2290 interconnect driver to
>   a kernel module and provided a better description in the commit message,
> - added tags given by Konrad.
> 
> [...]

Applied, thanks!

[1/5] arm64: defconfig: Build MSM power manager driver
      commit: eac3e74cba6d5a7e1060ffb730c1071a0b4db7fa
[2/5] arm64: defconfig: Build Global Clock Controller driver for QCM2290
      commit: b128ec5d5df44a6d204f959d0325635bb0d995d0
[3/5] arm64: defconfig: Build interconnect driver for QCM2290
      commit: 39433f576758d955c7e4ff58e945540b1cddba98
[4/5] arm64: defconfig: Build display clock controller driver for QCM2290
      commit: f20575d6963da3ccc21a9cf54b04b869e88a8e18
[5/5] arm64: defconfig: Build SM6115 display and GPU clock controller drivers
      commit: a19a3dcb0d190254ded4ac1cabb0f402e4b7c8c4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
