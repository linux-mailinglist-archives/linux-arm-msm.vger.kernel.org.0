Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A4D32C178
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389343AbhCCVhM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1842796AbhCCINS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 03:13:18 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62618C06121D
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 00:12:11 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id jx13so3678655pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 00:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=v+0jU7T/57brpKh9RpL8fin465X4mOv5JQ4AMv8IGp0=;
        b=dc2XBOX3HRnDVfFvwQniAJP185de/MmOM3KG9MRakuIhIH0uztDeESXuD++dRM7FId
         /QD4+X8DZ7RSk1besGI68U8WbOyMTSB2pXk9Phs21qYYdpmZvO15HZ8EJ5nLgQMqitSM
         LJueqwmSVvgFz0Bl7lnbZoyXS4y6ZqXXjD5nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=v+0jU7T/57brpKh9RpL8fin465X4mOv5JQ4AMv8IGp0=;
        b=SclnaLfTEmQa1u7v6e7QGiDWaSBA371Bt4mw8JlYLGDBxe/317yU/Koj/rauULf+m4
         ys+hy3BTeg4gCw2FKONjcXeLQ9oUldhGIui+w8zs5xKiA33+AFCvbxnAN9HxthTJbxpv
         IAVFHcnsH6ZIioU4yXWZh+kDlxtXBWL0yuxHBU+PI8THrNjAkY/pcHM0e7oEmnqWIQkl
         nzApc3PVD4PqhGkEOjejklEwcgvoQef9qR0X+rRsVKJeJF8A7Uj+nycUb2NXs/TL3TSF
         srbfh+OiXMxDEq8X8eiJeXWTqoNr7h1DfCsKmMqAZVnaBFdgiBasiczNB6tL0Z+nKNrX
         cAag==
X-Gm-Message-State: AOAM532WymG1zh2cA8H5yLdz4tD022TSCvLpyLYf0LOOcMYSxcO81i5Q
        jaMw69fjilFVkgv1Kz1IUGoo6Q==
X-Google-Smtp-Source: ABdhPJxkbVDZj/D+4e1Zi04a4GBVH8SLEIZCQme6jT56vZq4cjMzOy3HMCAKImi0vYzNwj5lH3H4WA==
X-Received: by 2002:a17:90a:a615:: with SMTP id c21mr8596905pjq.163.1614759130973;
        Wed, 03 Mar 2021 00:12:10 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:2510:ab07:78a:7d78])
        by smtp.gmail.com with ESMTPSA id r16sm23509186pfh.168.2021.03.03.00.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 00:12:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <15005f1441594670adcd60a300c88e41d79cad27.1614669585.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1614669585.git.saiprakash.ranjan@codeaurora.org> <15005f1441594670adcd60a300c88e41d79cad27.1614669585.git.saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8350: Rename the qmp node to power-controller
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Date:   Wed, 03 Mar 2021 00:12:09 -0800
Message-ID: <161475912912.1478170.15486269626625076966@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sai Prakash Ranjan (2021-03-01 23:28:04)
> Use the generic DT node name "power-controller" for AOSS message ram
> instead of the protocol name QMP(Qualcomm Messaging Protocol) since
> it is used for power management requests.
>=20
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
