Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 706B0721AC2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jun 2023 00:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjFDWBU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 18:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjFDWBT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 18:01:19 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81788AC
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 15:01:18 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E2EAB3E761;
        Mon,  5 Jun 2023 00:01:16 +0200 (CEST)
Date:   Mon, 5 Jun 2023 00:01:15 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Message-ID: <ojvx4uowxgxj73vwxrjeelp5drre5sw4rq43pbathfce4mw5vz@fwjsg3rhmox5>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
 <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
 <c18c8687-0c4e-894e-a629-bc55e54031c5@quicinc.com>
 <6se25tikdg2tkiprz4h4umfta34tc5orddksvwi6woklf7c74k@rbserwp5kt3a>
 <9001aaaf-778e-5b3c-e87f-2b196d8b62ed@quicinc.com>
 <CAA8EJpp2mGcOHf5KJ8Zt_MQK+grAvbb=tVtaiT7MBLzCis20fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpp2mGcOHf5KJ8Zt_MQK+grAvbb=tVtaiT7MBLzCis20fg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-30 23:14:19, Dmitry Baryshkov wrote:
> On Tue, 30 May 2023 at 20:37, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >
> >
> >
> > On 5/29/2023 2:36 PM, Marijn Suijten wrote:
> > > On 2023-05-24 12:18:09, Abhinav Kumar wrote:
> > >>
> > >>
> > >> On 5/24/2023 2:48 AM, Marijn Suijten wrote:
> > >>> On 2023-05-23 13:01:13, Abhinav Kumar wrote:
> > >>>>
> > >>>>
> > >>>> On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
> > >>>>> Drop SSPP-specifig debugfs register dumps in favour of using
> > >>>>> debugfs/dri/0/kms or devcoredump.
> > >>>>>
> > >>>>
> > >>>> I did see another series which removes src_blk from the catalog (I am
> > >>>> yet to review that one) . Lets assume that one is fine and this change
> > >>>> will be going on top of that one right?
> > >>>
> > >>> It replaces src_blk with directly accessing the blk (non-sub-block)
> > >>> directly, because they were overlapping anyway.
> > >>>
> > >>>> The concern I have with this change is that although I do agree that we
> > >>>> should be in favor of using debugfs/dri/0/kms ( i have used it a few
> > >>>> times and it works pretty well ), devcoredump does not have the support
> > >>>> to dump sub-blocks . Something which we should add with priority because
> > >>>> even with DSC blocks with the separation of enc/ctl blocks we need that
> > >>>> like I wrote in one of the responses.
> > >>>>
> > >>>> So the "len" of the blocks having sub-blocks will be ignored in favor of
> > >>>> the len of the sub-blocks.
> > >>>
> > >>> The sub-blocks are not always contiguous with their parent block, are
> > >>> they?  It's probably better to print the sub-blocks separately with
> > >>
> > >> Yes, not contiguous otherwise we could have just had them in one big range.
> > >>
> > >>> clear headers anyway rather than dumping the range parent_blk_base to
> > >>> max(parent_blk_base+len, parent_blk_base+sblk_base+sblk_len...).
> > >>>
> > >>> - Marijn
> > >>
> > >> When I meant sub-block support to devcoredump, this is how I visualize
> > >> them to be printed
> > >>
> > >> =========================SSPP xxx =======================
> > >> =========================SSPP_CSC =======================(for SSPP_xxx)
> > >> =========================SSPP_QSEED =====================(for SSPP_xxx)
> > >
> > > Yeah something along those lines, though I don't really like the `(for
> > > SSPP_xxx)` suffix which we should either drop entirely and make the
> > > "heading" less of a "heading"
> > >
> >
> > I wrote that "for SSPP_xxx" to explain the idea, ofcourse it wont be
> > part of the print itself.
> >
> > Without that, it matches what you have shared below.
> >
> >
> > > ========================= SSPP xxx =======================
> > > ...
> > > ------------------------- SSPP_CSC -----------------------
> > > ...
> > > ------------------------- SSPP_QSEED ---------------------
> > > ...
> > >
> > > And/or inline the numbers:
> > >
> > > ========================= SSPP xxx =======================
> > > ...
> > > ----------------------- SSPP_xxx_CSC ---------------------
> > > ...
> > > ---------------------- SSPP_xxx_QSEED --------------------
> > > ...
> 
> I'd prefer this format. It eases grepping.

Cool.  And let's also have spaces around the names :)

- Marijn

> 
> > >
> >
> > sure this is also fine with me.
> >
> > > Either works, or any other pattern in the title (e.g `SSPP xxx: CSC`)
> > > that clearly tells the blocks and sub-blocks apart.
> > >
> > > - Marijn
> 
> 
> 
> -- 
> With best wishes
> Dmitry
