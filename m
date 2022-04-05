Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 281774F2229
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Apr 2022 06:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiDEEU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 00:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiDEEUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 00:20:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09CBFF71;
        Mon,  4 Apr 2022 21:17:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C5F05B81B79;
        Tue,  5 Apr 2022 04:17:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FCF7C340F0;
        Tue,  5 Apr 2022 04:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649132242;
        bh=KCPGLPVeH6NYTKvdtiGBtcJRWw93SSF1I3156qmZZSM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QVwAnVKdmrWaK0a/L7PZoNplSCX1Y7xJ2q3ES1fA6a+owx43D7XQ80+BCiWLUUPrn
         ph3OJTwN+MqWw85S+HQXSJ4rOrTIPan2Uaymd64QPTpjNqFnOWJ5dMuE2ns+/1WEo2
         nl62VqxlWyc4YKy82ppGGnQZd2idxD6Y5BKjueAd11a2sgURGMZi+GAMOKsEeXZvIT
         m6MHO6FTUFPjsj97zkEx/UsySW5csN6hBW2s6fxcZSMdGNDQUiFvzixym59uKjeOJS
         FaFYt819xFCAGo8wJG8aaeA+Q5aovyeVNODa+oL2d9Z0Sa41zoetW+NgVEB3HiUs9O
         0x26KECI1U2kA==
Date:   Tue, 5 Apr 2022 09:47:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] soundwire: qcom: fix an error message in
 swrm_wait_for_frame_gen_enabled()
Message-ID: <YkvCzlU5/KuKE1rS@matsya>
References: <20220307125814.GD16710@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307125814.GD16710@kili>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07-03-22, 15:58, Dan Carpenter wrote:
> The logical AND && is supposed to be bitwise AND & so it will sometimes
> print "connected" instead of "disconnected".

Applied, thanks

-- 
~Vinod
