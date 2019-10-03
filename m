Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7972C9F05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 15:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729537AbfJCNEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 09:04:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34103 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbfJCNEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 09:04:00 -0400
Received: by mail-lj1-f194.google.com with SMTP id j19so2682207lja.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Oct 2019 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XioN7puVbcYRckEVTHmiB34pXF9Ej7EG9KjZda45NBU=;
        b=H94StjHmQA5TRSAC4/Abc0WwiGKQyKwCI6pdiTuyEJXIa3nnrlCVWv1OfoqEiZeATy
         4rZPkzd75ThGs8M0AIqY9Wvu3A9FcnYfOU4mOUbVNGCKmx/1uzJ8jnSiX6zIp5Z36COi
         8WmP9tmekQx+0CkLz3OC5EmxRSpVr8YOW7KbPDumSoW075JjFSIcd5R/jxX6YspjsWw1
         9qYL7XV7RHxSa6PoCa322+GkEVjjXxGqk0lHLgwL71qsXwx0NgdwR5gtckiKyeW8nXxs
         jPCUYskSLjqw4MJQ2ILs6Hsk+8qXt/PsDnwV0QlLxvOOdnw9jgYr/rY9xIsVcaqtCCUt
         49Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XioN7puVbcYRckEVTHmiB34pXF9Ej7EG9KjZda45NBU=;
        b=oGGjHl21MQkggLiQ/2zGkW1Jac1WL9ctne/RtVxXnhv8jHT7alRvb/LxJOQrajNg8D
         KDfPIB11xS4G4hbNg+s6UctWXoGuHfzpf47Cac1MdQFi8/j7o6weBDjjGelkL+yTRZH9
         Fxsqn0YSv2QXfFe6PUKBmQKim/6gOKlRNaFvOMJkkX6V9MgAqKarJPcG1W3xZ0f0GXqs
         1iVmqPvyWYloOsjI5yfK93XyGTt+hzaEzMaDX7alXKFv9zJ5WG1qtxIlXJgUMtEG03PX
         6J1/RxeSfxd7y8iqK+efkuMseS4dUvOtsEy+dAm5zQfQMNS0V2YsGBAI7pkqOMX++wN5
         sPhA==
X-Gm-Message-State: APjAAAW9ei8fkfm9LN8I3NbZbExxgHiOaNIozae7RIZUp56yAsYYRzcf
        9tFst9zTp7oorz431bvWeu984YlOO0WGuRxZDkibUQ==
X-Google-Smtp-Source: APXvYqwLTqJ6PluifEhLN3LXeppRw6SC+TULeLNjobndGDebZcb+fp7ss3iiSIMMyr4V9i2taRe0ub66NlmSxoi3y7o=
X-Received: by 2002:a2e:6e04:: with SMTP id j4mr5309093ljc.99.1570107837087;
 Thu, 03 Oct 2019 06:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190914111010.24384-1-masneyb@onstation.org>
In-Reply-To: <20190914111010.24384-1-masneyb@onstation.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 15:03:45 +0200
Message-ID: <CACRpkdZeKbNRqC+2Qs2tvWjWYDFJdg22YQ8mxMNu18n9O8cyig@mail.gmail.com>
Subject: Re: [PATCH] qcom: ssbi-gpio: convert to hierarchical IRQ helpers in
 gpio core
To:     Brian Masney <masneyb@onstation.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Sep 14, 2019 at 1:10 PM Brian Masney <masneyb@onstation.org> wrote:

> Now that the GPIO core has support for hierarchical IRQ chips, convert
> Qualcomm's ssbi-gpio over to use these new helpers to reduce duplicated
> code across drivers.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>

Patch applied for v5.5. I didn't have time to test before the merge
window, sorry, not it's in!

Yours,
Linus Walleij
