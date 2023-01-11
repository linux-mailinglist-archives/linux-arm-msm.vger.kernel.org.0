Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3CC466534E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 06:19:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbjAKFTL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 00:19:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbjAKFSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 00:18:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAD513DD3;
        Tue, 10 Jan 2023 21:09:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E0C6B61A34;
        Wed, 11 Jan 2023 05:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCA84C433EF;
        Wed, 11 Jan 2023 05:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413790;
        bh=8T+8nScsj6h7UAaq3JbWj4lsi2Ok/kNZGDGLdst/u3A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Uywpe3V/Hbx3iZbKhwIOOsNkxpKZgXqzn1UBosDj0NeMhgEz9q5zXTQS7yHfxRLP+
         pyefyyVJMiyN5IeEYhEAhk8jAss6ZITlVxtpAymXTF/tyfA0sqO05LEmbzfL5HkZ4r
         BbtPb6DVZvbYtrQ3XF+8aHZW7BOKsGZcqPGIi/DWDhXlljdVuxKlnvfkD0lyFaSIqo
         zs3Bws17fIguplQ80kMO6dwADuULp0I3TBdyAha50nmzl20HUXZLSQ7fpp/vzzqcWe
         g9NZL4twVm+E1VH5wFdz/x3JkXY/Y7ljGZ7riMrRaYM1wBzEbVAT8T5nw0IjyFJSjO
         IjDLPre1NmrqQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     dmitry.baryshkov@linaro.org, konrad.dybcio@linaro.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: qcom: clk-spmi-pmic-div: convert to use parent_data
Date:   Tue, 10 Jan 2023 23:09:15 -0600
Message-Id: <167341377720.2246479.15585168622539676439.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221210191013.453040-1-dmitry.baryshkov@linaro.org>
References: <20221210191013.453040-1-dmitry.baryshkov@linaro.org>
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

On Sat, 10 Dec 2022 22:10:13 +0300, Dmitry Baryshkov wrote:
> The clk-spmi-pmic-div driver gets the parent name from the first (and
> the only) clock parent. So, use parent data, index 0 to setup the clock.
> 
> 

Applied, thanks!

[1/1] clk: qcom: clk-spmi-pmic-div: convert to use parent_data
      commit: a622c1dc84d920f231df539b3013c58a15fa2a19

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
