Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9A2DB4167
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 21:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbfIPTyL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 15:54:11 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46717 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727884AbfIPTyL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 15:54:11 -0400
Received: by mail-pf1-f193.google.com with SMTP id q5so535015pfg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2019 12:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:from:subject:user-agent:date;
        bh=lrC/Mm8MKJYbyIapp2rG+4YTQFTYoqtqhsULa6M5KsQ=;
        b=mX2Xn+XJuSrIQX/3vRMQ3W21bf2fHZusW/23HHt9zZ96LdU0+hJ7E4PByjU+dH7zYD
         ulY6b4QpLuANuBtNDdJHkGuUh/5d49Sin3OsQ1upuF6MRYF2Zc8V4Ke3MKCoka1L3h63
         GKWf2RWu0iLRZoehcVgZgRmd/GlKHEpPnpYEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:date;
        bh=lrC/Mm8MKJYbyIapp2rG+4YTQFTYoqtqhsULa6M5KsQ=;
        b=GGbGSbT5zz62HRz1O3UkDmyhBz75C5J9XkHuaxVrS47UTrpewaNVheT/h2+WnJU60W
         iaiwBzywECHRUPXfA5sPN+FHspPeOKiqUEGZiRVukieCJ6A4a8v0GYfQoyKczybWn4bo
         +AMSRYz78dU5hAdCufvbJeXjzzy2q/90E0WYB0TqNMQV/I7abhpvu/jI5pe41EYpwcF2
         +mK/0+sL6a23TAOn39zpyXvLr9ZLCNjP0Xzl8snoFMVjxLKvuuixSzKa5YDX2KeT4Jvq
         opvjSsEpl9bpGFF8Zkwf0aU9zastUpTk7BRZxjaM7DZCt4RbC5DvtGt+6IfI6vLcsJP6
         Z6IQ==
X-Gm-Message-State: APjAAAVI4f8tEKYIJMz3qo9sjbuvmXQMh2qdsiHN8GeYxFd3fKTneyI8
        XrLhtqIif5jU6p5qDlY7nS9/xQ==
X-Google-Smtp-Source: APXvYqxUk+ttSr+TjZgdfGoX+v3Z9CTe/np15NOWgn4t9uKNcWkEJTPtjJik+Fqf9hb0pS4No35+ug==
X-Received: by 2002:a62:1658:: with SMTP id 85mr56563pfw.195.1568663650915;
        Mon, 16 Sep 2019 12:54:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id x9sm29605116pgp.75.2019.09.16.12.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2019 12:54:10 -0700 (PDT)
Message-ID: <5d7fe862.1c69fb81.8e5e3.2325@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c88947d18c65a692a8f314e4ad996d9d2a997997.1568240476.git.amit.kucheria@linaro.org>
References: <cover.1568240476.git.amit.kucheria@linaro.org> <c88947d18c65a692a8f314e4ad996d9d2a997997.1568240476.git.amit.kucheria@linaro.org>
Cc:     linux-clk@vger.kernel.org
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        ilina@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, tdas@codeaurora.org
From:   Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 4/5] clk: qcom: Initialise clock drivers earlier
User-Agent: alot/0.8.1
Date:   Mon, 16 Sep 2019 12:54:09 -0700
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2019-09-11 15:32:33)
> Initialise the clock drivers on sdm845 and qcs404 in core_initcall so we
> can have earlier access to cpufreq during booting.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Did you want this patch to go through clk tree?

