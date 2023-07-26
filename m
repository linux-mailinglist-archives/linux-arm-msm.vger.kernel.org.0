Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F4028764158
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jul 2023 23:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbjGZVoa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jul 2023 17:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjGZVo3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jul 2023 17:44:29 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D192F5
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 14:44:28 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5221f193817so281819a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jul 2023 14:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690407867; x=1691012667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rryoHbb2E9gLrnaioxHCyrumAvy8LaMUiA6zuYta+oM=;
        b=PuPYQv+WnzUI1XaubwRq2wbF7IlP0/pqeRVu8tW5zo4plwyxJllfcCPaza/QV9DoJp
         S9hBDE1e8DnfHNhOFpUu8J40HpRDBwqYFY4Qu7VjC5T6xgQ6RHV/yk//W1BmMx5FKL6f
         IfOFyKwK7h8rCjY6kCeBSZhtY8TYZXNS6DgsggYeaheZIGNvuYGG8MxYuPXmnzkZPVBr
         c3ASoF284jEaMCXjLGJiyOQ51G1CtWHX+GyIAiRTfR6cvzqIGvZFMpcf67Q4C8yrnA3p
         I+DMPBIVBcMbrN6xdJq7dU8tRpvoW+QKu5x5RA38XdzGSVp+yDz5Kk9Keao5s6VYoRxh
         bYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690407867; x=1691012667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rryoHbb2E9gLrnaioxHCyrumAvy8LaMUiA6zuYta+oM=;
        b=DZH2NOe4GhNgDhSbsvmhGzgB7VNR+pmxdaMwBZLHf11I7rWvfqX2bd0KrmJ2KwzqNH
         4QAWrcRj00Wppk9v2Nkxxj5IH0m8bCdK64T2gh6r3zrVdFqqVG3vZ1vEkejNZLCpK6G1
         KQafvZRgTN7BEabhWvuWvzMNBUsQ9RVvkndrvtSNY/7o9gpiFVy927sd4deMRdF/eaZL
         c/Ftv6sV4kxAJpzh+DJtDe200G7BS2qmtyVUsgmJi1ll0YNtrtHpFdzMGj1pvjArN4J1
         p74TiyCKrEvgTlnDUxnYzp/NKgDnxD8i1GgERviyfFXnghqrlloFIq6Gn3nsZ2ChGQBH
         68rQ==
X-Gm-Message-State: ABy/qLYDnD5ALgWo8cAaqP02eI6DpX5nPnUvYMn/QGpRm8WwQzWj2PcC
        wcUhTezvVSYtXLhl2P+Q/TvCuZgQyXtQTdKt/eNWAYm7
X-Google-Smtp-Source: APBJJlEJgfiOCewtbRuhKwNvDe+y7na1mXr0+rnVJEjg1gTLH3jBbWW1KA2CX1QDvDPJdizyEToD+O0jKVgWetpTLWs=
X-Received: by 2002:aa7:c517:0:b0:518:7a3b:e9fb with SMTP id
 o23-20020aa7c517000000b005187a3be9fbmr272917edq.19.1690407866597; Wed, 26 Jul
 2023 14:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com> <20230706211045.204925-13-robdclark@gmail.com>
 <ab9f2c65-deb4-1762-4a32-a7046608311e@linaro.org> <CAF6AEGtqw0Pj42jucV7H==81WckYQZxBLSwb_ksB+=6pFmC6fQ@mail.gmail.com>
 <b9806e33-2094-dd4b-ec63-06dd8dbbd224@linaro.org>
In-Reply-To: <b9806e33-2094-dd4b-ec63-06dd8dbbd224@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 26 Jul 2023 14:44:14 -0700
Message-ID: <CAF6AEGvGUpte3KJqXE=dVrTf873XZ61xkgeQj+CxRTweETBxyQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 12/12] drm/msm/adreno: Switch to chip-id for
 identifying GPU
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

On Wed, Jul 26, 2023 at 2:38=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 27/07/2023 00:37, Rob Clark wrote:
> > On Thu, Jul 6, 2023 at 8:45=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On 07/07/2023 00:10, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>>    /* Helper for formating the chip_id in the way that userspace tool=
s like
> >>>     * crashdec expect.
> >>>     */
> >>>    #define ADRENO_CHIPID_FMT "u.%u.%u.%u"
> >>> -#define ADRENO_CHIPID_ARGS(_r) (_r).core, (_r).major, (_r).minor, (_=
r).patchid
> >>> +#define ADRENO_CHIPID_ARGS(_c) \
> >>> +     (((_c) >> 24) & 0xff), \
> >>> +     (((_c) >> 16) & 0xff), \
> >>> +     (((_c) >> 8)  & 0xff), \
> >>> +     ((_c) & 0xff)
> >>
> >> So, we still have some meaning for chipid?
> >
> > Only enough to do the inverse of what userspace does when parsing
> > devcoredump to construct chip-id.  Basically it is just a different
> > way to represent a 32b #
>
> What about passing it in the direct form? The macro adds assumptions.

It is uabi

I wouldn't call it adding assumptions as much as just a funny way to
format a number.  In some cases it might work out to something that
vaguely resembles a marketing name (6.3.0.2), in other cases it won't
(12.34.56.78).. it's just formatting a 32b # to match the way existing
userspace parses it

BR,
-R
