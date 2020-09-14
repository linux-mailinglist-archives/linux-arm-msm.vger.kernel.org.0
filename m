Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460A6269639
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 22:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgINUSj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 16:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726169AbgINUSL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 16:18:11 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72BCC061788
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 13:18:08 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id q13so282700vkd.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 13:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uRAd4TkY3E5awHOzVDefEmGhmwZQ3nO0bhizEoI0HSk=;
        b=GAIXLWY1Gkag3cBGyczpELHlw5MF0yNt5vDmgLJoF87oRETi1yDXkgPQkHDRGWqsx4
         QrQ/dSZ7d4/bQlCV3/8x3foAPwYavqzDw59vRHLTL6mi54R0MfZDMKNuNak3XWqP9ME/
         3tfFnCHsI5R9ObHlpAsLlAG+CaSJ4SJ8R4wqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uRAd4TkY3E5awHOzVDefEmGhmwZQ3nO0bhizEoI0HSk=;
        b=eS+8xoJ5NML/woVeP+GicD07naOIoUAcWEr5J7p6q/Xe+zaF8eh9hS9n/3AbXfQrsE
         MaSvaf57138+CxfGvH1wJXU6HxH/rmhYaiE5hsdMg7m1nQTcXoQ/M5cvTyPlyGrDu75Y
         q7JduYyF9WbmjM6POfAZDDkCb2H+rwJyGpj0oLCXxGRNRtPN5hZdZ/z1ctp/MmobtBNT
         a71qg7DVqixLmKQQTb2QO9XufpZ2YuiDyC5viW+u1maiYvQxmoPgmFktuyrifkkK7MDu
         5A2CLW7csWOVGmHDjBa+8Q2m1pUxwSgT8GM1XlQpva9f9VCuFUQk0ElqKnUyfdSP9lXo
         st/g==
X-Gm-Message-State: AOAM533F0aS+dtF25asU9DZve4WbbilA2s3gcu2n16eZTt6XrpyaDzRc
        4flp9Xk+oGCGvJ6fZXI9wOX7hOuC1fndyQ==
X-Google-Smtp-Source: ABdhPJwVgmHZ/KG3aWLT36Ve6L5DQBQ6u0az0D7JoT5khOtbMqPoDDxcHJjA1JiRZ1Bz91u58S7fgQ==
X-Received: by 2002:a1f:31cc:: with SMTP id x195mr8202414vkx.3.1600114687911;
        Mon, 14 Sep 2020 13:18:07 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id u1sm1728699vsc.29.2020.09.14.13.18.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 13:18:07 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id d2so260373vkd.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2020 13:18:06 -0700 (PDT)
X-Received: by 2002:a1f:bf53:: with SMTP id p80mr8344769vkf.5.1600114686429;
 Mon, 14 Sep 2020 13:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200813080345.1.I85bb28f9ea3fa3bf797ecaf0a5218ced4cfaa6e2@changeid>
In-Reply-To: <20200813080345.1.I85bb28f9ea3fa3bf797ecaf0a5218ced4cfaa6e2@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 14 Sep 2020 13:17:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQP4bFSEuYMUyDqj4BAB6Kk52FdZQ9r+67jBnJn5uX6A@mail.gmail.com>
Message-ID: <CAD=FV=UQP4bFSEuYMUyDqj4BAB6Kk52FdZQ9r+67jBnJn5uX6A@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: add SC7180 entry to soc_id array
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Thu, Aug 13, 2020 at 8:04 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Add an entry for SC7180 SoC.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)

Any status update on this patch?  It's tiny but it'd be nice to get
landed!  :-)  Thanks!

-Doug
