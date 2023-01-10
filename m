Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04AE96645CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 17:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234513AbjAJQRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 11:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234087AbjAJQRb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 11:17:31 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDE65AC54;
        Tue, 10 Jan 2023 08:17:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 72199CE1836;
        Tue, 10 Jan 2023 16:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8792C433F0;
        Tue, 10 Jan 2023 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673367446;
        bh=X2eZHxy1glwfvxgETslx2Dzi6I9eiiWTnXfLfBOt8MU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UAmtt7X0kTtRA9rQK1+kG/sOl7avBaWii9X9Ot/EejjxrQ6LfpzOr6LXfwbScyUvG
         liem6+CfPhW6Oq3pioIqJG83/Ycf4QcQAVNqHOd3plv++D3hNPDidir5w5UEeT+DRF
         H81mLef/abNXpcprrV1F/8vUMTjtwyaTOzr0mqXlDilcd0P2NRkyEovopk5qE7Glo/
         t9+EFeRb+Pww1RU70AVHY5w4n7NL0VpMzA3LuRDIBoR8dmdPrfHwj/JIk6cq9t6ldP
         kR3mPAXmxehf5h25/YiKzxOzDjeFWBY5oGFkTqWqtcENA64DCy0NCsqi28RtIqyOgT
         TyrKn/iOEHxqQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-arm-msm@vger.kernel.org, dominikkobinski314@gmail.com
Cc:     petr.vorel@gmail.com, devicetree@vger.kernel.org, pevik@seznam.cz,
        bribbers@disroot.org, agross@kernel.org, quic_bjorande@quicinc.com,
        konrad.dybcio@linaro.org, alexeymin@postmarketos.org
Subject: Re: [PATCH] arm64: dts: msm8994-angler: fix the memory map
Date:   Tue, 10 Jan 2023 10:17:19 -0600
Message-Id: <167336743968.2134489.4564277359753611866.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221230194845.57780-1-dominikkobinski314@gmail.com>
References: <20221230194845.57780-1-dominikkobinski314@gmail.com>
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

On Fri, 30 Dec 2022 20:48:45 +0100, Dominik Kobinski wrote:
> Add reserved regions for memory hole and tz app mem to prevent
> rebooting. Also enable cont_splash_mem, it is the same as the
> generic 8994 one.
> 
> 

Applied, thanks!

[1/1] arm64: dts: msm8994-angler: fix the memory map
      commit: 380cd3a34b7f9825a60ccb045611af9cb4533b70

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
