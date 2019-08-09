Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDF3588479
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 23:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbfHIVR6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 17:17:58 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40225 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbfHIVR5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 17:17:57 -0400
Received: by mail-lf1-f66.google.com with SMTP id b17so70479984lff.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2019 14:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y4vLpkUXGaCx5ksGKXq1B6fru5dxWZeG1Id+VcyLndE=;
        b=G54KRPbppyCf6lOgHptflnWoJgyVEK93H+cXO/vp8LfwGrelRzgN5+IYoCLqXUrfYO
         X/Z645f3sLIDye0s3bOMNqrnMltaBkTAyYjneZ6d8DcT9/YcwkbfnK/Nth/KaLZbh+2/
         SYW0DZALxCSJQavegwiXuKNfFYGJX1d3/zt9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y4vLpkUXGaCx5ksGKXq1B6fru5dxWZeG1Id+VcyLndE=;
        b=TvGVap60H0QMLF96jBubmpGWULNZZqs2HV1JtOuNhhRB9vBw140ypdd5iHeEtrcjLn
         nujkvI+b0uafQGWw0MmSEOGoq2089i+GeOh5S/mprW+NdBKYhRIbExujGUZIbGWayYWG
         b3WFBV/yf5ch/9hFUZo7LPzJ4vGVudT2zCsRyb/wH3/M8HY9PejApeXwndinWAiBJyJg
         DBhhxcBuElSR0qgYGqfjx3lc12shoxQmyPRRdg7GHXfSr/BXXTVJJ0I46yYCjhf6u6lv
         YMBsODtoENqHBZnRT8MfJ75WfENJpaFaEsCUIIBZdmBjY02ey4JGR/rCDd0hWI4jKJkW
         pIQQ==
X-Gm-Message-State: APjAAAUzictZfERPny0xEmiYtpFGF2A2Vq1k5DfX8+M+eWoonF7axccI
        ISh9y2XqBN/xr0CcvoeA1yucexB+J/U=
X-Google-Smtp-Source: APXvYqxrOVk168BqzNNnSq4ywaQk0nSjyze9QKfV6AmGarRZV+FUGVvjThpIbVSIyHrYMM4yf2wY/g==
X-Received: by 2002:ac2:4a6e:: with SMTP id q14mr13194115lfp.80.1565385475991;
        Fri, 09 Aug 2019 14:17:55 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id d3sm17698487lfb.92.2019.08.09.14.17.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Aug 2019 14:17:55 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id y17so68742836ljk.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Aug 2019 14:17:55 -0700 (PDT)
X-Received: by 2002:a2e:93c8:: with SMTP id p8mr12301485ljh.6.1565385474677;
 Fri, 09 Aug 2019 14:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190809121325.8138-1-georgi.djakov@linaro.org> <20190809121325.8138-3-georgi.djakov@linaro.org>
In-Reply-To: <20190809121325.8138-3-georgi.djakov@linaro.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Fri, 9 Aug 2019 14:17:18 -0700
X-Gmail-Original-Message-ID: <CAE=gft5JD9QuH3cZpPX=4eJMjbyPi8nes1--6qcsKdb1sw_rNw@mail.gmail.com>
Message-ID: <CAE=gft5JD9QuH3cZpPX=4eJMjbyPi8nes1--6qcsKdb1sw_rNw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] interconnect: Add pre_aggregate() callback
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

On Fri, Aug 9, 2019 at 5:13 AM Georgi Djakov <georgi.djakov@linaro.org> wrote:
>
> Introduce an optional callback in interconnect provider drivers. It can be
> used for implementing actions, that need to be executed before the actual
> aggregation of the bandwidth requests has started.
>
> The benefit of this for now is that it will significantly simplify the code
> in provider drivers.
>
> Suggested-by: Evan Green <evgreen@chromium.org>
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
