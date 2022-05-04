Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE8351A0F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 15:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239507AbiEDNfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 09:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350601AbiEDNfa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 09:35:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42978377E0
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 06:31:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CFAEE6198A
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 13:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF4BC385A5;
        Wed,  4 May 2022 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651671113;
        bh=lBEsUXAhncVrCtdTQLW5xpTq13o4idnU/Uuq8Y9Mjws=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZIFSKVI/d24n75tJuzFwgDlw89b3QZ9a9webgZcypgJzhhvWqzR2tl3oZV0PLoRgN
         JsTbZr1/GCQXFWxM+q107mW4LVoYo/3PabiPk4avx0vHDQy16PzBpchziMuGSuFZ7U
         dt8Bs3YqCfrt65kOANAXL4PnMPR4QhnLUoktDvwOTcHBajYm3VGc4awRdkml1S4+/Z
         /aHMx5nuxGUqZZfsKH41e7Sn0pn0sJpjKNneac8eqy2cwKJoFolLIFSJBHZ26gEybO
         /BvsZNlStQWxcAxVMFoIx/wRaBadjvbCMTJOaSf1WHcPXD/eLtsZi9RIJp5qgYxMtw
         m4FC1rVKBIf3Q==
Date:   Wed, 4 May 2022 19:01:48 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        kernel test robot <lkp@intel.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use RMW cycles in
 dsi_update_dsc_timing
Message-ID: <YnKARNKFBuEx+Xli@matsya>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-04-22, 20:55, Dmitry Baryshkov wrote:
> The downstream uses read-modify-write for updating command mode
> compression registers. Let's follow this approach. This also fixes the
> following warning:
> 
> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]

Reviewed-by: Vinod Koul <vkoul@kernel.org>

Tested on pixel3:
Tested-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
