Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7D8770F41B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 12:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbjEXKZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 06:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbjEXKZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 06:25:11 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1E1C0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 03:25:09 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-ba829f93da3so1175649276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 03:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684923908; x=1687515908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aD3IA34gk0OpiFHmxgq4cZFvvS4AtjdfxP/2AHXDei4=;
        b=v42rDL2b4iFPtfMW+oR7SNJkKip2850QFTsyU+q5ISKql7iMfcDOgzYLmSxd+gQ1JR
         CkdspAZLOO3Os6ylUoe4hFkaZkcJr6VQHUTeAmWwbZYUay70avJ9EeaqZcnPS0euhFZ0
         5K28BrG+uDp81w0CUW5E34Ly434xVGcQ8rJz69KgWBLv6B5yaNal/bTWkSJJoUKboLzk
         pf0AWWHRqco76CED95f8NppvdSLVdCytawDMaHQk/9Zi/sWiqefnd+sDROR/QiFkjwII
         SMeNqPlAPDUBv6DVWPfWqYJk+03cbUtGBx1AaLrNZRrPzhsIhuPvaS+C+6G1cEex/40K
         MZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684923908; x=1687515908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aD3IA34gk0OpiFHmxgq4cZFvvS4AtjdfxP/2AHXDei4=;
        b=iwN7vBJN5zWNImLr/xShbwYHzbZME7TTnkLQLuHD57lC2PZrBBZprte0pXusXltknJ
         r/IWGq6wCcggfJMO6yjBLvnnNaBuJiFcSAJ9GchGGzibJLrG8KGXRvx+h73o0aS3cs5y
         zsGaVtoVyMAyPeLd0beb3mr/QngT6WaW9rS6xyAgrw1bJmAJuZLth8vf5HW+Fi8C3KbS
         v5XF+a/edhZKA43vtil3QVXferOmzKXiEG8uo++yGAAusQC1pL2n4oNrtSA4kUgTRAqJ
         If3JcZ1O7vtLMNx4VQrtvT1thFdtX5MccK8NE+ijf/mjB9kjOODccgw8D8G3kzWxMPJN
         BsCg==
X-Gm-Message-State: AC+VfDxAnQq11TTdh8OacGUs6nLBIEFXwoYc6y8PHgEBnfm69BNr8LdO
        Z3fu71lAWp3PqKcq0tRZ+jPr7ulyDpLPqM5VI5vfeA==
X-Google-Smtp-Source: ACHHUZ4xV9jRL3GEe5EA3g8bWvxcwLzA0YIwtlm12hu88MYwFnsVrU+nENvU+B1yodFngmQL9vL4RFxHDpW66Gpt3Is=
X-Received: by 2002:a81:8351:0:b0:559:f029:992d with SMTP id
 t78-20020a818351000000b00559f029992dmr18079445ywf.24.1684923908465; Wed, 24
 May 2023 03:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com> <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
In-Reply-To: <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 24 May 2023 13:24:57 +0300
Message-ID: <CAA8EJpoyZsEHJeh7wMrz3dYg3841AfR4LQEEhZff_zRpRQgAvw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 24 May 2023 at 12:48, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-23 13:01:13, Abhinav Kumar wrote:
> >
> >
> > On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
> > > Drop SSPP-specifig debugfs register dumps in favour of using
> > > debugfs/dri/0/kms or devcoredump.
> > >
> >
> > I did see another series which removes src_blk from the catalog (I am
> > yet to review that one) . Lets assume that one is fine and this change
> > will be going on top of that one right?
>
> It replaces src_blk with directly accessing the blk (non-sub-block)
> directly, because they were overlapping anyway.
>
> > The concern I have with this change is that although I do agree that we
> > should be in favor of using debugfs/dri/0/kms ( i have used it a few
> > times and it works pretty well ), devcoredump does not have the support
> > to dump sub-blocks . Something which we should add with priority because
> > even with DSC blocks with the separation of enc/ctl blocks we need that
> > like I wrote in one of the responses.
> >
> > So the "len" of the blocks having sub-blocks will be ignored in favor of
> > the len of the sub-blocks.
>
> The sub-blocks are not always contiguous with their parent block, are
> they?  It's probably better to print the sub-blocks separately with
> clear headers anyway

I hope this is what Abhinav meant.

> rather than dumping the range parent_blk_base to
> max(parent_blk_base+len, parent_blk_base+sblk_base+sblk_len...).
>
> - Marijn
>
> > If we remove this without adding that support first, its a loss of debug
> > functionality.
> >
> > Can we retain these blocks and remove dpu_debugfs_create_regset32 in a
> > different way?
>
> <snip>



-- 
With best wishes
Dmitry
