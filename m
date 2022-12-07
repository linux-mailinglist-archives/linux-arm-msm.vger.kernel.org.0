Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39AFE645E17
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 16:54:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiLGPyC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 10:54:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiLGPxk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 10:53:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F7F391EB;
        Wed,  7 Dec 2022 07:53:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0AB05B81EC3;
        Wed,  7 Dec 2022 15:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C2FC43470;
        Wed,  7 Dec 2022 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670428414;
        bh=2zXahfD5vUZM7d/s/Tdrpzp4i+oN9eQBYio2SqPoCX8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kE1jcNjlckoeV+ZismXjsSJeZ7DORJXA6iJJ66+QIiCLO4/9e9Iqvr1n8aDlkHKyk
         rPi6KNZV/P1n4ExqMbEEInTcRqaWBWWVAIDQYjgLFmZYqTmlTxgqHcYiufkNkGU7VP
         ggTt15sQZ6q5wIaaXS+yaEkyP9QFAK+I2QtBcPgvmLbX8fAW78QSuBcghJ9kebRssw
         BD8yOdGfC5wpkfzhZbg3zNiuLo69ZXo9yWBY0z0QJ7RxwSxTVHl/ry8h+WFQMhvBZX
         DDlEJcJq/Jge8UBtnu2KUJ/howddorFz3J5uxtkHY5Y8NdORZqr+RO6+cH2DzO+8HI
         oHnu87JT6Jung==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-remoteproc@vger.kernel.org, konrad.dybcio@somainline.org,
        shangxiaojing@huawei.com, govinds@codeaurora.org,
        mathieu.poirier@linaro.org, gokulsri@codeaurora.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Fix missing clk_disable_unprepare() in q6v5_wcss_qcs404_power_on()
Date:   Wed,  7 Dec 2022 09:53:27 -0600
Message-Id: <167042840345.3235426.8656802921250254848.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221204082757.18850-1-shangxiaojing@huawei.com>
References: <20221204082757.18850-1-shangxiaojing@huawei.com>
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

On Sun, 4 Dec 2022 16:27:57 +0800, Shang XiaoJing wrote:
> q6v5_wcss_qcs404_power_on() have no fail path for readl_poll_timeout().
> Add fail path for readl_poll_timeout().
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: q6v5: Fix missing clk_disable_unprepare() in q6v5_wcss_qcs404_power_on()
      commit: 7ff5d60f18bba5cbaf17b2926aa9da44d5beca01

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
