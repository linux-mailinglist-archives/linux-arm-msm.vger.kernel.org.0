Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1ACB70F369
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 11:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbjEXJsu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 05:48:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjEXJsn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 05:48:43 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3AE19E
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 02:48:41 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7EF1C3F321;
        Wed, 24 May 2023 11:48:39 +0200 (CEST)
Date:   Wed, 24 May 2023 11:48:37 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Message-ID: <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-23 13:01:13, Abhinav Kumar wrote:
> 
> 
> On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
> > Drop SSPP-specifig debugfs register dumps in favour of using
> > debugfs/dri/0/kms or devcoredump.
> > 
> 
> I did see another series which removes src_blk from the catalog (I am 
> yet to review that one) . Lets assume that one is fine and this change 
> will be going on top of that one right?

It replaces src_blk with directly accessing the blk (non-sub-block)
directly, because they were overlapping anyway.

> The concern I have with this change is that although I do agree that we 
> should be in favor of using debugfs/dri/0/kms ( i have used it a few 
> times and it works pretty well ), devcoredump does not have the support 
> to dump sub-blocks . Something which we should add with priority because 
> even with DSC blocks with the separation of enc/ctl blocks we need that 
> like I wrote in one of the responses.
> 
> So the "len" of the blocks having sub-blocks will be ignored in favor of 
> the len of the sub-blocks.

The sub-blocks are not always contiguous with their parent block, are
they?  It's probably better to print the sub-blocks separately with
clear headers anyway rather than dumping the range parent_blk_base to
max(parent_blk_base+len, parent_blk_base+sblk_base+sblk_len...).

- Marijn

> If we remove this without adding that support first, its a loss of debug 
> functionality.
> 
> Can we retain these blocks and remove dpu_debugfs_create_regset32 in a 
> different way?

<snip>
