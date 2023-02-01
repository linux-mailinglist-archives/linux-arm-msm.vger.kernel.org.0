Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5C8686560
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Feb 2023 12:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbjBAL0g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Feb 2023 06:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjBAL0f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Feb 2023 06:26:35 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08AC9AD30
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Feb 2023 03:26:34 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 13790200EA;
        Wed,  1 Feb 2023 12:26:33 +0100 (CET)
Date:   Wed, 1 Feb 2023 12:26:31 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Kalyan Thota <quic_kalyant@quicinc.com>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, robdclark@chromium.org,
        dianders@chromium.org, swboyd@chromium.org,
        quic_vpolimer@quicinc.com, dmitry.baryshkov@linaro.org,
        quic_abhinavk@quicinc.com
Subject: Re: [v1 2/3] drm/msm/disp/dpu1: add dspps into reservation if there
 is a ctm request
Message-ID: <20230201112631.mgwuboehrwdefqnd@SoMainline.org>
References: <1675092092-26412-1-git-send-email-quic_kalyant@quicinc.com>
 <1675092092-26412-3-git-send-email-quic_kalyant@quicinc.com>
 <20230201111604.htgczy6yvdkywhvl@SoMainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201111604.htgczy6yvdkywhvl@SoMainline.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-02-01 12:16:05, Marijn Suijten wrote:
<snip>
> > +	if (dpu_kms->catalog->dspp &&
> > +	    crtc_state->ctm && (dpu_kms->catalog->dspp_count >= topology.num_lm))
> 
> Multiline-if-clause is typically indented with two tabs, not a half tab
> (4 spaces).

Hmm, Dmitry requested indent-to-opening-parenthesis in v1 instead; and
the majority of dpu1 uses the worst version of all: indent with a single
tab so that the contents line up with the code block below.  Dmitry,
I'll leave final say to you (and fix it up in my own DPU series
accordingly too).

- Marijn
