Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2A11652BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 23:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbgBSWx2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 17:53:28 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41199 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727429AbgBSWx2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 17:53:28 -0500
Received: by mail-pg1-f193.google.com with SMTP id 70so853162pgf.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 14:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=AcediiSivT+LWqDEtOSOEIb/ql/h3th0iLtIJJddY0A=;
        b=BCbh2aaODXUOMbJ47FYF0Z3q9D7rmjUO9/HBZ51aFQnoqI+xQZNeZTl4dktydUcZO5
         mfuB+gNhVU3QidqaXo1cEkR9P6QUPcTUycelJSZTKfXGbYQhspJ+EvcjDHoXBiGZuk9q
         e9xQE32LTHEKzSITdQuKrTMmihiSSub4Q4KM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=AcediiSivT+LWqDEtOSOEIb/ql/h3th0iLtIJJddY0A=;
        b=gnF7Rb/ZswuqrGY93uRQQjPLGfFWIs5dQgATZuQ3pLNd5NgZbGeW22cNuCgMKB7ZTu
         v2CbbR9OOOavspp5xx8/f31aJKjbgAZf4/r6KTfKg1Sb8h7wIljc/Chp4cnrruvXSZLK
         FYfxUnaF+221oDCm32QN6R/KcWu86bILVHRl52jN30tvpOQBEXvE9ADjreF/5mmYXTO/
         To/3VQeZ5nw5aJzb1lJVDMg/bgIgwfg8QKg19peWlY72nRjQCttSzXSQqObyy4Ml9mrK
         pF419aYiwFWjD405IV/yoF+EemM1823m+SMZ20v63tFODYSyF6RWGahF53TI7uKRJkSW
         575g==
X-Gm-Message-State: APjAAAXLMp9yIi/eSy7ic2J0/JFLzG827rldqT9BjD4lnXJjba/paTr+
        43jPv47ngaetYPaU9tibLFYDPw==
X-Google-Smtp-Source: APXvYqzgVogCk4wmUAOqQEW4bVutbe6o2CYTMqBsdOfoHwfv/G7oBszdNXPvfuE9X4po34XTi3SYTg==
X-Received: by 2002:a63:c30e:: with SMTP id c14mr31594137pgd.168.1582152807989;
        Wed, 19 Feb 2020 14:53:27 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id h3sm845289pjs.0.2020.02.19.14.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 14:53:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6f95b3f0d39433c7e6b01094bdb200a7ac8e9f0d.1582048155.git.amit.kucheria@linaro.org>
References: <cover.1582048155.git.amit.kucheria@linaro.org> <6f95b3f0d39433c7e6b01094bdb200a7ac8e9f0d.1582048155.git.amit.kucheria@linaro.org>
Subject: Re: [PATCH v5 3/8] drivers: thermal: tsens: use simpler variables
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Andy Gross <agross@kernel.org>, bjorn.andersson@linaro.org,
        daniel.lezcano@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaa@codeaurora.org
Date:   Wed, 19 Feb 2020 14:53:26 -0800
Message-ID: <158215280660.184098.15487361696633323314@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Amit Kucheria (2020-02-18 10:12:07)
> We already dereference the sensor and save it into a variable. Use the
> variable directly to make the code easier to read.
>=20
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
