Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80894581765
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 18:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiGZQZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 12:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiGZQZa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 12:25:30 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D5D17ABD
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 09:25:28 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id v13so13115383wru.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 09:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t8LcVDs8RvZGnf91eTJED60DiX0yf8UGdRli/z4R9ww=;
        b=KOAeoyBm7wwBLORTMOBcTE7Nn6Uh+DlNDpeypqWgO3iRo3tTNM3ST5PjirqDA0SNJd
         2l8tM5Fj8bIosSVBQsNPXU16f9vBj/jxTLV1nUXBRaz958Ponsgt4MKJhTr/4P5C+ob8
         md49wVvLWNFB5WIcMqUydukfJrGCaC3zNFOc4r9JAlEwuq376EAb1KN9TGJAiGaS18CG
         pHW1lv0nYtqFya/3QGUA0ljw77iue/nXuR0nGJvpPMrGKGEDLJs/tHDRj6EjA6Mb7ZdR
         76rNBUZTj8S4pvcPutDbd37L1F7Da4v1+THmyE+fq8vsqR1TLx/hBtGU89MS78ZkXDIt
         fYyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t8LcVDs8RvZGnf91eTJED60DiX0yf8UGdRli/z4R9ww=;
        b=vBA6XIyH2KkCE7szVfV/iGUa8rk/dO1FuBpFWNXis4M7fnX3bt8Cr5meHlxOOj/5hy
         1VrrjXw1yLfdHtwjHSyGZF37DeCq9cNMmmUacWJOOcoNUKWMYcuCPBAwfxpbdpcLVH18
         Hxv111Vx6yiZqGctrZywAGEjoA9l4dg2b7djVE17hKa/0ulwWBzuaAycEws4LWz4mIrL
         6Twk7orNjTR2/xPC82bjAnI2IfpZXsuO3eVHMJcGMmMVxjmcY2qQCLojhAGzwjDl0Mbk
         YtbHcxToeI1eggCtDz2aP8qq0tGay2c/rU8m/TN3GPX5BQWjDchGmG6ZTa+yg1B9i/BN
         tKnA==
X-Gm-Message-State: AJIora/j1SVZ608IZ0hxNcyNCMoRAPKK14eO78ccSqrhCh2im+0j02bd
        VmndDEXWVXrro2PH7xUhEIfRS9dPm3U9H9Aif+E=
X-Google-Smtp-Source: AGRyM1vYA93JRusWt3hwGYo+dbJpfk0guI4CLJFR6iKYSfUwTVlqD4Bn4DScV0Cy1Y1E4ZJY93/GUDJxhAakmjQSbgI=
X-Received: by 2002:adf:e187:0:b0:21d:64c6:74f0 with SMTP id
 az7-20020adfe187000000b0021d64c674f0mr10806915wrb.221.1658852726467; Tue, 26
 Jul 2022 09:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220726044446.21102-1-quic_ddhamara@quicinc.com> <20220726044446.21102-2-quic_ddhamara@quicinc.com>
In-Reply-To: <20220726044446.21102-2-quic_ddhamara@quicinc.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 26 Jul 2022 09:25:50 -0700
Message-ID: <CAF6AEGvd+nS+hiypoVAZ-kag1xHHBMO=e=aGPrVr-+asUmFXBw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 1/1] drm/msm/a6xx: Fix null pointer access
 in a6xx_get_indexed_registers
To:     quic_ddhamara@quicinc.com
Cc:     freedreno@lists.freedesktop.org, quic_akhilpo@quicinc.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robclark@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 25, 2022 at 9:46 PM <quic_ddhamara@quicinc.com> wrote:
>
> From: Akhil P Oommen <quic_akhilpo@quicinc.com>
>
> Fix a null pointer access when memory allocation fails in
> a6xx_get_indexed_registers().
>
> Change-Id: I33e13745cd8e5841d2f377f48a199af98be2ed02
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Signed-off-by: Devi prasad Dhamarasingi <quic_ddhamara@quicinc.com>
> ---
>
> Changes in v2:
> - Corrected the signoff name and email id.
>
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> index 55f443328d8e..507074f6222c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> @@ -952,6 +952,12 @@ static void a6xx_get_indexed_registers(struct msm_gpu *gpu,
>         a6xx_get_indexed_regs(gpu, a6xx_state, &a6xx_cp_mempool_indexed,
>                 &a6xx_state->indexed_regs[i]);
>
> +       if (!a6xx_state->indexed_regs[i].data) {
> +               gpu_write(gpu, REG_A6XX_CP_MEM_POOL_SIZE, mempool_size);
> +               a6xx_state->nr_indexed_regs = count - 1;
> +               return;
> +       }

Hmm, I don't see us adjusting nr_indexed_regs if any of the earlier
sections fails, so I don't think we need to do that here either.  So I
think you could just:

if (a6xx_state->indexed_regs[i].data)
   a6xx_state->indexed_regs[i].data[0x2000] = mempool_size;

And I kinda expect if there was an allocation failure we'd just end up
dereferencing a null ptr later in the show path.

But, I think in general you can assume small GFP_KERNEL allocations
will never fail.  If necessary they will block for reclaim/shrinker to
free up some memory or evict some pages to swap.  If you've gotten to
the point where even that isn't possible, then a null ptr deref is
really the least of your problems ;-)

BR,
-R

> +
>         /*
>          * Offset 0x2000 in the mempool is the size - copy the saved size over
>          * so the data is consistent
> --
> 2.37.0
>
