Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3A3551A12B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 15:41:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350749AbiEDNpJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 09:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350741AbiEDNpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 09:45:09 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A36F2C64D
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 06:41:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 55C18CE262A
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 13:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B0EC385A5;
        Wed,  4 May 2022 13:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651671689;
        bh=8izgCIj9I2NmuN+VVbgtEFpR/n2CW+64r3eJYl8w76E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mnlDB4YdFdEbEmBQ1KPloG1YeaejdTprTQukTlTESxwdn0Kz2RmClFa4yUd5nzfFL
         Z0lg8FDOI9Fesg06rFk1ngwCPN+Uhv4ZLfOTL3puKtPFLVM+drz960NnQjPv67XhcE
         MDlrMJ4K97CTIeLg9ZmBf28L4YzD90QLb8rXvaYOc80yQzfVAQXc/lB+F7VP0/KB1D
         fBO1Kokm8d5r+tUfcwMhZ2JB2pdwy+sjjPB/htLiW+hKgZsECQY0RF9Piip7VxI4Iw
         f9pBEQ8F6x+zBI7dSc+eG9knthSLHsI16U78NFDEMc2P7GBfmh0NMQPQgNxlAOSr4R
         O6SwAGFYbTI4w==
Date:   Wed, 4 May 2022 19:11:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: use RMW cycles in
 dsi_update_dsc_timing
Message-ID: <YnKChRtWhgxbOx4V@matsya>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
 <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
 <4e308633-cb0d-7050-9ee0-421190683eac@linaro.org>
 <20220502084322.nvj7rnhnemewmil6@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502084322.nvj7rnhnemewmil6@SoMainline.org>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02-05-22, 10:43, Marijn Suijten wrote:
> On 2022-05-02 01:44:20, Dmitry Baryshkov wrote:
> that require DSC for the screen to work.  I've been told the series
> didn't result in positive screen output way back in its infancy, but

I would be intrested to hear about that. I have only pixel3 at my
disposal so tested on that. I would be willing to help with more testing
efforts.

Also, to get DSC to work, the panel needs to be set as well...

> I'll re-evaluate and send fixes or improvements if/when necessary.

That would be nice

-- 
~Vinod
