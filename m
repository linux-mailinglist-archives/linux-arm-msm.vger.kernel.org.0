Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC8B3F51DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 22:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbhHWUPf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 16:15:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232301AbhHWUPe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 16:15:34 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DDCC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 13:14:51 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso39594033ott.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hGriz5nEPC/9blprw2SSKn2ibNR/r6EGgeTF7xGzQOA=;
        b=VDYJUp7Plh2KyeGxRwUz2J+DE8zDTIowi27TR3jGY8L8VLlUHqO5eHIZziOva/WmBd
         b0CI1i0tDaq7XjlhJhNNNBK+e01KoatUkZ1GR0JbwXuZLKuAS4o6tfiNXIxglqz/X6wr
         gg2r1qr3DXtObXg0yY6XNpiRz3uPrYPpUSZ1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hGriz5nEPC/9blprw2SSKn2ibNR/r6EGgeTF7xGzQOA=;
        b=XVZU7OP8zPH9xOjho5uNVYTraaqApaVN2oOPMh1hvFpOjEpy2Nbd9czKvPVAYwQuQq
         KMKrXugxnI6rtn9ufSa19OFJi54NExlb23eYXe/BVHxnJKhpLofQoihHnZMReRNvDZtF
         TxMxUl35X3vdWgt3emTALrR/OB07dT7Zu3Jp9m9S7XAOx/vKHeDm0wcxnDis3+9qmgKY
         G/RQxzenR59NYB2DYxCgJ60oUrXywf90XK3UnyUFMCWPiU+wic4mK2ht1W+yEiEXjVXY
         ukZOLRUCU8WrWRIddjz+QUkOtp/9W8cpLqYMy1kAkb6oQ9FIMTWRk9nD7p/w1VHs9jFW
         0PEw==
X-Gm-Message-State: AOAM532nue0AvqIbx9DGGPGt1YnpMy4Ak2I2KB/+5iaUgfiZbaz1j2fy
        brFX4r4zDCrZMrbkQKkAzB1Ki+th7W89PziDi6phPw==
X-Google-Smtp-Source: ABdhPJz7QvAa9cl0qW+P2JH63tRIV8M2034yxYv1URsomWS1n7tP7NRfkZ7UKUIw/0NSoy2rXfEUugVzPRXMYhw+n4M=
X-Received: by 2002:a05:6830:88:: with SMTP id a8mr29450117oto.233.1629749691263;
 Mon, 23 Aug 2021 13:14:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Aug 2021 15:14:50 -0500
MIME-Version: 1.0
In-Reply-To: <1629344185-27368-2-git-send-email-sibis@codeaurora.org>
References: <1629344185-27368-1-git-send-email-sibis@codeaurora.org> <1629344185-27368-2-git-send-email-sibis@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 23 Aug 2021 15:14:50 -0500
Message-ID: <CAE-0n52t6QkvgzxbmV_sy6b-Bmou7Rsx8WyxN8LKOpJKP7S4KQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: remoteproc: qcom: pas: Add SC7280
 MPSS support
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        mka@chromium.org, robh+dt@kernel.org,
        saiprakash.ranjan@codeaurora.org, will@kernel.org
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-08-18 20:36:16)
> Add MPSS PAS support for SC7280 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> Acked-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
