Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC2415367B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 May 2022 21:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352759AbiE0TvS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 May 2022 15:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiE0TvR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 May 2022 15:51:17 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A58660F8
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 May 2022 12:51:15 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B21633F726;
        Fri, 27 May 2022 22:13:26 +0200 (CEST)
Date:   Fri, 27 May 2022 21:51:10 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com
Subject: Re: [PATCH 2/3] drm/msm/dpu: Add MISR register support for interface
Message-ID: <20220527195110.pdsq5aeun5ik5wsk@SoMainline.org>
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-3-quic_jesszhan@quicinc.com>
 <d72845af-f444-af2e-b834-6e4c754a1094@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d72845af-f444-af2e-b834-6e4c754a1094@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-27 22:38:24, Dmitry Baryshkov wrote:
> [..]
> >   #define INTF_CFG2_DATABUS_WIDEN	BIT(0)
> >   #define INTF_CFG2_DATA_HCTL_EN	BIT(4)
> >   
> > +#define INTF_MISR_CTRL			0x180
> > +#define INTF_MISR_SIGNATURE		0x184
> > +#define INTF_MISR_FRAME_COUNT_MASK	0xFF
> > +#define INTF_MISR_CTRL_ENABLE		BIT(8)
> > +#define INTF_MISR_CTRL_STATUS		BIT(9)
> > +#define INTF_MISR_CTRL_STATUS_CLEAR	BIT(10)
> > +#define INTF_MISR_CTRL_FREE_RUN_MASK	BIT(31)
> 
> I'm tempted to ask to move these bits to some common header. Is there 
> any other hardware block which uses the same bitfields to control MISR?

Can we use the "rnndb" register XML and bindings generator for DPU,
similar to how it is currently used for Adreno/freedreno and the DSI
kernel drivers?

- Marijn
