Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A32C1395AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 17:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728800AbgAMQVi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 11:21:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:33054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbgAMQVh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 11:21:37 -0500
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1A13B207FD;
        Mon, 13 Jan 2020 16:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578932497;
        bh=uyuX80zSyZU0zdvqiIzVXq0YSlCSPT17EFubZK/qreU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lgYohJZn7Il6C43tp/6EeaPdCSmjU/5LlT1IA5NZAfd4nxYbth1KhquOZ0SRdvT2D
         YDob0FIyHlQsGWuDwScuc3L36wNmpNagvrbcnQQWrLDvYhZtUKnf/+h6jXSmt4+HzW
         JWPzy62MM5dlv0/UTUq6yjv2GgA6ash1qo4YYTfQ=
Received: by mail-qt1-f178.google.com with SMTP id w47so9574289qtk.4;
        Mon, 13 Jan 2020 08:21:37 -0800 (PST)
X-Gm-Message-State: APjAAAW6kYEwH1BIkzMvwMiWXD5wTGxeYKxy0IQJQbsLhnNNGUa7lIhf
        B+LAlKTvemiO9pUyYxmNHzU8qHdWTpJZ4PTn/A==
X-Google-Smtp-Source: APXvYqy1aBli8QPGYN67tcxz0ioFkcG7Q8WDfjn/ep7R6JHh30SkhNkJk8G4wwwi/DRECco6JJw0FXj+/6AD7B1/xVo=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr14844595qtj.300.1578932496310;
 Mon, 13 Jan 2020 08:21:36 -0800 (PST)
MIME-Version: 1.0
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
 <1577421760-1174-2-git-send-email-tdas@codeaurora.org> <20200104213645.GA25711@bogus>
 <2d4a70f0-c882-a15b-cfa8-7fefef59f45b@codeaurora.org>
In-Reply-To: <2d4a70f0-c882-a15b-cfa8-7fefef59f45b@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 13 Jan 2020 10:21:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKiFipqb5KEs2RsyQKcoD78qOw2UvobEmj5=8-Q=qJF3Q@mail.gmail.com>
Message-ID: <CAL_JsqKiFipqb5KEs2RsyQKcoD78qOw2UvobEmj5=8-Q=qJF3Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 13, 2020 at 4:00 AM Taniya Das <tdas@codeaurora.org> wrote:
>
> Hi Rob,
>
> Thanks for your review.
>
> On 1/5/2020 3:06 AM, Rob Herring wrote:
>
> >> +description: |
> >> +  Qualcomm modem clock control module which supports the clocks.
> >> +
> >> +properties:
> >> +  compatible :
> >
> > drop space     ^
> >
>
> Will take care in the next patch.
>
> >> +    enum:
> >> +       - qcom,sc7180-mss
> >> +
> >> +  '#clock-cells':
> >> +    const: 1
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  additionalItems: false
> >
> > With the indentation here, you are defining a property. Should be no
> > indent.
> >
>
> I tried removing the indent too, but I keep getting this error.
>   Additional properties are not allowed ('additionalItems' was unexpected)
>
> Please let me know if I am missing something?

Sorry, I was reading that as 'additionalProperties' which is what you
want at the top level. Generally, 'additionalItems' is not needed.

Rob
