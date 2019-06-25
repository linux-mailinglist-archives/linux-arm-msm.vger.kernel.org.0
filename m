Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9025254EA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 14:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbfFYMTA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 08:19:00 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38809 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727792AbfFYMTA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 08:19:00 -0400
Received: by mail-lj1-f195.google.com with SMTP id r9so16017936ljg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 05:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jALhUuHnRMGGpmpdlDb0HIhW7kZ/qK9Mq/evTmTkD00=;
        b=I48yWJwGiioj2FgBHsgEqo+h9ie0rIphzW/pO7El8g0Ve0FckbkZNMUB367r5J1WCU
         /cp9KZzBY2nwMFG8rx5wAWI3vxwowVuqV3/DhgJsA/mAau+OXwxd52Z31Uo/CcD719oD
         ddSYF/1nj92zTIcEfhIDG6VdaKTFVkOLK70ziTnrdpYIUhIJ1xtv1Tign5rn2dAyJN/V
         n/uaJ9MMqHk0Zffw7LvtEWm60FzmpXVsPeqxEqH1IatZUK0UyjDSnMUbm7iXIQQcxioF
         Fp+ZtWzAYNpPGOy04scBl/bQPaBfMkr6h0ztFmvx3nacYkph9QHVVk5TbIhDP2ncAWDY
         Joaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jALhUuHnRMGGpmpdlDb0HIhW7kZ/qK9Mq/evTmTkD00=;
        b=J/4nzfwJvMvT64/6F2us0bwp83bggBbfPwh7ui4uLa3deY68ngFB5HEluPbRAWeypK
         8EN9dbK2ogrS5g6bqg8nsmSovp8ulxynnK9IEuH4eAu4sUZiOTD7v6SiFImKe2DBXJ5G
         1rvnnoilBUpv3CGcuyVP6OYRv8kXbzH/UKE1JheAfNj245E1joOw8qhXjlhFveUxUzdW
         7j5SNAEOBGxMyDXD0AojP+U5/NdBnopeD2fLWHlWQn+THbhZhmGoBITJZ17kmx8hQxPx
         eLB7OIjhNPuG17bWE0elu4ksDwOCc4U7G29mB0mWquPyQabxPUb+OOqM9OqNrQc17iFf
         FDlQ==
X-Gm-Message-State: APjAAAWxsl9SEDgMGdB9LzZri19ORfjyObDY0/Bgf5JqlEvUDk4gULOo
        rW7AT3gEV9//OHa8FlWseO387UUiLqJJgYt98emBZg==
X-Google-Smtp-Source: APXvYqwJlShOUGzSJYy1EdHq8lnqlJ7DfvQSdzbDHyFXLiG7jgfjQp4H2cmef6cUs212VQhxBDPSZv9UmUqJAyI51+o=
X-Received: by 2002:a2e:81d8:: with SMTP id s24mr33236100ljg.37.1561465138557;
 Tue, 25 Jun 2019 05:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <1560764090-22740-1-git-send-email-neeraju@codeaurora.org>
 <CACRpkdZ4BoZzX7pVw4HYBzSMvhnyu_oVNoiiLk3ME05nnG1T3Q@mail.gmail.com> <c9eb6bfc-a8d1-75df-159b-3f2304fdb8ea@codeaurora.org>
In-Reply-To: <c9eb6bfc-a8d1-75df-159b-3f2304fdb8ea@codeaurora.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 14:18:46 +0200
Message-ID: <CACRpkdYMW8TiK3jBfgVhmST_S8CHuyY2rTD=ZZ37eckdrJ2uTw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: Add irq_enable callback for msm gpio
To:     Neeraj Upadhyay <neeraju@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Timur Tabi <timur@codeaurora.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Srinivas Ramana <sramana@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 25, 2019 at 12:29 PM Neeraj Upadhyay <neeraju@codeaurora.org> wrote:
> On 6/25/19 2:28 PM, Linus Walleij wrote:

> > Please don't name functions __like __that.
> >
> >> -static void msm_gpio_irq_unmask(struct irq_data *d)
> >> +static void __msm_gpio_irq_unmask(struct irq_data *d, bool status_clear)
> > Instead of __unclear __underscore __semantic use something
> > really descriptive like
> >
> > static void msm_gpio_irq_clear_irq()
> >
> > That is what it does, right?
>
> Is below ok? as it clears (if status_clear set) and then unmasks irq
>
> static void msm_gpio_irq_clear_unmask()

Sure thing! Thanks.

Yours,
Linus Walleij
