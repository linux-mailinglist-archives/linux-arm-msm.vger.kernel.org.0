Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1D1C4CC7CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 22:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234718AbiCCVRj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 16:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233862AbiCCVRj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 16:17:39 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B973F532E5
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 13:16:53 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id n5-20020a4a9545000000b0031d45a442feso7240157ooi.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 13:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=eBRpf0i/hx08EbAhrJon0eI377sVgFylnKUzTw3G8q8=;
        b=Y1noj0CZkDChL6WDH0DFVnqalSjczZxzPiFZ0aeG9zYus0XaN6W0E0c+xiS47WsUTD
         ZgMe8dZXS/qf/ONhNPJR4f1+nbsghpw7hKXWIuCZ2dI2eZgfich2+2SlwJUaZZCyE95W
         Uc9E55tWfiKT76d6Z0xLVxVmKTccsfJXDXIec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=eBRpf0i/hx08EbAhrJon0eI377sVgFylnKUzTw3G8q8=;
        b=7kiAgIBR2gdUwQaL9tK2KcfZVdQ3PVpsthl+QrI15GPpKhP1UhXdJWATZ0JcwgWh9W
         gA5f2LybtttOv7JW1vLcnW2t8NZb30/0f+fr04QY+rfgzPfpUUNS9wZCo8pqo0fWstqg
         vPB9sXr6n3AVr+MnMufLFGmLLKdvc5mfAOuajP3bbBZAUcaQs5RFrxMrmXo4QpnN4OeA
         2HKT8oyusMp9uskR6hHMmr8qFSdFdsZXdCzyJiGlGHtYWp6uMdhO9zso2M6Lvx0TvO02
         T+eHBRdR7/z6QOFCXENVZ/CqT+Z4VsKwJ1L+uXBvfIBDnUMxvS/XstXnmwA/WM/LZhAh
         J9wA==
X-Gm-Message-State: AOAM530OOdEcqd18lLaGw11ImHthJfQrrMi+wWyIZUv8SL9Q3kwRezYJ
        lfYCffHwVhziprR2qwxrEy65lSJ8b9fb6nmIzyiWy0GQGXk=
X-Google-Smtp-Source: ABdhPJycDTkb12wMHQabG8QDoujORlwb5yF7X0CE3x/kQihq3Ki7wuKuov+4lGz1lU8+V2cIfN0D2vjvseXYvTdgcQo=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr5555933oab.32.1646342213146; Thu, 03
 Mar 2022 13:16:53 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:16:52 -0800
MIME-Version: 1.0
In-Reply-To: <20220222062246.242577-3-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org> <20220222062246.242577-3-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 13:16:52 -0800
Message-ID: <CAE-0n50ANGE0gQ6My2eXR4jhp5ivU6kvRcFCoUmmZ1rEoUT9UQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm/dpu: drop INTF_TYPE_MAX symbol
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-02-21 22:22:44)
> This enum value does not correspond to any of actual interface types,
> it's not used by the driver, and the value of INTF_WB is greater than
> INTF_TYPE_MAX. Thus this symbol serves no purpose and can be removed.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
