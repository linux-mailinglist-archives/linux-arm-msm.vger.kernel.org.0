Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E0A132FD7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 20:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgAGTvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 14:51:24 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50248 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728364AbgAGTvY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 14:51:24 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so79103wmb.0;
        Tue, 07 Jan 2020 11:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N+e1mVy5VPUC1b+U+QeGIXntkp+YQnzcx3wiamDhMYI=;
        b=QzQ1Ia8BIn5mC4RILSDjoqVdXSHmjccrKCoJNvWM2zSQmTcZAwsYzZEKn0Fs4q+/Ew
         vTs8+3whhN/s2kdibQlxCDmmUEZOL1pmmi4QgbslQ3omMsrrqd9qsfp2nRXG6kOjJ3Ma
         R836nHwK4x2xEEFWttu6vNR3jvUfaIsECs4jR2FZdqVvR2AFtNCQr1osvYBcJ2WknA80
         t/nd4rW9YpkuWfU3RUTWPcqA7fRpoYMzjFOYysEWJ3yK/1Eq2q0FgJ1BlFiczNQ7dfKO
         bWwF1NZB+1mam0xjkDDL5dRcqrM6zByTrxaySGbP4iPFW7SRoNALnEX7Ntmv/R3calS4
         14CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N+e1mVy5VPUC1b+U+QeGIXntkp+YQnzcx3wiamDhMYI=;
        b=GW6jE3YFR+JPYQujXl+l/1TrDARdt+4uuFRZT11iljbjeeJpV0DiUEQeSKHjg9yqI7
         2jtdqBm6dnSB2TOj1rlmFIzyTtnD7YOfsKDP0/9LyKGlZTlza4PmUY7HsaJedxAZrose
         uDI/xKpwl36pJ1maB8WEwGJbJz5aDbeVSyBT8NaNEmyR8pQScRdFV03o/2mTpQbXxX0Y
         jm4x7OOJDeyryV63zGJtj6Os7n4mnzP86r0xLec9hjpK8yWZFh4R6NCWBAWxcQT1HmLj
         pODVk6NCkKiK1uO+j+vVy00YMZmUJWMdHgNgzh0UH0lsY0wGgkOewm1lEr4/IOoUSgSj
         tspA==
X-Gm-Message-State: APjAAAV5z9zxu887VDxQbweFXuAxfev4kwTMWMTY0aQTahbvOKAG5xQv
        WhbpnCt+dfZ1rpQHvZu5BoXIyb5ur9g5NnpWZzo=
X-Google-Smtp-Source: APXvYqxw2oF+3vnxN6qUMzMwgtepbEmBB6gHsuaGdrKPHQ6z09MDLjhaFV4qD1LA2QQhEM2/cytMn5uqV5+eaYnwndI=
X-Received: by 2002:a1c:1b15:: with SMTP id b21mr48232wmb.17.1578426682449;
 Tue, 07 Jan 2020 11:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20191106083843.1718437-1-vkoul@kernel.org>
In-Reply-To: <20191106083843.1718437-1-vkoul@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 7 Jan 2020 11:51:11 -0800
Message-ID: <CANcMJZDqX6-+naGEbBiyM+1cZS6jfMoP9bm5Uk4ZuP_mw5aNWw@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] usb: xhci: Add support for Renesas USB controllers
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        linux-usb@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Todd Kjos <tkjos@google.com>,
        Alistair Delva <adelva@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 6, 2019 at 12:40 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> This series add support for Renesas USB controllers uPD720201 and uPD720202.
> These require firmware to be loaded and in case devices have ROM those can
> also be programmed if empty. If ROM is programmed, it runs from ROM as well.
>
> This includes two patches from Christian which supported these controllers
> w/o ROM and later my patches for ROM support and multiple firmware versions.
>

Hey Vinod!
   In pushing this series to one of the Android trees for the db845c,
there was some concern raised that this series is adding a lot of
renesas specific logic to the more generic xhci-pci driver. There was
some question if instead that logic should be added to its own
file/module? Do you have any thoughts on this?

Also, It seems there hasn't been much feedback on this for a few
months now. Is there a newer version of the patchset I should sync
with? Do you have plans to resubmit soon?

thanks
-john
