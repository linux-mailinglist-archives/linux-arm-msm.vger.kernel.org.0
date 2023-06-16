Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1EC733BB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 23:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjFPV6c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 17:58:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbjFPV6b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 17:58:31 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127E1297E
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 14:58:29 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D23EA40EF8;
        Fri, 16 Jun 2023 23:58:27 +0200 (CEST)
Date:   Fri, 16 Jun 2023 23:58:26 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN
 feature flag for DPU >= 5.0
Message-ID: <ldm6kswnucanjcxxwnrv7cgcma4datmg4eh7t5giyih2fm2ve7@s5wjam7unlhl>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
 <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
 <ycgei43x4kfmjk7g7gbeglehtiiinfbqmrjbdzcy56frxbtd2z@yk2f5kgrkbrt>
 <e23de804-060d-3278-5045-1ed03f0de80d@quicinc.com>
 <c5cfc132-effb-8269-ac5d-ed8c988d1a16@quicinc.com>
 <08b6aaf4-6edd-4f41-5d98-11ffc27e766e@quicinc.com>
 <udz5ij7g74zgnnwqw2q65idzzmiszhnvfieerw7izikgvotnkp@5tboohkd4t6t>
 <72963004-cda9-c5e1-68f9-622cb70fff9b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72963004-cda9-c5e1-68f9-622cb70fff9b@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-16 14:13:22, Abhinav Kumar wrote:
<snip>
> > As I've asked many times before, we should inline these masks (not just
> > the macros) (disclaimer: haven't reviewed if Dmitry's series actually
> > does so!).
> > 
> 
> Yes it does inline it. I am halfway through that rework got stuck in one 
> of the patches.

Neat, I'm still going through it but there are some conflicts with other
reworks that make it harder to review and test in parallel.

> >>>>> Tested this on SM8350 which actually has DSI 2.5, and it is also
> >>>>> corrupted with this series so something else on this series might be
> >>>>> broken.
> >>>>>
> >>>
> >>> Missed this response. That seems strange.
> > 
> > No worries.  But don't forget to look at the comments on patch 2/3
> > either.  Some of it is a continuation of pclk scaling factor for DSC
> > which discussion seems to have ceased on.
> > 
> >>> This series was tested on SM8350 HDK with a command mode panel.
> >>>
> >>> We will fix the DPU-DSI handshake and post a v2 but your issue needs
> >>> investigation in parallel.
> >>>
> >>> So another bug to track that would be great.
> > 
> > Will see if I can set that up for you!
> > 
> 
> Now, it seems this is resolved so bug is not needed?

Indeed, as mentioned in another message.  Looking forward to v2.

- Marijn
