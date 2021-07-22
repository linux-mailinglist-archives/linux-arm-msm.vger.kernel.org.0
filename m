Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB0EC3D2C6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 21:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhGVS1c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 14:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230345AbhGVS13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 14:27:29 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A171EC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:08:04 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id a17-20020a9d3e110000b02904ce97efee36so981960otd.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 12:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=scp+1rc24jdnxfL7eF19kK3DL+3J9gDohwlrgvGebZ0=;
        b=Kzg1+v+ASBz1l6YFdUYjoIJ1ycL30KyMVNUxiZbSsy/9xwgH7nYvbx0C2luXa/RK6v
         hHxo0L2IjE8alE4iJAA9A3eGelmKnpSy2X9ID5+zVi+2oucyhkHRSZFjbrdICtI1EGtp
         EERE2M2fk6+PWXVFGXH8veERzxrjmQZPsQdMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=scp+1rc24jdnxfL7eF19kK3DL+3J9gDohwlrgvGebZ0=;
        b=GL645ZVHSNtwmQFFBGEjfVX8Uxp3r7vPfZq7j4YfkoDv7DC0XfM+pQBFe+hIlWNq+z
         qea69OZM5nCNbEnIoO7oT+Nz2S5G3hMYsy84I9e5x5gle4fWq0Sa0IeT9jzS0jghk9Ft
         EPLcX/COltTJ9L9Yb4eeD/N2DNdWM+UPhNPHCh97PyJmBipmC8z+SQIGFvypGaE4AQfI
         rt68CR8+UpEK2DK3GQVfXO0rYTJxgDYS28T6KbAmvx4R86qY9twuB2ojHdO3BlhNWoXR
         1Q9V9ihbRS4OZlK5BX+icpB8Bt4sQfRoSU10FAfdY5+/nCbGerPQZm3WpDeAb78PPJtT
         ji1A==
X-Gm-Message-State: AOAM533xoRu7+Tr02xxU+QzitncYAIpomx33l7q1pG9ZF1LKDX3Hsor2
        OitQ8HQ6xYFVeyZxAcOj2y3edFuc6tJTX9kipBNRlg==
X-Google-Smtp-Source: ABdhPJzKPYX4blphNqYsrnAPfYagc8nG5lxdFDRdRvNxCcZa50YCfFPtbMdNhV6GjS7SG0R1yOQPOpaxxJ5vYACZZ0E=
X-Received: by 2002:a9d:650e:: with SMTP id i14mr838011otl.233.1626980883940;
 Thu, 22 Jul 2021 12:08:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:08:03 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-4-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org> <1626191647-13901-4-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 19:08:03 +0000
Message-ID: <CAE-0n5121VG4V9mqw6UTj2T4DrN66r53aCONMJr4bqe_niHz_w@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] drm/msm/dp: reset aux controller after
 dp_aux_cmd_fifo_tx() failed.
To:     Kuogee Hsieh <khsieh@codeaurora.org>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-07-13 08:54:03)
> Aux hardware calibration sequence requires resetting the aux controller
> in order for the new setting to take effect. However resetting the AUX
> controller will also clear HPD interrupt status which may accidentally
> cause pending unplug interrupt to get lost. Therefore reset aux
> controller only when link is in connection state when dp_aux_cmd_fifo_tx()
> fail. This fixes Link Layer CTS cases 4.2.1.1 and 4.2.1.2.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
