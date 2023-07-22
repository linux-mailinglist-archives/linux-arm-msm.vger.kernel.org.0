Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0036575DA2B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jul 2023 07:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjGVFPZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 22 Jul 2023 01:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbjGVFOz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 22 Jul 2023 01:14:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FD6421D
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jul 2023 22:14:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3E59360AB4
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jul 2023 05:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48C6CC433CC;
        Sat, 22 Jul 2023 05:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690002867;
        bh=GlByQGDNRXNRydY6cIuTIDLG57eYk3tw8PqUG52OPdU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eCoxa81Hx4w0bwi5CU5xkHjyF7FaqjXQ+roA2lnbDl1nLoRS6zbDx6hyt9QfLbeDJ
         yT08/GmHjD3TbWsUuqx7Oryn+ANN6XzQIbDfVRbvK+BFGKwJvo25XS/fJI6NUEOmzI
         jY5Dt9/w+qbOgW0uuyKIKqLOMJ9vLoqDMNkrfvM2T4YBg/G3XfU7TsA5ucLkOsN5dP
         k6v4+1bQlpXGHApTWdnG8OrfGv4xVp0JOuXV+sP0w+FLTkQOC4rYJkVpCVaKO/mBTn
         1Ec16Ipj/qTvAgFH2pi5En86JFcenhymLlT0XkkkzkHBQIUiB0BGeJg50Lt720L94B
         yCU3Aeb34oSCQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Yuanjun Gong <ruc_gongyuanjun@163.com>
Subject: Re: (subset) [PATCH 1/1] soc: qcom: use devm_clk_get_enabled() in gsbi_probe()
Date:   Fri, 21 Jul 2023 22:17:25 -0700
Message-ID: <169000304194.3611206.13621831382079630782.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720140834.33557-1-ruc_gongyuanjun@163.com>
References: <20230720140834.33557-1-ruc_gongyuanjun@163.com>
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


On Thu, 20 Jul 2023 22:08:34 +0800, Yuanjun Gong wrote:
> in gsbi_probe(), the return value of function clk_prepare_enable()
> should be checked, since it may fail. using devm_clk_get_enabled()
> instead of devm_clk_get() and clk_prepare_enable() can avoid this
> problem.
> 
> 

Applied, thanks!

[1/1] soc: qcom: use devm_clk_get_enabled() in gsbi_probe()
      commit: 489d7a8cc286f37f52156100b95751b10e240941

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
