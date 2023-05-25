Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C8BD7117F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 22:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234939AbjEYUSi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 16:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235432AbjEYUSh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 16:18:37 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8E7B2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 13:18:34 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2B1543F696;
        Thu, 25 May 2023 22:18:31 +0200 (CEST)
Date:   Thu, 25 May 2023 22:18:29 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v14 3/9] drm/display/dsc: Add drm_dsc_get_bpp_int helper
Message-ID: <czjefqca2ye4ntnqw7smy5uiyle3hxnhsxi3so3z3ezigejikd@imtsdfvgr5p4>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v14-3-bafc7be95691@quicinc.com>
 <7e5axjbnbhtdbrvtpcqnapp3p2xe2ekgj3aizssps2zesfhs22@trhwxetiif7p>
 <7ed799fe-1f0a-3d14-3244-7ca351feaf83@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed799fe-1f0a-3d14-3244-7ca351feaf83@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-24 15:38:23, Jessica Zhang wrote:
<snip>
> >> +	WARN_ON_ONCE(vdsc_cfg->bits_per_pixel & 0xf);
> > 
> > You did not add linux/bug.h back, presumably because Dmitry added
> > another use of WARN_ON_ONCE to this file in a previous series and it
> > compiles fine as the definition trickles in via another header?
> 
> Yep, this compiles fine without any error or warning.

Yes it does, just curious (CC Dmitry) if that is expected/intended: I am
not familiar enough with the current header includes to say for sure.

Dmitry seemed to rely on it already being available in
https://git.kernel.org/torvalds/c/2b470e5531f57c1b9bfa129cca0ee17a2ecd2183
but that could have been an oversight?

- Marijn
