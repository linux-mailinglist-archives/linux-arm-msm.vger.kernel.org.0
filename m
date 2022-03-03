Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE2E4CC883
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 23:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236726AbiCCWHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 17:07:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236685AbiCCWHA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 17:07:00 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9631A1688FF
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 14:06:13 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id l25-20020a9d7a99000000b005af173a2875so5831428otn.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 14:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=pdvZcd1dCzTos36AEvo2XuYW96g/JSyyd6Ju386HZBA=;
        b=GU/VicsmSZRw1d2LkDZ6wzydbTYT4L8dB1zCnJwjzA08Es/V8nusp7J1acftodaTq0
         5HH7HAouRm088ujftN55DNIdMBENIQKdJvGbxCq+X2n4YuPls/MdNaItK8W+zOfxKnv/
         O+Fxmy7cnSFBcug80vgAZtRq7kEgQVZE07yfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=pdvZcd1dCzTos36AEvo2XuYW96g/JSyyd6Ju386HZBA=;
        b=kGcY7QcIGMLqSKC0LAZtOehuC/tDmUgIVJH7Doq14Sut7beCYQ7wGw0wgqpXBPPo46
         BqyUYgieCzmN6iUh39U3Q00EzEFuybWPGFCP6v8fxVHXZVJB4XnISmHBvtRrWllx/tkK
         JBXhufxZcGDOVHIVKnj8s4hccmel3jNZSrD1v3BPYjxC6yONfj03HurFfkHiw00eXzAV
         UB7TTTYHayY3OeLYwnOXXHaZqiaN6zL9C3e+XeW1Kdr5Bnminkn106U0nbDoosDwW1xK
         8CFHQA8fMFxuulXPi5Zj3D/2elfbN9fEVkJT2FkNVPWdkEecOkZzb5tBnRiGipLj2v8v
         Vxwg==
X-Gm-Message-State: AOAM530e0vPewXy6CDWEDl7ksHyefBMnAyazG4Ajxvdg8fvaTIjDaDnM
        Ty0+SmvCppQ2D+5xoOleWYIyVqoJI3yFprHDe+ShWQ==
X-Google-Smtp-Source: ABdhPJzIsZYjGMPB9mIKaz9We4al2KijnAO/aGSWVSgdvkGTTn/LV94gdLX1B1Wq6BQq3wFmiUQFljUdJvXq2KeLZYw=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr19987839ota.159.1646345172996; Thu, 03
 Mar 2022 14:06:12 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:06:12 -0800
MIME-Version: 1.0
In-Reply-To: <1646300401-9063-3-git-send-email-quic_vpolimer@quicinc.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com> <1646300401-9063-3-git-send-email-quic_vpolimer@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 14:06:12 -0800
Message-ID: <CAE-0n539U9OzNRoaAG28TG7UJBUdiBYdJ-PKzGyF++ihK0Xo1A@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] arm64/dts/qcom/sc7180: remove assigned-clock-rate
 property for mdp clk
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, quic_kalyant@quicinc.com
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

Quoting Vinod Polimera (2022-03-03 01:39:59)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Fixes: a3db7ad1af("arm64: dts: qcom: sc7180: add display dt nodes")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
