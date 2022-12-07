Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1344645E16
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 16:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiLGPyA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 10:54:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbiLGPxk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 10:53:40 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8660BB1DA;
        Wed,  7 Dec 2022 07:53:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 213EF61AA3;
        Wed,  7 Dec 2022 15:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E226EC43148;
        Wed,  7 Dec 2022 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670428415;
        bh=llclJzDCjTFxN1whzjfwcLTC+qJkpNppGaooMsY/Nak=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Rv8tigYStwE+Z+ZL/RFsR6C/csFLD5hbS5eLpo/qY54L5O6G+xWn8whX6cLsm3HLU
         D8g7Qj6vu3vwz0r74hhw4O2YPhGnTAsBU5J9aqvqZb2Xdtj1ns7nO7wK6rEdNdzmar
         rkvH0F6fSLk0aW95TI/tWo1S1WKb2ZwzA8MAYbhCrP68xXrKnwAIZ0X/0l4IDze4a3
         U0cCgvH1SMYSKMosnan1zhCaC8UlSMNH6Jk9KyjzAIS9JYARRnx6G2613eHaYTjbbq
         lM5mZPlh4e8InRbBi3zhnsRPP0ND6HEKgfrDf8ZQJTokbaREUyU0uuTkGy34sLxV9k
         7mwnREh1nzSIg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-remoteproc@vger.kernel.org, konrad.dybcio@somainline.org,
        shangxiaojing@huawei.com, govinds@codeaurora.org,
        mathieu.poirier@linaro.org, gokulsri@codeaurora.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Fix potential null-ptr-deref in q6v5_wcss_init_mmio()
Date:   Wed,  7 Dec 2022 09:53:28 -0600
Message-Id: <167042840343.3235426.16890651852249990026.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221125021641.29392-1-shangxiaojing@huawei.com>
References: <20221125021641.29392-1-shangxiaojing@huawei.com>
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

On Fri, 25 Nov 2022 10:16:41 +0800, Shang XiaoJing wrote:
> q6v5_wcss_init_mmio() will call platform_get_resource_byname() that may
> fail and return NULL. devm_ioremap() will use res->start as input, which
> may causes null-ptr-deref. Check the ret value of
> platform_get_resource_byname() to avoid the null-ptr-deref.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: q6v5: Fix potential null-ptr-deref in q6v5_wcss_init_mmio()
      commit: f360e2b275efbb745ba0af8b47d9ef44221be586

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
