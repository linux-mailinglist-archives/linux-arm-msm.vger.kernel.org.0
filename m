Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4296FEBA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 May 2023 08:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbjEKGSQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 02:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjEKGSQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 02:18:16 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C7C3596
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 May 2023 23:18:10 -0700 (PDT)
Received: from SoMainline.org (unknown [89.205.226.142])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DFAF32030C;
        Thu, 11 May 2023 08:18:07 +0200 (CEST)
Date:   Thu, 11 May 2023 08:18:06 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v7 2/8] drm/display/dsc: add helper to set semi-const
 parameters
Message-ID: <mbiijomkmkrwixpbg2rnpv3hb5y7gnsqqv2rkektgh4xvxig6u@iazy42chd7b5>
References: <20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v7-2-df48a2c54421@quicinc.com>
 <tl5zijcxx7326jdgr6lyjptvvvyxosoupz3vekvhex3vnviw5t@3vswzg244tme>
 <05021e78-6c1a-b4b1-6312-4dd3f1647074@quicinc.com>
 <7eeac1dd-8cd1-60e7-5dc0-f8f5adc18ffe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7eeac1dd-8cd1-60e7-5dc0-f8f5adc18ffe@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-11 07:26:28, Dmitry Baryshkov wrote:
> On 11/05/2023 01:35, Jessica Zhang wrote:
> > 
> > 
> > On 5/9/2023 11:29 PM, Marijn Suijten wrote:
> >> On 2023-05-09 15:06:48, Jessica Zhang wrote:
> >>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>
> >>> Add a helper setting config values which are typically constant across
> >>> operating modes (table E-4 of the standard) and mux_word_size (which is
> >>> a const according to 3.5.2).
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> >>
> >> Same question about ordering.
> > 
> > Hi Marijn,
> > 
> > This patch was authored by Dmitry and originally part of his DRM DSC 
> > helpers series [1], but was removed from that series for mergeability 
> > reasons.
> > 
> > Looking over the kernel documentation, the last Signed-off-by should be 
> > from the patch submitter [2], so I think my s-o-b tag should be at the 
> > bottom.

That's true, but I also think the S-o-B at the top should match the
 From: author.

> > As for the order in the previous patch, I can add a duplicate s-o-b 
> > before Dmitry's so that it reflects the history of the patch.
> 
> I think this is an overkill. Instead you can drop my SOB from the patch 
> 1. We do not need this level of detail.
> 
> For this patch the ordering of tags is correct.

So indeed, that either means duplicating the S-o-B or dropping it
entirely as we do not care that it was part of that series earlier.
Dmitry will likely sign this off once again when picking the patches.

- Marijn
