Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB4C4402EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 21:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbhJ2TMq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 15:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbhJ2TMq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 15:12:46 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF8FC061570
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:10:17 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id x16-20020a9d7050000000b00553d5d169f7so13227488otj.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Oct 2021 12:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=6E8vcYJD1fKDP3XaD/ycH8JYuUdwy86+ns+dWhU9gv0=;
        b=RocDwXFrDGO/UvAZFqVuRg/v72xtGyOM9Lk5I2qYuyt1+h8yABESCofSInZzYjJ7g5
         cOTtJivWVwprgwt3Q5LXiAJYIEl+sdyNTcBH1qmMMZJlh1QmB9bHBS76g/C8pElZQDuB
         q4l3oiqhf6zDfV9HFpik4L4/j1+eP7S6z4164=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=6E8vcYJD1fKDP3XaD/ycH8JYuUdwy86+ns+dWhU9gv0=;
        b=E5240NM+ydFAPIxvgNNaNmdYmXy+/0C4dHdXZ7VMp/2JTu1y8nE/Wtks1J5RqBaXkj
         Pd3Sx2U1mBUjfpMN8jUxQisvieL1DIIkmKTW73wlZJUx5uQ6TeuJ0neY1+yW3XYORT5F
         00OnP0OpN6Vedf4sIqlNkpWf597Mhuhj2DzRZypLJNZjTrKvdp2v0U2LQpPqejHamyQs
         XH56Rc6ocdEi3k/0yTdyY8fQiRYj+kfb1nRfsg/5Wh3/yczbwDokjhArmIMbFRrjOI6q
         R5jVjAPGor9KxJOi1WxVo1S4N/N2CEzCfdndkUbIVC93vlkGKwrbovzSpBsjeItVz1gA
         /loA==
X-Gm-Message-State: AOAM532EqfH79D/zeSVroW52ITnoIyk3ZnaSqfCuayiAjge+9O1m6tij
        c0k8rfZgLYgAJ0n3nZDY1hclGmdlEuejj3juUs3CMg==
X-Google-Smtp-Source: ABdhPJxCk6IMb59lyzYez87DGQZ6Gc3q17oYBRmUQDgX/ynDSJlazwQKn7ZL0Q43BMkQWirfnUQPme8eEHyOBDDqfXA=
X-Received: by 2002:a05:6830:1290:: with SMTP id z16mr2825771otp.159.1635534616693;
 Fri, 29 Oct 2021 12:10:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 29 Oct 2021 14:10:16 -0500
MIME-Version: 1.0
In-Reply-To: <1635510619-6715-1-git-send-email-quic_kalyant@quicinc.com>
References: <y> <1635510619-6715-1-git-send-email-quic_kalyant@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 29 Oct 2021 14:10:16 -0500
Message-ID: <CAE-0n51eW3kkeW+3vJyqVTUF-R5G38SF2VjXi4SksuFbz=zcQg@mail.gmail.com>
Subject: Re: [v2] drm/msm/disp/dpu1: set default group ID for CTL.
To:     Kalyan Thota <quic_kalyant@quicinc.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        y@qualcomm.com
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, mkrishn@codeaurora.org,
        abhinavk@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kalyan Thota (2021-10-29 05:30:19)
> New required programming in CTL for SC7280. Group ID informs
> HW of which VM owns that CTL. Force this group ID to
> default/disabled until virtualization support is enabled in SW.
>
> Changes in v1:
>  - Fix documentation and add descritpion for the change (Stephen)
>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
