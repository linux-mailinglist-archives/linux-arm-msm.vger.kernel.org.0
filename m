Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2FC68FED8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 05:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjBIEbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 23:31:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjBIEay (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 23:30:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B2D13D908
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 20:30:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF8AEB82018
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 04:22:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB26C4339E;
        Thu,  9 Feb 2023 04:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675916528;
        bh=aN+7Rj7saooPVCSS/o6ab2W4M5O/fblZIyDOgRZQ3Qs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jqdNnbJQiNydrvRsUSfzyLyg+1buLPMCZngFuF9wUX/zqBFcdgkju5LAQ71lXYtuv
         FNMyJ/tcLyqqrRqUzQQT+9MQh7zYsbPNFQTDP1R91D2XElw7AwlEUGnGqh7QFvvKjN
         J+5oFWp3QXRCgzxFtYb3cotL15bZHWo613RwHGP6t5KWl//hlk7OFQForrFXL6ibF1
         p7eo1QwC4LVs/053zK0F0OdgLHkulIHjUvbJHgP6HWkMhN6rkpW+FaiGNd4ycw94U9
         B578YMNmP7pc+Q5M4Z6Lb7ycIaUKQe3njfGSfS6/eQJl2OPZZrRD/0YjfojtWY3sv3
         JGC2W8AgqT8Ug==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Petr Vorel <pvorel@suse.cz>, linux-arm-msm@vger.kernel.org
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Jamie Douglass <jamiemdouglass@gmail.com>,
        Jeremy McNicoll <jeremymc@redhat.com>
Subject: Re: (subset) [PATCH 1/1] arm64: dts: qcom: msm8992-lg-bullhead: Enable regulators
Date:   Wed,  8 Feb 2023 20:23:25 -0800
Message-Id: <167591660371.1230100.16426269669909411046.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203100952.13857-1-pvorel@suse.cz>
References: <20230203100952.13857-1-pvorel@suse.cz>
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

On Fri, 3 Feb 2023 11:09:52 +0100, Petr Vorel wrote:
> Enable pm8994_s1, pm8994_l{26,29,30,32} regulators.
> Use values from downstream kernel on bullhead rev 1.01.
> 
> NOTE: downstream kernel on angler rev 1.01 differences:
> * pm8994_l29: regulator-min-microvolt = <2700000>
> * pm8994_l{20,28,31}: use regulator-boot-on
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8992-lg-bullhead: Enable regulators
      commit: 2866527093ddbc6356bb31f560f0b4b4decf3e2e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
