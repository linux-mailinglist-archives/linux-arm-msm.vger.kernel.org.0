Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 947713244B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 20:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234480AbhBXTke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 14:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233743AbhBXTkc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 14:40:32 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FA41C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 11:39:52 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id gm18so2013787pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 11:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=3cb0bMohbYt0qtEfL517mkwSwHFgKV21YPkanwuMPDg=;
        b=QAHjSSGhi2s4UoDcFII/63SMa6ngH02wbFB1hJA6F6OrACOK/6nqyiPGIdlKQbum65
         6bz1tk0t1h58qRqQeuHQecOH2xz828tebwKAOs1BH4RsWoXeTQ/KXwLqD1FlfHDaVlyp
         fK4WWq+tmO7TTUco1+KTbkodcvyf0CLaUh8YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=3cb0bMohbYt0qtEfL517mkwSwHFgKV21YPkanwuMPDg=;
        b=QXLDoEsSnZlxFkC6Yy1rz6yjd8zT77BkFu+kPO7IPk3DsapHcKal1ER6dQNcghKsnq
         qGjwTbdyXmz0gTiqkRRGo7rM+blJAqRloofEcu1bwH+o1hJr1hiP54FnW2LPPzTGk4jb
         ziPZw/PEv51udRGiTv/ExI7I/UrL54BcwAux3UZLWJdkYFFIJsFxUpPGDcn27HU0CSaK
         3ioc5XkWiIkgSeul84f9dswq3Uk+mUIL+OyB5SKNqy7gYyuu3DiMeMekhgSb4Nj+60BV
         ub+cTTvbHrXdmyPGJokvuSR42eSyHNUbNu8bBEPr5iS9TNehK6cKw8Biit109jxvNGFH
         F90A==
X-Gm-Message-State: AOAM53016Y6Wic4mDjZfqBFkwpJXvuALJtBUt3iR6yGKDXik35si7wST
        Q+kpXyQr9ax+3LDacYecXBRn9SLED3tYAA==
X-Google-Smtp-Source: ABdhPJypHHjsYp5jhxrBtvZOoR3lU79knB/axfSDhALXkW+fIXC53VIkhwN+L8ATtEdirWZv8nLV4Q==
X-Received: by 2002:a17:902:8206:b029:e3:95d2:eb0a with SMTP id x6-20020a1709028206b02900e395d2eb0amr17196116pln.43.1614195592126;
        Wed, 24 Feb 2021 11:39:52 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:933:e73c:97ad:add3])
        by smtp.gmail.com with ESMTPSA id q4sm3690774pfs.134.2021.02.24.11.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 11:39:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <161367397738.1254594.12158219605796616035@swboyd.mtv.corp.google.com>
References: <1613667070-27613-1-git-send-email-khsieh@codeaurora.org> <161367397738.1254594.12158219605796616035@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 1/2] phy/qualcomm: add hbr3_hbr2 voltage and premphasis swing table
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Date:   Wed, 24 Feb 2021 11:39:49 -0800
Message-ID: <161419558963.1254594.762999750680493756@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Stephen Boyd (2021-02-18 10:46:17)
> Quoting Kuogee Hsieh (2021-02-18 08:51:10)
> > Add hbr3_hbr2 voltage and premphasis swing table to support
> > HBR3 link rate.
> >=20
> > Changes in V2:
> > -- replaced upper case with lower case at hbr3_hbr2 table
> >=20
> > Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> > ---
>=20
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>=20
> BTW, the DP driver already set rates for HBR2, so does that mean this is
> fixing the voltage and preemphasis settings for HBR2? If so we should
> backport this to stable trees and mark it as fixing commit 52e013d0bffa
> ("phy: qcom-qmp: Add support for DP in USB3+DP combo phy").

Yes? No?
