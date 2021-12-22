Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E6947D158
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 12:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240159AbhLVLyq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Dec 2021 06:54:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240144AbhLVLyp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Dec 2021 06:54:45 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2614DC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Dec 2021 03:54:45 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id F279D3EEEF;
        Wed, 22 Dec 2021 12:54:42 +0100 (CET)
Date:   Wed, 22 Dec 2021 12:54:41 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, abhinavk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        konrad.dybcio@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: Fix timeout issues on command mode
 panels
Message-ID: <20211222115441.7c5e55svs6inabrl@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        abhinavk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, paul.bouchara@somainline.org
References: <20210911163919.47173-1-angelogioacchino.delregno@somainline.org>
 <20210911163919.47173-2-angelogioacchino.delregno@somainline.org>
 <b325fc8d-e06b-36de-b40a-b5ffbcebb1c5@linaro.org>
 <94bedea3-0e5f-5ae8-79d1-ceb17ccdea23@somainline.org>
 <20211211213528.uroqfdksvokspbxf@SoMainline.org>
 <CAA8EJprT5gcWOsS5jJk8egUpxutBpUdW2Pnh-8FFXhgOd3hr=A@mail.gmail.com>
 <20211211215718.pe675o5wvculxavc@SoMainline.org>
 <33d44631-f0d7-83cc-569d-d6d6f82d6808@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33d44631-f0d7-83cc-569d-d6d6f82d6808@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-12-22 12:28:52, AngeloGioacchino Del Regno wrote:
> Il 11/12/21 22:57, Marijn Suijten ha scritto:
> > On 2021-12-12 00:49:09, Dmitry Baryshkov wrote:
> >> On Sun, 12 Dec 2021 at 00:35, Marijn Suijten
> >> <marijn.suijten@somainline.org> wrote:
> >>> [..]
> >>> On this note, does it perhaps make more sense to call the "internal"
> >>> _dpu_encoder_phys_cmd_wait_for_idle function directly, instead of going
> >>> through the "public" dpu_encoder_phys_cmd_wait_for_tx_complete which
> >>> seems solely intended to handle the wait_for_tx_complete callback?
> >>
> >> Either one would work. The main difference is the error message. Do
> >> you want to see it here if the wait times out or not?
> > 
> > I prefer calling _dpu_encoder_phys_cmd_wait_for_idle directly and
> > optionally adding our own error message.  IIRC DRM_ERROR prints source
> > information such as the function this originated from, and that makes it
> > impossible to distinguish between the wait_for_tx_complete callback or
> > the invocation through dpu_encoder_phys_cmd_wait_for_commit_done anyway.
> > 
> > - Marijn
> > 
> 
> I wouldn't be happy to find myself in a situation in which I get strange
> display slowness without any print to help me; for this reason, I find
> having the print in place useful for debugging of both perf and fault.

Same thought here, though dpu_encoder_phys_cmd_wait_for_tx_complete
exists for the sole reason of printing a nice debug message, which I
wouldn't want to be misused by dpu_encoder_phys_cmd_wait_for_commit_done
punting its errors on wait_for_tx_complete - if that happens the first
thing I'd do during debugging is assign individual messages to both,
otherwise it is impossible to know which two functions is the cause: we
might as well "duplicate" the error message right now and prevent such
confusion from occurring in the first place?

- Marijn

> 
> Cheers,
> - Angelo
