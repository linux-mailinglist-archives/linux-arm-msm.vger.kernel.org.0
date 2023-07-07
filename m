Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6E374B4A9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 17:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231849AbjGGPxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 11:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjGGPxd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 11:53:33 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E4311B
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 08:53:32 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-38c35975545so1871538b6e.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 08:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688745212; x=1691337212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nCL53aP+hS7tciKjFD7blcuEy36DSLX5ukiouHjZxlI=;
        b=MD0SFOGCQwWl8ocgrw6iXF5GRCdimdJN1uKsubkVald2jn73QqUSrs2jfiZ9sW2j3D
         ebk7TnC9/dCgGGz5BGLEmEa3vKzJzE37uk+57QETK52SlEJ7SnFYfjj6hGgN2ytCUgYa
         QpU7ZRFBU30/aL3xfLrxhqyciH8GCvA7ZYjSQhAZTtazVOAmbMkaUOFm11QnGfhYUUGU
         dHhnfS0m2oIOQOPIdGKq+UF8Vl00Z4R+4g6jynhIT3nCyB2YAmvWWQDj+seEDf61Lc4d
         95xJhRVU6K9C2maYkCKXfR4M4z4ON1tKB78m4ZEg8/VgxmHr+9KNL+q41AiN8ewg9ljk
         uk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688745212; x=1691337212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nCL53aP+hS7tciKjFD7blcuEy36DSLX5ukiouHjZxlI=;
        b=Q7y7lqDZHCwHJsz8+sHi9qI3CfoQ5kN/A/2GHxGmTYWP54govJ3VWD7Ht18nC+EblN
         kLOmIAjmUt1FFCZKjXIQsP78sTXJmM9NEGH5vVRSrt5aIwimWgnClWjgCy6kpmSiJbx1
         SbJ0xBb8Dfx4BOSGCq5YYdYmrZFuFRiDY61gzXF48RSctFCyrGRWsLElHdbbCWEqYnE+
         XcrDIfHFtNTMG+kfjwQPICdcGLkGI5J5fkRyzCdCHxy1jyVDNPz5YvJ71bMF8OkVcNEQ
         LCWqR3P6rQX4vC8XVo8xK817VO4YD60tXlS8BLVRwQ6K/bKdikGQ/5UujB5utFxYIzFm
         drwA==
X-Gm-Message-State: ABy/qLawHslWHLzYF7K5Xvro8Slm3Ma7+hP9LJZTSmPnUyPn1Y0C7psr
        a3tChvpu7B92bDO7HPLkG6qw2i3hvdI+x9OFpco=
X-Google-Smtp-Source: APBJJlEMVoC5fgJnH4032EslDGIrvj1PozPWtG1GU/u4PiOj3BGo1Mq7H5JFzTWtaNqWO+MPSYBtw7CN6so33VTDo0g=
X-Received: by 2002:a05:6808:2126:b0:3a3:e61a:c7d8 with SMTP id
 r38-20020a056808212600b003a3e61ac7d8mr4008620oiw.59.1688745212194; Fri, 07
 Jul 2023 08:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com> <20230706211045.204925-6-robdclark@gmail.com>
 <60df0f9e-9a9c-e55b-6cab-3d89dd90bcdb@linaro.org>
In-Reply-To: <60df0f9e-9a9c-e55b-6cab-3d89dd90bcdb@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 7 Jul 2023 08:53:21 -0700
Message-ID: <CAF6AEGs2EGpEaA-sP1Y8cNS5uCyL9gXbe0U3H-jPWSQt1njokw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 05/12] drm/msm/adreno: Use quirk to identify
 cached-coherent support
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 6, 2023 at 7:29=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 07/07/2023 00:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > It is better to explicitly list it.  With the move to opaque chip-id's
> > for future devices, we should avoid trying to infer things like
> > generation from the numerical value.
>
> Would it be better to push this to DT? I mean, we already have a
> 'dma-cache-coherent' property for it.

I suppose that would also handle the case where some a6xy are coherent
but others aren't..  OTOH it isn't the case that dma operations are
coherent, just that they can be.  It depends on smmu pte bits.  Maybe
that bit of pedanticism doesn't matter since we mostly bypass the dma
api, but we still do need to (ab)use dma_map_sgtable/dma_unmap_sgtable
for cache ops

BR,
-R

> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++------=
-
> >   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
> >   2 files changed, 17 insertions(+), 7 deletions(-)
> >
>
> --
> With best wishes
> Dmitry
>
