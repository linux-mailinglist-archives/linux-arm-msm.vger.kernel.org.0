Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A0C4FC641
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 23:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349969AbiDKVCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 17:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349953AbiDKVCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 17:02:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AC42AC43
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 14:00:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 866A1616A0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 21:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74A29C385A9;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649710815;
        bh=gPbaDmTnvLJFZitaNyyLTRsQmR8vgbSi03Ce3V01w/Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Wc2mgs5QMlogXvJQ7si77PY9rMqx7iAP85rKVvqSBIk+600XXQ1a+ktDtULI4tpfO
         FDQsHusra572V2tFRVRAYmLTXxcH5BkFU7j/F7tOk2dQsfFgPVe3AhVRs+obk7zR4u
         QKBA5OxoxKynmpLhgj9+epGfjGXtfgStaH7o+6mo1LTmbNABf6vCofYB5eudqfYRgR
         qd8hmGHRvxlIVFl+elHa5niv17MgFhXMvHfnWx8W4xCm+0bwiU90BNFszkby4zK3Ew
         nBp8ckcU0yUUuvGY75wPbL4M4WQTtpkTsDxxsm/aejW/oapDVb00j8TsMZL+/r7uh4
         Md0uo/4cKLvzw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4F43BE8DD67;
        Mon, 11 Apr 2022 21:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: switch panel compatible to "edp-panel" for
 limozeen
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <164971081531.4542.15641339860104638361.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Apr 2022 21:00:15 +0000
References: <20220322092524.1.Ied05fc4b996737e3481861c6ab130a706f288412@changeid>
In-Reply-To: <20220322092524.1.Ied05fc4b996737e3481861c6ab130a706f288412@changeid>
To:     Ivy Jian <ivyjian417@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Tue, 22 Mar 2022 09:25:26 +0800 you wrote:
> some panel can't light up with new board with ps8640, switch compatible
> panel define to make it workable.
> 
> Signed-off-by: Pan Sheng-Liang <sheng-liang.pan@quanta.corp-partner.google.com>
> Signed-off-by: Ivy Jian <ivyjian417@gmail.com>
> ---
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: switch panel compatible to "edp-panel" for limozeen
    https://git.kernel.org/qcom/c/33495eb77ee4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


