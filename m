Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D688176813E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 21:11:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjG2TLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 15:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbjG2TLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 15:11:02 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F5110C0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 12:11:00 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6D2553F28C;
        Sat, 29 Jul 2023 21:10:58 +0200 (CEST)
Date:   Sat, 29 Jul 2023 21:10:57 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v3 5/6] drm/msm/dpu: stop using raw IRQ indices in the
 kernel output
Message-ID: <g4kcpmeixi4yqbtazngyombrlgoz73zrnozjol6ke3h7q2x3w3@uoxosls3ouxu>
References: <20230728233200.151735-1-dmitry.baryshkov@linaro.org>
 <20230728233200.151735-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728233200.151735-6-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-29 02:31:59, Dmitry Baryshkov wrote:
> In preparation to reworking IRQ indcies, stop using raw indices in
> kernel output (both printk and debugfs). Instead use a pair of register
> index and bit. This corresponds closer to the values in HW catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 49 ++++++++++++-------
>  1 file changed, 31 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 308b122059cd..6071d3f05b0c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -199,6 +199,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>  
>  #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
>  #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
> +#define DPU_IRQ_BIT(irq_idx)	(ffs(DPU_IRQ_MASK(irq_idx)) - 1)

Another nit: I'd find it clearer to define DPU_IRQ_MASK in terms of
DPU_IRQ_BIT[_INDEX...] than the other way around, because this is just
irq_idx%32.

- Marijn
