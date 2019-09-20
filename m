Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA941B97C4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 21:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbfITT2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 15:28:07 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34878 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbfITT2H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 15:28:07 -0400
Received: by mail-qt1-f196.google.com with SMTP id m15so9993036qtq.2;
        Fri, 20 Sep 2019 12:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XHTMSzwJkliwgOP7eZyXNvC4MBsPW4A1aJFqBEd8zAQ=;
        b=N52OJsy0o51lGf/l/GmuR7130d5E5iLIcEiaAjDKQzydlhLNAeXfLqwDSAD9G7J3AT
         htygPBdd8egAi+hE3UqCjlxhL3VTOEWlFFq4vSxQu4T2TufCJCQGgVIBLCA0/PR/RvRv
         9q5pWSsxyScMnCCk7375lTw87wLLKzbKddn5brZv4QxF76wA7eafynmAUIKSm+SFij6z
         t9eaHYKj78dGvKM1K69gMotqpxLdjI3ZIo5m/Ik51x1lloIvhM5s7myVttZqGmGSjIRf
         EBj1LsBugPnI5vQlCHTpDm9rfOxCqVnYkV1gD+9WwTcWD9N1Fxff9hND2/HAOcL2KbFv
         7gcQ==
X-Gm-Message-State: APjAAAXoFMwy8AL0wQlJd0Gir2l3Vx7scVsHacFF7KvtFc7rFloLbVhu
        gNc7ioFAALA43tQFZ8c2FoNkreI/QauciVqyKM0=
X-Google-Smtp-Source: APXvYqwWOpxfEuTbjipdTHmB6EfT06OsCibdbejJw96yuSuerdplxAt2quCcZKxMg+fYIYqo4rdAsPypOYpd/xZ9iOA=
X-Received: by 2002:ac8:342a:: with SMTP id u39mr5115350qtb.7.1569007686519;
 Fri, 20 Sep 2019 12:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190920145543.1732316-1-arnd@arndb.de> <20190920164545.68FFB20717@mail.kernel.org>
In-Reply-To: <20190920164545.68FFB20717@mail.kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 20 Sep 2019 21:27:50 +0200
Message-ID: <CAK8P3a2j6QG19i3YtRPh7qD4Zr5TiHmK_5=s9mSD2pHVmE99HA@mail.gmail.com>
Subject: Re: [PATCH] mbox: qcom: avoid unused-variable warning
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 20, 2019 at 6:45 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > @@ -54,11 +60,6 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
> >         void __iomem *base;
> >         unsigned long i;
> >         int ret;
> > -       const struct of_device_id apcs_clk_match_table[] = {
>
> Does marking it static here work too? It would be nice to limit the
> scope of this variable to this function instead of making it a global.
> Also, it might be slightly smaller code size if that works.

No, I just tried and the warning returned.

      Arnd
