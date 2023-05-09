Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD4A86FC4B7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 13:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235366AbjEILMd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 May 2023 07:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbjEILM3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 May 2023 07:12:29 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA474106F8
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 04:12:20 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-b9ef06cb784so7371496276.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 04:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683630740; x=1686222740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O+AtwPwXPZlp/x5nJkkCBaOlYDV83aySbZPDW4HW+Ks=;
        b=HOmFRHQ2CGgJGUmh5sxSRX/cHyAlfs0He1YcCwUGt/kvIdjXiZVz7xhA+MnwFqMURm
         XETqZd8VkjC55dbMw6IcaJGxixIgQL1p9+Cd4Y7GjdlyFLhAwaTVYHZrrRBQZNnY6GRa
         BEWFlXxrA7LQAvwKR/RwkoPq7S24CBVL/TE48aIROCvrcu0apEzL9KzyhLrvCtgTk7eU
         GOhZx8fpt9fn7m+Ca8mfsyrbQ5Mdteum0XLGOQAU4bm2M4bmiouLjHma1F1lrbkDhp3m
         9/fmviKxf3yNj3OoB6y5dTF92i3KSYLxRHnDclg+hbFWH6QqXKutinXVcIzaw7ek7WUJ
         mCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683630740; x=1686222740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+AtwPwXPZlp/x5nJkkCBaOlYDV83aySbZPDW4HW+Ks=;
        b=GB5jNN/xijnc2Kv5ITReZ1MmUowdWRXb8o3qDExpZ9o966rWAl+OPexL4tgCZeGJy2
         n5ys5PhT57oXsw1ReVeV+v9zM+O1wMtjtFlzvsC4+WSOnOJpLD3Fq/Qt5InyMyFTI0Ry
         cx/srCU4PmMnv/CM3msboLWigETGxlrkxDb/EAuA0jdqDGsJjmNdKHQNP6C5C1Ixh94B
         NR+RPHOG7UXZTTnwYf55lxDm+QmKRKCEvnEp8UaOu6Gt3sXL84J2lkKdqW2i2mAM5mAy
         1S06MM30HFH4EFTHOtdtw10ioid7OJryUiGREbh7Z3Tmqr3LJLkdgRkrtTAXK1pEuU37
         26uQ==
X-Gm-Message-State: AC+VfDyLeBxNuVy1zE5md4fSXfTAE28Eyo968a2F6Sk0lquRbuCVQ5XQ
        1jQXnltzy/EdlwZGy0hwcvdU9PZcJu6AaH3AXf22dg==
X-Google-Smtp-Source: ACHHUZ7LNWGXsH5ngDCkMQSeQBUdW9HlHh4f1cvgaN8Fn0DQyw7TEC/v0WbmUraisWvo/nYB5xTL7/87v2KHSJ9yXrU=
X-Received: by 2002:a25:ade5:0:b0:b99:93d5:26dd with SMTP id
 d37-20020a25ade5000000b00b9993d526ddmr14771104ybe.20.1683630739827; Tue, 09
 May 2023 04:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com> <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
 <1d7ccb5f-55c2-3b3a-df97-2c17beffabfc@quicinc.com> <0aa4130d-bb37-4743-10e5-fd518276f4a2@linaro.org>
 <chw4jhkwbtml3w3ha6beubvvil4jsr7wuzahfif2mzkcmsqhwj@wgm7axq2o6wk>
In-Reply-To: <chw4jhkwbtml3w3ha6beubvvil4jsr7wuzahfif2mzkcmsqhwj@wgm7axq2o6wk>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 9 May 2023 14:12:08 +0300
Message-ID: <CAA8EJpoW_rrvTP8kt2gHKZA+0Jez0_dKay3XGs+3_CaHQK7+Wg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: Add DPU_INTF_DATA_COMPRESS feature flag
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 May 2023 at 10:00, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2023-05-09 02:08:52, Dmitry Baryshkov wrote:
> > On 09/05/2023 00:46, Jessica Zhang wrote:
> > >
> > >
> > > On 5/7/2023 9:00 AM, Marijn Suijten wrote:
> > >> On 2023-05-05 14:23:50, Jessica Zhang wrote:
> > >>> Add DATA_COMPRESS feature flag to DPU INTF block.
> > >>>
> > >>> In DPU 7.x and later, DSC/DCE enablement registers have been moved from
> > >>> PINGPONG to INTF.
> > >>>
> > >>> As core_rev (and related macros) was removed from the dpu_kms struct,
> > >>> the
> > >>> most straightforward way to indicate the presence of this register
> > >>> would be
> > >>> to have a feature flag.
> > >>
> > >> Irrelevant.  Even though core_rev was still in mainline until recently,
> > >> we always hardcoded the features in the catalog and only used core_rev
> > >> to select a dpu_mdss_cfg catalog entry.  There is no "if version >= X
> > >> then enable feature Y" logic, this manually-enabled feature flag is the
> > >> only, correct way to do it.
> > >
> > > Hi Marijn,
> > >
> > > Understood. FWIW, if we do find more register bit-level differences
> > > between HW versions in the future, it might make more sense to keep the
> > > HW catalog small and bring core_rev back, rather than keep adding these
> > > kinds of small differences to caps.
> >
> > Let's see how it goes. Abhinav suggested that there might be feature
> > differences inside the DPU generations (and even inside the single DPU
> > major/minor combo). So I'm not sure what core_rev will bring us.
> >
> > Let's land the platforms which are ready (or if there is anything close
> > to be submitted).
>
> You mean waiting for catalog changes on the list specifically, so the
> DSC series as well as SM6350/SM6375?  I do intend to send SM6125 now
> that the INTF TE series (required for it, as well as for SM63**) seems
> to be generally accepted, but have been quite busy with the DSC series
> on the list as we're now unblocking many Xperia's to finally have
> display!

Yes, please send it, as you find time. No time pressure.

>
> The catalog addition is "pretty much ready", let me know if you'd like
> it to be sent in prior to your cleanup.

-- 
With best wishes
Dmitry
