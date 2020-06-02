Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 953851EB3D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 05:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgFBDh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jun 2020 23:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbgFBDh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jun 2020 23:37:58 -0400
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com [IPv6:2607:f8b0:4864:20::942])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDBAC05BD43
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2020 20:37:56 -0700 (PDT)
Received: by mail-ua1-x942.google.com with SMTP id a10so759860uan.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2020 20:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Tu35wMUvVaUbJZZGmEqYD6hl6BjE9qoHA2F4LLuwpc=;
        b=e0nXZ01G9yqKOkxkRH/jBSACUc09CJtCCX4fdvqm/EU8DnLD75VaMN4adRxzPObMIe
         PFN2dMI9s/CCAjPncFv8ziDpLR5xr/RG+MLjLWinktrMEYX9z/M3kyeOyB/ywBapzCZF
         8Bk72OHQ+Yyji3hqPHvrZf8pF5YEaM0Runqus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Tu35wMUvVaUbJZZGmEqYD6hl6BjE9qoHA2F4LLuwpc=;
        b=pg+wY8Z71tOVtiXMZHegyxgEkqV9EyeRsXewmSGJF/rteZ1S3P7UImIfPRUispicGM
         Cq9x3vCXekImXgKB2QzHINlA84mBBEJQoZvhQxdEtPsTHNS9ptjFkETgNxc0wZ7eNkje
         4I+BOhj/Y/9NtGZPHXSnIBZqa47qvMj6XlJGMQAnVyF5io604Wltlktnf5K8hkc62I7a
         HuclnVF+FVBGzHgYz+xs+0yQYzZG2bTvdT5jw0ILWe/ed1KVKhurIdGOqgO6xoXW7EWa
         /M+5loxCinKBs6N8IWT8h1xdtLGkjgWb+9Cu3e2HLwzyDOeJX+Rp5cqNmvK88BLYE3p6
         CHjw==
X-Gm-Message-State: AOAM5338nW+w4Up79hKZNx3ch/szWMh0x2uOOk739LBmrr8TLDQQY+Hw
        hwMKNHi9mJjwcsR9YfetFBnI2dSwPzY=
X-Google-Smtp-Source: ABdhPJyTZMY7rgYFwNy7v85EYmatxlwc4cWNfl1fB7IebHbgh9ElYZZwcGqF42EB/T5AXyHbxb43eA==
X-Received: by 2002:ab0:61d3:: with SMTP id m19mr17679214uan.23.1591069075407;
        Mon, 01 Jun 2020 20:37:55 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id f11sm236234vsg.11.2020.06.01.20.37.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2020 20:37:54 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id q10so744166uaj.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2020 20:37:54 -0700 (PDT)
X-Received: by 2002:ab0:1684:: with SMTP id e4mr15730387uaf.22.1591069073999;
 Mon, 01 Jun 2020 20:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <1588314480-22409-1-git-send-email-mansur@codeaurora.org>
In-Reply-To: <1588314480-22409-1-git-send-email-mansur@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 1 Jun 2020 20:37:43 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vt8je1AtT8id-rPC3JToF_7uGKpC-uDuSpzCkwi3e4Sw@mail.gmail.com>
Message-ID: <CAD=FV=Vt8je1AtT8id-rPC3JToF_7uGKpC-uDuSpzCkwi3e4Sw@mail.gmail.com>
Subject: Re: [PATCH V2] venus: fix multiple encoder crash
To:     Mansur Alisha Shaik <mansur@codeaurora.org>
Cc:     stanimir.varbanov@linaro.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        vgarodia@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Apr 30, 2020 at 11:28 PM Mansur Alisha Shaik
<mansur@codeaurora.org> wrote:
>
> Currently we are considering the instances which are available
> in core->inst list for load calculation in min_loaded_core()
> function, but this is incorrect because by the time we call
> decide_core() for second instance, the third instance not
> filled yet codec_freq_data pointer.
>
> Solve this by considering the instances whose session has started.
>
> Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
> ---
> Changes in V2:
> - As per Alex and Jeffrey comments, elaborated problem
>   and addressed review comments.
>
>  drivers/media/platform/qcom/venus/pm_helpers.c | 4 ++++
>  1 file changed, 4 insertions(+)

This fixes the same crash I reported here:

https://lore.kernel.org/r/20200601150314.RFC.1.I1e40623bbe8fa43ff1415fc273cba66503b9b048@changeid

Thus:

Fixes: eff82f79c562 ("media: venus: introduce core selection")
Tested-by: Douglas Anderson <dianders@chromium.org>

I still have the same reservations I expressed in the patch I posed
about whether this is truly safe from a locking point of view, but
certainly it puts us in a better state than we are today.

-Doug
