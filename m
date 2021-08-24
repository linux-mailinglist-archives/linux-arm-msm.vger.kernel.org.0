Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6873F6C14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 01:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232651AbhHXXIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 19:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhHXXIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 19:08:36 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A22E0C061757
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 16:07:51 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id b7so28476401iob.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 16:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WE+YtBA3gJnr+ACnUTzWBgYKs5rZNaGQyfyCqSLCJh4=;
        b=XR8IPmMsfb9AITUHo8H7bgAFJbyTroEyqBamjYr4/G1KWUAhK9q9B/TaXjlqsz6JNL
         lmuSqtjEAd6pcHjtv9EvIFF0nyacrsz1Op48/IRk4c4mBbQP72dS06JO6BHCq14yNc3P
         Pp9LH7ufBggVEDobtoj8S/HX0fEXtUOLKHkS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WE+YtBA3gJnr+ACnUTzWBgYKs5rZNaGQyfyCqSLCJh4=;
        b=ryIOpNZvGLcLockJbFeVZYBvnG/qEUxFPON8ZTI9VbBHafq9tucCIYws7TNLOtMubB
         6/7P3jOeXjxsRVXDwk9ns26NJlouhRGvFSqi/YTs+O0xfSLUAOjNRRmmS9OCaWjRK3a5
         QRN0jqpz1vCc41kjC0I/nS7toVgL5XhuY3IaM2yC71sFMXpUHu9TcOU/A2FhtJt3C2TF
         fC0kcbg3EXOwqd/ar3JeIqKdQSThvEz28XcFp1+EsG8PhgwUhuXLqVywzRz5gMUTHzWI
         SZXvXLc9y3rRkv4HKK/SAbpgP5y8HRU7CmxAOwwwZBHRi4C70mOYFm3DvC4B6IL6u92K
         cc1w==
X-Gm-Message-State: AOAM530CFysZ14KjnRxdBFM4OA5Sl36Qqb+qe8YqOnKFhPSlritivDUD
        X7vxoxNWgf6+aAep+fA4D4CMaB9jKDQuvQ==
X-Google-Smtp-Source: ABdhPJyQ4ccmWqPexzy2nVaWlwGCCxYpsxM5tIFabm5NMUM/pt2kFX4qbDtIra85l7i1vjZh1El8uA==
X-Received: by 2002:a02:a317:: with SMTP id q23mr33054636jai.83.1629846470841;
        Tue, 24 Aug 2021 16:07:50 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id z22sm10502833ioe.52.2021.08.24.16.07.50
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Aug 2021 16:07:50 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id a15so28456120iot.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 16:07:50 -0700 (PDT)
X-Received: by 2002:a02:644:: with SMTP id 65mr3305905jav.84.1629846469728;
 Tue, 24 Aug 2021 16:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org> <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
In-Reply-To: <1628726882-27841-3-git-send-email-sbillaka@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 24 Aug 2021 16:07:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VgWm76kb1KwsieTXUmddPgkENtGBQ2UtMzQ38ob+6EKw@mail.gmail.com>
Message-ID: <CAD=FV=VgWm76kb1KwsieTXUmddPgkENtGBQ2UtMzQ38ob+6EKw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: Add SC7280 compatible string
To:     Sankeerth Billakanti <sbillaka@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Aug 11, 2021 at 5:08 PM Sankeerth Billakanti
<sbillaka@codeaurora.org> wrote:
>
> The Qualcomm SC7280 platform supports an eDP controller, add
> compatible string for it to msm/binding.
>
> Signed-off-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 3 +++
>  1 file changed, 3 insertions(+)

The ${SUBJECT} of the patch should probably be updated to say _what_
you're adding the SC7280 compatible string to. In this case, that
would be the msm dp-controller.

-Doug
