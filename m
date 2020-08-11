Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D02424220D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 23:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgHKVis (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 17:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgHKVis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 17:38:48 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D33C06174A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:38:47 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o13so7341466pgf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2020 14:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=1nrb3NgtDDxsWCZ3942wbgZJjyuNTJop0IAqdy46x2E=;
        b=SLAg/bSB8leuas1NGcLTVpkt9V5S65bDnusR0xr7dHetnOCWWkPJVYCBGHKPw4KBGd
         wTycZoIu+xB9k7Y6zp7TA3bcCo1foX5tbAG6ocFqOmD+2aqDJ/GweFjavdECAIN6HfgZ
         f6PIxnZlemV4sNORNrJzBhVnbuVUzA4msZp8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=1nrb3NgtDDxsWCZ3942wbgZJjyuNTJop0IAqdy46x2E=;
        b=obSmUARjFdeM/sCiuLT8Let2FgU+T/YO9WYBWE/N53z41tJOXP9rOvVvf7QKb5K7WD
         6AvrnxigkQ5w+S5G+cjBvHMf9JMInHobP+0XtEap33WYH9BXepB1uBd/Xu1KfQciM7fo
         LZ0fEKsXbtKLApF39M82y7ys2ydrjn5Dc7ofX1/+ju3SvbT639XUctyz5aL3vj+3fV8e
         0qOuHc8Q1QCg/zK3UftB4FnuyiXx3iNETy93yQvzUpHUwD+oxvMFR7KHTP+P3Wqv3qFx
         DNbMuQdMcQGJqegf0DJ8ZmQg9jpY1VothKkmC3azVFJaBalHlDjyYYX8Ez9isl94mjkt
         btcw==
X-Gm-Message-State: AOAM5312ugAH5uJqPjYB8pYWitQVMpRzK5/Id4Tl+5kQHNvmH4baAp6r
        nxjbRPkW7o4mPlQMccHz8rBDVA==
X-Google-Smtp-Source: ABdhPJwtxwh5lCBGmCPx0ZPwhsatN1s9hf+e8/eO+zY0pcyW6mpIB0WR+zdT98h80OGBjoMKHaFxZg==
X-Received: by 2002:a63:3ec2:: with SMTP id l185mr2431941pga.365.1597181927521;
        Tue, 11 Aug 2020 14:38:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id n22sm3465728pjq.25.2020.08.11.14.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 14:38:47 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200811190252.10559-1-sibis@codeaurora.org>
References: <20200811190252.10559-1-sibis@codeaurora.org>
Subject: Re: [PATCH 1/2] PM / Domains: Add GENPD_FLAG_SUSPEND_ON flag
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        gregkh@linuxfoundation.org, pavel@ucw.cz, len.brown@intel.com,
        rnayak@codeaurora.org, dianders@chromium.org, khilman@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>, bjorn.andersson@linaro.org,
        rjw@rjwysocki.net, ulf.hansson@linaro.org
Date:   Tue, 11 Aug 2020 14:38:45 -0700
Message-ID: <159718192589.1360974.15808376172581486987@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sibi Sankar (2020-08-11 12:02:51)
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index ee11502a575b0..3002a2d68936a 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -55,6 +55,10 @@
>   *
>   * GENPD_FLAG_RPM_ALWAYS_ON:   Instructs genpd to always keep the PM dom=
ain
>   *                             powered on except for system suspend.
> + *
> + * GENPD_FLAG_SUSPEND_ON:      Instructs genpd to keep the PM domain pow=
ered
> + *                             on during suspend and runtime PM controll=
ed

Maybe, "powered on across system suspend (if it is already powered on)"
to match the hunk above that talks about system suspend for
GENPD_FLAG_RPM_ALWAYS_ON. Otherwise someone may think that this powers
on the genpd during suspend or powers it on during runtime suspend.

> + *                             otherwise.
>   */
>  #define GENPD_FLAG_PM_CLK       (1U << 0)
>  #define GENPD_FLAG_IRQ_SAFE     (1U << 1)
