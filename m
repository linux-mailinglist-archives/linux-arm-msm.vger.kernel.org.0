Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5796A4BC514
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Feb 2022 03:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239900AbiBSCs4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 21:48:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241162AbiBSCs4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 21:48:56 -0500
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E808BF12
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:48:38 -0800 (PST)
Received: by mail-oo1-xc34.google.com with SMTP id 189-20020a4a03c6000000b003179d7b30d8so5878946ooi.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 18:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hPdjDdNadPqSVHbuOnqKmiG3swyOEQcjMi4i43w2HUQ=;
        b=AP5Zj0QHPXzaf68gGt3ocS1GQg9DML587jXkKRiK/42bBTMle2SHr2seh9i+gPvEdB
         9seinr0CYty6KtMIoD4brePKNsuTIcUqYjBaCEVlhvB81XGXtE+uujPwmvAr4zuHwOL9
         KPCJ9jiZ4Oao5Rt2w6zAJbOpdxXxm/K8KMb5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hPdjDdNadPqSVHbuOnqKmiG3swyOEQcjMi4i43w2HUQ=;
        b=MhoWm10GS8Bq3+EXS7G8NkZPCeCqbouH8kg5uUCM1Ij6wRBLpgZHYpaLGm0EJzU8ck
         s5zfqnGEHLYzmy63ROuqNv2xRjQL3f60Qjd6OZJ2EQE3HO26XtdSMtPBPkN5bue+3qFg
         PHP6KQy3rIacDPz7yeTfIdA5Bh1MKSwjj7dOs1P5XqdUgM1ngqTDdF8uxIcZl3dwag+H
         AsyTMBM1nqmLpDApBwKBhKkJIrdLSFZ6ChJtiK0urqEqJTETvZB7MWFK28DZ2ovAWRR6
         4koh6EWn81O8Mlrhuu7P5NbYyD4TDEcpnI+6TwfWXn5eVbjrzZBR8Nopp9H8dxIJbDLq
         LD2Q==
X-Gm-Message-State: AOAM531R55KcJbSjR/opytbOzCSaOBRgPx+m8jBBQLbwqHtA4B9/1pYg
        F/1fynM7bmibIz+SC2W0pBY4wsiGDuK+jvxkJzVC9A==
X-Google-Smtp-Source: ABdhPJzv3fD/5F9JZh4S7/yrUsbnHaMdSMc+45/Z1gxOvab80lBmoKayst3vo1YUAP6EKGWHGzS/pWyicSgVLN5HgaI=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr4196156oap.54.1645238917762; Fri, 18
 Feb 2022 18:48:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:48:37 -0800
MIME-Version: 1.0
In-Reply-To: <1645133788-5057-3-git-send-email-quic_khsieh@quicinc.com>
References: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com> <1645133788-5057-3-git-send-email-quic_khsieh@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 18 Feb 2022 18:48:37 -0800
Message-ID: <CAE-0n53oA_1iXq8gt97TOWBBxbLVs7YT338ePaBKaeoQsfX=SQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/4] drm/msm/dpu: replace BIT(x) with correspond marco
 define string
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2022-02-17 13:36:26)
> To improve code readability, this patch replace BIT(x) with
> correspond register bit define string
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
