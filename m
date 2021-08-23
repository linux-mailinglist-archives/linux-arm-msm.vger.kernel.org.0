Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9023F51F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 22:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbhHWUTB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 16:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232343AbhHWUTB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 16:19:01 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D72C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 13:18:18 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id o16-20020a9d2210000000b0051b1e56c98fso24835609ota.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Aug 2021 13:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=e+9/i7ql0JBP0axXyyLhXNf4AItySuPk82qcEXlXd5g=;
        b=fQrasVro5N3cZEnqPgBuX2YdB8zrxp3HHRfMlva8FJEkdLOEbBQirnmkqa04Oe+dnX
         IS8z5u8Wjdsu2ToHGuX11ef42nmkeC+KkgzGKhdb9HCwVkztQRVqJWXcW+L0OV1+6XsN
         FV/0Xckk73dNW8LW7WsYqjP2iP7Lw1YCKD++A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=e+9/i7ql0JBP0axXyyLhXNf4AItySuPk82qcEXlXd5g=;
        b=qSv0GUOygoow34TOPRdNgRR6+Oc3Nm4qdp17eFZzl+rBskzytmN0Cqjtb8dhTiFKWG
         2bTF4SKf1T2RWz4dwOqGEz1xCX8n+VaDsfwLZsra+khbC56nqYb7NZElxWiyYVmo9ycU
         Brv+hchddWONZ+Qzszus9lI6lnI4feL/VUOtI9hMWboVTJPjxOQ8cwsDwT/vFFezIHb5
         utSW4hqihkzl0pL/JlAPypgOpJqwbyrGF6uptehQKBCxrD3UhTzgSok4chuJ/4sZIDXP
         HDKAYR7JChjWME1ey7xMOm4rnh/eTI3JHa5Y2Z0gQplqAYFDIicls+ublPnNMlG80vAk
         vEbA==
X-Gm-Message-State: AOAM533cXX1VILjTz9v2sREg8KhfnhhnOzYqEnhYXyHbeaEBnZ8RLST6
        kh6GAMJcL44gmFkNb7eOyjCc6p29d7dxxBtQ0Q5lSQ==
X-Google-Smtp-Source: ABdhPJz9EiIOtyDS5NnRoJX3EMQljO9+XE46gP4QRLRbWTE3xA90fnZY61ZeGvuqz4V7mlfd/oCvObFvauiBVAqP6kM=
X-Received: by 2002:a05:6830:88:: with SMTP id a8mr29462620oto.233.1629749897488;
 Mon, 23 Aug 2021 13:18:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Aug 2021 15:18:17 -0500
MIME-Version: 1.0
In-Reply-To: <5848670f513187734d7625f242bbf67b@codeaurora.org>
References: <1629342136-3667-1-git-send-email-sibis@codeaurora.org>
 <1629342136-3667-3-git-send-email-sibis@codeaurora.org> <CAE-0n531EgLx-gGJswmmNAFmy-P9z=Hh1N=fkLw_uemoeQnYVg@mail.gmail.com>
 <d733d47bc6a86fe28302943e50d02bd5@codeaurora.org> <CAE-0n50z=MaEZhXRSQpN6Jo8m7nyQSS6MqikAgT5cfkH1ZvL_g@mail.gmail.com>
 <5848670f513187734d7625f242bbf67b@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 23 Aug 2021 15:18:16 -0500
Message-ID: <CAE-0n514NRg6SkvPCC4hAyQVp4MX9ubHGvsTT14FuaB_d1QsEQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP property
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, mka@chromium.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2021-08-23 09:19:08)
> On 2021-08-21 23:47, Stephen Boyd wrote:
> > Quoting Sibi Sankar (2021-08-20 07:24:02)
> >> On 2021-08-20 00:25, Stephen Boyd wrote:
> >> > Quoting Sibi Sankar (2021-08-18 20:02:05)
> >> >> The load state power-domain, used by the co-processors to notify the
> >> >> Always on Subsystem (AOSS) that a particular co-processor is up/down,
> >> >> suffers from the side-effect of changing states during suspend/resume.
> >> >> However the co-processors enter low-power modes independent to that of
> >> >> the application processor and their states are expected to remain
> >> >> unaltered across system suspend/resume cycles. To achieve this
> >> >> behavior
> >> >> let's drop the load state power-domain and replace them with the qmp
> >> >> property for all SoCs supporting low power mode signalling.
> >> >>
> >> >
> >> > How do we drop the load state property without breaking existing DTBs?
> >> > Maybe we need to leave it there and then somehow make it optional? Or
> >> > do
> >> > we not care about this problem as the driver will start ignoring it?
> >>
> >> We can afford to break the bindings
> >> because of the following reason:
> >>
> >> * Load state in mainline is currently
> >>    broken i.e. it doesn't serve its
> >>    main purpose of signalling AOP of
> >>    the correct state of Q6 during
> >>    system suspend/resume. Thus we
> >>    can maintain current functionality
> >>    even without the load state votes
> >>    i.e. when a new kernel with load
> >>    state removed is used with an older
> >>    dtb the remoteproc functionality
> >>    will remain the same.
> >>
> >
> > Alright. Is that reflected somewhere in the commit text? I must have
> > missed it. Can you please add it?
>
> Commit message throughout the series
> mention that the current load state
> implementation is broken but it is
> never mentioned explicitly that it
> is the reason why bindings can be
> broken. I'll wait for a couple of
> days to see if I get any more
> comments and will re-word it in the
> next re-spin.
>

Ok. You can add my Reviewed-by tag with that text updated.
