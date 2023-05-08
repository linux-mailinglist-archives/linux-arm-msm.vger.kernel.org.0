Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12FCC6FBA3F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 23:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233464AbjEHVuh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 17:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjEHVug (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 17:50:36 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7214692
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 14:50:35 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id C5C0D3F5A5;
        Mon,  8 May 2023 23:50:33 +0200 (CEST)
Date:   Mon, 8 May 2023 23:50:32 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature
 flag
Message-ID: <omythya2ks2u7awnlciwhiwmyo6ybqgwe6wpwmlly4dfmvxo6h@3cucuvs77hav>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
 <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
 <1d7ccb5f-55c2-3b3a-df97-2c17beffabfc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d7ccb5f-55c2-3b3a-df97-2c17beffabfc@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-08 14:46:10, Jessica Zhang wrote:
> 
> 
> On 5/7/2023 9:00 AM, Marijn Suijten wrote:
> > On 2023-05-05 14:23:50, Jessica Zhang wrote:
> >> Add DATA_COMPRESS feature flag to DPU INTF block.
> >>
> >> In DPU 7.x and later, DSC/DCE enablement registers have been moved from
> >> PINGPONG to INTF.
> >>
> >> As core_rev (and related macros) was removed from the dpu_kms struct, the
> >> most straightforward way to indicate the presence of this register would be
> >> to have a feature flag.
> > 
> > Irrelevant.  Even though core_rev was still in mainline until recently,
> > we always hardcoded the features in the catalog and only used core_rev
> > to select a dpu_mdss_cfg catalog entry.  There is no "if version >= X
> > then enable feature Y" logic, this manually-enabled feature flag is the
> > only, correct way to do it.
> 
> Hi Marijn,
> 
> Understood.

Thanks if you can drop the paragraph.

> FWIW, if we do find more register bit-level differences 
> between HW versions in the future, it might make more sense to keep the 
> HW catalog small and bring core_rev back, rather than keep adding these 
> kinds of small differences to caps.

That is not up to me to decide, but I do agree that DPU is currently
"one big mess" where lots of things are hardcoded in the catalog (which
isn't a bad thing, these things won't change but it does make it harder
on us than if we could dynamically state "every DPU between these two
revisions"), and certain other things are/were read back from hardware
registers.

As well as the sub-block feature flags that pain us :)

- Marijn

> Thanks,
> 
> Jessica Zhang

<snip>
