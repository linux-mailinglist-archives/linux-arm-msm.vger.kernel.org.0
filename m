Return-Path: <linux-arm-msm+bounces-834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B377EE915
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 23:01:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2212F280F48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 22:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681D849F6B;
	Thu, 16 Nov 2023 22:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c39vk3Pp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D365192
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 14:01:04 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5a7eef0b931so14695507b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 14:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700172063; x=1700776863; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XrDfTqC4kCNkXvqk06JZuMHZ8F1CQgx8Er0ge2sMlCI=;
        b=c39vk3Ppa/Xp2qoue6gSrPT67//d/E4aLL6kB2wSCktzXrWuxTdvFJhV5MG/Cnc6Zb
         Xdtuu9a4PfSQRmDS+EXhRV8iQ/XaY9J9xBcCVw4gLVuH5vjIMcgqWFaQOHrQb31JifOa
         GUbdCGxulOkPTZL+0Aamq0OkBVMsdHb/E/AXlFnnCVH9SxYaxaEzp6mtDLjljzMC9VHS
         MXrtjqIsYcBE050De9MCnZ7bpcBl1E05DhiQL/RZr/YMnz9TcI2zjQ8LTy4PtVV15AGp
         kJkD67hvGxQHuG1dOf8Eh5h/F2fEaIOD8Md2i98+uMRdJMjT/SOWu6mnXjdvIe/AgUjU
         TQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700172063; x=1700776863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrDfTqC4kCNkXvqk06JZuMHZ8F1CQgx8Er0ge2sMlCI=;
        b=s0GFKqrZHy5tCLEhRS3DqmFZM3j2oioenn2pzsi5Y0vw71EafLCyP25ND8/vn2vxbT
         N96OyWqdjv4cShS6n9HXedbFf3FZKJHm1C5P6qVuqQ2mbHVAwBaepwXZ2l23SefaYcDR
         3EDg9NGMOPOnN3cUiqjplhT9W6qlJhT5oJvbTBuEzNjmYCWJfxpPkgv/nK/dRE3UEZXr
         bToiCsc52IBBSagxOz9DarXxbw2DxufpFK9giPY8Mjtz/oTyWZkvrRxFaJ4lR+qskd8d
         5dbpHJsO7TdNnXH3ohjGL2hMNjq50f72fbiGRsPHQA4JJBVkapxLoVNS5bVsdmEZsXIv
         3egA==
X-Gm-Message-State: AOJu0Yx6bxCSBeunh6wlC/PC0fVCo3slXKkM5540TmagcFF3Q7pYpisW
	spemRh02fgXPe0erwoPG5hs+5qK+DkMKog8e1JCsAQ==
X-Google-Smtp-Source: AGHT+IFar8dbn8tWGRc5Du9nzxi2agmew03+it+BDi75j3YNagGC4edoDYvKPdFZlty1Nzek7YOPn3SS7ZFTZyvb9QY=
X-Received: by 2002:a05:690c:a87:b0:5c1:8075:5a7d with SMTP id
 ci7-20020a05690c0a8700b005c180755a7dmr18665864ywb.39.1700172063677; Thu, 16
 Nov 2023 14:01:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115224409.240935-1-robdclark@gmail.com> <6107757c-1217-1759-8bcf-7dbce6f2e730@quicinc.com>
In-Reply-To: <6107757c-1217-1759-8bcf-7dbce6f2e730@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Nov 2023 00:00:52 +0200
Message-ID: <CAA8EJpqUBTMnkcR_dmvRCaBGNCn6x-mvnna4qVkzCVqQKBFyJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/gpu: Move gpu devcore's to gpu device
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 16 Nov 2023 at 00:58, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 11/15/2023 2:44 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > The dpu devcore's are already associated with the dpu device.  So we
> > should associate the gpu devcore's with the gpu device, for easier
> > classification.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

