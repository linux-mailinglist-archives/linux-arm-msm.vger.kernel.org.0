Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4824050EA7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Apr 2022 22:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245405AbiDYUav (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 16:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245492AbiDYUam (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 16:30:42 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1264D14EC59
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 13:24:56 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id c17-20020a056830349100b00605ca7d1deeso42761otu.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 13:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=i/cbTDQy63LDQhOihWzHzZUmvcSW7IqWrJf3iJytnOs=;
        b=HNP4FnWUAWSVYDGDBPgD8iux+2z7R28TGzFiVrDlHmpIf05Co3eDVAciUrDqWte8qL
         SmiZGLOnXM/1FqL4454+qEox4QsuvNukIAGQ/PdKidaICzi05UiogyTi26UaG/BRQk4O
         i5biSKCOVzl33MfoNv3ZraKE9WsGM/5qpSpR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=i/cbTDQy63LDQhOihWzHzZUmvcSW7IqWrJf3iJytnOs=;
        b=WNVoaZrJyqXuXEeU/dcnTWBAGX3NNxSFM285td0tKeiKFepy6Aamot0WPcW/eVU1Xg
         IcDtqz1jba+TXvcrW2yPJqvjNSxsKyL5I0goN0bGq8O1RJvBxg57fv9R337p/owNQ3wn
         g44wrQkPcs9eMI4oCghzPB087+73bLkYUb4+PSiIdBa+Zr/JU/q4Kv+Vup+rK8y2S2BX
         o0wUr3XWwdMgJBaPea56Fbwq+4vqK8Gqp78HOxvkWlAqgeb9v/BPZqzfaxm/TlZ/pBC3
         1sGfPCj4W4Vdr2TdesdiZLJGoPPlVCIa4nxaXQwpkajmaYwp+fxpEcDFg2hMF3a5+OJH
         XYTQ==
X-Gm-Message-State: AOAM5308YAZ9Enh2bBD0Dg+L1r+4q8NuQN14MfaE+9yJ67RFlWcG4IMG
        fwAhTiceGfRV+jJ0U1ackQdJc51iHqWJ2dmG/KhtKQ==
X-Google-Smtp-Source: ABdhPJwVqbmVCPVHZaaa+iMgaqmo2o0oIEdpUhkFrQMPWCAx0UGWznDThN+OMIc0e6bI2J92JJDahtpwrSyFiUV0n+Y=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr7176514oth.77.1650918294748; Mon, 25 Apr
 2022 13:24:54 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 25 Apr 2022 13:24:54 -0700
MIME-Version: 1.0
In-Reply-To: <20220425122223.7415-1-guozhengkui@vivo.com>
References: <20220425122223.7415-1-guozhengkui@vivo.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Mon, 25 Apr 2022 13:24:54 -0700
Message-ID: <CAE-0n50a6K-UbG1xM+Au_-f1k98-uth8a__2YzzpZ4F4qBbBoA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix returnvar.cocci warning
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        David Heidelberg <david@ixit.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Lyude Paul <lyude@redhat.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Xu Wang <vulab@iscas.ac.cn>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     zhengkui_guo@outlook.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Guo Zhengkui (2022-04-25 05:22:21)
> Fix the following coccicheck warning:
> drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c:24:5-8: Unneeded variable:
> "ret". Return "0" on line 75.
>
> Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
