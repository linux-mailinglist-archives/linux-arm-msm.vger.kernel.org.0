Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD0879460A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Sep 2023 00:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244957AbjIFWQ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 18:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjIFWQ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 18:16:28 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3ED19AF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 15:16:25 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6bee392fe9dso247922a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 15:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694038584; x=1694643384; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TatTKafKUsYYCFxlPaO0ndc5iUmy3Qk4+A6ix/aUAqg=;
        b=KqHagFygW3pkoRvwwOS65ELOClzYbIdVizpf3/2V9OIOEkIED6Nz7H1ALficR8n/uq
         kuGo3U7mu21YDuE4VFb7hrBQNh+e9bNAy7gm9Y6J7qUEpzgR8qBf2EftHpr1te92c1aZ
         37Qe7rpF3MOVsS7QD+GbTFDRNkGFi9uq5lCbvVWr0dPhXCmadbGM070HQBxywkh2gRm/
         1khrkIyDi3qSinmlOZpYEHqKTK7YwChoO1FzP4jyVP7paqTrgh6cy8Kd/R+lUdxr9QgI
         HjYXMLQ9yjpKnWnQvBoTw/zGerJ5Llp3wxmPns1XXTZQrw0UDk8hdXFCScOVJXnduUko
         xdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694038584; x=1694643384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TatTKafKUsYYCFxlPaO0ndc5iUmy3Qk4+A6ix/aUAqg=;
        b=HxFE3rEULIc54xRjRzdsVaBeuxQXqwepE+nH6C8dKRMjjO4JBPlyXFqqaA0YeaxQs4
         +4SIPUmCHvKkfHMTuHgwpJJZoVMv9e0cgk8+6arxIrOZYNDiX1mYpJp4FpKLiOwZaDGd
         d5CKUqnF+7VmGLsT0i7/5lOpX8MsB8pP1aHd6mB6wP1rQkWjQgnKhWeUO9uk0VN4sjkz
         fzvPwzVWAx6wQitW7b/ZZN5JF6UVIU3dVqOpHIrcwJ+ZaNAeFikTHI21dAIyfYX7CtJq
         DqyV42+CP5iYz4i1jLd5SfYWWMqfy1QYPBzy2IJqMaV2MwE0TKg2vMm7C1jNWIIde5rR
         pMgw==
X-Gm-Message-State: AOJu0YxWEnBnNKuKItbOPSHz/ZgqI2QsQsvQFpUVraj+zCvaWzSoJdAL
        DgffCmD2GWmYnCJlJzB/e0bG3y6RCi9mc1SWcFbq5A==
X-Google-Smtp-Source: AGHT+IHVsinZuWrICTKLM00Gc2dovcRGyrKhxJ37wmOiXQbsxt1Emb50py8tz36rMLpW++su49CiJheSog7u3A45VnA=
X-Received: by 2002:a05:6830:478c:b0:6bd:67c:ba9c with SMTP id
 df12-20020a056830478c00b006bd067cba9cmr18432938otb.35.1694038584610; Wed, 06
 Sep 2023 15:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
 <20230904020454.2945667-3-dmitry.baryshkov@linaro.org> <CAE-0n505YyrVi=5TYvYJzwfvNmsxDT_MaR5KPefDAbn3vvhdOQ@mail.gmail.com>
In-Reply-To: <CAE-0n505YyrVi=5TYvYJzwfvNmsxDT_MaR5KPefDAbn3vvhdOQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 7 Sep 2023 01:16:13 +0300
Message-ID: <CAA8EJpqGXmip3xxWXxMt7=_vDTof52bbUQFNXL5WbkOCTL8nqQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] drm/msm/dpu: enable PINGPONG TE operations only
 when supported by HW
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 7 Sept 2023 at 00:54, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2023-09-03 19:04:48)
> > The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> > Rather than checking for the flag, check for the presense of the
>
> s/presense/presence/
>
> > corresponding interrupt line.
>
> The patch checks for the major version though?

ugh, forgot to update the commit message after rebasing on top of
Abhinav's core_major_rev series. I'll fix this in v4/



-- 
With best wishes
Dmitry
