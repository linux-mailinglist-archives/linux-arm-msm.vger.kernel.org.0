Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3611676EF98
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 18:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234817AbjHCQfN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 12:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234587AbjHCQfM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 12:35:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27EC2E77
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Aug 2023 09:35:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD9A261E3D
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Aug 2023 16:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4D9C433CB;
        Thu,  3 Aug 2023 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691080511;
        bh=+x7y7asMCa/peF1AtB/pvI244A2kIYGJirM/kxs9wLY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rANDlnM7IhnI56DbjHmhBVa5b0yRSUODCrXczwr66t98PGx3R/IhR2tK2cz1rLwKp
         geTUSTjDRMX/D4TNPgpGMWMrgoh5gamw5Qc+Y7fqAjEECYuAUnaK30b1BdoCzEycfY
         dmZ+mWGkf5InjykaY185muDpeNqx2Y5HAzNfI6nhvEZyD74N6sP0rmyAkGqrXZ27rG
         uQU6hEGXXjuBI4TFbXIFzpYHAGVbGZQKbAiKg3+/EidwR3vMUPnRkfbUz5+jW+HliN
         shffja2EYdOZCfiDl6KqFUBqzbJFVCzxJ92wd7Oz8ZosbgmoDBAyWaRVaJ/UhD9QMF
         wx06fKv1r5VbA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     agross@kernel.org, konrad.dybcio@linaro.org,
        quic_deesin@quicinc.com, linux-arm-msm@vger.kernel.org,
        Chen Jiahao <chenjiahao16@huawei.com>
Subject: Re: [PATCH -next] soc: qcom: smem: Fix incompatible types in comparison
Date:   Thu,  3 Aug 2023 09:38:01 -0700
Message-ID: <169108064635.108343.9463409374337127842.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801094807.4146779-1-chenjiahao16@huawei.com>
References: <20230801094807.4146779-1-chenjiahao16@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On Tue, 01 Aug 2023 17:48:07 +0800, Chen Jiahao wrote:
> This patch fixes the following sparse error:
> 
> drivers/soc/qcom/smem.c:738:30: error: incompatible types in comparison expression (different add        ress spaces):
> drivers/soc/qcom/smem.c:738:30:    void *
> drivers/soc/qcom/smem.c:738:30:    void [noderef] __iomem *
> 
> In addr_in_range(), "base" is of type void __iomem *, converting
> void *addr to the same type to fix above sparse error.
> 
> [...]

Applied, thanks!

[1/1] soc: qcom: smem: Fix incompatible types in comparison
      commit: 5f908786cf44fcb397cfe0f322ef2f41b0909e2a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
