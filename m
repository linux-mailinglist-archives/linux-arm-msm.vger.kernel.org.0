Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 541A92CE3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2019 20:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727855AbfE1SJU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 14:09:20 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42971 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbfE1SJU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 14:09:20 -0400
Received: by mail-pf1-f193.google.com with SMTP id r22so9084121pfh.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2019 11:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tlMPpoqpJ1M5vsv9PSz/nXeMxwOqULqzOJEOm1XHFU8=;
        b=KsvePykmq7eU2PD9yMZlwKmWg1b/BUNZld1ykTSRb2GXvxlNxXGqQ6biUwbPHT76Zy
         Oz+iSu31crNOCdNPONje0fGxIK+jbmIvRfowTZPQSZcPuNKanZeEdo4p8I8AnIkbRQah
         nYo7cL4fq8rCOHdJBrmOpK/aeldiKd4lf0r6rl5bVgGeX6guaf8xA6xxlqX85uD4gFpr
         wywm+VIJ1shhO7u3Uf9zJfUQLy3sEDSgvclIeYoXXUK8NFndmihpJ3bOg0KZW3PMSRnF
         5OV6GtgeEluNNowKLjRyRlLbKqm/iMX36NLYZYSUJaRxB6TOOLmtpaYAMzdAWCpuWCLn
         o1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tlMPpoqpJ1M5vsv9PSz/nXeMxwOqULqzOJEOm1XHFU8=;
        b=sNmTFvEHQgKt42zZvS1ottZRkBdQ2hG9//Pkh7RnaN6bAmU5o7qtzCOPqYz+XcKgJF
         qLpYQn1KHYMITU0q92kh6N9bW1YskHO4l39OhRg5eXvDmtKa3Cd41E1jfG4tXS1qqzX2
         DEK7q+6p0FVKip3j8znSmeV1qnmcvZMoBRYcW1HvjdUOUYR7Gmc3nBFHHymAzFrxd+Gi
         kzHivpUbk7sQ4ueKYacRN42FEZEUaflR1YvNoQjc7SYUCUrGhnqk23X9j6fiQZhyLmLD
         DeRJ8VcNTD1BfvXDjON7j+p2DAaJB9IDr8hK7FC5DCn4Y7eyDUf7FaI1LpElBeDa+5IS
         LuvQ==
X-Gm-Message-State: APjAAAXfPIYG5tr0FKPuoohqw21TJyWNP7GuCNF5FlXUwcnnF1w2xZWN
        UlaU9ZAuEpxMlhuGIl5//zg4bQaAua+K8EuVlCo=
X-Google-Smtp-Source: APXvYqwdutcV12zcgLS5zsMACLjYTRBi+8kxcxY5OpvGRrdTWDzNtWQ91FpcSdEqKfvxlIWFK7RNzMIQJAerhAkBUdk=
X-Received: by 2002:a17:90a:248:: with SMTP id t8mr7435833pje.119.1559066959742;
 Tue, 28 May 2019 11:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <5ce71d79.1c69fb81.dd0de.33cf@mx.google.com> <7hv9y01z85.fsf@baylibre.com>
 <20190524012913.D9BB72168B@mail.kernel.org> <CAP245DXkEym=x3vrN2cc2y+uHHx_+z0cW0WsV0dGGXfd+c2mSQ@mail.gmail.com>
In-Reply-To: <CAP245DXkEym=x3vrN2cc2y+uHHx_+z0cW0WsV0dGGXfd+c2mSQ@mail.gmail.com>
From:   Andy Gross <andygro@gmail.com>
Date:   Tue, 28 May 2019 13:09:08 -0500
Message-ID: <CAJ=6tTqdvgsoVH+3=_6ucAyuhgSjjVSROBKwtxjYwO1vmFvxfg@mail.gmail.com>
Subject: Re: next/pending-fixes boot: 227 boots: 6 failed, 198 passed with 20
 offline, 1 untried/unknown, 2 conflicts (v5.2-rc1-375-g3695b18d1e9cd)
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "kernelci.org bot" <bot@kernelci.org>,
        Kevin Hilman <khilman@baylibre.com>,
        kernel-build-reports@lists.linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 26, 2019 at 4:51 PM Amit Kucheria <amit.kucheria@linaro.org> wrote:

<snip>

> Sorry for breaking the boot on 8064. That was one of the platforms
> that I didn't convert over to regmap (needs more refactoring). I had
> hoped kernelci would catch any issues but looks like thermal-soc tree
> entered linux-next quite late and didn't catch this.
>
> Does reverting 3e6a8fb33084 ("drivers: thermal: tsens: Add new
> operation to check if a sensor is enabled") fix the issue? If so,
> reverting that commit might be the best course of action since I've
> started vacations and can't fix this for 8064 in a meaningful amount
> of time (until 3rd week of June). cc'ing Bjorn in case this needs more
> investigation, but I think that patch is fairly self contained and
> reverting it shouldn't have any knock-on effects.

I am ok with this.  I'll check with Bjorn before adding this to a
fixes for -rc2.

Andy
