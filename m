Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF1A918A33E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 20:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgCRTjE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 15:39:04 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43595 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgCRTjE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 15:39:04 -0400
Received: by mail-ot1-f66.google.com with SMTP id a6so26754521otb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2020 12:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PvgEm6RZLQDuYhakUPnlpNqU4gW7bJUO0kvb30X68xs=;
        b=NIBoQtgG4Rp7/eDa7kyVrci5awvuzgt02DOA62uK23hLyncJyGafbxPXDT/btjz2hk
         /HgGbDhv6TiwFpodAsQL+SJB0BCVJilcsGTHNgfUl3sYcTxvFBv9lObHQt02CXC+kMgJ
         v6mkLOQEgV19lv95hEyL13/YxhCAh1ldF9KqwMMPa/xOuc6HykA44yFhon+553t/U05f
         QtSSoLtTPOlcgPflOqnAm/PGAfTezfz1WIjygAEZCeWzW8xmVvoRBqXxFn+lpj+zunUe
         JT9v9nYoyRmlV0R+/t/lSirZhCUXWHt2X+rXKSXiaUepH7Nb02UzPxB2je+AQ+f3Tk5G
         gwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PvgEm6RZLQDuYhakUPnlpNqU4gW7bJUO0kvb30X68xs=;
        b=V5z8428O1vtSa6FWaDlpo7W5cz3fCcBXksKIFoA31EH2KLY97s1+ASR8Rlk9MUGt4w
         ridVCMFHe7J6LcCFgHv6VK4xBN+mDfOoA13IESgnmscQF/i1Xq2HXpSbzJzzm87K9kVN
         THZ3HWhE1H1LsQQnteDyG/qA/8aT3vKQWhphCImeGrSvlAxEhea5ip53ZpSh57WlVkcQ
         3eqAnuPZsqA5Uxe7OcVE+GcrMnyGG3ksLcgMXsCcuiuNTsKhXYolC1Qb71fcjr9r/LDo
         jMWSxBxqQyEmlYe6fNyvTGoxx2KS4d4qujvnuz+eJQGUuNBfOhfYz7CROg0JjS/CKiWy
         lweQ==
X-Gm-Message-State: ANhLgQ2pV5LrHKSIR5bqjgEeQpvLEIFW2E0VD3kxY1jIBE5a/BfY4ZKJ
        MYjsru2zZ0uejyZLR+bNKeenX2avlO/SeXml0uCzlA==
X-Google-Smtp-Source: ADFU+vu7pnwDal4gB09QFzfcR0/c2VxkCI04LsBk1AnrjZwLDwbyexqnHkz+YUKY4KMYKomA+dTyw9aoUggC+EmjWQU=
X-Received: by 2002:a9d:1920:: with SMTP id j32mr5032956ota.221.1584560344171;
 Wed, 18 Mar 2020 12:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200305054244.128950-1-john.stultz@linaro.org> <9ff7b615-8b8f-d3ba-e6f3-e3cee6ff58b2@codeaurora.org>
In-Reply-To: <9ff7b615-8b8f-d3ba-e6f3-e3cee6ff58b2@codeaurora.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 18 Mar 2020 12:38:53 -0700
Message-ID: <CALAqxLWdorO76ktNro8b11rQz3xsZpGpgcbYDxAhGK7NmBGJMA@mail.gmail.com>
Subject: Re: [RFC][PATCH] soc: qcom: rpmpd: Allow RPMPD driver to be loaded as
 a module
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 4, 2020 at 10:37 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
>
> On 3/5/2020 11:12 AM, John Stultz wrote:
> > Allow the rpmpd driver to be loaded as a module.
>
> The last time I tried this [1], I hit a limitation with pm_genpd_remove not cleaning up things right,
> is that solved now?
>
> [1] https://lkml.org/lkml/2019/1/17/1043
>

As I mentioned to Bjorn, I'll dig into this a bit to see if its
doable, but having it being a permanent/unloadable module is still an
improvement from it being stuck as a built in only.

thanks
-john
