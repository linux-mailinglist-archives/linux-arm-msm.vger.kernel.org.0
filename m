Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87A858BF60
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 19:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfHMRJW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 13:09:22 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:44858 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfHMRJW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 13:09:22 -0400
Received: by mail-lf1-f67.google.com with SMTP id v16so5562524lfg.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2019 10:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GVzAnVzEMjxkSBqu8V9mlBdGqDjrrYQzVhEjxzd+3hI=;
        b=I4qWR+mzqRT7c1SEkHGhKmL6s1EYBMsgtyPriDKNziH+B4FMxlEGuvrJH5HcS4lcUd
         oEuShorJ4j1kTmfzSPRIGn/stYQAr97GOiXpjAyAAXj4cxkN8Dy0uFFDrdXb/ecYQt9m
         1yniZalDerzD5yTNTTGHitP5LFfOrIUdgwpGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GVzAnVzEMjxkSBqu8V9mlBdGqDjrrYQzVhEjxzd+3hI=;
        b=doHl6/EmobDqbNizL4jYqpc5v3UfmyRqxwUOEktW8Yxuu9NmeOB8a94UWXDj7KMi5Q
         f5Ynme8/2xT1YXP8opeF4BoDd7mFAssknGNsqScYx7YjzmRtOpltdJ+jA3Rx86R6EA4M
         F+qkVtSeIemVMFiLzrrPwL0pWjnB2qbI0k5NSojKoQgD6iuYk6+qVnGjwuz7UJjf1OTd
         YxN7y8XSpZC0CugL0n4QbxpanbtI45XIOBR8qPoLASGouAbzmV4bjuon2S3W0xZwBYM6
         YlBY1bhqWzsdzx97gchIsbzVPCyLz84bzW/kO5tG/Sx3fBHve7+3pxCLCZCKmXMxJUfi
         ovJA==
X-Gm-Message-State: APjAAAW0T2ESBxvjmso7+MN0h1pHly8Q+XdHOHR9cKkl1cBpQC7/t3Tv
        v5oMrlgrSS4Nz7VncBxyYvvptoKiMC4=
X-Google-Smtp-Source: APXvYqz9gHZSKAlX+0t7JzUqJD35BBuPJSxgD11OV7mQJQvQ2rIMKxTgRYP0I1t9Xd7jahz4G59cYg==
X-Received: by 2002:a19:8093:: with SMTP id b141mr23788667lfd.137.1565716159455;
        Tue, 13 Aug 2019 10:09:19 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com. [209.85.167.50])
        by smtp.gmail.com with ESMTPSA id f18sm1032838ljj.60.2019.08.13.10.09.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 10:09:17 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id c19so77299823lfm.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2019 10:09:17 -0700 (PDT)
X-Received: by 2002:a19:641a:: with SMTP id y26mr22803433lfb.29.1565716156648;
 Tue, 13 Aug 2019 10:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190813145341.28530-1-georgi.djakov@linaro.org> <20190813145341.28530-4-georgi.djakov@linaro.org>
In-Reply-To: <20190813145341.28530-4-georgi.djakov@linaro.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 13 Aug 2019 10:08:40 -0700
X-Gmail-Original-Message-ID: <CAE=gft6ZpM6x21X+SxCbNDdNS5B51yYAFA0XBbViqLmr99n5SQ@mail.gmail.com>
Message-ID: <CAE=gft6ZpM6x21X+SxCbNDdNS5B51yYAFA0XBbViqLmr99n5SQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] interconnect: qcom: Add tagging and wake/sleep
 support for sdm845
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-pm@vger.kernel.org, David Dai <daidavid1@codeaurora.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        amit.kucheria@linaro.org, Doug Anderson <dianders@chromium.org>,
        Sean Sweeney <seansw@qti.qualcomm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 13, 2019 at 7:53 AM Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> From: David Dai <daidavid1@codeaurora.org>
>
> Add support for wake and sleep commands by using a tag to indicate
> whether or not the aggregate and set requests fall into execution
> state specific bucket.
>
> Signed-off-by: David Dai <daidavid1@codeaurora.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
