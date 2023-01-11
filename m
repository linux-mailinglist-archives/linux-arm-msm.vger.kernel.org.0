Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00939665338
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 06:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbjAKFTA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 00:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjAKFRv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 00:17:51 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE48E0F1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 21:09:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EB76C61A36
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 05:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE95AC43392;
        Wed, 11 Jan 2023 05:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673413785;
        bh=yv/6KcqMCloLjK+xNXUxwffKw904cbCoZQbshT0mA1M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RtHBH9PSsGmwckzhegVzRl8euqBxU7LIv+OLFmPbbCmfa38oJe9GfrJmwlK2G8Ccc
         Oe1d0UC+5KkajRaqDouyXEvnSmKCBiA26payQxcBQbfEFY2ra6mfo6M7rI+y9fz5Y0
         knGGrpKxBrFITkPJPs4WbbDbqX6je2Nwv8vKEzxmNfgxAEqr1uA+tknSnh4Go2cAER
         cpaqNRuufO8yyAlf5OFjbDedXJQPe1Ekl4pqW23i3yq2AzxBfXYkIdeN7++bgm8W11
         0Kv/1y4ydkmE6q5/b+EZpFr0BWPEsEK6hiEzM9Y1frhwN7GgJ3RXsx6s1PtW5k7WQX
         tpar+tMuvnt/w==
From:   Bjorn Andersson <andersson@kernel.org>
To:     konrad.dybcio@linaro.org, dmitry.baryshkov@linaro.org,
        agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH 1/3] arm64: defconfig: build PINCTRL_SM8250_LPASS_LPI as module
Date:   Tue, 10 Jan 2023 23:09:09 -0600
Message-Id: <167341377720.2246479.9452493876432277253.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221210194500.464556-1-dmitry.baryshkov@linaro.org>
References: <20221210194500.464556-1-dmitry.baryshkov@linaro.org>
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

On Sat, 10 Dec 2022 22:44:58 +0300, Dmitry Baryshkov wrote:
> Enable the driver used to drive sound-related pins on Qualcomm SM8250
> platform (Thundercomm RB5 board).
> 
> 

Applied, thanks!

[1/3] arm64: defconfig: build PINCTRL_SM8250_LPASS_LPI as module
      commit: fcf1316fd7bfda5cf7f60e4ed2eaf166857335c4
[2/3] arm64: defconfig: enable camera on Thundercomm RB5 platform
      commit: a084ea59f92eb4d0f297ccea84e152f07105c1f3
[3/3] arm64: defconfig: build SDM_LPASSCC_845 as a module
      commit: 3e727c3e6379ae21116aa0cb340c069761db53d7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
