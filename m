Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7634B51725C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 17:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385702AbiEBPV7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 11:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359468AbiEBPV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 11:21:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20000AE67;
        Mon,  2 May 2022 08:18:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C41AAB817F3;
        Mon,  2 May 2022 15:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CDAC385AE;
        Mon,  2 May 2022 15:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651504706;
        bh=aKNyZRP8Tj7zWsOrH52i+puSxFw0UBh5g0Pz7+RWRkM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aRscoBun45cHQnjh2BCYs4BEGQ+qEQ8bXUw9VO6m3WLpalk9JAKzHpF9UR9enp9BE
         v0Pk2DxHXKMaEOcu52EqSp3TQ/UR1hewrY5La/bgVN1dAX5irq0msFURjZAuPSTA0/
         ozKLosBS4vaNvF1NrJx+fNcHgI8BHNNqMPGzkkKmS+EZJNCrrwgXuNIjwRykDMX3Q+
         1FtlIdVVPVsryMqZ5Sg1YHUlTR5zqYCCQfDBZo4HIamVcOao2ccDzXUPJLJ/h0yoN0
         qkI4kUSPML3yOCF/4koul+DVwBcLmU3lFb5CLfjuZuPh1lzCfmKi0+LEOtb/Q58Afj
         +aFkGlXxWMLlQ==
Date:   Mon, 2 May 2022 08:18:24 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Georgi Djakov <djakov@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Alex Elder <elder@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Mike Tipton <quic_mdtipton@quicinc.com>
Subject: Re: [PATCH] interconnect: Restore sync state by ignoring ipa-virt in
 provider count
Message-ID: <Ym/2QJeGHDoZSw8o@dev-arch.thelio-3990X>
References: <20220427013226.341209-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427013226.341209-1-swboyd@chromium.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

On Tue, Apr 26, 2022 at 06:32:26PM -0700, Stephen Boyd wrote:
> Ignore compatible strings for the IPA virt drivers that were removed in
> commits 2fb251c26560 ("interconnect: qcom: sdx55: Drop IP0
> interconnects") and 2f3724930eb4 ("interconnect: qcom: sc7180: Drop IP0
> interconnects") so that the sync state logic can kick in again.
> Otherwise all the interconnects in the system will stay pegged at max
> speeds because 'providers_count' is always going to be one larger than
> the number of drivers that will ever probe on sc7180 or sdx55. This
> fixes suspend on sc7180 and sdx55 devices when you don't have a
> devicetree patch to remove the ipa-virt compatible node.
> 
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Alex Elder <elder@linaro.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Cc: Mike Tipton <quic_mdtipton@quicinc.com>
> Fixes: 2fb251c26560 ("interconnect: qcom: sdx55: Drop IP0 interconnects")
> Fixes: 2f3724930eb4 ("interconnect: qcom: sc7180: Drop IP0 interconnects")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

This patch as commit ad3cc2f05fda ("interconnect: Restore sync state by
ignoring ipa-virt in provider count") in -next causes the following
build warning when CONFIG_OF is disabled because of_match_node is just
NULL:

drivers/interconnect/core.c:1090:28: warning: unused variable 'ignore_list' [-Wunused-variable]
        const struct of_device_id ignore_list[] = {
                                  ^
1 warning generated.

Should it just be marked as __maybe_unused or is there a different fix
that would be more appropriate?

Cheers,
Nathan
