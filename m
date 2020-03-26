Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 704A5194C19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 00:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727347AbgCZXTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 19:19:24 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43023 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgCZXTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 19:19:24 -0400
Received: by mail-oi1-f194.google.com with SMTP id p125so7160683oif.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2020 16:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DyEvk8/M51KdB0k3RzKZQ+MYI/+9ypxdlmp1SmMW2Ys=;
        b=k0a14mZgV+qsmJefk5FW0WRpIXFp3Y2EY5YAXRsG57WFGA+UdtZN7wHpop1fJtXTMI
         6/tMIZ/jAGytCf64CNKgJUw78FNtPwoQqbB7Tuq08ARRQkVN6ZboVhRQWbLF19iwUVWh
         zobNxHzENu4otHX5v99SiEu0jD11Qm7SIKIzbIE83xBD9fvW7cnZ2T+JJwkY7LLzoaoe
         Gd7fpjSgUlpLzzZotvx8jLvoPPu2HNpcEQhd4dUDCYAD7hasysOUJDBDus1bZWfK6XnY
         k9fAuO5LJM5zHkC7z4TqspyMbuhlFhKeauoWfHRh/SLU+Rro9R3Bx60u38w2UeH3OzLi
         fFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DyEvk8/M51KdB0k3RzKZQ+MYI/+9ypxdlmp1SmMW2Ys=;
        b=s/daMrA4L49hXVjWWeN2ATAQoEZ9Y3anSSUBI757JdBp2RRs/nRGOHia1M23kFeQ7F
         jt86YjFc5zIPbpM5UN0Q4oGu25i5H1S8HirgioupbD/cMHmHrMMRpgPyTs7Wyt9ldJmd
         XvHZOuJrcN7IDrwa4lOTb5jD6pHRx09o81kdT6iVtoYuUxxW1iDmFHmtSiaYBzWdb5wU
         tqEi95lFJdMxjgvAFegmECWLxBkcn7NIsh2Iy4G98oRKmnICp4lWuWfZW/6b7iabqc4a
         9Cc9enz9J2X3CLg5OoeB5F8RFS16Zn2YekCscBo8zEYk244Ir0SzGCa1PpXpX1n79htb
         Lfxw==
X-Gm-Message-State: ANhLgQ1KIHerJokjv7zDCIahXayAqylsyvwED3l/h/lf/e7KzJstkx0N
        OdOygMxjbzyuZhmcUObe1hsloPslyZDmsLYvlNXoaA==
X-Google-Smtp-Source: ADFU+vsY8jjGNXiVRkPBLoE+CsoFXHwivXDHyvQUE2PxawFxjxYVp25D+Qgv+5hGqwQU/PsArkHMMzI8xKPxOHDQXVg=
X-Received: by 2002:aca:682:: with SMTP id 124mr2145796oig.69.1585264763192;
 Thu, 26 Mar 2020 16:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200326224459.105170-1-john.stultz@linaro.org>
In-Reply-To: <20200326224459.105170-1-john.stultz@linaro.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 26 Mar 2020 16:18:47 -0700
Message-ID: <CAGETcx-YynYi803j+O+vBmKNd=xVMX+OSwytOGYu9pURDzg8Zw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Allow for rpmpd/rpmh/rpmhpd drivers to be loaded
 as permenent modules
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 26, 2020 at 3:45 PM John Stultz <john.stultz@linaro.org> wrote:
>
> This series simply allows the qcom rpmpd, rpmh and rpmhpd
> drivers to be configured and loaded as permement modules.
>
> This means the modules can be loaded, but not unloaded.
>
> While maybe not ideal, this is an improvement over requiring the
> drivers to be built in.
>
> Feedback on this series would be welcome!
>
> thanks
> -john
>
> New in v3:
> * Added similar change to rpmh and rpmhpd drivers.
>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
>
> John Stultz (3):
>   soc: qcom: rpmpd: Allow RPMPD driver to be loaded as a module
>   soc: qcom: rpmh: Allow RPMH driver to be loaded as a module
>   soc: qcom: rpmhpd: Allow RPMHPD driver to be loaded as a module
>
>  drivers/soc/qcom/Kconfig    | 8 ++++----
>  drivers/soc/qcom/rpmh-rsc.c | 6 ++++++
>  drivers/soc/qcom/rpmhpd.c   | 5 +++++
>  drivers/soc/qcom/rpmpd.c    | 6 ++++++
>  4 files changed, 21 insertions(+), 4 deletions(-)

The whole series looks ok to me.
Acked-by: Saravana Kannan <saravanak@google.com>
for the whole series.

-Saravana
