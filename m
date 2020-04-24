Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400C51B6B71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 04:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726400AbgDXCi3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 22:38:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgDXCi1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 22:38:27 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D10C09B045
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 19:38:26 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id d17so3930416pgo.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 19:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=xkSGRkF++k+CMpZ51T6z7LFsFmj1btnV8v6kQtU62/U=;
        b=I+gDnRKqpg1I86DxyMy4+YzJ5N2lmDVvQJ7IZOBFnPURDa2WG8Jb6UGne5D1//TcpC
         O4zuO/zL+S686HpKagdoYlACOgwWl7ZSSm8OI4Yb9OYvGHc2Q7KiwndV185AATwlDngc
         JUe42JJmqlYbxWYQ/Li/bfgJ+dBqY5J233/Tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=xkSGRkF++k+CMpZ51T6z7LFsFmj1btnV8v6kQtU62/U=;
        b=mJypKrU5y6ZhnxI3SX62KZBW7/fgFXfYAeXbKB+AOHATIqu3DoeZiO5IA5UZ76WUk6
         NEdXqOs8hdCyYguAL7v5XG+2a6P7uM9TIthNlYgZUMYB7pLprFYgB9M4QJq/IvXJvfHW
         Mh/Qb3mAGlvDjUNMt+DG259SkcDN3HE7oV1XTlVgvQWuPxD1EWVm4Hdqzpd7efHOldAm
         OJ7w3eSJi65+bPf+dnsfK0tyJAISTtGoQM5QkiyUn7Td+u79WVdMlymopXrMDKT64odn
         Ya2O8boyiDIoL7C+cV8gLEoqklw1KEQkr00T2yP42tLKTycQz27Ln+nBlykwlGV44+kj
         hElA==
X-Gm-Message-State: AGi0PuaSia43QogbHezlg5JMjKVsYBH28BHyYGAH3UKfx9JD3N/KOsvP
        mOpZqSUKuwOs3QHSidOje6adtA==
X-Google-Smtp-Source: APiQypIgY3XlWvmx5aJnJRpZHoGg4R2hlIqr3yZetx41JEcKOOkkmlsHBuzsqF5wUX9oqkvX8HuwlQ==
X-Received: by 2002:a62:38cc:: with SMTP id f195mr7024640pfa.85.1587695905622;
        Thu, 23 Apr 2020 19:38:25 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id c28sm4014957pfp.200.2020.04.23.19.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 19:38:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200422145408.v4.2.I1927d1bca2569a27b2d04986baf285027f0818a2@changeid>
References: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid> <20200422145408.v4.2.I1927d1bca2569a27b2d04986baf285027f0818a2@changeid>
Subject: Re: [PATCH v4 2/5] soc: qcom: rpmh-rsc: We aren't notified of our own failure w/ NOTIFY_BAD
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     mka@chromium.org, mkshah@codeaurora.org, evgreen@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com
Date:   Thu, 23 Apr 2020 19:38:24 -0700
Message-ID: <158769590404.135303.4049749400685142607@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-04-22 14:55:00)
> When a PM Notifier returns NOTIFY_BAD it doesn't get called with
> CPU_PM_ENTER_FAILED.  It only get called for CPU_PM_ENTER_FAILED if
> someone else (further down the notifier chain) returns NOTIFY_BAD.
>=20
> Handle this case by taking our CPU out of the list of ones that have
> entered PM.  Without this it's possible we could detect that the last
> CPU went down (and we would flush) even if some CPU was alive.  That's
> not good since our flushing routines currently assume they're running
> on the last CPU for mutual exclusion.
>=20
> Fixes: 985427f997b6 ("soc: qcom: rpmh: Invoke rpmh_flush() for dirty cach=
es")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reported-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
