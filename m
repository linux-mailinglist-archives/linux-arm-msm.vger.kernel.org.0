Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8C61581D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 18:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgBJRzg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 12:55:36 -0500
Received: from mail-ua1-f66.google.com ([209.85.222.66]:38809 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgBJRzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 12:55:36 -0500
Received: by mail-ua1-f66.google.com with SMTP id c7so2812856uaf.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 09:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=siKHOuO8wOb9sw6P22vlsxiKOGFhLZkeTDhUG0eBw1U=;
        b=TH0vCFNjQCF7itW9+Z6ZYFb493fIZyD8YVn4iSK9fy1/KDtpK9dmmj5bVy6JE2ilET
         kjwJPnFS/rOWJ7+jJzyyoiPCUJV+1GpGlAMyPz6u/zxhXBymGsTgm+bsdoWkcDBaToiZ
         7+3z8uxOlnEAnw8r3bdd1mP4fIBTimHEgdSH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=siKHOuO8wOb9sw6P22vlsxiKOGFhLZkeTDhUG0eBw1U=;
        b=r6J2BymAk5XOaYFCGqlAWYAIh2KxJmNGP7oFzvJGQrXuyjgoDo+Oz6iRmshRJVyNCQ
         Zy2/SaKL58unl3sffSzzGpxPL4yTaqKJ5FojDpVWwpQWgawfC9h064g23IBIPglIuK9L
         CEArtH6EV0HGsEZjCzYvfiKFBHNsPzLXxsD0z7HW9J7Qe/od3zGYQvh6EmFU20s5HsRx
         SoLhrhYlwclLMUw3CkNlQDBljI3jBRM/Bz8uOIIkVxMBoeGlkmsyD3o3JjW1ZA2qwgrj
         tM5yxXVggGPbH302+Ov7Bufi0/Jr7/LyLK5oLWzXyPAuptTYgzdAWYWhEP8EqOBlAJHg
         qNIQ==
X-Gm-Message-State: APjAAAWg5Cwn8rgJzDjtR2jitg49a7vZZj9xXAVBwt5qScTnZBOOI0Yr
        SEYMGXd1xF7qRhmpfC32WBjUaDychDc=
X-Google-Smtp-Source: APXvYqxZ6RI8lRpR4Mtij7RqbQPbj95MT5x2t8Iv3vS/NgAtijyX2ghkPRtj9WqhMCbsZ60nAs6TaQ==
X-Received: by 2002:a9f:300a:: with SMTP id h10mr1454336uab.91.1581357333814;
        Mon, 10 Feb 2020 09:55:33 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id l21sm281219vsi.1.2020.02.10.09.55.32
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2020 09:55:33 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id 73so2808616uac.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2020 09:55:32 -0800 (PST)
X-Received: by 2002:a9f:300a:: with SMTP id h10mr1454266uab.91.1581357332297;
 Mon, 10 Feb 2020 09:55:32 -0800 (PST)
MIME-Version: 1.0
References: <1581307266-26989-1-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1581307266-26989-1-git-send-email-tdas@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 10 Feb 2020 09:55:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X-URWfbe8vNqtjHZPo6Rokwkede8oSagJu1KiD18a8EQ@mail.gmail.com>
Message-ID: <CAD=FV=X-URWfbe8vNqtjHZPo6Rokwkede8oSagJu1KiD18a8EQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: qcom: Add support for GPU GX GDSCR
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Feb 9, 2020 at 8:01 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> In the cases where the GPU SW requires to use the GX GDSCR add
> support for the same.
>
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  include/dt-bindings/clock/qcom,gpucc-sc7180.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

I already added my tag to this exact same patch in:

https://lore.kernel.org/linux-arm-msm/CAD=FV=VeMaKq3KR=t7dbG+VyVs5DS=gHasSdJQSqNQreTUoZig@mail.gmail.com/

Please make sure to carry forward tags unless something major has
changed.  In any case, re-adding my tag:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
