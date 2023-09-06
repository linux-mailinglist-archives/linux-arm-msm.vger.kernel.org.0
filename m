Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCD3279456C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 23:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjIFVuN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 17:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244861AbjIFVuM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 17:50:12 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3461BF2
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 14:49:25 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-500a398cda5so441214e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 14:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694036943; x=1694641743; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zODF48arHxEUmG5YwHnLNmTWm5hE5D/m+hZRjIw53xs=;
        b=dhk5fdDaU0kFDAZfEx2rsAiVoe2DkhgitpDlt2ZKGiNY6qTrpsxmpwksDSnxHG7DRC
         vxajXrRl7kjeG88/6AuVWJoi3ZExTxe+tBSWevwQADLdH/IYXM8mnvuJJGB4O6pSNyLG
         TSvYxNOn9h4qwAKHsgDCazvT3oH7q+n4eKn90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694036943; x=1694641743;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zODF48arHxEUmG5YwHnLNmTWm5hE5D/m+hZRjIw53xs=;
        b=U2tYl+R0bmAQsqlqnRdsR4ipOo6r2/pKGW935IxnGuNK2w9SZc0cYSeHUsiOrAhe12
         1z3ElkW36D6QxTMzlqh6imQTF09t142boCX3KJbUcEPPnGdtXyJyLC/N/kyWmMkSO6SF
         ycuc/KlsgHZC4Ug64aYwecW8hptKloQRY7Astp2PgdxSr7iiziwCEmHBeJPmZDvLTbiI
         +cWBHDjI5Yj0T23YS22B3Sq00TNj9ASeRqGUekCxrL9jAjglp0iD4qRMPlWCO3uIXnes
         uxH0O6SqAXGJj/I5lAoFozjj7L8zyynbiavtTAsFBqV3OYztbzLDFIxVuKaluXPEBbvx
         cuUQ==
X-Gm-Message-State: AOJu0YwCVcS6/gDsnGivoVCIXXDMQngEbRiDh3ECpwjBpUjf0vLLCmPI
        ThEqWPUQrqS82mcqKbe2jQGxUwVW0w6B6Isw1vuu1w==
X-Google-Smtp-Source: AGHT+IEppiQEcjzv1kgekJwTQhO9E5ahaKHYtKaSUNZr55bKaMROTpPQkM9dHWVlUeNxngRoEUY4F5A8nlqEYK7E/PY=
X-Received: by 2002:ac2:5f9c:0:b0:4ff:a8c6:d1aa with SMTP id
 r28-20020ac25f9c000000b004ffa8c6d1aamr2949184lfe.48.1694036943232; Wed, 06
 Sep 2023 14:49:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 16:49:02 -0500
MIME-Version: 1.0
In-Reply-To: <20230904020454.2945667-2-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org> <20230904020454.2945667-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Wed, 6 Sep 2023 16:49:02 -0500
Message-ID: <CAE-0n52-eL=McFLPPSENFE_ziA6E2ghsdM3JrVdfS4jFXgJT8w@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] drm/msm/dpu: inline _setup_pingpong_ops()
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-09-03 19:04:47)
> Inline the _setup_pingpong_ops() function, it makes it easier to handle
> different conditions involving PINGPONG configuration.
>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
