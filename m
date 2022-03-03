Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A69D4CC7D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 22:17:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbiCCVSP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 16:18:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbiCCVSO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 16:18:14 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6106EC12
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 13:17:27 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id k2so6020547oia.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 13:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=wYzeeIZFTYS/KurLrrqYigMllzmjedeg2meWYLtmJLs=;
        b=D4tg2jMDQATVChv7StvQYVpE2j1Tj+kDhpfEu/nlLJfNE8SxQ5d4TzX/bElISDi05i
         R3jC3zJgEcQ5/J+jFw+SiGbuX+w1RIYBjBsdLXqLEMQRBafBlY8Mt8uUk6Ri6HTiUQKP
         FkuPBg5veFnilziG+btyWOiLATOSFsUqUBhPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=wYzeeIZFTYS/KurLrrqYigMllzmjedeg2meWYLtmJLs=;
        b=fF8tyFjfhrbihBC0cIyns9Lyi1yBP9K2Y5hVfeU4ThHHmPVRmhjvuxVEOAgBZFQb0f
         Ash0ez8F3GLD61t0xW322fW/XrzTLf3Q3KcgAOw+oTh3gR3x4ihXAUeowhjo4ubzTcXL
         wE82eoKOOyGQsnw/I6+32HjMErH+TptYqoktVkZKSR81oKqR0PfR7munI06a8G6wpwb9
         LFIKV/YRgNVMF5e0zuMnU2LyibtQL2lYpbZvAS9ejTrk1ELPFOhWxZDcbfjj3ytDrBSA
         htVmTilFkf2yc0pYu3ZWyUsPoERorGNmuVbfml15mAF9oAsV/+CyYT9AKJ8oKyoOwsUm
         8pRA==
X-Gm-Message-State: AOAM530eYfsDFagn8r6UHWUgxqSd+L57GcgmLXAc58i245dzBdBLR2H8
        0sI7eGaa6n8n1XFgVHsarlUiP0YX2lawaV7DRHEzTQ==
X-Google-Smtp-Source: ABdhPJwvzjaldM6yPnGiL2obFRFwrnHI2rMhEOfCp5dWyB7Vm8URBBIA4uwHZlOogwzCCxW4ZLySjZG/0DgisPYxpzk=
X-Received: by 2002:aca:3346:0:b0:2d9:91f9:a7f2 with SMTP id
 z67-20020aca3346000000b002d991f9a7f2mr633882oiz.32.1646342246775; Thu, 03 Mar
 2022 13:17:26 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 13:17:26 -0800
MIME-Version: 1.0
In-Reply-To: <20220222062246.242577-4-dmitry.baryshkov@linaro.org>
References: <20220222062246.242577-1-dmitry.baryshkov@linaro.org> <20220222062246.242577-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 13:17:26 -0800
Message-ID: <CAE-0n50uVsdWU53p+VVjT-Zv5FjjwHfdMOFyy4O28_baNSh4Nw@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm/dpu: drop obsolete INTF_EDP comment
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

Quoting Dmitry Baryshkov (2022-02-21 22:22:45)
> DPU driver never supported INTF_EDP, so let's drop the obsolete comment.
> If at some point 8x74/8x84's INTF_EDP is ported to DPU driver,
> corresponding handling will have to be ported too. Until that time, the
> comment serves no purpose.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
