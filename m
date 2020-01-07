Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17E82132F6A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 20:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbgAGT3U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 14:29:20 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37531 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728358AbgAGT3U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 14:29:20 -0500
Received: by mail-vs1-f66.google.com with SMTP id x18so270194vsq.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 11:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1moPzDSwxv5Wk4/bKFlXZM2UuyFmVUd4X8vnm+QNOSk=;
        b=OOUxX0oEy44entYgcmt+C+QUp4NoNSVCgfdC0u3KcFj3f6Bq0b5K0kC4KRqiPTnINQ
         w8C+KNLSWVaaRc6+XDEwphWKrsT7+Jts/XVk46uh4h4eXaXZOXH/utvcVHStuirfIewH
         hucoZWNvBRnljqP19C9jQwSY0P0l7/uin5bsbwKocdbME+nmQdsj5moc9ZXfdoY6Qqam
         +GYT/cY8KjOJO6p5SWHsISC0DvPg0HrKSkq3LSyw5sRY8x0IUcdgLdbmY/4Bfur2LGCd
         XuGjrAD1dCJYbdTEPtT+ySQLYBA+TYp2WdiqtxXj1i+faN+qk+nKdHfM6VDoJ+cugq6C
         Xu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1moPzDSwxv5Wk4/bKFlXZM2UuyFmVUd4X8vnm+QNOSk=;
        b=Iy0LRjWhOLuWVhwmLnj+FW+6SCtZFJQ1b9OXaHoz/zSJajNedNf/NdbvyUKS7mnVuQ
         98vKOh4HdH4X2ERCdVsNvxg21arBdcuYl0lFHDxHvDZNUFxKBJjkIUFsN7yIMWrr1awk
         nRiY17lmiLchTiOlxYEE9iqFKeei3VtDaVIfG2sZ1JEBeYcpxyIEWnQkf9p0YjRtZUWK
         gE+qpAV5QCVCFpghEuB1/TbulA26MZw5wBVJRXnWuNFp9gRdRdZxmmEbEWOvmPtT/zeL
         3UVdHIlksnIfjJbbNaKzRZUSRHca8XivmMjSYB6yKMqXfYUJyT0WISj6ob04ErvljGJG
         iV4g==
X-Gm-Message-State: APjAAAXWPJ2GE9FbTdPmJmKzXMY93HMpq1jz/+ufnoZ96zpmU3zQhqg6
        nsOtvcOSJpyzHssBJ2MX0b6+BVkZYsj4ygeCUfMKcQ==
X-Google-Smtp-Source: APXvYqzSihib4LKAdw/4NDt3HQLw3pZ4ua4+q6rmirrwDRxgfbefNjou9wguam6xGKiB+ax0Wwkwf/8arMg+sva6DcY=
X-Received: by 2002:a67:e9da:: with SMTP id q26mr601448vso.34.1578425358940;
 Tue, 07 Jan 2020 11:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20200102160820.3572-1-ulf.hansson@linaro.org> <20200106172608.63qhvwr5b7jsmxmg@localhost>
In-Reply-To: <20200106172608.63qhvwr5b7jsmxmg@localhost>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 7 Jan 2020 20:28:38 +0100
Message-ID: <CAPDyKFq-ueSK2xAOBtec_N95sBVf-Vcm_-xgAhxQUuwAjUzbPw@mail.gmail.com>
Subject: Re: [GIT PULL] cpuidle/psci updates for v5.6
To:     Olof Johansson <olof@lixom.net>
Cc:     arm-soc <arm@kernel.org>, soc@kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 6 Jan 2020 at 18:31, Olof Johansson <olof@lixom.net> wrote:
>
> Hi,
>
> On Thu, Jan 02, 2020 at 05:08:20PM +0100, Ulf Hansson wrote:
> > Hi SoC maintainers,
> >
> > Here's a PR with updates for v5.6 for cpuidle/psci for ARM/ARM64.
> >
> > The changes are somewhat sprinkled over a couple of different directories and
> > there is also dts update for MSM8916. The main changes are in drivers/cpuidle/,
> > which have been acked-by Rafael [1] and Sudeep.
> >
> > If you have any further questions, please just tell.
>
> What was the reason to bring in a dts change in this branch?

Convenience. But I am not usually sending these PR, so feel free to
tell me to change.

> Bindings should be
> stable such that old DT contents still works even if drivers are updated to
> support newer attributes, etc.

They already are. No worries!

If you want to pick everything else but the DTS patch, that's fine by me.

Do you want me to send a new PR?

Kind regards
Uffe
