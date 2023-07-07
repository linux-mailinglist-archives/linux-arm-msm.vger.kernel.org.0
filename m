Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B89F974B17A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 15:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbjGGNJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 09:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGGNJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 09:09:11 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1812310E2
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 06:09:11 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6b74faaac3bso1705842a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 06:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688735350; x=1691327350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0E8y4fGYzz8yC2ib/jS3nwnW8qCRpxDzJh1d9RvFtk=;
        b=bpki2qcB+eLIwKnXEUSSAaEJDJ+snThABPQQqXxBPk54/nWPD+eFJNOIKY0Eu1l4Zv
         5eiBL2uAkyORf0Ah1uVUcK1gnzQ6M9u2zKJR5acbFswGDb+z7LEISpKmvPKboCqgpmUI
         adnw/HP7agE0y5LkPZsvS5CzIf23ONqpjqVuCn1mu2pdccL6bBVjGDzPgxLjVEJ19ZWI
         p8Xg7Gr/gVKDCqUgmaMnxRaE83f1k0UXfNTXpkqErsAgP12qJh9KiiLqEpKp12KsYOcp
         JBngbd2hFo6/rzFuG/3NDQUMdIRMDmrrrbcwHcpL33X0pfwUVBidoFps3OWTd5VzneKV
         sKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735350; x=1691327350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0E8y4fGYzz8yC2ib/jS3nwnW8qCRpxDzJh1d9RvFtk=;
        b=JZ7mJtYge3W8I3jgSaGYwqhtMPKJeRth5Y3dUmmTZDxOKjMd72ak09lpBaz8c6c92k
         dH9Lh7Px3H46cuQadGruh0YZ3avtlOIyKM+jgaSbvz9cVlYrv/b3rWuiIWRGkuMWxWCl
         Y17cwI+LQavfSDOZbXbLwcdvV6U+Nryge6XT25bw4Y82fLZRyqwKyYy5EEvxtJWVL2Jf
         /lBi/fg2+nSPsxTiNszq+Bi3oQo1B004a93bzDbrHdSOV/3L/E4BUMe1KP8b1RE323Iu
         hVkRY/lJoT66TrF382tO/u94rKGvVBXfIp/1PDyDzjkq/UYkXh5P+ikQg7CfgbwhNFFf
         kU9A==
X-Gm-Message-State: ABy/qLYP+7aELjv0HoO/2VBbfUtU5KKrGATGAx3gvtNPYXEMeOdfLkON
        8XlXJrGX1qSHLQe4pB7Cim4ZORzqontTwMFtbiVsh9/n
X-Google-Smtp-Source: APBJJlFhB3RwSiUYDs/RkJRayf+qGvXgwPyZgkYCBe721q2QnR1H8+yGO6Q2JKqLHwcJBKrUp3iz8c/Q0GropB3/Hfs=
X-Received: by 2002:a05:6808:178b:b0:39e:ffc5:c450 with SMTP id
 bg11-20020a056808178b00b0039effc5c450mr5609673oib.47.1688735350309; Fri, 07
 Jul 2023 06:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230706211045.204925-1-robdclark@gmail.com> <20230706211045.204925-12-robdclark@gmail.com>
 <3bbcabc4-69d2-93e0-a3e6-60d575b40126@kernel.org>
In-Reply-To: <3bbcabc4-69d2-93e0-a3e6-60d575b40126@kernel.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 7 Jul 2023 06:09:27 -0700
Message-ID: <CAF6AEGt5b_8eO6oXEt0mK+Rf0UfaEtB8JC+9fz+Wk=H9nWPuwQ@mail.gmail.com>
Subject: Re: [PATCH 11/12] dt-bindings: drm/msm/gpu: Extend bindings for chip-id
To:     Krzysztof Kozlowski <krzk@kernel.org>
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

On Fri, Jul 7, 2023 at 12:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/07/2023 23:10, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Upcoming GPUs use an opaque chip-id for identifying the GPU.
>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.

Oh, whoops, I'd overlooked that I hadn't configured sendemail.cccmd on
the laptop I was sending this from.  I'll fix that before resending.

BR,
-R

> You missed at least DT list (maybe more), so this won't be tested by
> automated tooling. Performing review on untested code might be a waste
> of time, thus I will skip this patch entirely till you follow the
> process allowing the patch to be tested.
>
> Please kindly resend and include all necessary To/Cc entries.
>
> Best regards,
> Krzysztof
>
