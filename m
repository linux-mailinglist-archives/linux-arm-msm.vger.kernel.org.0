Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5C173D49D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 23:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229654AbjFYVdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 17:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjFYVdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 17:33:24 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68318D7
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 14:33:23 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 560B33F290;
        Sun, 25 Jun 2023 23:33:21 +0200 (CEST)
Date:   Sun, 25 Jun 2023 23:33:19 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Message-ID: <vp56takwifjhcopj5mfnh3767alih5glyqliji55iptcdbhbv7@dwxbtnb24jso>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
 <mwxs3rvemvdizqtsfa7pxms5prgrdq2lue6lvkt2f23nehzhwr@uawaxv5jsnmh>
 <ad1cf803-729f-5ef5-a6cf-667ecde0b282@linaro.org>
 <okxoa5ltkvki25q6e25jwoh55l3aav3umowynklinyapg4ojvp@wfxa6upwnk3m>
 <fbfb5297-0b89-d48e-459f-7e2cd8aa221b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbfb5297-0b89-d48e-459f-7e2cd8aa221b@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-23 15:12:06, Abhinav Kumar wrote:
> 
> 
> On 6/23/2023 1:28 PM, Marijn Suijten wrote:
> > On 2023-06-23 14:37:12, Dmitry Baryshkov wrote:
> > <snip>
> >>> In fact I asked to make it 0xf00 + 0x10 or 0xf80 + 0x10 to also cover
> >>> the CTL registers, but that change didn't make it through.  0x29c is an
> >>> arbitrary number that I have no clue what it was based on.
> >>
> >> This should have been NAKed. or at least TODOed.
> > 
> > As usual ;) - add new features first, fix the fundamentals... later?
> > 
> > - Marijn
> 
> I think you yourself found out that this was not an arbitary number but 
> we atleast wanted to cover the full encoder set.
> 
> So fundamentals are always sound sometimes understanding is not ;)

The fundamentals are not sound until the CTL block/register can be
dumped ;)

- Marijn
