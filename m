Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 750FD168175
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 16:24:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgBUPYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 10:24:30 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46154 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgBUPYa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 10:24:30 -0500
Received: by mail-lj1-f196.google.com with SMTP id x14so2539773ljd.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2020 07:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q8F1pecknXeZPAGHPwSdHXa2S1HIMEUTEL9qK4pfGkI=;
        b=rxD7B9dqoAiPCPgcPMy3dxnS+3dsZtb0ZYOiZpv7dDIPGvwW3EUh2Y3DvQo/1IuVPB
         B8aCXt3Mbu5JD28DX63Op2V8OkUo8EMGp1u2VcbnQ7vL7goA2vrBUZYCagZosE8dywvW
         Rq1sB1XaqIPDkeGnN0NYXhMQ2QHImd7ijNGmGMyHOQ9ms7ngm6Xn8Qs51/6xbb7mNWU8
         jfVmfeRZO6Mi9nYlrM/p3bSU7gqnhDN9fncaCFUwbXNMTD4sxPCOu62OzH6LrtZgz2oc
         m2DItFi4GJvVvf9V61Qc+jAKPUtgovjrhmeloggKXeeOvSgcj386SgdPSjWybppU2d59
         Z2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q8F1pecknXeZPAGHPwSdHXa2S1HIMEUTEL9qK4pfGkI=;
        b=Sj9mhyuHxzQRXQ2CHjF3/JjFYGDZyP7Zmv9NT5mUWJa5LwBWgZIjfkF45m90BEaGjq
         IZePt1D7zwLSuDix5sTGfllTih5b+H3E3xxpXleGW3bs/SiQEYcDNpOPYT9xpHjI6F0y
         b1C2zXhuowU+dH8K8m1+eLocLnaNq7i/5zbR2VLt0uVTtJE+Un66gJ9mzu3Gt0rU/wD8
         JDjr2ba4GO5lBuIxS8iQWLppI9Z9h7XxLHJe2M3Tav8uZEQz/FdPgQxFfLOqfAIrtbyb
         ugUTxo9cjgCf/KSHH4s/PEDyhHDenS0uzwXUypy31UnrkkAq3/8fPbPCODBdxPyrsvRh
         kjUQ==
X-Gm-Message-State: APjAAAUypnehi248Wkn50UmS4VNBablIQvWuGFMfNTQJeVQuSo5VJgLy
        /cLjO37U8+T27wTXzQ7JzJP1xBC4z5iWw+Qb+aHYDQ==
X-Google-Smtp-Source: APXvYqziIUztxmcLeCs99putNp5eHfPKwvYYqzEsStcEDA0FthIqEITMkvuS+XoCG6v5robD0BZiVwXwVCyqWa3dCL4=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr20900215ljo.99.1582298668773;
 Fri, 21 Feb 2020 07:24:28 -0800 (PST)
MIME-Version: 1.0
References: <20200219175940.744-1-ansuelsmth@gmail.com>
In-Reply-To: <20200219175940.744-1-ansuelsmth@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 16:24:17 +0100
Message-ID: <CACRpkdZfHRuPwM8uFnzAYwCe3WeURPwX06arrZi+70aOwbcdGQ@mail.gmail.com>
Subject: Re: [PATCH] ipq8064: pinctrl: Fixed missing RGMII pincontrol definitions
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ram Chandra Jangir <rjangir@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 19, 2020 at 7:00 PM Ansuel Smith <ansuelsmth@gmail.com> wrote:

> Add missing gpio definition for mdio and rgmii2.
>
> Signed-off-by: Ram Chandra Jangir <rjangir@codeaurora.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Patch applied with Bjorn's ACK!

Yours,
Linus Walleij
