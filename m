Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11A74672D25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 00:56:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjARX4L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 18:56:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230192AbjARX4B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 18:56:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB2EC442EA;
        Wed, 18 Jan 2023 15:55:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 87CE461ABA;
        Wed, 18 Jan 2023 23:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658D7C433B3;
        Wed, 18 Jan 2023 23:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674086157;
        bh=/HDjdxQySdnuV8nM1B8SDmJTuMnlJvkvlGAbKPS4eeA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tklhKRiLIq7165/Uvwsvw2ZJl69czl6jJlO8iGxZMy8893aedSG4NVySSuBK/7ImT
         2RjixfvSZKu8lyBXRnJeh34cXc9mm3+S35TqVi4dGTYpNRNvvJbnHDMlFTxH/38jiA
         am+6WbUrxmC7zWLdi9wvNk40L57qFAv8BE06rKRVPu66nsNdYphmVHmXneQNMMjHNm
         yDG07ldUNIJnnpBE0zEc/IS1ISspuJRQMdQ8C3I1A3Rp3KhJ9OvUWlPu36E9Mb6g9P
         FYSbKltNkhcal6YEfeGuzXu4/wkgjHLfU1eQma92ydIsb88vyfRJjC6W2GC5Rc/ZEN
         RP/ZkmvPyG0ag==
From:   Bjorn Andersson <andersson@kernel.org>
To:     linux-arm-msm@vger.kernel.org, pevik@seznam.cz
Cc:     dominikkobinski314@gmail.com, devicetree@vger.kernel.org,
        petr.vorel@gmail.com, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH 0/3] msm8992-bullhead: 2 DTS fixes + 1 RFC
Date:   Wed, 18 Jan 2023 17:55:40 -0600
Message-Id: <167408614053.2989059.14903108100098965472.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221226185440.440968-1-pevik@seznam.cz>
References: <20221226185440.440968-1-pevik@seznam.cz>
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

On Mon, 26 Dec 2022 19:54:37 +0100, Petr Vorel wrote:
> From: Petr Vorel <petr.vorel@gmail.com>
> 
> Petr Vorel (3):
>   arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem size
>   arm64: dts: qcom: msm8992-bullhead: Disable dfps_data_mem
>   [RFC] arm64: dts: qcom: msm8992-bullhead: Fix smem_region, mpss_mem
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem size
      commit: 26a91359aea4d89e7d3646d806eed0f3755b74bd
[2/3] arm64: dts: qcom: msm8992-bullhead: Disable dfps_data_mem
      commit: 4dee5aa44b924036511a744ceb3abb1ceeb96bb6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
