Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9E2A1CB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 16:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbfH2O25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 10:28:57 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:38613 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbfH2O25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 10:28:57 -0400
Received: by mail-vs1-f66.google.com with SMTP id 62so2536373vsl.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 07:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mIpyQ3wOb9bWqvkX0Kpr4MtQFBTIPyZmoRnHAHX/iC4=;
        b=lHE8RghiwfW1Za7MXZfEj+tcRA5+wrEWmVF5Keow8qTDcQOlGf4062XfDSUn6uEXDh
         lZNKY9YudWj2VwmIGrrk0z96f7MCwqTmToJ0qUx7s9qo5fMEKYT63v3iilBq/ykKVI0k
         4uQGf2L0Qu4GxqfenZnbk3+E1Hyft/0qcstmSQbMSOP0hSUEeCdV4ho5986Zq2vC8vFd
         /3xTmD1TXSCXRTRhGGM9PJzXP4mIJTDL8Uz9uL0aFnR4Pv2X7S+q6R+YjGzN16IA04xd
         G/zNaTE1nZDJiQiJwhAZUOdxXwX36xfy+KGbSTMV406iQO+PaEU3HTP2Bd2sUPzNjmH9
         9DGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIpyQ3wOb9bWqvkX0Kpr4MtQFBTIPyZmoRnHAHX/iC4=;
        b=YpIgmaIyTDD/pTj9RYZcp1ysII/xFq0Mx2i6KJXKZ12A/SCGAPrZhGdtqpTqCaGhrf
         1GfpF6gAv1U9PQ2xCQHWH1qEu9AEDYf55XT3qlFq5lVUifc+y36E6nqEkBquiFhwfAne
         PjVLWcGUEQBukWRnJUXljS+HXCgQ+EEf2383Cjoj7s7OdTQcjpX8ErePkLN6MCS63jE6
         F7JGosx+JnA5/iCY6VjKfZHS8kjB63KwoaNx0xY2KRzPVZk3c8cri1cIsci5JyUmAHzT
         c8FQzYHkYEUdESNLUPx40CH4Kfbi7GLw2NjEV/WGookFBp3NGoLLtL+5USzExlSWEa14
         eSTQ==
X-Gm-Message-State: APjAAAUHYb0cj1MJ4TSev8vzZETDvW+Z5PIX7ZMd2KBVIEc2z0lWzAmR
        VAFF6pEAGmBzynz01791Fmhbr+dY1NmMGkZ1j9yG4A==
X-Google-Smtp-Source: APXvYqzYJ6oqRwamIEDLJ3VtjU+XaOg77kkXW1O2XB+w4FxGCSBbCRCZltm1LjnvJjPK+WsK0l7De0RJSAqYnMnKyvI=
X-Received: by 2002:a67:b009:: with SMTP id z9mr5725405vse.27.1567088936391;
 Thu, 29 Aug 2019 07:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566907161.git.amit.kucheria@linaro.org>
 <93fa782bde9c66845993ff883532b3f1f02d99e4.1566907161.git.amit.kucheria@linaro.org>
 <20190829140459.szauzhennltrwvg4@holly.lan>
In-Reply-To: <20190829140459.szauzhennltrwvg4@holly.lan>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Thu, 29 Aug 2019 19:58:45 +0530
Message-ID: <CAHLCerNuycWTLmCvdffM0=GdG7UZ7zNoj0Jb0CeLTULzVmfSJw@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] drivers: thermal: tsens: Add __func__ identifier
 to debug statements
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 29, 2019 at 7:35 PM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> On Tue, Aug 27, 2019 at 05:43:59PM +0530, Amit Kucheria wrote:
> > Printing the function name when enabling debugging makes logs easier to
> > read.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>
> This should need to be manually added at each call site; it is already
> built into the logging system (the f flag for dynamic debug)?

I assume you meant "shouldn't".

I haven't yet integrated dynamic debug into my daily workflow.

Last time I looked at it, it was a bit bothersome to use because I
needed to lookup exact line numbers to trigger useful information. And
those line numbers constantly keep changing as I work on the driver,
so it was a bit painful to script. Not to mention the syntax to frob
the correct files in debugfs to enable this functionality.

As opposed to this, adding the following to the makefile is so easy. :-)

CFLAGS_tsens-common.o          := -DDEBUG

Perhaps I am using it all wrong? How would I go about using dynamic
debug instead of this patch?

Regards,
Amit
